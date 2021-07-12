# HSY vesipostit

## Kuvaus (in Finnish)

Tämä repo sisältää skriptejä ja tiedostoja [HSYn vesipostien](http://www.polkupyoraily.net/wiki/Vesipostit) näyttämiseen Google Maps ja OpenStreetMap -kartoissa.
Vesipostien sijainnit perustuvat [HSYn avoimeen dataan]((https://www.hsy.fi/ymparistotieto/avoindata/avoin-data---sivut/paakaupunkiseudun-vesipostit/)): vesipostien sijainti- ja osoitedata ovat siis peräisin HSY:ltä. Google Maps ja OpenStreetMap -pohjaisissa kartoissa näkyvät vesipostien tila, tyyppi, kuvat ja lisätiedot ovat käyttäjien keräämiä, ne eivät siis tule HSY:ltä.

Tämä repo ei ole HSYn ylläpitämä. Palautetta reposta voi lähettää sähköpostilla: hsy-vesipostit@polkupyoraily.net

## Description

This repositor includes scripts and files for show [HSYn water posts (Finnish only)](http://www.polkupyoraily.net/wiki/Vesipostit) in Google Maps and OpenStreetMap. HSY water post locations are based on [open data provided by HSY](https://www.hsy.fi/ymparistotieto/avoindata/avoin-data---sivut/paakaupunkiseudun-vesipostit/): water post locations and addresses come from HSY. Water post status, type, images and extra information are collected by users, so those data do not come from HSY.

## Maps

* [HSY water posts in Google Maps based map](https://www.google.com/maps/d/viewer?mid=1WeNhhtc9n4ypJ_X3bz5KpLppR5JNsk9A&usp=sharing), short link: [http://www.polkupyoraily.net/hsy-vesipostit](http://www.polkupyoraily.net/hsy-vesipostit)
* [HSY water posts in OpenStreetMap based map](http://u.osmfr.org/m/635042/), short link: [http://www.polkupyoraily.net/hsy-vesipostit-osm](http://www.polkupyoraily.net/hsy-vesipostit-osm)

## Repositor usage

This repository contains following files which you might be able to import to e.g. your navigator or other program:
* KMZ file exported from Google Maps
* KML file exported from Google Maps
* OSM file converted from KML file

The main idea is that the primary source of the data is Google Maps which is easiest to update.

## Original data

HSY original data is copied to `hsy-original-data` folder. There are two formats available:
* MapInfo TAB file `*.tab`
* ESRI Shapefile `*.shp`

## Development

Below instructions are written for Ubuntu Linux.

### Transform KML file exported from Google Maps to OSM file

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
