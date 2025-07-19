import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import '../domain/frameworks/location_services.dart';

class LocationServicesImpl implements LocationServices {
  @override
  Future<String?> loadAddressFromLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return null;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        return null;
      }
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    if (placemarks.isNotEmpty) {
      final placemark = placemarks.first;
      return '${placemark.street}, ${placemark.locality}, ${placemark.administrativeArea}, ${placemark.country}';
    }

    return null;
  }
}
