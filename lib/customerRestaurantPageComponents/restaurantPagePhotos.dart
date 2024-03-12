import 'package:flutter/material.dart';

class RestaurantPagePhotos extends StatelessWidget {
  final GlobalKey _photosKey;

  RestaurantPagePhotos(this._photosKey);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: _photosKey,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Photos',
                style: TextStyle(fontSize: 24, color: Colors.black),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    buildPhoto("assets/images/restaurantPhotos/restPhoto1.jpg"),
                    const SizedBox(width: 33.75),
                    buildPhoto("assets/images/restaurantPhotos/restPhoto2.jpg"),
                    const SizedBox(width: 33.75),
                    buildPhoto("assets/images/restaurants/restaurant1.jpg"),
                    // Add more photos as needed
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPhoto(String imagePath) {
    return Image.asset(imagePath);
  }
}
