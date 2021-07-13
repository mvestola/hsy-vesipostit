#!/bin/bash
# Garmin Edge 800 does not work well with long POI names like: HSY vesiposti: Luuvantie 1, it will truncate these to HSY vesiposti 1, HSY vesiposti 2 etc.
# Thus use shorter POI names like: HSY: Luuvantie 1, which seems to work
echo "Converting exported Google Maps KML to Garmin Edge 800 compatible GPX file with shorter POI names..."
gpsbabel -w -i kml -f google-maps-export.kml -o gpx -F google-maps-export-garmin-edge-800.gpx
sed -i 's/<name>HSY vesiposti: /<name>HSY: /g' google-maps-export-garmin-edge-800.gpx
echo "Done"
