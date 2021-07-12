# HSY vesipostit

Code related to importing HSY drinking water posts (vesipostit) to OpenStreetMap and Google Maps


## Transform KML file exported from Google Maps to OSM file

First make sure that you have installed XSLT 2.0 compatible processor. Here we use cross platform [Saxon-HE](https://www.saxonica.com/download/java.xml). This can be installed in Ubuntu:
```
sudo apt install libsaxonb-java
```

Convert KML to OSM:
```
saxonb-xslt -s:google-maps-export.kml -xsl:kml-to-osm.xsl -o:google-maps-export.osm
```

## Upload Mapillary images

Install [Mapillary tools](https://github.com/mapillary/mapillary_tools). Go to folder where new images are and execute:
```
mapillary_tools process_and_upload --import_path "./" --user_name "YOUR_MAPILLARY_USERNAME"
```
