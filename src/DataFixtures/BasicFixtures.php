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
    use ReservationFixtureTrait;

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
                ['name'=>'userActive', 'active'=>true, 'role'=>[]],
                ['name'=>'userInactive', 'active'=>false, 'role'=>[]],
                ['name'=>'userForbidden', 'active'=>true, 'role'=>[]],
                ['name'=>'userAdmin', 'active'=>true, 'role'=>["ROLE_ADMIN"]],
                ['name'=>'userActive2', 'active'=>true, 'role'=>[]]
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

        $this->reservations = $this->createReservations(
            [
                ["owner" => $this->users[4], "validationState"=>"posted", "date_begin"=>"2019-08-01", "date_end"=>"2019-08-10", "nbPerson"=>"1", "annonce"=>$this->annonces[1]],
            ]
        );



        $this->manager->flush();
    }


}
