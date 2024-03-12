import 'package:flutter/material.dart';

class RestaurantPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onBackButtonPressed;
  final VoidCallback onFavoriteButtonPressed;
  final VoidCallback onShareButtonPressed;

  RestaurantPageAppBar({
    required this.onBackButtonPressed,
    required this.onFavoriteButtonPressed,
    required this.onShareButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: onBackButtonPressed,
      ),
      title: const Text(''),
      actions: [
        IconButton(
          icon: const Icon(Icons.favorite_border),
          onPressed: onFavoriteButtonPressed,
        ),
        IconButton(
          icon: const Icon(Icons.settings),
          onPressed: onShareButtonPressed,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
