import 'package:flutter/material.dart';
import 'package:flutter_exercies/core/domain/repositories/user_repository.dart';
import 'package:flutter_exercies/utils/helpers/di_helpers.dart';

class UserService {
  late UserRepository userRepo;

  UserService(BuildContext context) {
    this.userRepo = context.getRequireProviderService<UserRepository>();
  }
}
