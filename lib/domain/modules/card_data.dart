import 'package:flutter/material.dart';

class CardData {
  final String text;
  final IconData icon;
  final String descriptionText;
  final String? imageUrl;

  const CardData(
      this.text, {
        this.icon = Icons.eighteen_mp_sharp,
        required this.descriptionText,
        this.imageUrl
      });

}