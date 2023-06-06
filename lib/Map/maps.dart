import 'dart:async';
import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:geocoder2/geocoder2.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final CameraPosition _initialCameraPosition =
      const CameraPosition(target: LatLng(23.7945814, 90.3369494), zoom: 14);

  final Completer<GoogleMapController> _controller = Completer();
  Set<Marker> marker = {};

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  var lat;
  var long;
  var dataAddress;

  Future getCurrentPosition() async {
    var position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    setState(() {
      lat = position.latitude;
      long = position.longitude;
    });

    var Address = await Geocoder2.getDataFromCoordinates(
        latitude: position.latitude,
        longitude: position.longitude,
        googleMapApiKey: "AIzaSyCN8snQFg1eriDbdHIgHPWxirZKkz2PKyY");

    print("${position.latitude}");
    print("${position.longitude}");
    print("${Address}");
    setState(() {
      marker.add(
        Marker(
            infoWindow: InfoWindow(title: dataAddress.toString()),
            markerId: const MarkerId("1"),
            position: LatLng(position.latitude, position.longitude)),
      );
    });

    dataAddress = Address.address;
    final CameraPosition currentPosition = CameraPosition(
        target: LatLng(position.latitude, position.longitude), zoom: 14);

    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(currentPosition));
  }

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      getCurrentPosition();
    });
    _determinePosition();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$dataAddress"),
        centerTitle: true,
      ),
      body: GoogleMap(
        markers: marker,
        mapType: MapType.normal,
        zoomControlsEnabled: true,
        initialCameraPosition: _initialCameraPosition,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
          setState(() {
            getCurrentPosition();
          });
        },
      ),
    );
  }
}
