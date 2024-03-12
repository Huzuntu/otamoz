import 'package:flutter/material.dart';
import 'customerSettingsComponents/topBoxComponent.dart';
import 'restaurantSettingsComponents/infoList.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class RestaurantCustomerSettingsScreen extends StatelessWidget {
  final Map<String, dynamic> user;
  RestaurantCustomerSettingsScreen({required this.user});
  //const RestaurantCustomerSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double heightTopGroup = 300;
    double heightTopGroupA = 200;
    double heightTopGroupB = 100;

    return Scaffold(
      body: Container(
        width: width,
        height: height,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(color: Colors.white),
        child: Stack(
              children: [
                buildTopBoxComponent(width, height, heightTopGroup, heightTopGroupA, heightTopGroupB),
                buildPositioned(heightTopGroup + 30, width, 40,"${user['username']}"),
                buildPositioned(heightTopGroup + 75, width, 40,"${user['email']}"),
                buildPositioned(heightTopGroup + 120, width, 40,"John"),
                buildPositioned(heightTopGroup + 165, width, 40,"Doe"),
                buildPositioned(heightTopGroup + 210, width, 40,"User Phone Number"),
                Positioned(
      top: height - 80,
      left: width-110,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text('Save'),
      ),
    )
            
              ],
              
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     FirebaseAuth.instance.signOut();
            //     // Add any additional logic you want to perform on sign-out
            //   },
            //   child: Text(
            //     "Sign Out",
            //     style: TextStyle(fontSize: 13),
            //   ),
            // ),
      ),
      
      
    );
  }

}
