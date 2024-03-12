import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:otamoz/customerOwnerSetupPage.dart';
import 'package:otamoz/userAuthentication/welcomeScreen.dart';

class RegScreen extends StatefulWidget {
  final BuildContext prevContext;

  RegScreen(this.prevContext);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<RegScreen> {
  String usertypeInput = '';
  String _errorText = '';
  bool _isPasswordVisible = true;
  bool registrationSuccess = false;
  String restaurantId = '';

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPWDController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  Future registerUser() async {
    try {
      // Create a user with email and password using FirebaseAuth
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      // Obtain the user ID (restaurantID)
      String userID = userCredential.user?.uid ?? '';
      print('restaurant id:');

      // Add user data to Firestore after successful user creation
      var docRef =
          await FirebaseFirestore.instance.collection('users').doc(userID).set({
        'usertype': usertypeInput,
        'username': usernameController.text.trim(),
        'email': emailController.text.trim(),
      });

      if (usertypeInput == 'owner') {
        var restaurantRef =
            await FirebaseFirestore.instance.collection('restaurants').add({
          'userID': userID,
          'address': '',
          'costForTwo': '',
          'cuisine': '',
          'delivery': '',
          'distance': '',
          'imageURL': '',
          'name': '',
          'rating': '',
          'reviewCount': '',
        });
        restaurantId = restaurantRef.id;
      }

      // If everything is successful, no need to explicitly return anything.
      registrationSuccess = true;
    } catch (error) {
      // Handle any errors that occurred during user registration
      print('Error during user registration: $error');
      _errorText = error.toString();
      // You may want to throw the error or handle it in a way suitable for your application.
      // Example: throw FirebaseAuthException(code: 'register_failed', message: 'User registration failed');
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPWDController.dispose();
    usernameController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFFF3040),
          title: const Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Sign up',
              style: TextStyle(
                  fontSize: 42,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context); // Navigate back to the loginScreen
            },
          ),
        ),
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFFFF3040),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 10.0),
                    _buildUserTypeOption('owner', 'Restaurant Owner'),
                    const SizedBox(height: 10.0),
                    _buildUserTypeOption('customer', 'Restaurant Customer'),
                    const SizedBox(height: 20.0),
                  ]),
            ),
            usertypeInput == ''
                ? const SizedBox(
                    height: 100,
                  )
                : Padding(
                    padding: const EdgeInsets.only(top: 200.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40)),
                        color: Colors.white,
                      ),
                      height: double.infinity,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 18.0, right: 18),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextField(
                              controller: usernameController,
                              decoration: const InputDecoration(
                                  suffixIcon: Icon(
                                    Icons.person_rounded,
                                    color: Colors.blue,
                                  ),
                                  label: Text(
                                    'User Name',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF2C2C2C),
                                    ),
                                  )),
                            ),
                            TextField(
                              controller: emailController,
                              decoration: const InputDecoration(
                                suffixIcon: Icon(
                                  Icons.mail_rounded,
                                  color: Colors.blue,
                                ),
                                label: Text(
                                  'Email adress',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF2C2C2C),
                                  ),
                                ),
                              ),
                            ),
                            TextField(
                              controller: passwordController,
                              obscureText: !_isPasswordVisible,
                              decoration: InputDecoration(
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _isPasswordVisible =
                                            !_isPasswordVisible;
                                      });
                                    },
                                    child: Icon(
                                      _isPasswordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors
                                          .blue, // Change the color to blue when clicked
                                    ),
                                  ),
                                  label: const Text(
                                    'Password',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF2C2C2C),
                                    ),
                                  )),
                            ),
                            TextField(
                              controller: confirmPWDController,
                              obscureText: !_isPasswordVisible,
                              decoration: InputDecoration(
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _isPasswordVisible =
                                            !_isPasswordVisible;
                                      });
                                    },
                                    child: Icon(
                                      _isPasswordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors
                                          .blue, // Change the color to blue when clicked
                                    ),
                                  ),
                                  label: const Text(
                                    'Confirm Password',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF2C2C2C),
                                    ),
                                  )),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              _errorText,
                              style: const TextStyle(color: Colors.red),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                String password = passwordController.text;
                                String confirmPassword =
                                    confirmPWDController.text;

                                if (password == confirmPassword) {
                                  setState(() {
                                    _errorText =
                                        ''; // Clear any previous error message
                                  });
                                  print(
                                      'Passwords match. Proceed with sign-up.');
                                  registerUser();
                                  //UserType bakilacak
                                  if (registrationSuccess) {
                                    if (usertypeInput == 'customer') {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const MainPage()));
                                    } else {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  RestaurantOwnerSetupPage(
                                                      restaurantID:
                                                          restaurantId)));
                                    }
                                  }
                                  // Implement your sign-up logic here.
                                } else {
                                  setState(() {
                                    _errorText =
                                        'Passwords do not match. Please try again.';
                                  });
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Container(
                                width: 342,
                                height: 48,
                                child: const Center(
                                  child: Text(
                                    'Sign up',
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
                            const SizedBox(
                              height: 30,
                            )
                          ],
                        ),
                      ),
                    ),
                  )
          ],
        ));
  }

  Widget _buildUserTypeOption(String userType, String label) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (usertypeInput == userType) {
            usertypeInput = ''; // Deselect the current option
          } else {
            usertypeInput = userType; // Select the new option
          }
        });
      },
      child: Row(
        children: [
          Container(
            width: 20.0,
            height: 20.0,
            margin: const EdgeInsets.only(right: 15.0, left: 15.0),
            decoration: BoxDecoration(
              color: usertypeInput == userType ? Colors.blue : Colors.white,
              border: Border.all(color: Colors.black),
            ),
          ),
          Text(
            label,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF2C2C2C),
                fontSize: 16),
          )
        ],
      ),
    );
  }
}
