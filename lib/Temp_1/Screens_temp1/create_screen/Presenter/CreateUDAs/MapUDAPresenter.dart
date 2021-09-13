import 'dart:async';

import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Map/PlaceSearch.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/map.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Services/CreateUDAs/MapPlacesServices.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/AddSiteScreen.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Map/Place.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_webservice/places.dart';

enum SearchMapType { LOCATION, NAME }

class MapUDAPresenter {
  MapUDAView view;
  BuildContext _context;

  final List<MapObject> mapObjects;
  List<PlaceSearch> searchResults;
  Set<Marker> markers = {};

  String latitude;
  String longitude;

  TextEditingController longitudeController = TextEditingController();
  TextEditingController latitudeController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  final placesService = PlacesService();
  StreamController<Place> selectedLocation = StreamController<Place>();
  Place selectedLocationStatic;

  GoogleMapController controller;
  CameraPosition currentPosition;
  LatLng initialPosition;
  LatLng lastMapPosition;

  SearchMapType searchMapType;

  static const GoogleAPIKey = "AIzaSyDuR5bWEk3iuiIyZtj8_HN-oUlWxVce2Ww";

  MapUDAPresenter(BuildContext context,
      {this.view, this.mapObjects, this.longitude, this.latitude}) {
    _context = context;
    setMarkers(mapObjects);
    lastMapPosition = initialPosition;
  }

  setMarkers(List<MapObject> maps) {
    if (isNotEmptyList(maps)) {
      longitude = maps[0].longtitude;
      latitude = maps[0].latitude;
      maps.forEach((map) {
        markers.add(Marker(
            markerId: MarkerId(map.longtitude + map.latitude),
            position: LatLng(
                double.parse(map.longtitude), double.parse(map.latitude)),
            infoWindow: InfoWindow(
                title: map.locationName,
                snippet: "This is a snippet",
                onTap: () {}),
            onTap: () {},
//              icon: BitmapDescriptor.defaultMarkerWithHue(
//                  HSLColor.fromColor(hexToColor(map.pinColor)).hue)
            icon: BitmapDescriptor.defaultMarker));
      });
      view.updateMapScreenView();
    }
    initCurrentCameraPosition();
//      markers.add(value)
  }

  initCurrentCameraPosition() {
    initialPosition = LatLng(double.parse(longitude), double.parse(latitude));
    currentPosition = CameraPosition(
      target: LatLng(double.parse(longitude), double.parse(latitude)),
      zoom: 9,
    );
  }

  bool isInitialPositionDetermined() {
    return initialPosition != null;
  }

  bool isSearchPlacesListFound() {
    return isNotEmptyList(searchResults);
  }

  int searchPlacesListCount() {
    return searchResults.length;
  }

  onCameraMove(CameraPosition position) {
    lastMapPosition = position.target;
  }

  onAddMarkerButtonPressed() {
    Navigator.push(
        _context,
        MaterialPageRoute(
            builder: (context) => LocationInfoScreen(
                  latitude: lastMapPosition.latitude,
                  longtitude: lastMapPosition.longitude,
                ))).then((value) => {
          if (value != null) _setNewMarker(value),
        });
  }

  searchPlaces(String searchTerm) async {
    searchResults = await placesService.getAutocomplete(searchTerm);
    view.updateMapScreenView();
  }

  setSelectedLocation(String placeId) async {
    var sLocation = await placesService.getPlace(placeId);
    selectedLocation.add(sLocation);
    selectedLocationStatic = sLocation;
    currentPosition = CameraPosition(
      target: LatLng(
          sLocation.geometry.location.lat, sLocation.geometry.location.lat),
      zoom: 9,
    );
    lastMapPosition = currentPosition.target;
    onCameraMove(currentPosition);
    goToPlace(sLocation);
    searchResults = null;
    view.updateMapScreenView();
  }

  void goToPlace(Place place) {
    final GoogleMapController _controller = controller;
    _controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
            target: LatLng(
                place.geometry.location.lat, place.geometry.location.lng),
            zoom: 14.0),
      ),
    );
  }

  Future<void> handlePressButton() async {
    currentPosition = CameraPosition(
      target: LatLng(double.parse(latitudeController.text),
          double.parse(longitudeController.text)),
      zoom: 9,
    );
    lastMapPosition = LatLng(double.parse(latitudeController.text),
        double.parse(longitudeController.text));
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(double.parse(latitudeController.text),
          double.parse(longitudeController.text)),
      zoom: 9,
    )));
    view.updateMapScreenView();
  }

  _setNewMarker(MapObject map) {
    markers.add(Marker(
        markerId: MarkerId(lastMapPosition.toString()),
        position: lastMapPosition,
        infoWindow: InfoWindow(
            title: map.locationName,
            snippet: map.locationDescription ?? "",
            onTap: () {}),
        onTap: () {},
        icon: BitmapDescriptor.defaultMarker
//        icon: BitmapDescriptor.defaultMarkerWithHue(
//            HSLColor.fromColor(hexToColor(map.pinColor)).hue),
        ));
    view.updateMapScreenView();
  }

  void setSearchMapType(String value) {
    if (value == 'Search By Location')
      searchMapType = SearchMapType.LOCATION;
    else
      searchMapType = SearchMapType.NAME;
    view.updateMapScreenView();
  }

  Future<Null> displayPrediction(Prediction p) async {
    if (p != null) {
      // get detail (lat/lng)
      GoogleMapsPlaces _places = GoogleMapsPlaces(
        apiKey: GoogleAPIKey,
        apiHeaders: await GoogleApiHeaders().getHeaders(),
      );
      PlacesDetailsResponse detail =
          await _places.getDetailsByPlaceId(p.placeId);
      final lat = detail.result.geometry.location.lat;
      final lng = detail.result.geometry.location.lng;

      Scaffold.of(_context).showSnackBar(
        SnackBar(content: Text("${p.description} - $lat/$lng")),
      );
    }
  }
}

abstract class MapUDAView {
  void updateMapScreenView();
}
