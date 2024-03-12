import 'package:flutter/material.dart';

class RestaurantPageBar extends StatefulWidget {
  //final Map<String, dynamic> restaurantData;
  final String name;
  final double distance;
  final double rating;
  final String imageURL;
  final int reviewCount;
  final String costForTwo;
  final String address;
  final String cuisine;
  

  const RestaurantPageBar({Key? key, required this.name, 
  required this.distance, required this.rating,
    required this.imageURL, required this.reviewCount,
    required this.costForTwo, required this.address,
    required this.cuisine}) : super(key: key);

  @override
  State<RestaurantPageBar> createState() => _RestaurantPageBarState();
}

class _RestaurantPageBarState extends State<RestaurantPageBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                
                '  ${widget.name}',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: const Color.fromARGB(255, 193, 193, 193)),
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(8), bottom: Radius.circular(8)),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                      ),
                      child: Row(
                        children: [
                          Text('${widget.rating}', style: TextStyle(fontSize: 15, color: Colors.white)),
                          Icon(Icons.star, color: Colors.white, size: 20),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(bottom: Radius.circular(8)),
                      ),
                      child: Column(
                        children: [
                          Text('${widget.reviewCount}', style: TextStyle(fontSize: 12, color: Colors.black)),
                          Text('Reviews', style: TextStyle(fontSize: 10, color: Colors.black)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(width: 5,),
              Text(widget.cuisine),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              SizedBox(width: 5,),
              Text(widget.address),
              Text('${widget.distance} kms'),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              SizedBox(width: 5,),
              Text('${widget.costForTwo} for two'),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Text('Open Now ', style: TextStyle(color: Colors.green)),
              Text('| 12 noon - 3:30pm, 6:45pm-11:15 pm'),
            ],
          ),
          const SizedBox(height: 8),
          Divider(),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Handle location button press
                    },
                    icon: Icon(Icons.location_on, color: Colors.blue),
                    label: Text('Directions'),
                  ),
                ),
                const SizedBox(height: 45, child: VerticalDivider(color: Colors.grey)),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Handle phone button press
                    },
                    icon: Icon(Icons.phone, color: Colors.green),
                    label: Text('Call'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
