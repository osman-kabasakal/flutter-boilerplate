import 'package:flutter/material.dart';
import 'package:flutter_exercies/core/domain/abstract/repository.dart';
import 'package:flutter_exercies/core/domain/entities/user.dart';

class UserRepository extends Repository<User> {
  UserRepository(BuildContext context)
      : super(context: context, tableName: "user", primaryFieldName: "uid");

  Future<bool> hasUser(String uid) async {
    var user = await single(User(uid: uid));
    return user != null;
  }
}
