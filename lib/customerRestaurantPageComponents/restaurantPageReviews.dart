import 'package:flutter/material.dart';

class RestaurantPageReviews extends StatefulWidget {
  final GlobalKey reviewsKey;

  RestaurantPageReviews({required this.reviewsKey});

  @override
  _RestaurantPageReviewsState createState() => _RestaurantPageReviewsState();
}

class RestaurantPageUserReviews {
  final String userName;
  final String userImage;
  final double rating;
  final String reviewText;
  final List<String> reviewPhotos;

  RestaurantPageUserReviews({
    required this.userName,
    required this.userImage,
    required this.rating,
    required this.reviewText,
    required this.reviewPhotos,
  });
}

class _RestaurantPageReviewsState extends State<RestaurantPageReviews> {
  bool showFullReview = false;
  late List<bool> showFullReviewList;
  final List<RestaurantPageUserReviews> restaurantPageUserReviews = [
    RestaurantPageUserReviews(
      userName: 'Umut',
      userImage: 'assets/images/reviews/reviewUser.jpg',
      rating: 4.5,
      reviewText:
          'Specifically downloaded this app to review my favourite restaurant, it’s a heaven on Earth, thanks to whoever designed this fantastic app',
      reviewPhotos: ['assets/images/reviews/reviewPhoto1.jpg', 'assets/images/reviews/reviewPhoto2.jpg'],
    ),
    RestaurantPageUserReviews(
      userName: 'Harun',
      userImage: 'assets/images/reviews/reviewUser.jpg',
      rating: 4.7,
      reviewText: 'Great food!',
      reviewPhotos: ['assets/images/reviews/reviewPhoto2.jpg', 'assets/images/reviews/reviewPhoto3.jpg'],
    ),
    RestaurantPageUserReviews(
      userName: 'Salih',
      userImage: 'assets/images/reviews/reviewUser.jpg',
      rating: 4.9,
      reviewText:
          'I enjoyed the meal at this restaurant. The ambiance was pleasant, and the service was good. However, I think there is room for improvement in terms of menu variety.',
      reviewPhotos: ['assets/images/reviews/reviewPhoto3.jpg', 'assets/images/reviews/reviewPhoto1.jpg'],
    ),
    // Add more restaurant details as needed
  ];
  int visibleReviews = 2; 
  @override
  void initState() {
    super.initState();
    showFullReviewList = List.generate(restaurantPageUserReviews.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    //showFullReviewList = List.generate(restaurantPageUserReviews.length, (index) => false);
    return Container(
      key: widget.reviewsKey,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: restaurantPageUserReviews.length,
              itemBuilder: (BuildContext context, int index) {
                RestaurantPageUserReviews review = restaurantPageUserReviews[index];
                String userLogo = review.userName.isNotEmpty ? review.userName[0].toUpperCase() : '';

                return Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(16.0),
                  margin: const EdgeInsets.only(bottom: 16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey[200],
                  ), // Add margin for space between reviews
                  child: Column(
                    children: [
                      // Review
                      Container(
                        margin: const EdgeInsets.only(bottom: 16.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // User Logo
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blueGrey, // Change color as needed
                              ),
                              child: Center(
                                child: Text(
                                  userLogo,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                    color: Colors.white, // Change color as needed
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 12.0),
                            // User Name and Rating
                            Expanded(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(review.userName, style: TextStyle(fontWeight: FontWeight.bold)),
                                  Spacer(),
                                  Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: const BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.vertical(top: Radius.circular(2)),
                                    ),
                                    child: Row(
                                      children: [
                                        Text(review.rating.toString(), style: TextStyle(fontSize: 15, color: Colors.white)),
                                        Icon(Icons.star, color: Colors.white, size: 20),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Review Rating
                          ],
                        ),
                      ),
                      // Review Text
                      Text(
                        review.reviewText,
                         maxLines: showFullReviewList[index] ? null : 2,
                        overflow: showFullReviewList[index] ? TextOverflow.visible : TextOverflow.ellipsis,
                      ),
                      // Show More Button (conditionally displayed)
                      if (_isReviewTextLong(review.reviewText, context))
                        TextButton(
                          onPressed: () {
                            setState(() {
                              showFullReviewList[index] = !showFullReviewList[index];
                            });
                          },
                          child: Text(showFullReviewList[index] ? 'Show Less' : 'Show More'),
                        ),

                      // Display review photos
                      Row(
                        children: review.reviewPhotos.map((photoPath) {
                          return Container(
                            padding: EdgeInsets.all(8.0),
                            child: Image.asset(photoPath, width: 100, height: 100),
                          );
                        }).toList(),
                      ),
                      // Add more review-specific widgets if needed
                    ],
                  ),
                );
              },
            ),

            SizedBox(height: 7),
            ElevatedButton(
              onPressed: () {
                print('See all reviews button clicked');
              },
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(
                  Size(MediaQuery.of(context).size.width, 50.0),
                ),
              ),
              child: Text('See All Reviews (${restaurantPageUserReviews.length})'),
            ),
          ],
        ),
      ),
    );
  }
  bool _isReviewTextLong(String reviewText, BuildContext context) {
    // Check if the review text exceeds two lines
    TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: reviewText,
        style: TextStyle(fontSize: 16.0, color: Colors.black),
      ),
      maxLines: 2,
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: MediaQuery.of(context).size.width - 24.0); // Subtracting padding

    return textPainter.didExceedMaxLines;
  }
}
