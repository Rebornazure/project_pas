import 'package:flutter/material.dart';

class FoodItem {
  const FoodItem({
    required this.name,
    required this.description,
    required this.price,
    required this.color,
  });

  final String name;
  final String description;
  final int price;
  final Color color;
}

const List<FoodItem> menuMakanan = [
  FoodItem(
    name: 'Nasi Goreng Spesial',
    description: 'Nasi goreng bumbu rempah dengan telur mata sapi, ayam suwir, dan kerupuk.',
    price: 25000,
    color: Color(0xFFFFE7C2),
  ),
  FoodItem(
    name: 'Ayam Bakar Madu',
    description: 'Ayam bakar olesan madu murni lengkap dengan sambal terasi dan lalapan.',
    price: 30000,
    color: Color(0xFFFFE2D9),
  ),
  FoodItem(
    name: 'Sate Ayam Madura',
    description:
        '10 tusuk sate ayam daging pilihan dengan siraman bumbu kacang kental.',
    price: 28000,
    color: Color(0xFFFFE9C7),
  ),
  FoodItem(
    name: 'Mie Ayam Bakso',
    description: 'Mie kenyal dengan topping ayam kecap, sawi hijau, dan 2 butir bakso sapi.',
    price: 20000,
    color: Color(0xFFFFE8D7),
  ),
  FoodItem(
    name: 'Es Teh Manis Jumbo',
    description:
        'Minuman teh melati segar dengan gula asli dan es batu kristal.',
    price: 8000,
    color: Color(0xFFDDF3E7),
  ),
];
