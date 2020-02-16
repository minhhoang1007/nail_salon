import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nail_app/configs/env.dart';
import 'package:nail_app/models/NailSalon.dart';

class GetStepService {
  static Future<List<Step>> getStep(int id) async {
    final String url = "${Configs.API_BASE}/step?key=1234&serviceId=${id}";
    try {
      var response = await http.get(Uri.encodeFull(url));

      if (response.statusCode < 200 || response.statusCode > 400) {
        return null;
      }

      var responseDecoded = json.decode(response.body);

      if (!responseDecoded["success"]) {
        return null;
      }

      List<Step> list = List();

      for (dynamic x in responseDecoded["result"]) {
        print(x);
        list.add(Step.fromJson(x));
      }

      return list;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
