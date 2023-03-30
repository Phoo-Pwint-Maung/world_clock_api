import 'package:flutter/material.dart';
import 'package:world_clock_api/pages/loading.dart';
import 'package:provider/provider.dart';
import 'package:world_clock_api/provider/providers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: provider,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const LoadingPage(),
      ),
    );
  }
}
