import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class Location {
  double latitude;
  double longitude;

  Future<void> getRealTimeLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);

      latitude = position.latitude;
      longitude = position.longitude;

      // print(latitude);
      // print(longitude);
    } catch (e) {
      print(e);
    }
  }
}
