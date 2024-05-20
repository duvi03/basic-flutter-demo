import 'dart:convert';

import 'package:flutter_learning_demo/screen/dashboard/list_of_screen/1_flutter_widget/data/model/picsum_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<Picsum>> get() async {
    try {
      final response = await http.get(Uri.parse("https://picsum.photos/v2/list"));
      if (response.statusCode == 200) {
        List<dynamic> json = jsonDecode(response.body);
        return List<Picsum>.from(json.map((e) => Picsum.fromJson(e)));
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}