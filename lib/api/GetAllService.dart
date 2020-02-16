import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nail_app/configs/env.dart';
import 'package:nail_app/models/NailSalon.dart';

class GetAllService {
  static Future<List<Sevice>> getService(int id) async {
    final String url = "${Configs.API_BASE}/sevices?key=1234&salonId=${id}";
    try {
      var response = await http.get(Uri.encodeFull(url));

      if (response.statusCode < 200 || response.statusCode > 400) {
        return null;
      }

      var responseDecoded = json.decode(response.body);

      if (!responseDecoded["success"]) {
        return null;
      }

      List<Sevice> list = List();

      for (dynamic x in responseDecoded["result"]) {
        print(x);
        list.add(Sevice.fromJson(x));
      }

      return list;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
