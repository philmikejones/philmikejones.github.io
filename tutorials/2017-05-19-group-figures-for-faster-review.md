
# Automate image layout for comparison

date: 2017-05-19




For a project I'm working on I needed to compare three figures each for about 50 countries.
Printing 150 images seemed like a waste (especially as I would need to print the images single--sided) and open three images to view on screen 150 times was likely to result in me opening the wrong image at least once.
My solution was to group the three images for each country onto one image for me to easily compare, and print if necessary.



To do this I wrote the following small python script using the [`pillow`](https://python-pillow.org/) library.
The script:

1. creates a blank canvas (A3 size),
1. loads the images,
1. places them together on a blank canvas, and
1. saves the output for review.

My images were called:

- `mort_ABC.png` (`mort_` means mortality; `ABC` are [alpha--3 country codes](https://en.wikipedia.org/wiki/ISO_3166-1#Current_codes)) is a Lexis surface plot of mortality, one for each country; and
- `cohort_ABC.png` are line charts, one for females and one for males for each country.

`mort_ABC.png` is about 420mm x 148mm, and fills the top half of each resulting canvas.
`cohort_ABC.png` are about A5 in size, and between them fill the bottom half of the canvas side by side.
The table below, although crude, should give you some idea of what the result will look like:

| `mort_ABC.png`             |                          |
|---------------------------:|--------------------------|
| `cohort_ABC.png` (females) | `cohort_ABC.png` (males) |

Anyway, here's the code:

<script src="https://gist.github.com/philmikejones/c2465a992b678e7fde464caed60dd569.js"></script>

The final stage was to combine all the resultant files into one multiple--page pdf for easier printing.
Save the following shell script (for example as `group_pages.sh`:

```bash
#! /bin/bash

countries=$(find . -name "country_*.png" | sort)
convert $countries countries.pdf
```

Make sure it's executable:

```bash
chmod u+x group_pages.sh
```

Then run the script:

```bash
./group_pages.sh
```
