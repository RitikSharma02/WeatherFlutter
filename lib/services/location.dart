import 'dart:ffi';

import 'package:geolocator/geolocator.dart';

class Location {
  double? latitude;
  double? longitude;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}

//
// Future<Position> getCurrentLocationCheckingPermissions() async {
//   bool serviceEnabled;
//   LocationPermission locationPermission;
//
//   // Test if location services are enabled.
//   serviceEnabled = await Geolocator.isLocationServiceEnabled();
//   if (!serviceEnabled) {
//     // Location services are not enabled don't continue
//     // accessing the position and request users of the
//     // App to enable the location services.
//     throw Exception('Location services are disabled. Please activate them.');
//   } else {
//     locationPermission = await Geolocator.checkPermission();
//     if (LocationPermission.unableToDetermine == locationPermission) {
//       throw Exception(
//           'Unable to determine if location permissions are enabled.');
//     } else if (LocationPermission.denied == locationPermission ||
//         LocationPermission.deniedForever == locationPermission) {
//       throw Exception(
//           'Location permissions are denied: ' + locationPermission.toString());
//     }
//
//     if (LocationPermission.whileInUse == locationPermission ||
//         LocationPermission.always == locationPermission) {
//       Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.lowest,
//       );
//       return position;
//     }
//   }
//   throw Exception('Location permissions are not granted.');
// }
