Formal informal testing of research code
========================================

date: 2016-01-29

When writing research code I do test my code and results, but until
recently I’ve only been doing this informally and not in any systematic
way. I decided it was time to change my testing habits when I noticed I
had recoded a variable incorrectly despite my informal tests suggesting
nothing was wrong. When I went back and corrected this error this made a
small, but noticeable, difference to my model.

I didn’t want to write formal unit tests that required setting up new
folders and files, etc., as I would use this as an excuse not to switch
tabs and write the tests. My other concern is that I am often testing
large dataframes that I remove from memory once checked and merged into
something else, so they don’t persist for external testing (like a
function). For my own needs I just wanted to write a test inline with
the script, which would halt the execution of the script if the test did
not pass. I would suggest this approach would work for many researchers
writing code as scripts in environments like R or Python.

Writing informal tests formally
-------------------------------

For R users a great tool I found is the ``testthat`` package by Hadley
Wickham. It’s available on CRAN so is as easy as any other package to
install. Stick near the top of your script:

.. raw:: html

   <pre class="brush: r; title: ; notranslate" title="">install.packages("testthat")
   library("testthat")</pre>

Really the package is written for package authors who want to automate
their testing, but by dropping a few bits it can easily be integrated
into a script and the tests are performed when sourceing the file.

The `testthat
documentation <https://cran.r-project.org/web/packages/testthat/index.html>`__
outlines how to write a test, and the syntax to use. As an example, the
following test checks to see that the right number of rows and columns
are present, assuming we know our data should have 1,000 respondents and
20 variables, respectively:

.. raw:: html

   <pre class="brush: r; title: ; notranslate" title="">df &lt;- readr::read_csv("data.csv")
    
   context("Check df loaded correctly")
   test_that("df correct number of rows (respondents) loaded?", {
     expect_that(nrow(df), equals(1000))
   })
   test_that("df correct number of columns (variables) loaded?", {
     expect_that(ncol(df), equals(20))
   })</pre>

Clearly this is a trivial example and you probably wouldn’t test to this
detail, but this does show you the outline of the test format. I use a
new context for each group of tests focused around an individual object
or function. For example, I would write a new context when no longer
testing ``df``. Within each context you can then have as many
test_that() calls, and within each test_that() calls you can have as
many expect_that() calls as you like. This effectively allows you to
give your test groups ‘headings’ to remind you of their purpose and
structure. These headings are useful when the tests fail because they
form part of the error message returned to you so you can easily spot
what’s wrong.

The advantage of using testthat in this way is that it stops execution
of the script if any tests fail. Assuming you write good tests, you can
be confident that if the script finishes that there are no errors.

## Writing informal tests systematically

.. raw:: html

   <figure id="attachment_1749" class="thumbnail wp-caption aligncenter" style="width: 562px">

.. raw:: html

   <figcaption class="caption wp-caption-text">

Think about your unit tests

.. raw:: html

   </figcaption>

.. raw:: html

   </figure>

Of course, tests don’t write themselves so you need to cover this
yourself. This takes practice, am I don’t claim to have mastered writing
unit testing yet. The bits of advice I have picked up through trial and
error and reading others’ work, though, are:

1. Test systematically. Test everything. Test every time you create a
   new object (function, data frame, variable, vector, etc).
2. Of course, some objects are pretty straightforward, so use your
   judgement when applying suggestion 1! If in doubt, err on the side of
   testing.
3. If writing a function, write some tests that compare the output with
   what you expect the output to be.
4. If testing a data frame check you have the right number of
   respondents (rows) and variables (columns) if necessary. Test to see
   that there are no responses that do not have an incorrect value. For
   example, if your variable should be binary (0/1) only check there are
   no 2s.
5. If the class of an object is important, test to see if it is that
   class.
6. When you recode a variable, test these have been recoded correctly.
7. Prefer tests that are comprehensive over tests that sample, if
   possible. For example, write tests that check a whole vector rather
   than a selection of values in that vector.
8. Test what you can, and you’ll get better with practice. Testing
   *some* things is better than testing *no* things.

Why bother testing?
-------------------

Well, clearly it’s up to you if you test. There is an investment upfront
in learning to test, but it’s not that great. You can be up and running
writing testthat tests within half a day, tops. In my case, that
investment has saved me two things:

1. Time. When I come to re-use a function (or copy+paste a section of
   code) I have the tests in place so I can run the new code immediately
   and know if it’s working or not without having to scrutinise every
   line of code or test a number of outputs from the function. They’re
   written, and they’ll fail if there’s a problem.
2. Worry. I am now much more confident in my results than ever before,
   because I know that I’ve made sensible tests along the way. Crucially
   I also know that if I ever need to change anything the tests will
   inform me if there’s a problem, rather than having to check
   everything carefully or hope for the best_.\_
