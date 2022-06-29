import 'package:flutter/material.dart';

const reactionColor = Color(0xFF64686E);

class LikeButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;
  const LikeButton({
    Key? key,
    required this.icon,
    required this.color,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: color, size: 18),
              const SizedBox(width: 4),
              Text(
                "Like",
                style: TextStyle(color: color),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OtherReactionButton extends StatelessWidget {
  final IconData icon;
  final String text;
  const OtherReactionButton({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: reactionColor, size: 18),
              const SizedBox(width: 4),
              Text(
                text,
                style: const TextStyle(color: reactionColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
