import 'package:flutter/foundation.dart';

// class LocationName {
//   String locationName;
//   LocationName({required this.locationName});
// }

class LocationSearch extends ChangeNotifier {
  String locationName = "";
  void searchLocation({required String name}) {
    locationName = name;
    print(locationName);
    notifyListeners();
  }
}
