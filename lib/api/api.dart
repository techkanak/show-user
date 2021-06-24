import 'dart:convert';

import 'package:http/http.dart' as http;
class CallApi {
  final String _url = 'https://reqres.in/api/';

  // postData(data, apiUrl) async {
  //   var fullUrl = _url + apiUrl ;
  //   return await http.post(Uri.parse(fullUrl),
  //       body: jsonEncode(data));
  // }

  getData(apiUrl) async {
    var fullUrl = _url + apiUrl ;
    return await http.get(Uri.parse(fullUrl));
  }

  // _setHeaders() => {
  //   'Content-type': 'application/json',
  //   'Accept': 'application/json',
  // };
}
