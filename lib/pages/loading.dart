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
import 'package:world_clock_api/component/search_btn.dart';
import 'package:world_clock_api/model/location_list.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  Widget build(BuildContext context) {
    final getTime = Provider.of<GetData>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("World Clock"),
      ),
      body: Column(
        children: [
          Consumer<LocationList>(builder: (context, list, _) {
            return ListView.builder(
              controller: ScrollController(),
              shrinkWrap: true,
              itemCount: list.locationList.length,
              itemBuilder: (context, index) => LocationButton()
                  .button(searchlocation: list.locationList[index]),
            );
          }),
          const SizedBox(
            height: 100,
          ),
          Text(
            getTime.showName,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            getTime.showDate,
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w400,
            ),
          )
          // if (getTime.showDate != "") Text(getTime.showDate),
          // if (getTime.showDate == "") const Text("no data"),
        ],
      ),
    );
  }
}
