import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:otamoz/customerAccountScreen.dart';
import 'package:otamoz/customerHomepage.dart';
import 'package:otamoz/customerRestaurantPage.dart';
import 'package:otamoz/mainIndex.dart';
import 'package:otamoz/restaurantHomepage.dart';
import 'package:otamoz/restaurantOwnerSettingsScreen.dart';
import './regScreen.dart';
import 'loginScreen.dart';
import 'dart:async';

// ignore: camel_case_types

Future<String> getRestaurantID(String userID) async {
  var snapshot = await FirebaseFirestore.instance
      .collection('restaurants')
      .where('userID', isEqualTo: userID)
      .get();

  return snapshot.docs.first.reference.id;
}

Future<(Map<String, dynamic>, String)> getUser(String email) async {
  var snapshot = await FirebaseFirestore.instance
      .collection('users')
      .where('email', isEqualTo: email)
      .get();

  return (snapshot.docs.first.data(), snapshot.docs.first.reference.id);
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    User? activeUser = FirebaseAuth.instance.currentUser;
    Map<String, dynamic> userData = {};
    String userID = '';

    if (activeUser != null) {
      return FutureBuilder(
        future: getUser(activeUser.email!),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show a loading indicator while waiting for the data
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            // Handle error
            return Text('Error: ${snapshot.error}');
          } else {
            // Data has been loaded successfully, update the UI
            userData = snapshot.data!.$1;
            userID = snapshot.data!.$2;
            if (userData['usertype'] == "customer") {
              return CustomerHomepage(
                user: userData,
              );
            } else {
              return FutureBuilder(
                  future: getRestaurantID(userID),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      // Show a loading indicator while waiting for the data
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      // Handle error
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return RestaurantHomepage(restaurantID: snapshot.data!);
                    }
                  });
            }
          }
        },
      );
    } else {
      return const welcomeScreen();
    }
  }
}

//User? activeUser = FirebaseAuth.instance.currentUser;

class welcomeScreen extends StatefulWidget {
  const welcomeScreen({Key? key}) : super(key: key);

  @override
  State<welcomeScreen> createState() => _welcomeScreenState();
}

class _welcomeScreenState extends State<welcomeScreen> {
  bool _showIntroScreen = true;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    // Display the intro screen for 2 seconds
    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _showIntroScreen = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _showIntroScreen
          ? const AppIntro()
          : Container(
              width: double.infinity,
              height: double.infinity,
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: const Color(0xFFFF3040),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
              child: Stack(children: [
                const Padding(
                  padding: EdgeInsets.only(top: 188, left: 24),
                  child: Text(
                    'Lets get started',
                    style: TextStyle(
                      color: Color(0xFF2C2C2C),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 134, left: 20),
                  child: Text(
                    'Welcome',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 42,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    left: 24,
                    top: 433,
                  ),
                  child: Text(
                    'Existing customer',
                    style: TextStyle(
                      color: Color(0xFF2C2C2C),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24, top: 524),
                  child: Row(
                    children: [
                      const Text(
                        'New customer?',
                        style: TextStyle(
                          color: Color(0xFF2C2C2C),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextButton(
                          child: const Text(
                            'Create new account',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegScreen(context)));
                          }),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24, top: 466),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const loginScreen()));
                    },
                    child: Container(
                      width: 342,
                      height: 48,
                      decoration: ShapeDecoration(
                        color: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      child: const Center(
                        child: Text(
                          'Sign in',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 600),
                    child: Center(child: Image.asset('assets/logo.png')))
              ]),
            ),
    );
  }
}

class AppIntro extends StatelessWidget {
  const AppIntro({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(color: Color(0xFFFF3044)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Image.asset('assets/logo.png')),
          const SizedBox(
            height: 50,
          ),
          const Text(
            'Best Restaurants',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: 'Inika',
              fontWeight: FontWeight.w700,
              height: 0,
            ),
          ),
          const Text(
            'in Turkey',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: 'Inika',
              fontWeight: FontWeight.w700,
              height: 0,
            ),
          ),
        ],
      ),
    );
  }
}
