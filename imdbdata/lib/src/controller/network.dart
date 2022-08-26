import 'dart:convert';

import 'package:http/http.dart' as http;

class Network {
  static get(Uri url) async {
    return await http.get(url);
  }
}
