// ignore_for_file: prefer_const_constructors

import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class map extends StatefulWidget {
  late double lat, lng;
  @override
  _mapState createState() => _mapState();
  map.withlatlng(this.lat, this.lng);
}

class _mapState extends State<map> {
  var myMarkers = HashSet<Marker>();
  late BitmapDescriptor customMarker;
  dynamic long;
  dynamic lat;

  getCustomMarker() async {
    customMarker = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration.empty, 'assets/images/logo.png');
  }

  // void getlocation() async {
  //   LocationPermission per = await Geolocator.checkPermission();
  //   if (per == LocationPermission.denied ||
  //       per == LocationPermission.deniedForever) {
  //     print("permission denied");
  //     LocationPermission per1 = await Geolocator.requestPermission();
  //   } else {
  //     Position currentLoc = await Geolocator.getCurrentPosition(
  //         desiredAccuracy: LocationAccuracy.best);
  //     setState(() {
  //       long = currentLoc.longitude.toString();
  //       lat = currentLoc.latitude.toString();
  //     });
  //   }
  // }

  @override
  void initState() {
    super.initState();
    getCustomMarker();
    // getlocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition:
            CameraPosition(target: LatLng(widget.lat, widget.lng), zoom: 19),
        onMapCreated: (GoogleMapController googleMapController) {
          // getlocation();
          setState(() {
            myMarkers.add(Marker(
                markerId: MarkerId('1'),
                position: LatLng(widget.lat, widget.lng),
                icon: customMarker));
            // myMarkers.add(Marker(
            //   markerId: MarkerId('1'),
            //   position: LatLng(double.parse(lat), double.parse(long)),
            // ));
          });
        },
        markers: myMarkers,
      ),
    );
  }
}
