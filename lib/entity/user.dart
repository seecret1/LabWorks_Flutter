import 'package:labwork1/entity/baseEntity.dart';

class User extends BaseEntity {

  static int _counter = 0;

  int _id = 0;

  User(super._name) {
    _id = ++_counter;
  }

  int get getNumber => _id;
}