
# rakeR v0.1.1 released on CRAN

date: 2016-09-19


I'm proud to announce the [initial release of rakeR](https://cran.r-project.org/package=rakeR), v0.1.1, has been published on CRAN! It's licensed under the GPLv3 so you can use it for any projects you wish.

## Purpose

The goal behind rakeR is to make performing spatial microsimulation in R as easy as possible. R is a succinct and expressive language, but previously performing spatial microsimulation required multiple stages, including weighting, integerising, expanding, and subsetting. This doesn't even include testing inputs and outputs, and validation of the results. To make matters worse, each stage of the microsimulation required the input data to be in a slightly different format, adding to the workload of the analyst and the complexity of the task, introducing multiple opportunities for errors to creep in.

rakeR reduces this complexity, risk and time needed by:

- Performing the data re-formatting for each stage silently and automatically: no manual processing of data between stages.
- Accepting standardised arguments. The core functions accept either: two data frames and a character vector of variables to constrain over; or a table of weights.
- Robust error checking. The core functions are designed to be strict and not to try to correct any inputs. This means getting the inputs in the right format can sometimes be tricky, but because of this you can be confident in the results. There are also functions to help you check your inputs to make this as pain-free as possible.


## Documentation

See [`rakeR` package documentation](https://philmikejones.github.io/rakeR/) website for help with usage and function reference.


## Acknowledgements

Many of the functions in this package are based on code written by [Robin Lovelace](https://github.com/Robinlovelace) and [Morgane Dumont](https://github.com/modumont) for their book [_Spatial Microsimulation with R_ (2016), Chapman and Hall/CRC Press](https://www.crcpress.com/Spatial-Microsimulation-with-R/Lovelace-Dumont/p/book/9781498711548), licensed under the terms below:

Copyright (c) 2014 Robin Lovelace

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the &#8220;Software&#8221;), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED &#8220;AS IS&#8221;, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

Their book is also an excellent resource for learning about spatial microsimulation and understanding what's going on under the hood of this package.

The rewighting (ipfp) algorithm itself is [written by Andrew Blocker](https://github.com/awblocker/ipfp) and is written in `C` for maximum speed and efficiency.

Thanks to [Tom Broomhead](http://mhs.group.shef.ac.uk/members/tom-broomhead/) for his feedback on error handling and suggestions on function naming.
