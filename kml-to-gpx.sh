#!/bin/bash
echo "Converting exported Google Maps KML to GPX file..."
gpsbabel -w -i kml -f google-maps-export.kml -o gpx -F google-maps-export.gpx
echo "Done"
