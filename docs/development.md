## Development

Below instructions are written for Ubuntu Linux.

### Software needed

* [GPSBabel](http://www.gpsbabel.org/index.html)
* [Saxon-HE](https://www.saxonica.com/download/java.xml)

Install above with:
```
sudo apt install libsaxonb-java gpsbabel
```

Note that you can not use commonly used `xsltproc` since it is limited to XSLT 1.0. Saxon supports XSLT 2.0.

### Export Google Maps to KML

1. Open [HSY water posts in Google Maps based map](https://www.google.com/maps/d/viewer?mid=1WeNhhtc9n4ypJ_X3bz5KpLppR5JNsk9A&usp=sharing) in public read mode (not edit mode)
2. Click three dots from upper left corner
3. Choose load as KML (not as zipped KMZ)

### Update all files from updated KML file

```
cd scripts
./update-all.sh
```


### Transform KML file exported from Google Maps to OSM file

```
cd scripts
./kml-to-osm.sh
```

### Transform KML file exported from Google Maps to GPX file

```
cd scripts
./kml-to-gpx.sh
```

### Transform KML file exported from Google Maps to uMap compatible KML file

Google Maps contains field names with spaces and ä/ö/å characters which do not seem to work in uMap. Thus need to convert those field names to English ones.
Also adding `icon_symbol` field to show T/N for handle type in uMap.

```
cd scripts
./kml-to-umap-compatible-kml.sh
```

Import data to uMap as KML and replace layer contents. Take backup first in uMap, shape colors will reset and those need to be updated manually.

### Upload Mapillary images

Install [Mapillary tools](https://github.com/mapillary/mapillary_tools). Go to folder where new images are and execute:
```
mapillary_tools process_and_upload --import_path "./" --user_name "YOUR_MAPILLARY_USERNAME"
```

Mapillary might take a day to process images. Add link to mapillary image to Google Maps datasheet.

## Original data

HSY original data is copied to `hsy-original-data` folder. There are two formats available:
* MapInfo TAB file `*.tab`
* ESRI Shapefile `*.shp`

Original shapefile converted once to KML using tool: https://mygeodata.cloud/converter/shp-to-kml (uploaded whole zip file, allows 3 free conversions per month). 

Can also use `ogr2ogr` tool locally (above service apparently uses `ogr2ogr` also in the background):
```
sudo apt install gdal-bin
cd hsy-original-data/
./convert-to-kml.sh
```
