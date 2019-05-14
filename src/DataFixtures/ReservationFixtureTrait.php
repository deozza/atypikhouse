<?php
namespace App\DataFixtures;

use App\Entity\User;
use Deozza\PhilarmonyBundle\Entity\Entity;
use Faker;

trait ReservationFixtureTrait
{
    public function createReservations(array $items)
    {
        $reservations = [];
        $i = 1;
        foreach($items as $item)
        {
            $reservation = $this->createReservation($item['owner'],  $item['validationState'], $item['date_begin'], $item['date_end'], $item['nbPerson'], $item['annonce']);
            $reservation->setUuid("00".$i."00000-0000-5000-a000-000000000000");
            $reservations[] = $reservation;
            $i++;
        }

        return $reservations;
    }

    public function createReservation(User $user, $validationState, $date_begin, $date_end, $nbPerson, $annonce)
    {
        $reservation = new Entity();
        $reservation->setKind("reservation");
        $reservation->setOwner($user);
        $reservation->setValidationState($validationState);

        $objectDateBegin = new \DateTime($date_begin);
        $objectDateEnd = new \DateTime($date_end);

        $annonce= ["uuid"=>$annonce->getUuid(), "owner"=>$annonce->getOwner()->getId()];

        $properties =
            [
                "date_begin"=> $objectDateBegin,
                "date_end"=>$objectDateEnd,
                "nbPerson"=>$nbPerson,
                "annonce"=>$annonce
            ];

        $reservation->setProperties($properties);

        $this->manager->persist($reservation);

        return $reservation;
    }
}