import 'package:labwork1/entity/user.dart';

import 'baseEntity.dart';
import 'orderStatus.dart';

class Order extends BaseEntity {

  static int _counter = 0;

  int _number = 0;

  Set<User> _users = {};

  OrderStatus _status;

  String? _comment;

  Order(
      super._name,
      {
        required User user,
        String? comment
      })  :
        _number = ++_counter,
        _status = OrderStatus.PENDING,
        _comment = comment {
    _users.add(user);
  }

  int get getNumber => _number;
  OrderStatus get getStatus => _status;
  String? get getComment => _comment;
  Set<User> get getUsers => _users;

  set setStatus(OrderStatus status) => _status = status;
  set setComment(String comment) => _comment = comment;
}