import 'package:bloc_demo_pagination/cubit/user_cubit.dart';
import 'package:bloc_demo_pagination/network/api_interface.dart';
import 'package:bloc_demo_pagination/routes.dart';
import 'package:bloc_demo_pagination/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: MainScreen.route,
      onGenerateRoute: (settings) => Routes.onGenerateRoute(settings) ,
    );
  }
}
