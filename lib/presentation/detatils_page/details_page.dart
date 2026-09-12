import 'package:flutter/material.dart';

import '../../domain/modules/card_data.dart';

class DetailsPage extends StatelessWidget {
  final CardData data;

  const DetailsPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data.text),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (data.imageUrl != null)
              SizedBox(
                width: double.infinity,
                height: 240,
                child: Image.network(
                  data.imageUrl!,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => const Placeholder(),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(data.icon, size: 32),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          data.text,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    data.descriptionText,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}