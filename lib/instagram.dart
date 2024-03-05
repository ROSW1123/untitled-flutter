// InstagramProfilePage
import 'package:flutter/material.dart';

class InstagramSettingPage extends StatelessWidget {
  const InstagramSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(icon: const Icon(Icons.mode_edit), onPressed: () {}),
        ],
      ),

      body: ListView(
        children: [

          // Profile section
          const ProfileSection(
            imageUrl: 'profile_image_url',
            username: 'username',
            postCount: 120,
            followersCount: 850,
            followingCount: 220,
          ),

          // Grid of posts
          GridView.count(
            crossAxisCount: 3,
            children: const [
              PostCard(imageUrl: 'post1'),
            ],
          ),

        ],
      ),
    );
  }
}

class ProfileSection extends StatelessWidget {

  final String imageUrl;
  final String username;
  final int postCount, followersCount, followingCount;

  const ProfileSection({
    super.key,
    required this.imageUrl,
    required this.username,
    required this.postCount,
    required this.followersCount,
    required this.followingCount
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        // Profile photo
        CircleAvatar(radius: 50, backgroundImage: NetworkImage(imageUrl)),

        const SizedBox(height: 10),

        Text(
          username,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),

        // Stats row
        StatsRow(
          label: 'Posts',
          count: '$postCount',
        ),
        StatsRow(
            label: 'Followers',
            count: '$followersCount'
        ),
        StatsRow(
            label: 'Following',
            count: '$followingCount'
        ),

      ],
    );
  }

}

// Post card
class PostCard extends StatelessWidget {

  final String imageUrl;

  const PostCard({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Image.network(imageUrl),
    );
  }

}

// Stats row
class StatsRow extends StatelessWidget {

  final String label;
  final String count;

  const StatsRow({super.key,  required this.label, required this.count});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),
        Text(count),
      ],
    );
  }

}