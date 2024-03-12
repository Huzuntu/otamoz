import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'customerSettingsComponents/topBoxComponent.dart';
import 'customerAccountComponents/buttonGroupComponent.dart';
import 'customerAccountComponents/reviewCardComponent.dart';
import 'customerAccountComponents/filteredReviewsComponent.dart';

GlobalKey _reviewsKey = GlobalKey();

class RestaurantCustomerAccountScreen extends StatefulWidget {
  final Map<String, dynamic> user;
  RestaurantCustomerAccountScreen({required this.user});

  @override
  State<RestaurantCustomerAccountScreen> createState() =>
      _RestaurantCustomerAccountScreenState();
}

class _RestaurantCustomerAccountScreenState
    extends State<RestaurantCustomerAccountScreen> {
  // Future<Map<String, dynamic>> getUser() async {
  //   var snapshot = await FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(widget.userID)
  //       .get();

  //   return snapshot.data() as Map<String, dynamic>;
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   getUser(); // Fetch user data when the widget is initialized
  // }

  @override
  Widget build(BuildContext context) {
    // return FutureBuilder(
    //     future: getUser(),
    //     builder: (context, snapshot) {
    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         // Show a loading indicator while waiting for the data
    //         return CircularProgressIndicator();
    //       } else if (snapshot.hasError) {
    //         // Handle error
    //         return Text('Error: ${snapshot.error}');
    //       } else {
    //         // Data has been loaded successfully, update the UI
    //         Map<String, dynamic> data = snapshot.data!;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double heightTopGroup = 300;
    double heightTopGroupA = 200;
    double heightTopGroupB = 100;
    Map<String, dynamic> user = widget.user;
    print('account screen user');
    print(user);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                children: [
                  buildTopBoxComponent(width, height, heightTopGroup,
                      heightTopGroupA, heightTopGroupB),
                  buildButtonGroupComponent(
                      width, height, heightTopGroup + 10, user, context),
                  FilteredRestaurantPageReviews(
                      reviewsKey: _reviewsKey, username: user['username']),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//         });
//   }
// }
