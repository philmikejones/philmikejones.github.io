---
title: "Test your data"
author: "Phil Mike Jones"
date: 2019-04-09
categories: "tutorials"
tags: ["r", "rstats", "test", "unit test", "testthat"]
---

# Test your data

2019-04-09

I've written and spoken before about how important it is to [test your functions and data analysis scripts](blog/unit-testing-in-r/).
I decided to revisit these ideas and write this tutorial based on my recent experience of calculating the number of units of alcohol the panel members in the [NCDS and BCS70 birth cohorts](https://cls.ucl.ac.uk/cls-studies/) drank at different time points.
I initially thought this would be a straightforward mathematical calculation but this turned out to be vastly more complicated than I thought (it always does!).
My tests of the data identified the problem (something I would likely have missed without them) and confirmed when I had solved it.
I use `testthat` in `R` although the ideas are language--agnostic.

I am currently using the NCDS and BCS70 birth cohort data sets to model alcohol consumption at different time points.
Respondents were asked questions about the type and quantity of drinks they consumed in the past seven days, and we decided to convert these into just units of alcohol consumed to simplify the modelling.
For example, at most time points cohort members were asked how many pints or glasses of beer, wine, and spirits they had consumed in the past seven days.

For this example I'm going to take an extract from the BCS70 cohort in 1986 when they were aged 16, but the other time points and cohort raised very similar issues.
I obviously can't include actual BCS70 data as it is restricted (but if you're a UK academic researcher you can download the [BCS70 sixteen--year follow--up (1986)](https://beta.ukdataservice.ac.uk/datacatalogue/studies/study?id=3535) yourself).

I've taken a sample of 100 respondents and removed their given IDs and replaced these with just a unique integer.
In all other respects I've constructed the example data to be as close to the original data as possible, including the proportion of completed/missing responses.
You can [download my example data](https://philmikejones.me/_static/data/bcs70.csv) or load it directly into `R`.

As with any script, first let's load the packages we need:


```r
# if necessary run:
# install.packages(c("readr", "dplyr", "testthat", "usethis", "tidyr"))

library("readr")
library("dplyr")
library("usethis")
library("testthat")
library("tidyr")
```

Now download the example data we'll use:


```r
url = "https://philmikejones.me/_static/data/bcs70.csv"
bcs70 = read_csv(url)
```

```
## 
## ?????? Column specification ?????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
## cols(
##   bcsid = col_double(),
##   days_drink = col_double(),
##   beer = col_double(),
##   cider = col_double(),
##   sherry = col_double(),
##   wine = col_double(),
##   shandy = col_double(),
##   spirits = col_double()
## )
```

Let's take a look at the top and bottom cases:


```r
head(bcs70)
```

```
## # A tibble: 6 x 8
##   bcsid days_drink  beer cider sherry  wine shandy spirits
##   <dbl>      <dbl> <dbl> <dbl>  <dbl> <dbl>  <dbl>   <dbl>
## 1     1         NA    NA    NA     NA    NA     NA      NA
## 2     2         NA    NA    NA     NA    NA     NA      NA
## 3     3         NA    NA    NA     NA    NA     NA      NA
## 4     4         NA    NA    NA     NA    NA     NA      NA
## 5     5         NA    NA    NA     NA    NA     NA      NA
## 6     6         NA    NA    NA     NA    NA     NA      NA
```

```r
tail(bcs70)
```

```
## # A tibble: 6 x 8
##   bcsid days_drink  beer cider sherry  wine shandy spirits
##   <dbl>      <dbl> <dbl> <dbl>  <dbl> <dbl>  <dbl>   <dbl>
## 1    95         NA    NA    NA     NA    NA     NA      NA
## 2    96          1     0     0      0     2      0       0
## 3    97         NA    NA    NA     NA    NA     NA      NA
## 4    98          1     1     0      0     0      0       0
## 5    99          1     1     0      0     0      0       0
## 6   100         NA    NA    NA     NA    NA     NA      NA
```

Like all social science data it is a bit messy.
We can see there are a lot of completely missing cases (`NA`) so these respondents exist at some point in the BCS70 but were not asked the alcohol questions (or any questions) in 1986.
Those with answers look like they have a value in each question (even if it's `0.0`).
So let's get to it.

My approach here is to calculate the number of units of each drink type consumed and create a new variable for each.
So for `beer` I will calculate `beer_units`, `cider` I will calculate `cider_units`, and so on.
I will therefore be using `mutate()` in the `dplyr()` package for these calculations so that existing variables are not removed.


```r
bcs70 =
  bcs70 %>%
  mutate(
    beer_units = beer * 2.3,
    cider_units = cider * 2.6,
    sherry_units = sherry * 1.8,
    wine_units = wine * 1.8,
    shandy_units = shandy * 2.3 / 2,
    spirits_units = spirits * 1.0
  )

bcs70
```

```
## # A tibble: 100 x 14
##    bcsid days_drink  beer cider sherry  wine shandy spirits beer_units
##    <dbl>      <dbl> <dbl> <dbl>  <dbl> <dbl>  <dbl>   <dbl>      <dbl>
##  1     1         NA    NA    NA     NA    NA     NA      NA         NA
##  2     2         NA    NA    NA     NA    NA     NA      NA         NA
##  3     3         NA    NA    NA     NA    NA     NA      NA         NA
##  4     4         NA    NA    NA     NA    NA     NA      NA         NA
##  5     5         NA    NA    NA     NA    NA     NA      NA         NA
##  6     6         NA    NA    NA     NA    NA     NA      NA         NA
##  7     7         NA    NA    NA     NA    NA     NA      NA         NA
##  8     8         NA    NA    NA     NA    NA     NA      NA         NA
##  9     9          1     0     2      0     0      0       0          0
## 10    10         NA    NA    NA     NA    NA     NA      NA         NA
## # ??? with 90 more rows, and 5 more variables: cider_units <dbl>,
## #   sherry_units <dbl>, wine_units <dbl>, shandy_units <dbl>,
## #   spirits_units <dbl>
```

After I've calculated the units for each individual drink I'll first try simply adding them up to arrive at the number of units consumed in the past seven days:


```r
bcs70 =
  bcs70 %>%
  mutate(
    total_units =
      beer_units + cider_units + sherry_units + wine_units +
      shandy_units + spirits_units
  )

bcs70
```

```
## # A tibble: 100 x 15
##    bcsid days_drink  beer cider sherry  wine shandy spirits beer_units
##    <dbl>      <dbl> <dbl> <dbl>  <dbl> <dbl>  <dbl>   <dbl>      <dbl>
##  1     1         NA    NA    NA     NA    NA     NA      NA         NA
##  2     2         NA    NA    NA     NA    NA     NA      NA         NA
##  3     3         NA    NA    NA     NA    NA     NA      NA         NA
##  4     4         NA    NA    NA     NA    NA     NA      NA         NA
##  5     5         NA    NA    NA     NA    NA     NA      NA         NA
##  6     6         NA    NA    NA     NA    NA     NA      NA         NA
##  7     7         NA    NA    NA     NA    NA     NA      NA         NA
##  8     8         NA    NA    NA     NA    NA     NA      NA         NA
##  9     9          1     0     2      0     0      0       0          0
## 10    10         NA    NA    NA     NA    NA     NA      NA         NA
## # ??? with 90 more rows, and 6 more variables: cider_units <dbl>,
## #   sherry_units <dbl>, wine_units <dbl>, shandy_units <dbl>,
## #   spirits_units <dbl>, total_units <dbl>
```


## Set up tests

To test to see if this worked I create a test suite.
The easiest way to do this is with the `usethis` package:


```r
use_test("test-bcs70")
```

This creates the necessary `tests/` directories and sets up a test file.

## Test calculations

First set up a context and load the necessary libraries, and as our first test I want to ensure the calculated `_units` variables are numeric (specifically double):


```r
context("Test bcs70")

test_that("Calculated units are numeric", {
  expect_type(bcs70$beer_units, "double")
  expect_type(bcs70$cider_units, "double")
  expect_type(bcs70$sherry_units, "double")
  expect_type(bcs70$wine_units, "double")
  expect_type(bcs70$shandy_units, "double")
  expect_type(bcs70$spirits_units, "double")
  expect_type(bcs70$total_units, "double")
})
```

```
## Test passed ????
```

Next I want to test that the number of units calculated are plausible amounts.
The minimum number of units should be `0.0`; it's not possible to consume a negative number of units.


```r
test_that("Calculated minimum units are 0.0", {
  expect_gte(min(bcs70$beer_units), 0.0)
  expect_gte(min(bcs70$cider_units), 0.0)
  expect_gte(min(bcs70$sherry_units), 0.0)
  expect_gte(min(bcs70$wine_units), 0.0)
  expect_gte(min(bcs70$shandy_units), 0.0)
  expect_gte(min(bcs70$spirits_units), 0.0)
  expect_gte(min(bcs70$total_units), 0.0)
})
```

If you run the code above, the tests will fail.
This is because the `min` of a vector with an `NA` in is `NA`: i.e. the `min` of `bcs70$beer` is `NA` because there's an `NA` in that vector:


```r
is.na(min(bcs70$beer))
```

```
## [1] TRUE
```

This is something I forget all the time:

<blockquote class="twitter-tweet" data-cards="hidden" data-lang="en"><p lang="en" dir="ltr">If I had a quid for every time I forgot that NA + 0.0 is NOT 0.0 I&#39;d still be as forgetful but at least I&#39;d be richer <a href="https://twitter.com/hashtag/RStats?src=hash&amp;ref_src=twsrc%5Etfw">#RStats</a> <a href="https://t.co/iaUBCd87Rk">pic.twitter.com/iaUBCd87Rk</a></p>&mdash; ???????????? Phil (@philmikejones) <a href="https://twitter.com/philmikejones/status/1107958263247720448?ref_src=twsrc%5Etfw">March 19, 2019</a></blockquote>
<script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

So we must modify our tests to exclude the NAs with [na.rm = TRUE](https://www.rdocumentation.org/packages/base/versions/3.5.3/topics/Extremes):


```r
test_that("Calculated minimum units are 0.0", {
  expect_gte(min(bcs70$beer_units, na.rm = TRUE), 0.0)
  expect_gte(min(bcs70$cider_units, na.rm = TRUE), 0.0)
  expect_gte(min(bcs70$sherry_units, na.rm = TRUE), 0.0)
  expect_gte(min(bcs70$wine_units, na.rm = TRUE), 0.0)
  expect_gte(min(bcs70$shandy_units, na.rm = TRUE), 0.0)
  expect_gte(min(bcs70$spirits_units, na.rm = TRUE), 0.0)
  expect_gte(min(bcs70$total_units, na.rm = TRUE), 0.0)
})
```

```
## Test passed ????
```

So far, so good.
(You don't need to manually add the `message()` line under normal circumstances as you get feedback from `testthat` in interactive mode, but it's useful here to see if the tests are successful).

Now I want to test to see if the maximum number of units is sensible.
I didn't know in advance what the maximum number of drinks should be, but I worked out that 180 was a sensible maximum for the individual drinks (and therefore 1080 for the total); this is where your domain knowledge comes in:


```r
test_that("Calculated maximum units are 180.0/1080.0", {
  expect_lte(max(bcs70$beer_units, na.rm = TRUE), 180.0)
  expect_lte(max(bcs70$cider_units, na.rm = TRUE), 180.0)
  expect_lte(max(bcs70$sherry_units, na.rm = TRUE), 180.0)
  expect_lte(max(bcs70$wine_units, na.rm = TRUE), 180.0)
  expect_lte(max(bcs70$shandy_units, na.rm = TRUE), 180.0)
  expect_lte(max(bcs70$spirits_units, na.rm = TRUE), 180.0)
  expect_lte(max(bcs70$total_units, na.rm = TRUE), 1080.0)
})
```

```
## Test passed ????
```


## Test for missing data

Next I want to check that if there is data in any of the variables then I should have a value in `total`.
For example if I have a non--missing value in `beer` there should also be a value in `total`.
I wrote the following tests to check for this:


```r
test_that("No missing data when there should be data", {
  expect_false(any(is.na(bcs70$total_units[!is.na(bcs70$beer)])))
  expect_false(any(is.na(bcs70$total_units[!is.na(bcs70$cider)])))
  expect_false(any(is.na(bcs70$total_units[!is.na(bcs70$sherry)])))
  expect_false(any(is.na(bcs70$total_units[!is.na(bcs70$wine)])))
  # expect_false(any(is.na(bcs70$total_units[!is.na(bcs70$shandy)])))
  expect_false(any(is.na(bcs70$total_units[!is.na(bcs70$spirits)])))
})
```

```
## Test passed ????
```

Each of these tests is essentially saying, "if there's data in one of more of the drinks variables (`!is.na()` means 'is not missing') there should not be any missing data in `total_units`".
Notice though that I've commented out the `shandy` variable.
That's because for at least one respondent they gave a number of shandies consumed but one or more drinks were recorded as missing (and as we've seen above a number + `NA` is `NA`):


```r
is.na(NA_real_ + 2.0)
```

```
## [1] TRUE
```

We can see this respondent by `filter`ing:


```r
bcs70 %>%
  filter(!is.na(shandy)) %>%
  filter(is.na(total_units))
```

```
## # A tibble: 1 x 15
##   bcsid days_drink  beer cider sherry  wine shandy spirits beer_units
##   <dbl>      <dbl> <dbl> <dbl>  <dbl> <dbl>  <dbl>   <dbl>      <dbl>
## 1    69          1    NA    NA     NA    NA      2      NA         NA
## # ??? with 6 more variables: cider_units <dbl>, sherry_units <dbl>,
## #   wine_units <dbl>, shandy_units <dbl>, spirits_units <dbl>,
## #   total_units <dbl>
```

How to deal with this case, and any others like it in the main dataset?
I found the easiest way to solve this was to replace all `NA`s with `0.0` in the `_units` variables to ensure `total_units` summed correctly.
The easiest way to do this is with `replace_na()` in the `tidyr` package.
I don't recommend modifying the original variable in place (e.g. `beer`) but as we've calculated `beer_units` we can correct this instead:


```r
bcs70 =
  bcs70 %>%
  replace_na(list(
    beer_units = 0.0,
    cider_units = 0.0,
    sherry_units = 0.0,
    wine_units = 0.0,
    shandy_units = 0.0,
    spirits_units = 0.0
  )) %>%
  mutate(
    total_units =
      beer_units + cider_units + sherry_units + wine_units +
      shandy_units + spirits_units
  )

bcs70
```

```
## # A tibble: 100 x 15
##    bcsid days_drink  beer cider sherry  wine shandy spirits beer_units
##    <dbl>      <dbl> <dbl> <dbl>  <dbl> <dbl>  <dbl>   <dbl>      <dbl>
##  1     1         NA    NA    NA     NA    NA     NA      NA          0
##  2     2         NA    NA    NA     NA    NA     NA      NA          0
##  3     3         NA    NA    NA     NA    NA     NA      NA          0
##  4     4         NA    NA    NA     NA    NA     NA      NA          0
##  5     5         NA    NA    NA     NA    NA     NA      NA          0
##  6     6         NA    NA    NA     NA    NA     NA      NA          0
##  7     7         NA    NA    NA     NA    NA     NA      NA          0
##  8     8         NA    NA    NA     NA    NA     NA      NA          0
##  9     9          1     0     2      0     0      0       0          0
## 10    10         NA    NA    NA     NA    NA     NA      NA          0
## # ??? with 90 more rows, and 6 more variables: cider_units <dbl>,
## #   sherry_units <dbl>, wine_units <dbl>, shandy_units <dbl>,
## #   spirits_units <dbl>, total_units <dbl>
```

Finally so that I knew which respondents genuinely didn't drink and which were simply missing I replaced any `0.0` in `total_units` if *all* the drinks were missing.


```r
bcs70 =
  bcs70 %>%
  mutate(
    total_units = if_else(
      {
        is.na(beer) & is.na(cider) & is.na(sherry) &
        is.na(wine) & is.na(shandy) & is.na(spirits)
      },
      NA_real_,
      total_units
    )
  )
```

Let's review case `69` (identified above) to see if `total_units` is correct:


```r
bcs70 %>%
  filter(bcsid == 69) %>%
  select(beer, shandy, total_units)
```

```
## # A tibble: 1 x 3
##    beer shandy total_units
##   <dbl>  <dbl>       <dbl>
## 1    NA      2         2.3
```

So even though there is missing data (`NA`) in `beer` the `total_units` has been summed correctly.
And indeed if we run the tests now, they all pass (note you would not normally duplicate tests in a document, you'd just run them again):


```r
test_that("No missing data when there should be data", {
  expect_false(any(is.na(bcs70$total_units[!is.na(bcs70$beer)])))
  expect_false(any(is.na(bcs70$total_units[!is.na(bcs70$cider)])))
  expect_false(any(is.na(bcs70$total_units[!is.na(bcs70$sherry)])))
  expect_false(any(is.na(bcs70$total_units[!is.na(bcs70$wine)])))
  expect_false(any(is.na(bcs70$total_units[!is.na(bcs70$shandy)])))
  expect_false(any(is.na(bcs70$total_units[!is.na(bcs70$spirits)])))
})
```

```
## Test passed ????
```


## Test for 'true zero'

Now I want to make sure I have a 'true zero' for the respondents that were asked the drinking questions, but that did not drink.
Notice the `days_drink` variable?
If this contains data (i.e. is not `NA`) then the respondent was asked the series of drinking questions, and should be included in the valid sample, even if they didn't drink anything.
Most respondents who were asked `days_drink` who did not drink have `0` coded in the drinks types so that these sum correctly.
In some cases, though, the drinks data were missing despite the respondent being asked about their drinking behaviour:


```r
bcs70 %>%
  filter(!is.na(days_drink), is.na(shandy)) %>%
  select(bcsid, days_drink, beer, cider, wine, sherry, shandy, spirits, total_units)
```

```
## # A tibble: 1 x 9
##   bcsid days_drink  beer cider  wine sherry shandy spirits total_units
##   <dbl>      <dbl> <dbl> <dbl> <dbl>  <dbl>  <dbl>   <dbl>       <dbl>
## 1    19          1    NA    NA    NA     NA     NA      NA          NA
```

To check for this I wrote the following test, which will fail if any respondent with data in `days_drink` also has a missing value in `total_units`:


```r
test_that("True zero coded", {
  expect_false(any(is.na(bcs70$total_units[!is.na(bcs70$days_drink)])))
})
```

To fix this I replaced any `NA` in `total_units` with 0, *if* there is data in `days_drink`:


```r
bcs70 =
  bcs70 %>%
  mutate(
    total_units = if_else(
      is.na(total_units) & !is.na(days_drink),
      0.0,
      total_units
    )
  )
```

Now when I run the test it passes:


```r
test_that("True zero coded", {
  expect_false(any(is.na(bcs70$total_units[!is.na(bcs70$days_drink)])))
})
```

```
## Test passed ????
```


## Conclusion

I hope from this tutorial/example you can see that what can ostensibly be a straightforward task can, on closer inspection, be challenging to get right.
Testing the calculations and data helped in three main ways:

- Tests helped identify the problem(s).
- Tests helped verify the problems were solved.
- Re--running the tests helped ensure the problem didn't return after fixing something else.

For complex data I would recommend writing a test suite and regularly running it when working on any data processing steps.


## Scripts

I've bundled the data, data processing, and testing code above into files to download to see how these work in a 'real' project (rather than inline in a blog post).

- [Download project zip file](https://philmikejones.me/_static/data/test-example.zip)

## Resources

The best places to start with writing your own tests (and you should) for #rstats are:

- [Testing](http://r-pkgs.had.co.nz/tests.html) chapter in Hadley Wickham's *R Packages*
- The [testthat documentation](https://testthat.r-lib.org/)
- The [testthat tag on StackOverflow](https://stackoverflow.com/questions/tagged/testthat)
