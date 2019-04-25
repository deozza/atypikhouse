<?php

namespace App\Security;

use App\Entity\ApiToken;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Security\Core\Authentication\Token\TokenInterface;
use Symfony\Component\Security\Core\Exception\AuthenticationException;
use Symfony\Component\Security\Core\Exception\CustomUserMessageAuthenticationException;
use Symfony\Component\Security\Core\User\UserInterface;
use Symfony\Component\Security\Core\User\UserProviderInterface;
use Symfony\Component\Security\Guard\AbstractGuardAuthenticator;
use Firebase\JWT\JWT;
use Symfony\Component\Dotenv\Dotenv;

use App\Entity\User;

class ApiKeyAuthenticator extends AbstractGuardAuthenticator
{

    public function __construct(EntityManagerInterface $em)
    {
        $this->em = $em;
    }

    public function supports(Request $request)
    {

        $urlWithoutAuthentication = [
            'POST'=>[
                '/api/auth-token',
                '/api/users',
                '/api/reset-password/request',
                '/api/reset-password/reset/',
            ]
        ];

        foreach($urlWithoutAuthentication as $method => $bypassUrl)
        {
            if($request->getMethod() === $method)
            {
                foreach($bypassUrl as $url){
                    if(substr($request->getPathInfo(), 0, strlen($url)) === $url)
                    {
                        return false;
                    }
                }
            }
        }


        return true;
    }

    public function getCredentials(Request $request)
    {

        $header = $request->headers->get('Authorization');
        return substr($header, 7);
    }

    public function getUser($credentials, UserProviderInterface $userProvider)
    {
        if(empty($credentials))
        {
            throw new CustomUserMessageAuthenticationException("Invalid token");
        }

        try
        {
            $env = new Dotenv();
            $env->load(__DIR__."/../../.env");
            $secret = getenv("APP_SECRET");
            $data = JWT::decode($credentials, $secret, ["HS256"]);
            $username = $data['username'];
            $user = $this->em->getRepository(User::class)->findOneByUsername($username);
            if(!$this->em->getRepository(ApiToken::class)->findOneBy([
                "user" => $user,
                "kind" => "AUTH_TOKEN"
            ]))
            {
                throw new CustomUserMessageAuthenticationException("Invalid token");
            }

            return $user;
        }
        catch(\Exception $e)
        {

            $data = $this->em->getRepository(ApiToken::class)->findOneBy([
                "token" => $credentials,
                "kind" => "AUTH_TOKEN"
                ]);

            if($data)
            {
                return $data->getUser();
            }
            else
            {
                throw new CustomUserMessageAuthenticationException("Invalid token");
            }
        }
    }

    public function checkCredentials($credentials, UserInterface $user)
    {
        return true;
    }

    public function onAuthenticationFailure(Request $request, AuthenticationException $exception)
    {
        $data = [
            "message" => strtr($exception->getMessageKey(), $exception->getMessageData())
        ];

        return new JsonResponse($data, Response::HTTP_UNAUTHORIZED);
    }

    public function onAuthenticationSuccess(Request $request, TokenInterface $token, $providerKey)
    {
        return;
    }

    public function start(Request $request, AuthenticationException $authException = null)
    {
        $data = [
            'message' => 'Authentication required'
        ];

        return new JsonResponse($data, Response::HTTP_UNAUTHORIZED);
    }

    public function supportsRememberMe()
    {
        return false;
    }
}
