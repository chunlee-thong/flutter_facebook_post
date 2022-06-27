import 'package:flutter/material.dart';

const reactionColor = Color(0xFF64686E);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Facebook',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FacebookFeed(),
    );
  }
}

class FacebookFeed extends StatefulWidget {
  const FacebookFeed({Key? key}) : super(key: key);

  @override
  State<FacebookFeed> createState() => _FacebookFeedState();
}

class _FacebookFeedState extends State<FacebookFeed> {
  @override
  Widget build(BuildContext context) {
    final postDivider = Container(
      width: double.infinity,
      height: 8,
      color: Colors.grey.withOpacity(0.4),
    );
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: const Text(
          "facebook",
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, color: Colors.black87),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu, color: Colors.black87),
          ),
        ],
      ),
      body: Column(
        children: [
          postDivider,
          const FacebookPost(),
          postDivider,
        ],
      ),
    );
  }
}

class FacebookPost extends StatefulWidget {
  const FacebookPost({Key? key}) : super(key: key);

  @override
  State<FacebookPost> createState() => _FacebookPostState();
}

class _FacebookPostState extends State<FacebookPost> {
  int _likeCount = 24;
  bool _isLiked = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeader(),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "The best car for the best prices. Get your 10% discount now.\nFor only 599,999\$",
          ),
        ),
        const SizedBox(height: 8),
        Image.network(
          "https://greatdubai.com/sell-car-rentals/wp-content/uploads/sites/4/2022/05/SONATA-hero-option1-764A5360-edit-640x354-1.jpg",
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        _buildReactionStat(),
        Container(
          height: 1,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 8),
          color: Colors.grey.withOpacity(0.2),
        ),
        _buildReactionAction(),
      ],
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 8, 4),
      child: Row(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.black87,
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(6),
            margin: const EdgeInsets.only(right: 8),
            child: const Icon(
              Icons.person,
              color: Colors.white,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Greenco Car Dealership",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  const Text("Sponsored", style: TextStyle(fontSize: 12, color: Colors.grey)),
                  Container(
                    width: 4,
                    height: 4,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: const BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
                  ),
                  const Icon(
                    Icons.south_america_sharp,
                    size: 12,
                    color: Colors.grey,
                  ),
                ],
              )
            ],
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_horiz),
          ),
        ],
      ),
    );
  }

  Widget _buildReactionStat() {
    const textstyle = TextStyle(fontSize: 14, color: Colors.grey);
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.thumb_up,
              size: 10,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 4),
          Text("$_likeCount", style: textstyle),
          const Spacer(),
          const Text("105 comments", style: textstyle),
          const SizedBox(width: 8),
          const Text("25 shares", style: textstyle),
        ],
      ),
    );
  }

  Widget _buildReactionAction() {
    return Row(
      children: [
        LikeButton(
          icon: _isLiked ? Icons.thumb_up : Icons.thumb_up_outlined,
          color: _isLiked ? Colors.blue : reactionColor,
          onPressed: () {
            setState(() {
              _isLiked = !_isLiked;
              _likeCount = _likeCount + (_isLiked ? 1 : -1);
            });
          },
        ),
        const OtherReactionButton(
          icon: Icons.messenger_outline_sharp,
          text: "Comment",
        ),
        const OtherReactionButton(
          icon: Icons.share,
          text: "Share",
        ),
      ],
    );
  }
}

class LikeButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;
  const LikeButton({Key? key, required this.icon, required this.color, required this.onPressed}) : super(key: key);

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
