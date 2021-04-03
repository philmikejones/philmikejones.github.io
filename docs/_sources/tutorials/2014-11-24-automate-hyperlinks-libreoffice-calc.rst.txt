Automate Hyperlinks in LibreOffice Calc
=======================================

date: 2014-11-24

I’m in the middle of obtaining articles I’ve identified as part of
literature review search. I have a large LibreOffice Calc table with
bibliographic details of all the articles I’ve considered (plus a marker
for whether I have excluded the article manually or not).

Having to copy and paste article titles or DOIs into Google is a bit of
a chore, if I’m honest, as there are nearly 100 of them, so to automate
the Google search somewhat I carried out the following steps:

1. Copy the column of the information you’re going to search on. For
   example, I know I have the title for each article so I’ve taken a
   copy of the title column to edit.
2. Format the copied titles into an appropriate format to pass to
   google. This includes removing any line breaks and spaces:

   1. To remove link breaks, select the column and Find & Replace (CTRL
      + H). Search for and replace with nothing (i.e. leave the replace
      field blank). Replace all.
   2. Google expects spaces linking words to be a + symbol. Again,
      select the entire column press CTRL + H and search for a space
      character (just hit spacebar once), and replace with +. Again,
      replace all.

3. To turn these formatted strings into Google hyperlinks to search,
   select the column againand press CTRL + H for another find and
   replace. Find .\* and replace with
   =HYPERLINK(&#8220https://www.google.co.uk/search?q=&”)

   1. This searches for, effectively, the entire content of each cell.
      This is then passed to the end of the replace string where the ‘&’
      is.
   2. Each cell should now be a hyperlink that can simply be clicked,
      greatly reducing search time!

Sources:
--------

-  `List of regular
   expressions <https://help.libreoffice.org/Common/List_of_Regular_Expressions>`__
-  http://ask.libreoffice.o../_static/question/19726/calc-make-rows-of-text-into-google-search-hyperlinks/
