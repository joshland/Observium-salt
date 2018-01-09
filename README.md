# Observium Install and Configuration Salt State

I adapted this work from another observium configurator.  I have updated this to the latest community edition, and I have targetted it to run on Fedora 2x series.

I may re-adapt the changes for Centos7, and Ubuntu, if I find a practical application.  This is a super-simple state which remains focussed on the objective: reliable installation.

.. note::

    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.


## File List

     .
     ├── example.sls              Top.sls Example
     ├── observium
     │   ├── config.sls           Config re-writer state.
     │   ├── files
     │   │   ├── apache2.conf     Apache2 Configuration Base #deprecated
     │   │   ├── apache-default   Aapche2 Default Config #deprecated
     │   │   ├── config.php       Observium stock config
     │   │   ├── cron             Observium stock cron entries.
     │   │   ├── nginx.conf       Nginx Conf.d snippet
     │   │   ├── www.obs.php      php-fpm configuration file
     │   ├── init.sls             Packaged install state.
     │   ├── php5.sls             PHP5 package state
     │   ├── php7.sls             PHP7 package state
     │   └── users.sls            User creation state.
     ├── pillar.sls
     └── README.md
     
