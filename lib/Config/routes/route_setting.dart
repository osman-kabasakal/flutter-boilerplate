import 'package:flutter/material.dart';
import 'package:flutter_exercies/Config/routes/page_routes.dart';
import 'package:flutter_exercies/constants/route_names.dart';
import 'package:flutter_exercies/modules/app/Home/home.dart';

final Map<String, Route Function(RouteSettings)> routeNames = {
  Routes.home: (route) => PageRoutes.fade<Home>(() => Home(), route)
};
