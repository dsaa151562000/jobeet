<?php
/**
 * Created by PhpStorm.
 * User: s
 * Date: 2016/03/08
 * Time: 10:19
 */

namespace Nazo\UserBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Security\Core\SecurityContext;
use Nazo\UserBundle\Entity\User;


class UserAdminController extends Controller
{

    /**
     * @Route("/admin/user/index", name="admin_user_index")
     * @Template()
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getEntityManager();
        $users = $em->getRepository('NazoUserBundle:User')->findAll();
        return array(
            'users' => $users,
        );
    }


    /**
     * @Route("/admin/user/create", name="admin_user_create")
     * @Template()
     */
    public function createAction()
    {

        return $this->onEdit(null);
    }

    /**
     * @Route("/admin/user/edit", name="admin_user_edit")
     * @Template()
     */
    public function editAction(Request $request)
    {
        $id = $request->get('id');

        return $this->onEdit($id);
    }

    /**
     * protected
     *
     */
    protected function onEdit($id = null)
    {

        $em = $this->getDoctrine()->getEntityManager();
        $request = $this->get('request');


        if ($id == null) {
            $user = new User();
        } else {
            $user = $em->getRepository('NazoUserBundle:User')->find($id);
        }

//        $user = new User();

        $form = $this->createFormBuilder($user)

            ->add('username', 'text')
            ->add('password', 'password')
            ->getForm();

        if ($request->getMethod() == 'POST') {
            $form->handleRequest($request);

            if ($form->isValid()) {
                // encrypt password



                $salt = sha1(uniqid($user->getUsername(), true));
                $password_raw = $user->getUsername();
                $user->setSalt($salt);

                $ef = $this->get('security.encoder_factory');
                $password = $ef->getEncoder($user)->encodePassword($password_raw, $salt);
                $user->setPassword($password);

                $em->persist($user);
                $em->flush();
            }
        }

        return $this->render('NazoUserBundle:UserAdmin:edit.html.twig', array(
            'user' => $user,
            'form' => $form->createView(),
        ));
    }


}