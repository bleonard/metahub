# Metahub

Do things to all your github repositories.

## Install

    $ git clone git@github.com:bleonard/metahub.git
    $ cd metahub
    $ bundle install

## Backup

    $ bundle exec ./bin/metahub backup

    Github Username: bleonard
    Github Password: ***********

    assaf/vanity...
    git clone git@github.com:assaf/vanity.git /Users/brian/bleonard/metahub/2014.3.10/assaf/vanity
    Cloning into '/Users/brian/bleonard/metahub/2014.3.10/assaf/vanity'...
    remote: Reusing existing pack: 4550, done.
    remote: Total 4550 (delta 0), reused 0 (delta 0)
    Receiving objects: 100% (4550/4550), 2.87 MiB | 86.00 KiB/s, done.
    Resolving deltas: 100% (2049/2049), done.
    Checking connectivity... done
     ...done!

    bleonard/actionHero...
    git clone git@github.com:bleonard/actionHero.git /Users/brian/bleonard/metahub/2014.3.10/bleonard/actionHero
    Cloning into '/Users/brian/bleonard/metahub/2014.3.10/bleonard/actionHero'...
    remote: Counting objects: 3360, done.
    remote: Compressing objects: 100% (1868/1868), done.

    ... lots of those

## Repositories

    $ bundle exec ./bin/metahub repositories

    Github Username: bleonard 
    Github Password: ***********

    assaf/vanity
    bleonard/actionHero
    bleonard/blackbook
    bleonard/bleonard.github.com
    bleonard/bootstrap

    ... lots of those

## TODO

* Probably more commands to come