
# Update to Townsend deprivation score script

date: 2015-05-10

I've updated and released a new version of the Townsend material deprivation score script.

## Changes in v2.0

- The script now uses the Nomis web API to obtain census data through a http:// connection, meaning they can be downloaded, unzipped and loaded from within an interactive session.
- Shapefiles of England and Wales are now downloaded from the UK data service boundary data archive's easy downloader, again meaning shapefiles can be downloaded from within an interactive session rather than having to be downloaded and unpacked separately.
- A thematic map of appropriate geography and a csv file with z-scores for use in GIS software are output.

## Source

Get the source from github: [townsend-depr-score-2011](https://github.com/philmikejones/townsend-depr-score-2011/releases/tag/v2.0)

