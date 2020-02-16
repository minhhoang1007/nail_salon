import 'package:http/http.dart' as http;
import 'package:nail_app/configs/env.dart';
import 'dart:convert';

import 'package:nail_app/models/NailSalon.dart';

class GetAllSalon {
  static Future<List<Salon>> getListSalon() async {
    final String url = "${Configs.API_BASE}/ListSalon?key=1234";
    try {
      var response = await http.get(Uri.encodeFull(url));

      if (response.statusCode < 200 || response.statusCode > 400) {
        return null;
      }

      var responseDecoded = json.decode(response.body);

      if (!responseDecoded["success"]) {
        return null;
      }

      List<Salon> list = List();

      for (dynamic x in responseDecoded["result"]) {
        print(x);
        list.add(Salon.fromJson(x));
      }

      return list;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
