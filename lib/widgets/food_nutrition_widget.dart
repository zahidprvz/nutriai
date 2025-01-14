import 'package:flutter/material.dart';

class FoodNutritionsWidget extends StatelessWidget {
  final Map<String, dynamic> foodData;

  const FoodNutritionsWidget({Key? key, required this.foodData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Handle error case
    if (foodData.containsKey('error')) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(foodData['error'],
            style: const TextStyle(fontSize: 16, color: Colors.red)),
      );
    }

    // Extract values safely, providing defaults if not found
    final String foodName = foodData['food'] ?? 'Unknown Food';
    final String protein = foodData['protein'] ?? '-';
    final String carbs = foodData['carbs'] ?? '-';
    final String fat = foodData['fat'] ?? '-';
    final String calories = foodData['calories'] ?? '-';

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$foodName',
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text('Protein: $protein', style: TextStyle(fontSize: 18)),
          Text('Carbs: $carbs', style: TextStyle(fontSize: 18)),
          Text('Fat: $fat', style: TextStyle(fontSize: 18)),
          const SizedBox(height: 10),
          Text(
            'Calories: $calories',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          // Add more Text widgets for additional data as needed
        ],
      ),
    );
  }
}
