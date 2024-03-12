import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:otamoz/customerAccountScreen.dart';
import 'package:otamoz/customerRestaurantPage.dart';
import 'package:otamoz/userAuthentication/welcomeScreen.dart';

import '/ScrollFeature.dart';
import 'customerHomepageComponents/customerHomepageSearch.dart';
import 'customerHomepageComponents/customerHomepageCuisines.dart';

class CustomerHomepage extends StatefulWidget {
  final Map<String, dynamic> user;
  CustomerHomepage({required this.user});

  @override
  State<StatefulWidget> createState() => CustomerHomepageState();
}

class Restaurant {
  final String name;
  final String cuisine;
  final String imageUrl;
  final String deliveryTime;
  final String distance;
  final String costForOne;
  final double rating;

  Restaurant({
    required this.name,
    required this.cuisine,
    required this.imageUrl,
    required this.deliveryTime,
    required this.distance,
    required this.costForOne,
    required this.rating,
  });
}

class CustomerHomepageState extends State<CustomerHomepage> {
  // String userID = '';

  // Future<String> getUserID() async {
  //   print(user.email!);
  //   String userID = '';

  //   try {
  //     QuerySnapshot querySnapshot = await FirebaseFirestore.instance
  //         .collection('users')
  //         .where('email', isEqualTo: user.email!)
  //         .get();

  //     if (querySnapshot.docs.isNotEmpty) {
  //       // Use first document's reference to get the document ID
  //       userID = querySnapshot.docs.first.reference.id;
  //       print(userID);
  //     } else {
  //       print('No matching documents found.');
  //     }
  //   } catch (error) {
  //     print('Error getting user ID: $error');
  //   }
  //   return userID;
  // }

  List<String> restaurantIDList = [];
  List<Map<String, dynamic>> restaurantsList = [];

  Future getRestaurantID() async {
    await FirebaseFirestore.instance.collection('restaurants').get().then(
          (snapshot) => snapshot.docs.forEach((element) {
            restaurantsList.add(element.data() as Map<String, dynamic>);
            print(element.data());
            restaurantIDList.add(element.reference.id);
          }),
        );
  }
  
  @override
  void initState() {
    super.initState();
    //getRestaurantID();
  }

  List<String> tabName = [
    "Sort",
    "Rating 4.0+",
    "Nearest",
  ];

