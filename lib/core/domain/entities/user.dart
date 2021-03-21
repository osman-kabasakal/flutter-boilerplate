import 'package:flutter_exercies/core/domain/abstract/base_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends IEntity {
  User({this.uid, this.last_updated_date, this.score, this.hint, this.review});

  final String? uid;
  final DateTime? last_updated_date;
  int? score;
  int? hint = 2;
  bool? review = false;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  Map<String, dynamic> toSqlite() => <String, dynamic>{
        'uid': this.uid,
        'last_updated_date': this.last_updated_date?.toIso8601String(),
        'score': this.score,
        'hint': this.hint,
        'review': this.review != null
            ? this.review!
                ? 1
                : 0
            : 0,
      };
}
