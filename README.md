# HSY vesipostit kartalla / HSY water posts on map

<kbd><img src="images/promo/water-post-helsinki.jpg" alt="Vesiposti Helsingissä" height="200" /></kbd> <kbd><img src="images/promo/google-maps-screenshot.png" alt="Google Maps" height="200" /></kbd> 

## Kuvaus (in Finnish)

Tämä repo sisältää skriptejä ja tiedostoja [HSYn vesipostien](http://www.polkupyoraily.net/wiki/Vesipostit) näyttämiseen [Google Maps](https://www.google.com/maps/d/viewer?mid=1WeNhhtc9n4ypJ_X3bz5KpLppR5JNsk9A&usp=sharing) ja [OpenStreetMap](http://u.osmfr.org/m/635042/) -kartoissa.
Vesipostien sijainnit perustuvat [HSYn avoimeen dataan]((https://www.hsy.fi/ymparistotieto/avoindata/avoin-data---sivut/paakaupunkiseudun-vesipostit/)): vesipostien sijainti- ja osoitedata ovat siis peräisin [Helsingin seudun ympäristöpalvelut HSY:ltä](https://www.hsy.fi/). Google Maps ja OpenStreetMap -pohjaisissa kartoissa näkyvät vesipostien tila, tyyppi, kuvat ja lisätiedot ovat käyttäjien keräämiä, ne eivät siis tule HSY:ltä.

**Tämä repo ei ole HSYn ylläpitämä**. Palautetta kartoista voi lähettää sähköpostilla: hsy-vesipostit@polkupyoraily.net

## Description

This repositor includes scripts and files for show [HSYn water posts (Finnish only)](http://www.polkupyoraily.net/wiki/Vesipostit) in [Google Maps](https://www.google.com/maps/d/viewer?mid=1WeNhhtc9n4ypJ_X3bz5KpLppR5JNsk9A&usp=sharing) and [OpenStreetMap](http://u.osmfr.org/m/635042/). HSY water post locations are based on [open data provided by HSY](https://www.hsy.fi/ymparistotieto/avoindata/avoin-data---sivut/paakaupunkiseudun-vesipostit/): water post locations and addresses come from [Helsinki Region Environmental Services HSY](https://www.hsy.fi/en/). Water post status, type, images and extra information are collected by users, so those data do not come from HSY.

**This repository is not maintained by HSY**. Feedback for maps can be sent by email: hsy-vesipostit@polkupyoraily.net

## Maps

* [HSY water posts in Google Maps based map](https://www.google.com/maps/d/viewer?mid=1WeNhhtc9n4ypJ_X3bz5KpLppR5JNsk9A&usp=sharing), short link: [http://www.polkupyoraily.net/hsy-vesipostit](http://www.polkupyoraily.net/hsy-vesipostit)
* [HSY water posts in OpenStreetMap based map](http://u.osmfr.org/m/635042/), short link: [http://www.polkupyoraily.net/hsy-vesipostit-osm](http://www.polkupyoraily.net/hsy-vesipostit-osm)

## Repositor usage

This repository contains following files which you might be able to import to e.g. your navigator or other program:
* [KMZ file](google-maps-export.kmz) exported from Google Maps
* [KML file](google-maps-export.kml) exported from Google Maps
* [GPX file](google-maps-export.gpx) converted from KML file
* [OSM file](google-maps-export.osm) converted from KML file

The main idea is that the primary source of the data is Google Maps which is easiest to update.

## Original data

HSY original data is copied to `hsy-original-data` folder. There are two formats available:
* MapInfo TAB file `*.tab`
* ESRI Shapefile `*.shp`

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

### Transform KML file exported from Google Maps to OSM file

```
./kml-to-osm.sh
```

### Transform KML file exported from Google Maps to GPX file

```
./kml-to-gpx.sh
```

### Upload Mapillary images

Install [Mapillary tools](https://github.com/mapillary/mapillary_tools). Go to folder where new images are and execute:
```
mapillary_tools process_and_upload --import_path "./" --user_name "YOUR_MAPILLARY_USERNAME"
```

## Links

* [Discussion in OSM Finnish forum](https://forum.openstreetmap.org/viewtopic.php?id=73183)
* [How to use HSY water posts (in Finnish only)](http://www.polkupyoraily.net/wiki/Vesipostit)
* [JOSM plugin which can read .kml, .shp and .tab files](https://wiki.openstreetmap.org/wiki/JOSM/Plugins/OpenData)
* https://wiki.openstreetmap.org/wiki/Import/Guidelines
* https://wiki.openstreetmap.org/wiki/Import/ODbL_Compatibility

## License

Creative Commons Attribution 4.0 International

This licence was chosen since that is the licence of the original HSY data
