import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otamoz/userAuthentication/welcomeScreen.dart';
import 'restaurantPageButton.dart';
import 'customerRestaurantPageComponents/restaurantPageTopBar.dart';
import 'customerRestaurantPageComponents/restaurantPageIndex.dart';
import 'dart:convert';

GlobalKey _photosKey = GlobalKey();
GlobalKey _menuKey = GlobalKey();
GlobalKey _reviewsKey = GlobalKey();
GlobalKey _aboutKey = GlobalKey();

class Restaurant1 {
  String? cuisine;
  String? name;
  String? imageUrl;
  String? address;
  String? distance;
  String? costForTwo;
  double? rating;
  int? reviewCount;

  Restaurant1({
    this.name,
    this.cuisine,
    this.imageUrl,
    this.address,
    this.distance,
    this.costForTwo,
    this.rating,
    this.reviewCount,
  });
}

class CustomerRestaurantPage extends StatefulWidget {
  final Map<String, dynamic> user;

  final String restaurantID;

  CustomerRestaurantPage({required this.user, required this.restaurantID});

  //const CustomerRestaurantPage({required this.user, super.key});

  @override
  State<StatefulWidget> createState() => CustomerRestaurantPageState();
}

class CustomerRestaurantPageState extends State<CustomerRestaurantPage> {
  Future<Map<String, dynamic>> getRestaurant() async {
    var snapshot = await FirebaseFirestore.instance
        .collection('restaurants')
        .doc(widget.restaurantID)
        .get();
    // Map<String, dynamic> snapMap = snapshot.data() as Map<String, dynamic>;
    // mockUpRest.name = snapMap['name'];

    return snapshot.data() as Map<String, dynamic>;
  }

  @override
  void initState() {
    super.initState();
    getRestaurant(); // Fetch user data when the widget is initialized
  }

  final List<RecommendedRestaurantDetails> restaurantDetailsList = [
    RecommendedRestaurantDetails(
      name: 'Mamagoto',
      imagePath: 'assets/images/restaurantPhotos/recom1.jpg',
      rating: 4.5,
      distance: 3.2,
    ),
    RecommendedRestaurantDetails(
      name: 'Gears & Garage',
      imagePath: 'assets/images/restaurantPhotos/recom2.jpg',
      rating: 4.8,
      distance: 1.8,
    ),
    RecommendedRestaurantDetails(
      name: 'Dhaba - Estd 1986',
      imagePath: 'assets/images/restaurantPhotos/restPhoto2.jpg',
      rating: 4.3,
      distance: 5.4,
    ),
    // Add more restaurant details as needed
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 960));
    return FutureBuilder(
        future: getRestaurant(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show a loading indicator while waiting for the data
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            // Handle error
            return Text('Error: ${snapshot.error}');
          } else {
            // Data has been loaded successfully, update the UI
            Map<String, dynamic> data = snapshot.data!;
            //Map<String, dynamic> data = snapshot.data as Map<String, dynamic>;
            return Scaffold(
              appBar: AppBar(
                leading: widget.user['usertype'] == 'owner'
                    ? const SizedBox(
                        width: 10,
                      )
                    : IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                title: const Text(''),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.favorite_border),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.share),
                    onPressed: () {},
                  ),
                ],
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: data['name'] == ''
                      ? ElevatedButton(
                          onPressed: () {
                            FirebaseAuth.instance.signOut();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MainPage()));
                            // Add any additional logic you want to perform on sign-out
                          },
                          child: Text(
                            "Sign Out",
                            style: TextStyle(fontSize: 13.sp),
                          ),
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            //RestaurantPageBar(restaurantData: data),
                            RestaurantPageBar(
                              name: data['name'],
                              distance: data['distance'],
                              rating: data['rating'],
                              imageURL: data['imageURL'],
                              reviewCount: data['reviewCount'],
                              costForTwo: data['costForTwo'],
                              address: data['address'],
                              cuisine: data['cuisine'],
                            ),
                            const SizedBox(height: 8),
                            Container(
                              child: RestaurantPageScrollButtons(
                                onPhotosTap: () {
                                  //_scrollController.scrollTo(key: _photosKey);
                                  Scrollable.ensureVisible(
                                      _photosKey.currentContext!,
                                      duration:
                                          const Duration(milliseconds: 1000));
                                },
                                onMenuTap: () {
                                  //_scrollController.scrollTo(key: _menuKey);
                                  Scrollable.ensureVisible(
                                      _menuKey.currentContext!,
                                      duration:
                                          const Duration(milliseconds: 1000));
                                },
                                onReviewsTap: () {
                                  //_scrollController.scrollTo(key: _reviewsKey);
                                  Scrollable.ensureVisible(
                                      _reviewsKey.currentContext!,
                                      duration:
                                          const Duration(milliseconds: 1000));
                                },
                                onAboutTap: () {
                                  //_scrollController.scrollTo(key: _aboutKey);
                                  Scrollable.ensureVisible(
                                      _aboutKey.currentContext!,
                                      duration:
                                          const Duration(milliseconds: 1000));
                                },
                              ),
                            ),
                            Container(
                              child: RestaurantPagePhotos(_photosKey),
                            ),
                            Container(
                              child: RestaurantPageMenu(_menuKey),
                            ),
                            RestaurantPageReviews(reviewsKey: _reviewsKey),
                            Container(
                              child: RestaurantPageAbout(_aboutKey),
                            ),
                            RestaurantPageFacilities(),
                            RestaurantPageRecommendations(
                                restaurantDetailsList),
                            SizedBox(height: 16),
                            RestaurantPageError(),
                          ],
                        ),
                ),
              ),
            );
          }
        });
  }
}
