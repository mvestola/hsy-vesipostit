#!/bin/bash
echo "Converting exported Google Maps KML to uMap compatible KML file..."
saxonb-xslt -s:../google-maps-export.kml -xsl:kml-to-umap-kml-symbols.xsl -o:google-maps-export-umap-compatible-symbols.kml
saxonb-xslt -s:google-maps-export-umap-compatible-symbols.kml -xsl:kml-to-umap-kml-variables.xsl -o:../google-maps-export-umap-compatible.kml
rm google-maps-export-umap-compatible-symbols.kml
echo "Done"
