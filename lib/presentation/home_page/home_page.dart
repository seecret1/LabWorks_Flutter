import 'package:flutter/material.dart';

import '../../domain/modules/card_data.dart';
import '../detatils_page/details_page.dart';

part 'card.dart';

class Body extends StatefulWidget {
  const Body({super.key, required this.title});

  final String title;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {

  @override
  void initState() {

    super.initState();
  }

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
      CardData(
          'Chevrolet',
          descriptionText: "Chevrolet Camaro, Color: white",
          imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnz7GS5qj950_p6To68O1ohYkgz_grCZiqr9gdmuh5aWuE1oqu51ke-VE&s=10"
      ),
      CardData(
          'Lamborghini',
          icon: Icons.eleven_mp,
          descriptionText: "Lamborghini, Color: blue",
          imageUrl: "https://robbreport.com/wp-content/uploads/2024/08/temerario01.jpg?w=800"
      ),
      CardData(
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
            children: data.map((e) => _Card(
              data: e,
              onLike: (title, isLiked) =>
                  _showSnackBar(context, title, isLiked),
              onTap: (cardData) => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DetailsPage(data: cardData),
                ),
              ),
            )).toList(),
          ),
        )
    );
  }

  void _showSnackBar(BuildContext context, String title, bool isLiked) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Racoon $title ${isLiked ? 'liked' : 'disliked :<'}',
              style: Theme
                  .of(context)
                  .textTheme
                  .bodyLarge,
            ),
            backgroundColor: Colors.orangeAccent,
            duration: const Duration(seconds: 1),
          )
      );
    });
  }
}