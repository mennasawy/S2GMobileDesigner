import 'package:flutter/material.dart';
import 'package:templets/Utilities/utility_methods.dart';

class MapObject {
  String mapValue;
  String locationName;
  String address;
  String locationDescription;
  String information;
  String longtitude;
  String latitude;
  String labelColor;
  String pinColor;
  String label;

  List<MapObject> maps = [];

  MapObject(
      {String mapValue,
      String longtitude,
      String latitude,
      String address,
      String locationName,
      String locationDescription,
      String information,
      String labelColor,
      String pinColor,
      String label}) {
    this.mapValue = mapValue;
    this.latitude = latitude;
    this.longtitude = longtitude;
  }

  //------------map helping methods----------------
  List<MapObject> pasrseLangtidueAndLatitudeForMapUDA(String mapQuery) {
    List<MapObject> mapObjects = [];
    MapObject mapObject = new MapObject();
    if (!isEmptyText(mapQuery)) {
      mapQuery = mapQuery.replaceAll("&", "&[");
      List<String> mapQueries = mapQuery.split("[");
      mapQueries.removeLast();
      mapQueries.forEach((mapElement) {
        mapObjects.add(MapObject(
//          address: mapElement.substring(0, mapElement.indexOf("=")),
          address: splitString(mapElement, 0, mapElement.indexOf("=")),
          latitude: getLatLongFromMapQuery(mapElement)[0],
          longtitude: getLatLongFromMapQuery(mapElement)[1],
          locationName: mapElement.substring(
              mapElement.indexOf("@") + 1, mapElement.indexOf("*")),
          locationDescription: mapElement.substring(
              mapElement.indexOf("*") + 1, mapElement.indexOf("!")),
          label: mapElement.substring(
              mapElement.indexOf("!") + 1, mapElement.indexOf("%")),
          pinColor: mapElement.substring(
              mapElement.indexOf("%") + 1, mapElement.indexOf("+")),
          labelColor: "#" +
              mapElement.substring(
                  mapElement.indexOf("+") + 1, mapElement.indexOf("&")),
        ));
      });
    }
    return mapObjects;
  }

  String splitString(String text, int startIndex, int endIndex) {
    return text.substring(startIndex, endIndex);
  }

  List getLatLongFromMapQuery(String mapQuery) {
    mapQuery = mapQuery.substring(
        mapQuery.indexOf(String.fromCharCodes(new Runes('\u0024'))) + 1,
        mapQuery.indexOf(
            "@")); // String.fromCharCodes(new Runes('\u0024')) ----- > indicate for $
    print("lan & lat list ===== $mapQuery");
    List mapLatLongList = mapQuery.split(",");
    return mapLatLongList;
  }

  String mapQueryFromMapObjectList(List<MapObject> mapObjects) {
    String mappedStringFromMapObject = "";
    mapObjects.forEach((map) {
      mappedStringFromMapObject +=
          "${map.address}=${map.latitude},${map.longtitude}@${map.locationName}*${map.locationDescription}!${map.label}%${map.pinColor}+${map.labelColor}&";
    });
    return mappedStringFromMapObject;
  }
}
