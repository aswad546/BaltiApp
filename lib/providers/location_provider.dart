import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class Location with ChangeNotifier {
  double lat = -1;
  double lng = -1;
  double pickedLat = -1;
  double pickedLng = -1;
  String address = "";
  String pickedAddress = "";

  double get latitude {
    return lat;
  }

  double get longitude {
    return lng;
  }

  double get pickedLatitude {
    return pickedLat;
  }

  double get pickedLongitude {
    return pickedLng;
  }

  String get currentAddress {
    return address;
  }

  String get currentPickedAddress {
    return pickedAddress;
  }

  Future<void> setLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    Position pos = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    lat = 0 + pos.latitude;
    lng = 0 + pos.longitude;

    await setAddress(lat, lng, true);

    notifyListeners();
  }

  Future<void> setAddress(double lat, double lng, bool overwrite) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);
      if (overwrite == true) {
        address =
            "${placemarks[0].name} ${placemarks[0].subLocality}, ${placemarks[0].locality}";
      } else {
        pickedAddress =
            "${placemarks[0].name} ${placemarks[0].subLocality}, ${placemarks[0].locality}";
      }
    } catch (e) {
      print('No address for current location');
    }
  }

  Future<void> setPickedLocation(double latitude, double longitude) async {
    pickedLat = latitude;
    pickedLng = longitude;
    await setAddress(pickedLat, pickedLng, false);
    notifyListeners();
  }

  Future<void> overwriteLocation(double l, double lg) async {
    lat = l;
    lng = lg;
    await setAddress(lat, lng, true);
    notifyListeners();
  }
}
