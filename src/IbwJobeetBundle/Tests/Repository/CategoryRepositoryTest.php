<?php
namespace IbwJobeetBundle\Tests\Repository;

use IbwJobeetBundle\Repository\CategoryRepository;
use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;


class JobRepositoryTest extends WebTestCase
{
    /**
     * @var \IbwJobeetBundle\Repository\CategoryRepository
     */
    private $em;


    public function setUp()
    {
        $kernel = static::createKernel();
        $kernel->boot();
        $this->blogRepository = $kernel->getContainer()
            ->get('doctrine.orm.entity_manager')
            ->getRepository('IbwJobeetBundle:Category');
    }

    public function testCountActiveJobs()
    {
        $query = $this->em->createQuery('SELECT c FROM IbwJobeetBundle:Category c');
        $categories = $query->getResult();

        foreach($categories as $category) {
            $query = $this->em->createQuery('SELECT COUNT(j.id) FROM IbwJobeetBundle:Job j WHERE j.category = :category AND j.expires_at > :date');
            $query->setParameter('category', $category->getId());
            $query->setParameter('date', date('Y-m-d H:i:s', time()));
            $jobs_db = $query->getSingleScalarResult();

            $jobs_rep = $this->em->getRepository('IbwJobeetBundle:Job')->countActiveJobs($category->getId());
            // This test will verify if the value returned by the countActiveJobs() function
            // coincides with the number of active jobs for a given category from the database
            $this->assertEquals($jobs_rep, $jobs_db);
        }
    }



}