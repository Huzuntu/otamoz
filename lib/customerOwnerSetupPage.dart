import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:otamoz/restaurantHomepage.dart';

class RestaurantOwnerSetupPage extends StatefulWidget {
  final String restaurantID;

  RestaurantOwnerSetupPage({required this.restaurantID});
  
  @override
  _RestaurantOwnerSetupPageState createState() => _RestaurantOwnerSetupPageState();
}

class _RestaurantOwnerSetupPageState extends State<RestaurantOwnerSetupPage> {
  final TextEditingController addressController = TextEditingController();
  final TextEditingController costForTwoController = TextEditingController();
  final TextEditingController cuisineController = TextEditingController();
  final TextEditingController deliveryController = TextEditingController();
  final TextEditingController distanceController = TextEditingController();
  final TextEditingController imageURLController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ratingController = TextEditingController();
  final TextEditingController reviewCountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurant Owner Setup'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Restaurant Name'),
            ),
            TextFormField(
              controller: addressController,
              decoration: InputDecoration(labelText: 'Address'),
            ),
            TextFormField(
              controller: costForTwoController,
              decoration: InputDecoration(labelText: 'Cost for Two'),
            ),
            TextFormField(
              controller: cuisineController,
              decoration: InputDecoration(labelText: 'Cuisine'),
            ),
            TextFormField(
              controller: deliveryController,
              decoration: InputDecoration(labelText: 'Delivery'),
            ),
            TextFormField(
              controller: distanceController,
              decoration: InputDecoration(labelText: 'Distance'),
            ),
            TextFormField(
              controller: imageURLController,
              decoration: InputDecoration(labelText: 'Image URL'),
            ),
            TextFormField(
              controller: ratingController,
              decoration: InputDecoration(labelText: 'Rating'),
            ),
            TextFormField(
              controller: reviewCountController,
              decoration: InputDecoration(labelText: 'Review Count'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Save logic here
                // String restaurantID = FirebaseAuth.instance.currentUser?.uid ?? '';
                // print('restaurant ID in setup');
                // print(widget.restaurantID);
                String restaurantID = widget.restaurantID;
                //String costForTwoString = costForTwoController.text.trim();
                String distanceString = distanceController.text.trim();
                String ratingString = ratingController.text.trim();
                String reviewCountString = reviewCountController.text.trim();

                
                double distance = double.tryParse(distanceString) ?? 0.0;
                double rating = double.tryParse(ratingString) ?? 0.0;
                int reviewCount = int.tryParse(reviewCountString) ?? 0;

                await FirebaseFirestore.instance.collection('restaurants').doc(restaurantID).update({
                  'address': addressController.text.trim(),
                  'costForTwo': costForTwoController.text.trim(),
                  'cuisine': cuisineController.text.trim(),
                  'delivery': deliveryController.text.trim(),
                  'distance': distance,
                  'imageURL': imageURLController.text.trim(),
                  'name': nameController.text.trim(),
                  'rating': rating,
                  'reviewCount': reviewCount,
                });

                // After saving, navigate to RestaurantHomepage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RestaurantHomepage(restaurantID: restaurantID,)),
                );
              },
              child: Text('Save'),
            ),
          
          ],
        ),
      ),
    );
  }
}
