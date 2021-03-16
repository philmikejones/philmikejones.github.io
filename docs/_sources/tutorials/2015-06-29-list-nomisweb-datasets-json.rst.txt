List Nomisweb Datasets with JSON
================================

date: 2015-06-29

You can use the `Nomisweb
API <https://www.nomisweb.co.uk/api/v01/help>`__ to discover (list)
datasets and to obtain them once you have identified what you need. The
API supports a variety of formats but in this tutorial I use
`JSON <https://en.wikipedia.org/wiki/JSON>`__ because it’s less verbose
than other formats so is a smaller file.

``jq`` and ``curl``
-------------------

To list all the available datasets I used a programme called ``jq``
(‘Json Query’ I assume). You can install ``jq`` on an Ubuntu machine
with ``sudo apt install jq`` or ``sudo snap install jq``. You should
install a version >= 1.5. You will also need ``curl``
(``sudo apt install curl``).

The following script uses curl and jq to obtain and filter the results,
retaining ID, name, and description. It then saves the output to
``nomisweb-datasets.txt``:

.. raw:: html

   <script src="https://gist.github.com/philmikejones/99580cdc638611c0060b.js"></script>

-  Line 1 specifies which shell to use.
-  Line 2 specifies the relevant json file listing all the datasets,
   specified in the API documentation.
-  Line 3 is a series of filters piped together. It essentially obtains
   everything; then filters out everything but ``keyfamilies`` at that
   level; then filters everything but ``keyfamily`` (it just so happens
   there’s nothing to filter at that level); then obtains all datasets
   (‘``.[]``’); before finally extracting the id, name, and description
   from each index.
-  Line 4 saves this to the file rather than print it to the terminal
   window as is the default.

``nomisr``
----------

If you’re an R user, querying and obtaining data from the Nomis API is
now even easier with the ```nomisr``
package <https://docs.evanodell.com/nomisr/>`__.
