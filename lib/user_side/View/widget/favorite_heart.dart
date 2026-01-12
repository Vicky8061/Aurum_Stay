import 'package:flutter/material.dart';

class FavoriteHeart extends StatefulWidget {
  const FavoriteHeart({super.key});

  @override
  State<FavoriteHeart> createState() => _FavoriteHeartState();
}

class _FavoriteHeartState extends State<FavoriteHeart>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scale;
  bool isLiked = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );

    _scale = Tween<double>(
      begin: 1,
      end: 1.3,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void toggleLike() {
    setState(() => isLiked = !isLiked);
    _controller.forward().then((_) => _controller.reverse());
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scale,
      child: GestureDetector(
        onTap: toggleLike,
        child: Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.4),
            shape: BoxShape.circle,
          ),
          child: Icon(
            isLiked ? Icons.favorite : Icons.favorite_border,
            color: isLiked ? const Color(0xFFFFC107) : Colors.white,
            size: 22,
          ),
        ),
      ),
    );
  }
}
