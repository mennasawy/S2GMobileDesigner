import 'dart:async';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/GoogleMaps.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/const.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/map.dart';

class LocationPickerUDA extends StatefulWidget {
  final String latitude;
  final String longitude;
  final List<MapObject> mapObjects;

  const LocationPickerUDA(
      {Key key, this.latitude, this.longitude, this.mapObjects})
      : super(key: key);
  @override
  _LocationPickerUDAState createState() => _LocationPickerUDAState();
}

class _LocationPickerUDAState extends State<LocationPickerUDA> {
  @override
  Widget build(BuildContext context) {
    return drawWidgetOrEmptyContainer(
        (!isEmptyText(widget.latitude) && !isEmptyText(widget.longitude)),
        getLocationPickerWidget());
  }

  DottedBorder getLocationPickerWidget() {
    return DottedBorder(
      borderType: BorderType.RRect,
      dashPattern: [7, 0],
      strokeWidth: 2,
      radius: Radius.circular(TEXTFIELD_BORDER_RADUIS),
      color: DARK_GREY.withOpacity(0.25),
      padding: EdgeInsets.all(5),
      child: Column(
        children: <Widget>[
          Container(
            color: LITE_GREY.withOpacity(OPACITY),
            height: 500,
            width: double.infinity,
            child: Container(
              child: MapUDA(
                latitude: widget.latitude,
                longitude: widget.longitude,
                mapObjects: widget.mapObjects,
              ),
//             child: MapWebViewUDA(
//               latitude: widget.latitude,
//               longitude: widget.longitude,
//             ),
            ),
          ),
//          Container(
//            height: 40,
//            child: BlueRaisedButtonWidget(
//              hinttext: "Open In Maps",
//              onpressed: () {
//                MapUtils.openMap(double.parse(widget.latitude),
//                    double.parse(widget.longitude));
//              },
//            ),
//          )
//          Column(
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: <Widget>[
//              Icon(
//                    Icons.add_location,
//                    color: Blue_Koi,
//                    size: 50,
//                  ),
//              SizedBox(height: 10),
//              Text(AppLocalizations.of(context).translate("location_map_uda"), style: normalGreyTextStyle)
        ],
      ),
    );
  }

  @override
  void initState() {
    log(LogType.DEBUG, "map list object ${widget.mapObjects}");
  }
}

class MapWebViewUDA extends StatefulWidget {
  final String latitude;
  final String longitude;

  const MapWebViewUDA({Key key, this.latitude, this.longitude})
      : super(key: key);
  @override
  _MapWebViewUDAState createState() => _MapWebViewUDAState();
}

class _MapWebViewUDAState extends State<MapWebViewUDA> {
  final _key = UniqueKey();
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
            height: double.infinity,
            width: double.infinity,
            child: WebView(
              key: _key,
              initialUrl:
                  'https://www.google.com/maps/search/?api=1&query=${widget.latitude},${widget.longitude}',
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) {
                _controller.complete(webViewController);
              },
            )),
        onTap: () {
          MapUtils.openMap(
              double.parse(widget.latitude), double.parse(widget.longitude));
        });
  }
}

class MapUtils {
  MapUtils._();

  static Future<void> openMap(double latitude, double longitude) async {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }
}
