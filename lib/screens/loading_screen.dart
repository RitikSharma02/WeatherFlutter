import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }

  void getLocation() async {
    // LocationPermission permission = await Geolocator.requestPermission();
    // LocationPermission permission1 = await Geolocator.checkPermission();

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    // bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();

    print(position);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
