Spatial packages and Travis
===========================

Date: 2017-05-12 Update: 2021-03-13 - I no longer use Travis CI as they
don’t seem to support open source projects any more. I should ideally
update this post to work with generic docker containers that can be
deployed anywhere.

A number of ``R`` spatial libraries have been updated in the last couple
of weeks, and this has played havoc with my Travis–CI build. I had still
been using Ubuntu Trusty with Travis which uses old versions of
libraries like ``rgdal`` and ``rgeos``, so I needed to move to updated
versions of these. In addition ``sf`` has now become a dependency for a
number of spatial packages like ``tmap``, and this uses
``libudunits2-dev`` which isn’t installed by default.

To solve all these problems at once as simply as possible, I switched to
using a docker container within Travis so I could use an Ubunutu 16.04
(‘Xenial’) build. This meant I was able to upgrade to more up–to–date
versions of most packages. I installed the ``ubuntugis-unstable`` ppa to
use the most recent versions of ``gdal``, ``geos``, and ``proj``. I
finally installed ``libudunits2`` so I could update ``sf``.

The docker container is a bit slower (6 minutes vs 3 minutes) but will
hopefully speed up with caching.

The final ``.travis.yml`` looked like this (I’ve removed my notification
options and coverage report token for clarity):

.. code:: yaml

   sudo: required

   services:
     - docker

   language: r
   cache: packages

   before_install:
     - "docker pull ubuntu:16.04"
     - sudo add-apt-repository ppa:ubuntugis/ubuntugis-unstable -y
     - sudo apt-get --yes --force-yes update -qq
     - sudo apt-get install libgdal-dev libgeos-dev libproj-dev libudunits2-dev libv8-dev libprotobuf-dev protobuf-compiler libjq-dev

   r_packages:
     - sp
     - rgdal
     - rgeos
