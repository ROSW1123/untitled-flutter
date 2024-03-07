import 'package:flutter/material.dart';

class SnapchatDiscoveryPage extends StatelessWidget {
  const SnapchatDiscoveryPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[

          // Stories section
          const SliverToBoxAdapter(
              child: StoriesSection()
          ),

          // Ads
          SliverToBoxAdapter(
              child: Container(
                height: MediaQuery.of(context).size.height*0.2,
                color: Colors.red,
              )
          ),

          // Stories list
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) => StoryTile(
                  storyName: 'Story $index',
                  imageUrl: 'image_url$index'
              ),
            ),
          ),

        ],
      ),
    );

  }

}

// Stories section
class StoriesSection extends StatelessWidget {
  const StoriesSection({super.key});


  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) => StoryCircle(
            imageUrl: 'url$index'
        ),
      ),
    );

  }

}

// Story tile
class StoryTile extends StatelessWidget {

  final String storyName;
  final String imageUrl;

  const StoryTile({super.key,required this.storyName, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(storyName),
      leading: StoryCircle(imageUrl: imageUrl),
    );
  }

}

// Story circle avatar
class StoryCircle extends StatelessWidget {

  final String imageUrl;

  const StoryCircle({super.key,required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: NetworkImage(imageUrl),
      radius: 30,
    );
  }

}