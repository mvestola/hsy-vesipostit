#!/bin/bash
echo "Updating all data from exported Google Maps KML..."
./kml-to-garmin-edge-800-gpx.sh
./kml-to-gpx.sh
./kml-to-osm.sh
./kml-to-umap-compatible-kml.sh
echo "All done"
