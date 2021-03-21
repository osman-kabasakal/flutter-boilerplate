import 'package:flutter_exercies/core/bloc/bloc.dart';

class AppConfig implements Bloc {
  final bool hasDatabase;

  AppConfig(this.debug, {required this.hasDatabase});
  final bool debug;
  @override
  void dispose() {}
}
