#!/bin/bash
echo "Converting ESRI Shapefile to Google Maps KML file..."
unzip HSY_Vesipostit_shp.zip -d hsy-vesipostit-zip-contents
ogr2ogr -f KML hsy-vesipostit-original-shp.kml hsy-vesipostit-zip-contents/HSY_Vesipostit.shp
rm -rf hsy-vesipostit-zip-contents/
echo "Done"
