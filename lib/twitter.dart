// TwitterHomePage
import 'package:flutter/material.dart';
class TwitterHomePage extends StatelessWidget {
  const TwitterHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Twitter'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {}
          )
        ],
      ),

      body: ListView(
        children: const [
          Row(
            children: [
              AvatarStoryTile(
                imageUrl: 'url',
                icon: Icon(Icons.add),
              ),
            ],
          ),

          // Tweets
          TweetCard(
            profilePhotoUrl: 'url',
            username: 'username',
            displayName: 'Display Name',
            tweetText: 'This is a tweet',
          ),

          // Loading indicator
          Padding(
            padding: EdgeInsets.all(8),
            child: LinearProgressIndicator(),
          ),
        ],
      ),

      floatingActionButton: GestureDetector(),
    );
  }
}

class AvatarStoryTile extends StatelessWidget {
  final String imageUrl;
  final Icon icon;

  const AvatarStoryTile({super.key, required this.imageUrl, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Stack(
        children: [
          CircleAvatar(backgroundImage: NetworkImage(imageUrl)),
          (icon != const Icon(Icons.person_off)) ? Positioned(child: icon) : Container(),
        ],
      ),
    );
  }
}

// Tweet card
class TweetCard extends StatelessWidget {

  final String profilePhotoUrl;
  final String username;
  final String displayName;
  final String tweetText;

  const TweetCard({super.key,
    required this.profilePhotoUrl,
    required this.username,
    required this.displayName,
    required this.tweetText
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [

            // Avatar, name, handle
            Row(
              children: [
                CircleAvatar(backgroundImage: NetworkImage(profilePhotoUrl)),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(username),
                    Text(displayName),
                  ],
                )
              ],
            ),

            // Tweet text
            Text(tweetText),

            // Actions, timestamp
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(icon: const Icon(Icons.favorite_border), onPressed: (){}),
                IconButton(icon: const Icon(Icons.comment), onPressed:(){} ),
                IconButton(icon: const Icon(Icons.share), onPressed:(){} ),
                const Text('11:30')
              ],
            )

          ],
        ),
      ),
    );
  }

}