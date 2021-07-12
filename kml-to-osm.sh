#!/bin/bash
echo "Converting exported Google Maps KML to OSM file..."
saxonb-xslt -s:google-maps-export.kml -xsl:kml-to-osm.xsl -o:google-maps-export.osm
echo "Done"
