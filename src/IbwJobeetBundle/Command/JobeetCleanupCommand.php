<?php

namespace IbwJobeetBundle\Command;

use Symfony\Bundle\FrameworkBundle\Command\ContainerAwareCommand;
use Symfony\Component\Console\Input\InputArgument;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Input\InputOption;
use Symfony\Component\Console\Output\OutputInterface;
use IbwJobeetBundle\Entity\Job;

class JobeetCleanupCommand extends ContainerAwareCommand
{

    protected function configure()
    {
        $this
            ->setName('ibw:jobeet:cleanup')
            ->setDescription('Cleanup Jobeet database')
            ->addArgument('days', InputArgument::OPTIONAL, 'The email', 90)
        ;
    }

    protected function execute(InputInterface $input, OutputInterface $output)
    {
        #引数に日数
        $days = $input->getArgument('days');
        #ドクトリンDI
        $em = $this->getContainer()->get('doctrine')->getManager();
        #リポジトリcleanupメソッドの実行
        $nb = $em->getRepository('IbwJobeetBundle:Job')->cleanup($days);
        #コマンドラインにテキストを出力
        $output->writeln(sprintf('Removed %d stale jobs', $nb));
    }


}