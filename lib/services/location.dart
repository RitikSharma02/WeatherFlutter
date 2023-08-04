import 'package:geolocator/geolocator.dart';

import 'dart:ffi';
import 'package:weather/services/networking.dart';
import 'package:geolocator/geolocator.dart';

class Location {
  double? latitude;
  double? longitude;

  Future<void> getCurrentLocation() async {
    try {
      LocationPermission permission;
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      var permission = await Geolocator.requestPermission();

      print(e);
    }
  }
}

// class Location {
//   double? latitude;
//   double? longitude;
//   Future<void> getCurrentLocation() async {
//     try {
//       bool serviceEnabled;
//       LocationPermission permission;
//
//       serviceEnabled = await Geolocator.isLocationServiceEnabled();
//       if (!serviceEnabled) {
//         // Handle case when location services are not enabled on the device.
//         return;
//       }
//
//       permission = await Geolocator.checkPermission();
//       if (permission == LocationPermission.deniedForever) {
//         // Handle case when the user has previously denied location permissions permanently.
//         return;
//       }
//
//       if (permission == LocationPermission.denied) {
//         // Request location permissions from the user.
//         permission = await Geolocator.requestPermission();
//         if (permission != LocationPermission.whileInUse &&
//             permission != LocationPermission.always) {
//           // Handle case when the user denies location permissions.
//           return;
//         }
//       }
//
//       Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high,
//       );
//
//       latitude = position.latitude;
//       longitude = position.longitude;
//     } catch (e) {
//       print(e);
//     }
//   }
// }
//
