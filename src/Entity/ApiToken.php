<?php
namespace App\Entity;

use App\Entity\User;
use Doctrine\ORM\Mapping as ORM;
use JMS\Serializer\Annotation as JMS;

/**
 * @ORM\Entity(repositoryClass="App\Repository\ApiTokenRepository")
 */
class ApiToken
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     * @JMS\Exclude
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $token;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\User")
     * @JMS\Exclude
     */
    private $user;

    /**
     * @ORM\Column(type="string", length=255)
     * @JMS\Exclude
     */
    private $kind;


    public function __construct(User $user, $token, string $kind)
    {
        $this->user = $user;
        $this->token = $token;
        $this->kind = $kind;
    }
    public function getId(): ?int
    {
        return $this->id;
    }

    public function getToken(): ?string
    {
        return $this->token;
    }

    public function getUser(): ?User
    {
        return $this->user;
    }

    public function getKind(): ?string
    {
        return $this->kind;
    }
}