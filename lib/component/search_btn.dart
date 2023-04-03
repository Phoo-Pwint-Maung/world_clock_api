import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:world_clock_api/api/world_clock.dart';

// Button For each Location
class LocationButton {
  Widget button({required String searchlocation}) {
    String buttonName = searchlocation.split("/")[1];
    return Consumer<GetData>(builder: (context, getTime, _) {
      return ElevatedButton(
        onPressed: () {
          getTime.getTime(
              context: context, name: searchlocation, locationName: buttonName);

          // name is for searching "Asia/Yangon"
        },
        child: Text(buttonName),
      );
    });
  }
}
