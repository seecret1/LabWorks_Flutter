import 'package:labwork1/entity/order.dart';
import 'package:labwork1/entity/user.dart';

class OrderService {
  final List<Order> _orders = [];

  Future<Order> createOrder(User user, {String? comment}) async {
    final generateName = (int number, String userName) {
      return "Order #$number";
    };

    final order = Order(
      generateName(user.getNumber, user.getName),
      user: user,
      comment: comment,
    );

    await Future.delayed(Duration(milliseconds: 500));

    _orders.add(order);
    return order;
  }

  List<Order> getAllOrders() => _orders;

  List<Order> getOrdersByUser(User user) {
    final result = <Order>[];

    for (var order in _orders) {
      for (int i = 0; i < order.getUsers.length; i++) {
        if (order.getUsers.elementAt(i).getName == user.getName) {
          result.add(order);
        }
      }
    }
    return result;
  }
}