  List<String> category = [
    "Pizza",
    "Biryani",
    "Chicken",
    "Pastry",
    "Fish",
    "Fried Rice",
    "Prawns",
    "Muttons",
  ];


  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 690));
    return FutureBuilder(
        future: getRestaurantID(),
        builder: (context, snapshot) {
          return Container(
          color: Colors.black,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              body: Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
        
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 25.sp,
                            color: const Color.fromARGB(255, 0, 0, 0),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Istanbul",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                                    child: FaIcon(
                                      FontAwesomeIcons.angleDown,
                                      size: 15.sp,
                                    ),
                                  ),
                                ],
                              ),
                              Text("Beykent")
                            ],
                          ),
                          Spacer(),
                          SizedBox(
                            width: 5.w,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        RestaurantCustomerAccountScreen(
                                            user: widget.user)),
                              );
                            },
                            child: Container(
                              height: 30.h,
                              width: 30.w,
                              child: CircleAvatar(
                                  backgroundImage: AssetImage(
                                "assets/profileButton.jpg",
                              )),
                            ),
                          )
                        ],
                      ),
                    ),
                    //search box
                    CustomerHomepageSearch(),
                    Container(
                      height: 40.h,
                      child: ListView.builder(
                        itemCount: tabName.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.all(5.h),
                            child: Container(
                              width: 100.w,
                              child: index == 0
                                  ? Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10.r),
                                          border:
                                              Border.all(color: Colors.grey[300]!)),
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            Icon(
                                              Icons.tune,
                                              size: 15.sp,
                                            ),
                                            Text(
                                              "Filters",
                                              style: TextStyle(fontSize: 13.sp),
                                            ),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            FaIcon(
                                              FontAwesomeIcons.angleDown,
                                              size: 10.sp,
                                            ),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  : index == 5 || index == 6
                                      ? Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                              border: Border.all(
                                                  color: Colors.grey[300]!)),
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: 5.w,
                                              ),
                                              Text(
                                                "${tabName[index]}",
                                                style: TextStyle(fontSize: 10.sp),
                                              ),
                                              SizedBox(
                                                width: 5.w,
                                              ),
                                              FaIcon(
                                                FontAwesomeIcons.angleDown,
                                                size: 10.sp,
                                              ),
                                              SizedBox(
                                                width: 5.w,
                                              ),
                                            ],
                                          ),
                                        )
                                      : Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                              border: Border.all(
                                                  color: Colors.grey[300]!)),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5.w, vertical: 5.h),
                                            child: Center(
                                                child: Text("${tabName[index]}")),
                                          ),
                                        ),
                            ),
                          );
                        },
                      ),
                    ),
                    Expanded(
                      child: ScrollConfiguration(
                        behavior: ScrollFeature(),
                        child: ListView(
                          children: [
                            CustomerHomepageCuisines(category: category),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(child: Divider()),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Center(
                                      child: Text(
                                    "Recommendations",
                                    style: TextStyle(color: Colors.grey[500]!),
                                  )),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Expanded(child: Divider()),
                                ],
                              ),
                            ),
                            ListView.builder(
                              itemCount: restaurantIDList.length,
                              
                              physics: ClampingScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (BuildContext context, int index) {
                                print('Length ${restaurantIDList.length}');
                                String restaurantID = restaurantIDList[index];
                                String restName = restaurantsList[index]['name'];
                                String imageUrl =restaurantsList[index]['imageURL'];
                                double rating = restaurantsList[index]['rating'];
                                String costForTwo = restaurantsList[index]['costForTwo'];
                                double distance = restaurantsList[index]['distance'];
                                String cuisine = restaurantsList[index]['cuisine'];
                                String delivery = restaurantsList[index]['delivery'];
        
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.w, vertical: 10.h),
                                  child: Card(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.r)),
                                      child: Stack(
                                        children: [
                                          Column(
                                            children: [
                                              Container(
                                                  height: 150.h,
                                                  width: double.infinity,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      print('he');
        
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              CustomerRestaurantPage(
                                                                  user: widget.user,
                                                                  restaurantID:
                                                                      restaurantID),
                                                        ),
                                                      );
                                                    },
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topRight:
                                                            Radius.circular(10.r),
                                                        topLeft:
                                                            Radius.circular(10.r),
                                                      ),
                                                      child: imageUrl.startsWith("assets")
                                                        ? Image.asset(
                                                            imageUrl,
                                                            fit: BoxFit.fill,
                                                          )
                                                        : Image.network(
                                                            imageUrl,
                                                            fit: BoxFit.fill,
                                                          ),
                                                    ),
                                                  )
                                                  // ClipRRect(
                                                  //     borderRadius:
                                                  //         BorderRadius.only(
                                                  //       topRight:
                                                  //           Radius.circular(
                                                  //               10.r),
                                                  //       topLeft:
                                                  //           Radius.circular(
                                                  //               10.r),
                                                  //     ),
                                                  //     child: Image.asset(
                                                  //       restaurant.imageUrl,
                                                  //       fit: BoxFit.fill,
                                                  //     )
                                                  // )
                                                  ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 10.h),
                                                child: Column(
                                                  children: [
                                                    SizedBox(
                                                      height: 40.h,
                                                    ),
                                                    Row(
                                                      children: [
                                                        SizedBox(
                                                          width: 10.w,
                                                        ),
                                                        Icon(
                                                          Icons.alarm,
                                                          color: Colors.green,
                                                        ),
                                                        SizedBox(
                                                          width: 5.w,
                                                        ),
                                                        Text(
                                                            "${delivery} ● ${distance} km"),
                                                        Spacer(),
                                                        Text(costForTwo),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          Positioned(
                                              top: 10.h,
                                              right: 10.w,
                                              child: Icon(
                                                Icons.favorite_outline,
                                                size: 20.sp,
                                              )),
                                          Positioned(
                                              bottom: 30.h,
                                              left: 10.w,
                                              child: Container(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      restName,
                                                      style: TextStyle(
                                                        fontSize: 20.sp,
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Container(
                                                            child: Padding(
                                                          padding:
                                                              EdgeInsets.symmetric(
                                                                  horizontal: 5.w),
                                                          child: Text(
                                                            cuisine,
                                                            style: TextStyle(
                                                                color:
                                                                    Colors.black),
                                                          ),
                                                        )),
                                                        SizedBox(
                                                          width: 215.w,
                                                        ),
                                                        Container(
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.r),
                                                              color: Colors.green),
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        5.w),
                                                            child: Text(
                                                              "${rating}★",
                                                              style: TextStyle(
                                                                  color:
                                                                      Colors.white),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                    ElevatedButton(
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
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
        
        });
    
        
   
  
  }
}
