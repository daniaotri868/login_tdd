import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
const LatLng SOURCE_LOCATION=LatLng(42.7477863, -71.1699932);
const LatLng DEST_LOCATION=LatLng(42.743902, -71.170009);
class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _controller=Completer();
  BitmapDescriptor ?sourceIcon;
  BitmapDescriptor ?distenationIcon;
  Set<Marker> _markes=Set<Marker>();
  LatLng ?currentLocation;
  LatLng ?distinationLocation;
  static const double CAMERA_ZOOM=16;
   static const double CAMERA_TILT=16;
  static const double CAMERA_BIRING=16;
  @override
void initState() {
    // TODO: implement initState
    super.initState();
    this.setInitLocation();
    this.setSourceAndDestinationMarkerIcon();
  }
  void setSourceAndDestinationMarkerIcon()async
  {
      sourceIcon= await
      BitmapDescriptor.fromAssetImage(ImageConfiguration(devicePixelRatio: 2.0), 'assets/images/bell.png') ;
      distenationIcon=await
      BitmapDescriptor.fromAssetImage(ImageConfiguration(devicePixelRatio: 2.0), 'assets/images/boy.png') ;
  }
  void setInitLocation(){
    currentLocation=LatLng(SOURCE_LOCATION.latitude, SOURCE_LOCATION.longitude);
    distinationLocation=LatLng(DEST_LOCATION.latitude, DEST_LOCATION.longitude);
  }
  Widget build(BuildContext context) {
    CameraPosition intilalCameraPosition=CameraPosition(
      zoom: CAMERA_ZOOM,
      tilt: CAMERA_TILT,
      bearing: CAMERA_BIRING,
      target: SOURCE_LOCATION
    );
    return GoogleMap(
      myLocationButtonEnabled: true,
        compassEnabled: false,
        tiltGesturesEnabled: false,
        markers: _markes,
        mapType: MapType.normal,
        initialCameraPosition:intilalCameraPosition,
        onMapCreated: (controller) {
          _controller.complete(controller);
        },
    );
  }
}
