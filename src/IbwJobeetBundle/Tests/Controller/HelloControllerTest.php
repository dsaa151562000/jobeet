<?php

namespace IbwJobeetBundle\Tests\Controller;

use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;
use IbwJobeetBundle\Entity\Category;

class HelloControllerTest extends KernelTestCase
{
    /**
     * @var \Doctrine\ORM\EntityManager
     */
    private $em;

    /**
     * {@inheritDoc}
     */
    protected function setUp()
    {
        self::bootKernel();

        $this->em = static::$kernel->getContainer()
            ->get('doctrine')
            ->getManager();
    }

    /**
     * @test */
    public function 指定した属性のメンバーが追加されていること()
    {
        $job = $this->em->createQuery('SELECT j FROM IbwJobeetBundle:Job j ')
            ->setMaxResults(1)
            ->getSingleResult();

        $this->assertEquals($job->getCompanySlug(), Jobeet::slugify($job->getCompany()));

    }

    /**
     * {@inheritDoc}
     */
    protected function tearDown()
    {
        parent::tearDown();

        $this->em->close();
    }

}