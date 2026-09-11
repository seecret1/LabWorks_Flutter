import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const MyWidget(),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      _CardData(
        'Chevrolet',
        descriptionText: "Chevrolet Camaro, Color: white",
        imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnz7GS5qj950_p6To68O1ohYkgz_grCZiqr9gdmuh5aWuE1oqu51ke-VE&s=10"
      ),
      _CardData(
        'Lamborghini',
        icon: Icons.eleven_mp,
        descriptionText: "Lamborghini, Color: blue",
        imageUrl: "https://robbreport.com/wp-content/uploads/2024/08/temerario01.jpg?w=800"
      ),
      _CardData(
        'Chevrolet',
        icon: Icons.sixteen_mp,
        descriptionText: "Chevrolet Corvette, Color: red",
        imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSUv-Tr_Bu2mFGuGiULhuHJPOXVqK_Uj5Kh1KI6EpqFtBQMAmnaKEFsvVj8&s=10"
      ),
    ];
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: data.map((e) => _Card.fromData(e)).toList(),
        ),
      )
    );
  }
}

class _CardData {
  final String text;
  final IconData icon;
  final String descriptionText;
  final String? imageUrl;

  const _CardData(
      this.text, {
        this.icon = Icons.eighteen_mp_sharp,
        required this.descriptionText,
        this.imageUrl
      });

}

class _Card extends StatelessWidget {

  final String text;
  final IconData icon;
  final String descriptionText;
  final String? imageUrl;

  const _Card(
      this.text, {
        this.icon = Icons.ac_unit_outlined,
        required this.descriptionText,
        this.imageUrl
  });

  factory _Card.fromData(_CardData data) => _Card(
    data.text,
    descriptionText: data.descriptionText,
    icon: data.icon,
    imageUrl: data.imageUrl
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.black,
          width: 5
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                height: 150,
                width: 100,
                child: Image.network(
                  imageUrl ?? '',
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => const Placeholder(),
                ),
              ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      text,
                    style: Theme.of(context).textTheme.headlineLarge
                  ),
                  Text(
                      descriptionText,
                      style: Theme.of(context).textTheme.headlineSmall
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(icon),
          )
        ],
      ),
    );
  }
}
