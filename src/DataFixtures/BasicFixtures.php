<?php

namespace App\DataFixtures;

use App\Entity\ApiTokenKind;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\Persistence\ObjectManager;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;

class BasicFixtures extends Fixture
{
    use UserFixtureTrait;
    use AnnonceFixtureTrait;

    private $manager;
    private $encoder;

    public function __construct(UserPasswordEncoderInterface $encoder)
    {
        $this->encoder = $encoder;
    }

    public function load(ObjectManager $manager)
    {
        $this->manager = $manager;

        $this->users = $this->createUsers(
            [
                ['name'=>'userActive', 'active'=>true, 'role'=>[], 'token'=>[ApiTokenKind::AUTH, ApiTokenKind::RESET]],
                ['name'=>'userInactive', 'active'=>false, 'role'=>[], 'token'=>[ApiTokenKind::AUTH, ApiTokenKind::RESET]],
                ['name'=>'userForbidden', 'active'=>true, 'role'=>[], 'token'=>[ApiTokenKind::AUTH, ApiTokenKind::RESET]],
                ['name'=>'userAdmin', 'active'=>true, 'role'=>["ROLE_ADMIN"], 'token'=>[ApiTokenKind::AUTH]]
            ]);
        $this->manager->flush();

        $this->annonces = $this->createAnnonces(
            [
                ["owner" => $this->users[0], "validationState"=>"posted"],
                ["owner" => $this->users[0], "validationState"=>"public"],
                ["owner" => $this->users[2], "validationState"=>"public"],
            ]
        );



        $this->manager->flush();
    }


}
