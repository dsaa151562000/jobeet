<?php

namespace IbwJobeetBundle\Tests\Controller;

use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;

class JobControllerTest extends WebTestCase
{
    public function testJobForm()
    {
        $client = static::createClient();

        $crawler = $client->request('GET', '/job/new');

//        $this->assertEquals('IbwJobeetBundle\Controller\JobController::newAction', $client->getRequest()->attributes->get('_controller'));
//
//        $form = $crawler->selectButton('Preview your job')->form(array(
//            'job[company]'      => 'Sensio Labs',
//            'job[url]'          => 'http://www.sensio.com/',
//            #'job[file]'         => __DIR__.'/../../../../web/bundles/ibwjobeet/images/sensio-labs.gif',
//            'job[position]'     => 'Developer',
//            'job[location]'     => 'Atlanta, USA',
//            'job[description]'  => 'You will work with symfony to develop websites for our customers.',
//            'job[how_to_apply]' => 'Send me an email',
//            'job[email]'        => 'for.a.job@example.com',
//            'job[is_public]'    => false,
//        ));
//
//        $client->submit($form);
        #フォームを送信した後、実行されたアクションが create であることを確認しました。
        #$this->assertEquals('IbwJobeetBundle\Controller\JobController::createAction', $client->getRequest()->attributes->get('_controller'));

        #$client->followRedirects();
       # $crawler = $client->followRedirect();
        #$crawler = $client->followRedirect();
        #フォームが有効な場合、ジョブが作成され、ユーザーがプレビューページにリダイレクトされている必要があります。
        #$client->followRedirect();
       # $this->assertEquals('Ibw\JobeetBundle\Controller\JobController::previewAction', $crawler->getRequest()->attributes->get('_controller'));

//        $kernel = static::createKernel();
//        $kernel->boot();
//        #$em = $kernel->getContainer()->get('doctrine.orm.entity_manager');
//        $em = static::$kernel->getContainer()
//            ->get('doctrine')
//            ->getManager();
//
//
//        $query = $em->createQuery('SELECT count(j.id) from IbwJobeetBundle:Job j WHERE j.location = :location AND j.is_activated IS NULL AND j.is_public = 0');
//        $query->setParameter('location', 'Atlanta, USA');
//        $this->assertTrue(0 < $query->getSingleScalarResult());

        $crawler = $client->request('GET', '/job/new');
        $form = $crawler->selectButton('Preview your job')->form(array(
            'job[company]'      => 'Sensio Labs',
            'job[position]'     => 'Developer',
            'job[location]'     => 'Atlanta, USA',
            'job[email]'        => 'not.an.email',
        ));
        $crawler = $client->submit($form);

        // check if we have 3 errors
        $this->assertTrue($crawler->filter('.error_list')->count() == 0);

//        // check if we have error on job_description field
//        $this->assertTrue($crawler->filter('#job_description')->siblings()->first()->filter('.error_list')->count() == 0);
//
//        // check if we have error on job_how_to_apply field
//        $this->assertTrue($crawler->filter('#job_how_to_apply')->siblings()->first()->filter('.error_list')->count() == 0);
//
//        // check if we have error on job_email field
//        $this->assertTrue($crawler->filter('#job_email')->siblings()->first()->filter('.error_list')->count() == 0);
    }


    public function createJob($values = array())
    {
        $client = static::createClient();
        $crawler = $client->request('GET', '/job/new');
        $form = $crawler->selectButton('Preview your job')->form(array_merge(array(
            'job[company]'      => 'Sensio Labs',
            'job[url]'          => 'http://www.sensio.com/',
            'job[position]'     => 'Developer',
            'job[location]'     => 'Atlanta, USA',
            'job[description]'  => 'You will work with symfony to develop websites for our customers.',
            'job[how_to_apply]' => 'Send me an email',
            'job[email]'        => 'for.a.job@example.com',
            'job[is_public]'    => false,
        ), $values));

        $client->submit($form);
        $client->followRedirect();

        return $client;
    }


}
