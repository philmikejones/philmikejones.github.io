Unit testing in R
=================

date: 2018-03-07

Yesterday I gave a short talk for the `Sheffield R Users’
Group <http://sheffieldr.github.io/>`__ about unit testing in R.

.. figure:: https://philmikejones.me/img/lack-of-unit-tests-disturbing.png
   :alt: I find your lack of unit tests disturbing

   I find your lack of unit tests disturbing

I shared some examples of tests I’ve used with
`rakeR <https://github.com/philmikejones/rakeR>`__ and my
`thesis <https://github.com/philmikejones/thesis>`__.

In short, there are two things you should really be testing when working
in R:

1. Data analysis scripts (usually in ``data-raw/``)
2. Functions (usually in ``R/``)

Head over to the repo and follow the instructions there to get started
with your own tests: https://philmikejones.github.io/RUnitTesting/
