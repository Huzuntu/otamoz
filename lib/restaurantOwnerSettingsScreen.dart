import 'package:flutter/material.dart';
import 'restaurantSettingsComponents/ratingComponent.dart';
import 'restaurantSettingsComponents/restaurantInfoComponent.dart';
import 'restaurantSettingsComponents/infoList.dart';

class RestaurantOwnerSettingsScreen extends StatelessWidget {
  final Map<String, dynamic> data;
  const RestaurantOwnerSettingsScreen({Key? key,required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: width,
        height: height,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(color: Colors.white),
        child: Stack(
          children: [
            _buildTopContainer(width, data),
            buildPositioned(335, width, 40, data['name']),
            buildPositioned(380, width, 40, data['address']),
            buildPositioned(425, width, 40, data['costForTwo']),
            buildPositioned(470, width, 40, data['cuisine']),
            buildPositioned(515, width, 40, "John Doe"),
            buildPositioned(560, width, 40, "Phone Number"),
            _buildSubscriptButton(width, height),
          ],
        ),
      ),
    );
  }

  Widget _buildTopContainer(double screenWidth,Map<String, dynamic> data) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: const ShapeDecoration(
        color: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ),
        ),
      ),
      child: Center(
        child: Container(
          width: 366,
          height: 200,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Stack(
            children: [
              buildStarReview(366, 200,data['reviewCount'],data['rating']),
              buildRestaurantInfo(366, 200,data),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSubscriptButton(double screenWidth, double screenHeight) {
    return Positioned(
      bottom: 20,
      left: (screenWidth - 200) / 2,
      child: ElevatedButton(
        onPressed: () {
          // Add your subscription functionality here
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.blue,
        ),
        child: Text('Subscript For Premium'),
      ),
    );
  }
}