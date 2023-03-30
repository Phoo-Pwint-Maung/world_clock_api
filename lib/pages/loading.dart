import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import 'package:http/src/response.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:world_clock_api/api/world_clock.dart';
import 'package:world_clock_api/model/location_model.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  String showDate = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("World Clock"),
      ),
      body: Consumer<LocationSearch>(builder: (context, search, _) {
        return Column(
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  search.searchLocation(name: "Asia/Bangkok");

                  context.read<GetData>().getTime(context: context);
                  showDate = context.read<GetData>().showDate;
                },
                child: const Text("Bangkok"),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  search.searchLocation(name: "Asia/Hong_Kong");

                  context.read<GetData>().getTime(context: context);
                  showDate = context.read<GetData>().showDate;
                },
                child: const Text("Hong_Kong"),
              ),
            ),
            if (showDate != "") Text(showDate),
            if (showDate == "") const Text("no data")
          ],
        );
      }),
    );
  }
}
