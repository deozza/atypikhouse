<?php
namespace App\EventSubscriber;


use App\Events;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use Symfony\Component\EventDispatcher\GenericEvent;

class AddParticipantsEvent implements EventSubscriberInterface
{

    public static function getSubscribedEvents()
    {
        return [
            Events::ADD_PARTICIPANTS => "onAddParticipants"
        ];
    }

    public function onAddParticipants(GenericEvent $event)
    {
        $conversation = $event->getSubject();
        $receiver = $conversation->getProperties()['message'][0]["receiver"];
        $owner = $conversation->getOwner()->getId();
        $properties = $conversation->getProperties();

        $participants = [$owner, $receiver];
        $properties['participants'] = $participants;

        $conversation->setProperties($properties);

    }
}