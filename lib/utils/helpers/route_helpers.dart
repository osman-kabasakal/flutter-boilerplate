import 'package:flutter/cupertino.dart';
import 'package:flutter_exercies/Config/routes/route_setting.dart';
import 'package:flutter_exercies/constants/route_names.dart';

extension GetRoute on RouteSettings {
  Route getRoute() {
    if (routeNames.containsKey(this.name)) {
      return routeNames[this.name!]!(this);
    }
    return routeNames[Routes.home]!(this);
  }
}
