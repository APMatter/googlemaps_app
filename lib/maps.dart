import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Maps extends StatefulWidget {
  const Maps({super.key});

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  //Create controller
  final Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition initialPosition = CameraPosition(
  target: LatLng(37.7749, -122.4194),
  zoom: 14.0,
);

  static const CameraPosition targetPosition = CameraPosition(
      target: LatLng(37.43296265331129, -122.08832357078792),
      
      //bearing: 192.0,
      //tilt: 60
      );
      
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Google Maps",
        ),
        centerTitle: true,
      ),
      body: GoogleMap(
        initialCameraPosition: initialPosition,
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      /*floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add functionality here
        },
        tooltip: 'Go to Uni',
        child: Icon(Icons.directions),
      ),*/
    );
  }

  Future<void> goToUni() async{ 
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(targetPosition));
  }
}
