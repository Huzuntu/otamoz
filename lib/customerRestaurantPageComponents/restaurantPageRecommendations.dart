import 'package:flutter/material.dart';

class RecommendedRestaurantDetails {
  final String name;
  final String imagePath;
  final double rating;
  final double distance;

  RecommendedRestaurantDetails({
    required this.name,
    required this.imagePath,
    required this.rating,
    required this.distance,
  });
}

class RestaurantPageRecommendations extends StatefulWidget {
  final List<RecommendedRestaurantDetails> restaurantDetailsList;

  RestaurantPageRecommendations(this.restaurantDetailsList);

  @override
  _RestaurantPageRecommendationsState createState() =>
      _RestaurantPageRecommendationsState();
}

class _RestaurantPageRecommendationsState
    extends State<RestaurantPageRecommendations> {
  Map<String, bool> favoritedRestaurants = {
    'Restaurant 1': false,
    'Restaurant 2': false,
    'Restaurant 3': false,
    'Restaurant 4': false,
    'Restaurant 5': false,
    // Add more restaurants as needed
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'More Dining Recommendations',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          SizedBox(
            height: 300,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (var restaurant in widget.restaurantDetailsList)
                    buildRestaurantRecommendation(restaurant),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRestaurantRecommendation(
      RecommendedRestaurantDetails restaurantDetails) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                width: double.infinity,
                height: 195,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(restaurantDetails.imagePath),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: IconButton(
                  icon: Icon(
                    favoritedRestaurants[restaurantDetails.name] == true
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    setState(() {
                      favoritedRestaurants[restaurantDetails.name] =
                          !(favoritedRestaurants[restaurantDetails.name] ?? false);
                    });
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Flexible(
                child: Text(
                  restaurantDetails.name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Spacer(),
              Container(
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                ),
                child: Row(
                  children: [
                    Text(
                      restaurantDetails.rating.toString(),
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    Icon(Icons.star, color: Colors.white, size: 20),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 4),
          Text('${restaurantDetails.distance} km away'),
        ],
      ),
    );
  }
}
