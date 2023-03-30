import 'package:provider/single_child_widget.dart';
import 'package:provider/provider.dart';
import 'package:world_clock_api/api/world_clock.dart';
import 'package:world_clock_api/model/location_model.dart';

List<SingleChildWidget> provider = [
  ChangeNotifierProvider(create: (context) => LocationSearch()),
  ChangeNotifierProvider(create: (context) => GetData())
];
