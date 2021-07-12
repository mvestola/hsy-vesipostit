# HSY vesipostit

Code related to importing HSY drinking water posts (vesipostit) to OpenStreetMap and Google Maps

Below instructions are written for Ubuntu Linux.

## Original address and location data

HSY water post address and location data in this repo is based on [open data provided by HSY](https://www.hsy.fi/ymparistotieto/avoindata/avoin-data---sivut/paakaupunkiseudun-vesipostit/).
This data is enriched by user created data like images, status, handle type etc.

## Map links

* [Google Maps](https://www.google.com/maps/d/viewer?mid=1WeNhhtc9n4ypJ_X3bz5KpLppR5JNsk9A&usp=sharing), short link: [http://www.polkupyoraily.net/hsy-vesipostit](http://www.polkupyoraily.net/hsy-vesipostit)
* [OpenStreetMap](http://u.osmfr.org/m/635042/), short link: [http://www.polkupyoraily.net/hsy-vesipostit-osm](http://www.polkupyoraily.net/hsy-vesipostit-osm)

## Transform KML file exported from Google Maps to OSM file

First make sure that you have installed XSLT 2.0 compatible processor. 
Commonly used `xsltproc` does not work since it is limited to XSLT 1.0.
Here we use cross platform [Saxon-HE](https://www.saxonica.com/download/java.xml). This can be installed in Ubuntu:
```
sudo apt install libsaxonb-java
```

Convert KML to OSM:
```
./kml-to-osm.sh
```

## Upload Mapillary images

Install [Mapillary tools](https://github.com/mapillary/mapillary_tools). Go to folder where new images are and execute:
```
mapillary_tools process_and_upload --import_path "./" --user_name "YOUR_MAPILLARY_USERNAME"
```
