import 'package:labwork1/entity/order.dart';
import 'package:labwork1/entity/orderStatus.dart';

extension OrderExtensions on Order {
  bool get isCompleted => getStatus == OrderStatus.SUCCESS;

  String get statusDescription {
    switch (getStatus) {
      case OrderStatus.PENDING:
        return 'Ожидание';
      case OrderStatus.SUCCESS:
        return 'Выполнен';
      case OrderStatus.ERROR:
        return 'Ошибка';
    }
  }

  String get formattedInfo {
    final usersInfo = getUsers.map((user) => user.getName).join(', ');
    return 'Заказ #${getNumber}: $usersInfo - ${statusDescription}';
  }
}