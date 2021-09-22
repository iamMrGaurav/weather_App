import 'package:http/http.dart' as http;
import 'dart:convert';

class Networking {
  String url;

  Networking(this.url);

  getNetworkAPI() async {
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print("Error");
    }
  }
}
