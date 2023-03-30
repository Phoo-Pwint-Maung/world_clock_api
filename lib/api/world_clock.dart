import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/src/response.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:world_clock_api/model/location_model.dart';

class GetData extends ChangeNotifier {
  String showDate = '';
  void getTime({required BuildContext context}) async {
    String locationName = context.read<LocationSearch>().locationName;

    print(locationName);

    Response getResponse = await ApiData().postApi(
        endPoint: "/world-time/datetime-now",
        body: '{"datetime_format":"iso8601","timezones":["$locationName"]}');

    String location = jsonDecode(getResponse.body)["data"][locationName];

    print(location);

    // print(DateTime.parse(location).toLocal());
    // print(DateTime.parse("2023-03-25T18:07:35.914149+07:00").toLocal());

    String showDate1 =
        DateFormat.yMMMd().add_jm().format(DateTime.parse(location));
    String showDate2 = DateFormat.yMMMd()
        .add_jm()
        .format(DateTime.parse("2023-03-25T18:07:35.914149+07:00"));

    print(showDate1);
    print(showDate2);

    // showDate =
    //     DateFormat.yMMMd().add_jm().format(DateTime(location).timeZoneOffset);

    notifyListeners();
  }
}

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

    // _body = '{"datetime_format":"iso8601","timezones":["America/Chicago"]}';

    return await http.post(Uri.parse("$_baseUrl$endPoint"),
        headers: _header, body: body);
  }
}
