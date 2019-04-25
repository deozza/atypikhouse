<?php
namespace App\DataFixtures;

use App\Entity\ApiToken;
use App\Entity\ApiTokenKind;
use App\Entity\User;

trait UserFixtureTrait
{

    public function createUsers(array $items)
    {
        $users = [];
        foreach($items as $item)
        {
            $user = $this->createUser($item["name"], $item['active'], $item['role'], $item['token']);
            $users[] = $user;
        }

        return $users;
    }

    public function createUser($name, $active, $role=[], $token)
    {

        $user = new User();
        $user->setUsername($name);
        $user->setEmail($name.'@mail.com');
        $user->setRegisterDate(new \DateTime('now'));
        $user->setActive($active);

        $encoded = $this->encoder->encodePassword($user, $name);

        $user->setPassword($encoded);
        $user->setRoles($role);

        $this->manager->persist($user);

        if(!empty($token))
        {
            $this->createTokenForUser($user,$token);
        }

        return $user;
    }

    public function createTokenForUser(User $user, $kinds)
    {
        foreach($kinds as $kind)
        {
            $tokenValue = "token_".$user->getUsername()."_".$kind;
            $apiTokenKind = ApiTokenKind::AUTH;
            $token = new ApiToken($user, $tokenValue, $apiTokenKind);
            $this->manager->persist($token);
        }
        return $user;
    }
}