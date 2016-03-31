<?php
namespace IbwJobeetBundle\Tests\Entity;


use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;




class JobTest extends KernelTestCase
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