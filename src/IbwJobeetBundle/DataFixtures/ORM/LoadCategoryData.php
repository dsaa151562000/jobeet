<?php

namespace IbwJobeetBundle\DataFixtures\ORM;

use Doctrine\Common\Persistence\ObjectManager;
use Doctrine\Common\DataFixtures\AbstractFixture;
use Doctrine\Common\DataFixtures\OrderedFixtureInterface;
use IbwJobeetBundle\Entity\Category;

class LoadCategoryData extends AbstractFixture implements OrderedFixtureInterface
{
    public function load(ObjectManager $em)
    {
        $design = new Category();
        $design->setName('デザイン');


        $programming = new Category();
        $programming->setName('プログラミング');

        $manager = new Category();
        $manager->setName('マネージャー');

        $administrator = new Category();
        $administrator->setName('アドミニストレーター');



        $em->persist($design);
        $em->persist($programming);
        $em->persist($manager);
        $em->persist($administrator);
        $em->flush();

        $this->addReference('category-design', $design);
        $this->addReference('category-programming', $programming);
        $this->addReference('category-manager', $manager);
        $this->addReference('category-administrator', $administrator);
    }

    public function getOrder()
    {
        return 1; // the order in which fixtures will be loaded
    }

}