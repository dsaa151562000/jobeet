<?php

namespace IbwJobeetBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use IbwJobeetBundle\Entity\Category;

class CategoryController extends Controller
{


                            #引数にカテゴリ、ページ
    public function showAction($slug, $page)
    {
        $em = $this->getDoctrine()->getManager();

        #カテゴリーのslugから ... findOneBySlug
        $category = $em->getRepository('IbwJobeetBundle:Category')->findOneBySlug($slug);

        #$category我ない場合は'Unable to find Category entity.'で例外
        if (!$category) {
            throw $this->createNotFoundException('Unable to find Category entity.');
        }

        #countActiveJobs 数 category_id ２の  31(プログラミング)
//        $total_jobs = $em->getRepository('IbwJobeetBundle:Job')->countActiveJobs($category->getId());
//
//        #max_jobs_on_category 10
//        $jobs_per_page = $this->container->getParameter('max_jobs_on_category');
//
//        #$total_jobs  31/10
//        $last_page = ceil($total_jobs / $jobs_per_page);
//
//        #前へ $page より−１
//        $previous_page = $page > 1 ? $page - 1 : 1;
//
//        $next_page = $page < $last_page ? $page + 1 : $last_page;
//
//        #アクティブなjob  max10件  offset前のページ*10〜  10件づつ
//        $category->setActiveJobs($em->getRepository('IbwJobeetBundle:Job')
//            ->getActiveJobs($category->getId(), $jobs_per_page, ($page - 1) * $jobs_per_page));
//
//
//
//        return $this->render('IbwJobeetBundle:Category:show.html.twig', array(
//            'category' => $category,
//            'last_page' => $last_page,
//            'previous_page' => $previous_page,
//            'current_page' => $page,
//            'next_page' => $next_page,
//            'total_jobs' => $total_jobs
//        ));

        $latestJob = $em->getRepository('IbwJobeetBundle:Job')->getLatestPost($category->getId());

        if($latestJob) {
            $lastUpdated = $latestJob->getCreatedAt()->format(DATE_ATOM);
        } else {
            $lastUpdated = new \DateTime();
            $lastUpdated = $lastUpdated->format(DATE_ATOM);
        }

        $total_jobs = $em->getRepository('IbwJobeetBundle:Job')->countActiveJobs($category->getId());
        $jobs_per_page = $this->container->getParameter('max_jobs_on_category');
        $last_page = ceil($total_jobs / $jobs_per_page);
        $previous_page = $page > 1 ? $page - 1 : 1;
        $next_page = $page < $last_page ? $page + 1 : $last_page;
        $category->setActiveJobs($em->getRepository('IbwJobeetBundle:Job')->getActiveJobs($category->getId(), $jobs_per_page, ($page - 1) * $jobs_per_page));

        $format = $this->getRequest()->getRequestFormat();

        return $this->render('IbwJobeetBundle:Category:show.' . $format . '.twig', array(
            'category' => $category,
            'last_page' => $last_page,
            'previous_page' => $previous_page,
            'current_page' => $page,
            'next_page' => $next_page,
            'total_jobs' => $total_jobs,
            'feedId' => sha1($this->get('router')->generate('IbwJobeetBundle_category', array('slug' => $category->getSlug(), 'format' => 'atom'), true)),
            'lastUpdated' => $lastUpdated
        ));


    }
}