import 'dart:async';

import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/CreateUDAs/MapUDAPresenter.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/WidgetsUtilites/RaisedButton.dart';
import 'package:templets/Utilities/const.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/map.dart';

class MapUDA extends StatefulWidget {
  final List<MapObject> mapObjects;
  String latitude;
  String longitude;
  MapUDA({Key key, this.mapObjects, this.latitude, this.longitude})
      : super(key: key);
  @override
  _MapUDAState createState() => _MapUDAState();
}

const GoogleAPIKey = "AIzaSyDuR5bWEk3iuiIyZtj8_HN-oUlWxVce2Ww";

class _MapUDAState extends State<MapUDA> implements MapUDAView {
  Map<String, Marker> markers = <String, Marker>{};

  MapType _currentMapType = MapType.normal;

  ScrollController _mapScrollController = ScrollController();

  MapUDAPresenter _presenter;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    log(LogType.DEBUG,
        "LocationPickerUDA latitude ==== ${widget.latitude} longtiude ====${widget.longitude}");
    _presenter = MapUDAPresenter(context,
        view: this, longitude: widget.longitude, latitude: widget.latitude);
//    setMarkers(widget.mapObjects);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE,
      body: _presenter.isInitialPositionDetermined()
          ? Container(
              padding: EdgeInsets.all(5),
              child: Column(children: <Widget>[
                searchTypeDropDownList(
                  ['Search By Location', 'Search By Name'],
                  'search',
                ),
                Expanded(child: mapWidget()),
                (_presenter.searchMapType == SearchMapType.LOCATION)
                    ? getSearchMapByLocationWidget()
                    : getMapSearchMapByNameWidget(),
              ]),
            )
          : Container(
              child: Center(
                child: Text(
                  'loading map..',
                  style: TextStyle(
                      fontFamily: 'Avenir-Medium', color: Colors.grey[400]),
                ),
              ),
            ),
    );
  }

  Widget mapWidget() {
    return Stack(
      children: <Widget>[
        GestureDetector(
          onVerticalDragStart: (start) {},
          child: GoogleMap(
              mapType: _currentMapType,
              initialCameraPosition: _presenter.currentPosition,
              onMapCreated: (GoogleMapController controller) {
//              _controller.complete(controller);
                _presenter.controller = controller;
              },
              scrollGesturesEnabled: true,
              markers: _presenter.markers,
              myLocationEnabled: true,
              gestureRecognizers: Set()
                ..add(Factory<OneSequenceGestureRecognizer>(
                    () => new EagerGestureRecognizer()))
                ..add(
                    Factory<PanGestureRecognizer>(() => PanGestureRecognizer()))
                ..add(Factory<ScaleGestureRecognizer>(
                    () => ScaleGestureRecognizer()))
                ..add(
                    Factory<TapGestureRecognizer>(() => TapGestureRecognizer()))
                ..add(Factory<VerticalDragGestureRecognizer>(
                    () => VerticalDragGestureRecognizer())),
              onCameraMove: _presenter.onCameraMove),
        ),
        if (_presenter.isSearchPlacesListFound())
          Container(
              height: 300.0,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(.6),
                  backgroundBlendMode: BlendMode.darken)),
        if (_presenter.isSearchPlacesListFound())
          Container(
            height: 300.0,
            child: ListView.builder(
                itemCount: _presenter.searchPlacesListCount(),
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      _presenter.searchResults[index].description,
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      _presenter.setSelectedLocation(
                          _presenter.searchResults[index].placeId);
                    },
                  );
                }),
          ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
              margin: EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
              child: Column(
                children: <Widget>[
                  mapButton(
                      _presenter.onAddMarkerButtonPressed,
                      Icon(
                        Icons.add_location,
                        color: WHITE,
                      ),
                      Main_Blue),
//                  mapButton(
//                      _onMapTypeButtonPressed,
//                      Icon(
//                        IconData(0xf473,
//                            fontFamily: CupertinoIcons.iconFont,
//                            fontPackage: CupertinoIcons.iconFontPackage),
//                      ),
//                      Main_Green),
                ],
              )),
        ),
      ],
    );
  }

  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  Widget getSearchMapByLocationWidget() {
    return Row(
      children: <Widget>[
        Expanded(
            flex: 2,
            child: TextFormField(
                controller: _presenter.longitudeController,
                decoration: getInputDecoration(
                  context,
                  ' ',
                  null,
                  GREY,
                  null,
                ))),
//            TextField(
//              controller: _locationController,
//              textCapitalization: TextCapitalization.words,
//              decoration: InputDecoration(
//                hintText: 'Search by City',
//                suffixIcon: Icon(Icons.search),
//              ),
//              onChanged: (value) => applicationBloc.searchPlaces(value),
//              onTap: () => applicationBloc.clearSelectedLocation(),
//            )
//        ),
        Expanded(
          flex: 2,
          child: TextFormField(
              controller: _presenter.latitudeController,
              decoration: getInputDecoration(
                context,
                ' ',
                null,
                GREY,
                null,
              )),
        ),
        Expanded(flex: 1, child: goToLocationOnMapButton()),
      ],
    );
  }

  Widget getMapSearchMapByNameWidget() {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: TextFormField(
              controller: _presenter.locationController,
              onChanged: (value) => _presenter.searchPlaces(value),
              decoration: getInputDecoration(
                context,
                ' Search by City',
                null,
                GREY,
                null,
              )),
        ),
        Expanded(flex: 1, child: goToLocationOnMapButton()),
      ],
    );
  }

  Widget goToLocationOnMapButton() {
    return BlueRaisedButtonWidget(
      hinttext: "Go!",
      onpressed: _presenter.handlePressButton,
    );
  }

  Widget mapButton(Function function, Icon icon, Color color) {
    return RawMaterialButton(
      onPressed: function,
      child: icon,
      shape: new CircleBorder(),
      elevation: 2.0,
      fillColor: color,
      padding: const EdgeInsets.all(7.0),
    );
  }

  searchTypeDropDownList(List<String> list, String hint) {
    return DropdownButtonHideUnderline(
      child: DropdownButton(
        isExpanded: true,
        icon: Icon(Icons.more_vert),
        iconSize: 30,
        iconEnabledColor: GREY,
        onChanged: (_) {},
        items: list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: GestureDetector(
                onTap: () {
                  _presenter.setSearchMapType(value);
                },
                child: Text(value)),
          );
        }).toList(),
      ),
    );
  }

  changeState() {}

  @override
  void updateMapScreenView() {
    setState(() {});
  }
}
