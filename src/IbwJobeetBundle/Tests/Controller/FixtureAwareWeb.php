<?php

namespace IbwJobeetBundle\Test\Controller;

use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;
use Symfony\Bridge\Doctrine\DataFixtures\ContainerAwareLoader;

use Doctrine\Common\DataFixtures\FixtureInterface;
use Doctrine\Common\DataFixtures\Purger\ORMPurger;
use Doctrine\Common\DataFixtures\Executor\ORMExecutor;

use IbwJobeetBundle\DataFixtures\ORM\LoadJobData;



class FixtureAwareWeb extends WebTestCase
{
    /**
     * 指定された fixture を読み込みます
     *
     * @param FixtureInterface[] $fixtures
     */
    public function loadFixtures($fixtures)
    {
        //boot kernel
        $kernel = $this->createKernel();
        $kernel->boot();

        //load data fixtures
        $loader = new ContainerAwareLoader($kernel->getContainer());
        foreach ($fixtures as $fixture) {
            $loader->addFixture($fixture);
        }

        //execute query with truncate table
        $manager = $kernel->getContainer()->get('doctrine')->getManager();
        $purger = new ORMPurger($manager);
        $purger->setPurgeMode(ORMPurger::PURGE_MODE_TRUNCATE);
        $executor = new ORMExecutor($manager, $purger);
        $executor->execute($loader->getFixtures());
    }


    public function setUp()
    {
        $this->loadFixtures(
            array(
                new LoadJobData(),
            )
        );
    }


    /**
     * @test */
    public function 指定した属性のメンバーが追加されていること() {

    }



}