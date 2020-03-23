import 'dart:convert';

import 'package:wedding_final_app/model/weddingmodel.dart';
import 'package:http/http.dart'as http;

Future<WeddingModel> fetchAlbum() async {
  final response =
  await http.get('https://jsonplaceholder.typicode.com/photos/1');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response, then parse the JSON.
    return WeddingModel.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response, then throw an exception.
    throw Exception('Failed to load album');
  }
}
