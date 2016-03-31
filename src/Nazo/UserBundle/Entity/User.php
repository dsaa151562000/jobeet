<?php

namespace Nazo\UserBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Security\Core\User\UserInterface;
use Symfony\Component\Security\Core\User\AdvancedUserInterface;

/**
 * Nazo\UserBundle\Entity\User
 *
 * @ORM\Table(name="users")
 * @ORM\Entity
 */
class User implements AdvancedUserInterface
{
    /**
     * @var integer $id
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @var string $username
     *
     * @ORM\Column(name="username", type="string", length=255)

     */
    private $username;

    /**
     * @var string $password
     *
     * @ORM\Column(name="password", type="string", length=255)
     */
    private $password;

    /**
     * @var string $salt
     *
     * @ORM\Column(name="salt", type="string", length=255)
     */
    private $salt;

    private $accountNonExpired = true;
    private $credentialsNonExpired = true;
    private $accountNonLocked = true;
    private $enabled = true;
    private $roles = array('ROLE_USER');


    /**
     * Get id
     *
     * @return integer
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * {@inheritdoc}
     */
    public function getPassword()
    {
        return $this->password;
    }

    /**
     * Saltを返すメソッド
     * {@inheritdoc}
     */
    public function getSalt()
    {
        return $this->salt;
    }

    /**
     * {@inheritdoc}
     */
    public function getUsername()
    {
        return $this->username;
    }

    /**
     * Set password
     *
     * @param string $password
     */
    public function setPassword($password)
    {
        $this->password = $password;
    }

    /**

     * Set salt
     *
     * @param string $salt
     */
    public function setSalt($salt)
    {
        $this->salt = $salt;
    }

    /**
     * Set username
     *
     * @param string $username
     */
    public function setUsername($username)
    {
        $this->username = $username;
    }

    /**
     * 権限を返す private $roles = array('ROLE_USER');
     * {@inheritdoc}
     */
    public function getRoles()
    {
        return $this->roles;
    }
    /**
     * {@inheritdoc}
     */
    public function isAccountNonExpired()
    {
        return $this->accountNonExpired;
    }

    /**
     * {@inheritdoc}
     */
    public function isAccountNonLocked()
    {
        return $this->accountNonLocked;
    }

    /**
     * {@inheritdoc}
     */
    public function isCredentialsNonExpired()
    {
        return $this->credentialsNonExpired;
    }

    /**
     * {@inheritdoc}
     */
    public function isEnabled()
    {


        return $this->enabled;
    }

    /**
     * * 取得されたくないようなユーザーデータとかを削除するメソッドらしい
     * {@inheritdoc}
     */
    public function eraseCredentials()
    {
    }

    /**
     *  同一ユーザーであるかの判定
     * {@inheritDoc}
     */
    public function equals(UserInterface $user)
    {
        if (!$user instanceof User) {
            return false;
        }

        if ($this->password !== $user->getPassword()) {
            return false;
        }

        if ($this->getSalt() !== $user->getSalt()) {
            return false;
        }

        if ($this->getUsername() !== $user->getUsername()) {

            return false;
        }

        if ($this->accountNonExpired !== $user->isAccountNonExpired()) {
            return false;
        }

        if ($this->accountNonLocked !== $user->isAccountNonLocked()) {
            return false;
        }

        if ($this->credentialsNonExpired !== $user->isCredentialsNonExpired()) {
            return false;
        }

        if ($this->enabled !== $user->isEnabled()) {
            return false;
        }

        return true;
    }
}