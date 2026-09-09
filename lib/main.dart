import 'package:flutter/material.dart';
import 'package:labwork1/service/orderService.dart';

import 'entity/order.dart';
import 'entity/orderStatus.dart';
import 'entity/user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: .fromSeed(seedColor: Colors.orange),
      ),
      home: const MyHomePage(title: 'Мужиков Павел Александрович ПИбд-31'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _counter = 0;

  String? _lastOrderUser;

  OrderService _orderService = new OrderService();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  Future<void> _createOrder() async {
    final randomName = "User: $_counter";
    final user = User(randomName);

    Order order = await _orderService.createOrder(
      user,
      comment: 'Тестовый заказ $randomName',
    );
    String orderName = order.getName;
    OrderStatus status = order.getStatus;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Заказ: $orderName для $randomName получил статус: $status'),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: _createOrder,
              icon: const Icon(Icons.add_shopping_cart),
              label: const Text('Создать заказ'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              ),
            ),
            const SizedBox(height: 30),
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            if (_lastOrderUser != null)
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  'Последний заказ: $_lastOrderUser',
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
