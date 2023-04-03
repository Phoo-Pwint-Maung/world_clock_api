import 'package:provider/single_child_widget.dart';
import 'package:provider/provider.dart';
import 'package:world_clock_api/api/world_clock.dart';
import 'package:world_clock_api/component/search_btn.dart';
import 'package:world_clock_api/model/location_list.dart';

List<SingleChildWidget> provider = [
  ChangeNotifierProvider(create: (context) => GetData()),
  ChangeNotifierProvider(create: (context) => LocationList()),
];
