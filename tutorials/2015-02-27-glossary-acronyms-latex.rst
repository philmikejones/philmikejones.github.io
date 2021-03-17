Glossary and acronyms in LaTeX
==============================

date: 2015-02-27

To write a glossary in LaTeX you need to use a specific packages
designed for the purpose. It then allows you to define a term and its
acronym in a file, then reference the item later. The first time the
item is referred to the full label and acronym are displayed
automatically:

   United Kingdom (UK)

All subsequent times you reference the item LaTeX just the acronym is
shown:

   UK

As you edit and chop and change your document structure you don’t have
to worry about where the first reference is, this is tracked
automatically. You also get a nice glossary page at the beginning of
your document that lists all acronyms or definitions.

Getting the acronyms and glossaries working is relatively easy. In the
preamble of your document, place the following code *before*
``usepackage{hyperref}`` to load the appropriate package:

.. code:: latex

   usepackage{hyperref}
   usepackage[toc]{glossaries}
     makeglossaries

``toc`` places a listing for the glossary in the table of contents.
``makeglossaries`` builds the glossary list when you build the main
file.

I place all my glossary items and acryonyms in a separate file (called,
imaginatively, ``glossary.tex``) so I refer to this using input where I
want the glossary to be placed in the document (typically after the
table of contents):

.. code:: latex

   input{glossary.tex}
   printglossaries

I use ``input{}`` rather than ``include{}`` so as not to force a page
break.

In the ``glossaries.tex`` file I list all my glossary items and
acronyms. The syntax for producing these is well documented in the
`LaTeX Wikibook:
http://en.wikibooks.org/wiki/LaTeX/Glossary <http://en.wikibooks.org/wiki/LaTeX/Glossary>`__
so I won’t reproduce that here. As an example, my ``glossary.tex``
includes:

.. code:: latex

   newacronym{UK}{UK}{United Kingdom}

The first ‘``{UK}``’ is the label referred to later, the second
‘``{UK}``’ is the acronym which is printed each time you reference it,
and the ‘``{United Kingdom}``’ is the description used in the glossary
and when referenced the first time.

In my main document I can then simply refer to this listing using:

.. code:: latex

   gls{UK}

This generally worked fine, but I did struggle to produce the glossary
list at the beginning of the document, despite no warnings or errors
when I built the document. It traspired that there is an additional
build step, like when building a bibliography:

1. Build ``file.tex``.
2. Build glossary using ``makeglossary``.
3. Build ``file.tex`` again.
4. (Maybe) build ``file.tex`` again.

It seems that in most LaTeX GUIs there isn’t a build option for
glossaries, so you can either build the glossary from the command line
or create a build button. To build from the command line, first build
your ``.tex`` file, then navigate to (or open your terminal at) the
folder your ``.tex`` file is located in and type:

.. code:: bash

   makeglossary file

Replace ``file`` with your actual filename without an extension, then
build your ``.tex`` file again (and maybe again).

If, like me, you can’t be bothered to run this command every time your
glossary items change, you can add a button to most LaTeX GUIs. For
example, in LaTeXilla:

1. Open the Build > Manage Build Tools menu.
2. Press ``+`` under ‘Personal build tools’.
3. Enter the following details:

   -  Label: Run makeglossaries
   -  Description: Make glossary and acronyms (optional)
   -  Extensions: ``.tex``
   -  Icon: Execute
   -  Commands: ``makeglossaries $shortname``
   -  Post-processor: all-output

This adds a new button to the GUI called ‘Make glossary and acronyms’.
