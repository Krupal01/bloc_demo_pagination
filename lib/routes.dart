import 'dart:js';

import 'package:bloc_demo_pagination/cubit/user_cubit.dart';
import 'package:bloc_demo_pagination/network/api_interface.dart';
import 'package:bloc_demo_pagination/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

var routes = {
  MainScreen.route: (context) => MainScreen(),
};

class Routes {
  static final ApiInterface _apiInterface = ApiInterface();

  static MaterialPageRoute? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case MainScreen.route:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) =>
                UserCubit(apiInterface: _apiInterface),
            child: MainScreen(),
          ),
        );
    }
  }
}
