import 'package:flutter/material.dart';
import 'package:flutter_exercies/Config/app_config.dart';
import 'package:flutter_exercies/app_starter.dart';
import 'package:flutter_exercies/core/bloc/bloc_provider.dart';

void main() {
  runApp(
    BlocProvider(
      bloc: AppConfig(false, hasDatabase: false),
      child: AppStarter(),
    ),
  );
}
