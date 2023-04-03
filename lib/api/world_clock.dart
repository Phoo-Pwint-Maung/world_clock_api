import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/src/response.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class GetData extends ChangeNotifier {
  String showDate = '';
  String showName = '';
  void getTime(
      {required BuildContext context,
      required String name,
      required String locationName}) async {
    // Get Data from api by post method
    Response getResponse = await ApiData().postApi(
        endPoint: "/world-time/datetime-now",
        body: '{"datetime_format":"iso8601","timezones":["$name"]}');

    String location = jsonDecode(getResponse.body)["data"][name];
    // 2023-04-02T23:52:06.652665-05:00

    // now is already calculate with Offset time
    DateTime now = timeConvert(location: location);
    showDate = DateFormat("hh:mm a").format(now);
    showName = locationName;
    notifyListeners();
  }
}

// For Api address
class ApiData {
  String _baseUrl = "https://worldtime5.p.rapidapi.com/api";
  final Map<String, String> _header = {};

  String _apiKey = "275969399amshef593573afa7fd8p1ff3e0jsn9e168261f7f0";
  String _apiHost = "worldtime5.p.rapidapi.com";
  String _contentType = "application/json";

  Future<Response> postApi(
      {required String endPoint,
      String? baseUrl,
      String? contentType,
      String? apiKey,
      String? apiHost,
      required Object? body}) async {
    if (baseUrl != null) {
      _baseUrl = baseUrl;
    }
    if (contentType != null) {
      _contentType = contentType;
    }
    if (apiKey != null) {
      _apiKey = apiKey;
    }
    if (apiHost != null) {
      _apiHost = apiHost;
    }

    _header["content-type"] = _contentType;
    _header["X-RapidAPI-Key"] = _apiKey;
    _header["X-RapidAPI-Host"] = _apiHost;

    return await http.post(Uri.parse("$_baseUrl$endPoint"),
        headers: _header, body: body);
  }
}

// Funtion For Offset adding and subtract to get Real Time
DateTime timeConvert({required String location}) {
  //  location String is UTC time string
  String newString = location.substring(location.length - 6); // Get Offset
  int offsetHour = int.parse(newString.substring(1, 3)); // Offset hour => 07
  int offsetMin = int.parse(newString.substring(4, 6)); // Offset minute => 30

  DateTime now = DateTime.parse(location);

  if (newString[0] == "+") {
    now = now.add(Duration(hours: offsetHour, minutes: offsetMin));
  } else if (newString[0] == "-") {
    now = now.subtract(Duration(hours: offsetHour, minutes: offsetMin));
  }

  return now;
}
