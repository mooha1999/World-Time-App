import 'package:flutter/material.dart';
import 'package:world_time_module/pages/choose_location.dart';
import 'package:world_time_module/pages/home.dart';
import 'package:world_time_module/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const Loading(),
      '/home': (context) => const Home(),
      '/location': (context) => const ChooseLocation(),

    },
  ));
}
