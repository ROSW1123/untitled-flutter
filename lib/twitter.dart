// TwitterHomePage
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
      title: const Text('Twitter'),
      backgroundColor: Colors.blue,
    ),

    body: ListView(
      children: [
        const Row(
          children: [
          ],
        ),

        // Tweets
        TweetCard(),
        TweetCard(),

        // Loading indicator
        const Padding(
          padding: EdgeInsets.all(8),
          child: LinearProgressIndicator(),
        ),
      ],
    ),

    floatingActionButton: GestureDetector(),
  );
}

// Tweet card
class TweetCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            // Avatar, name, handle
            Row(children: []),

            // Tweet text
            Text('Sample tweet'),

            // Actions, timestamp
            Row(children: [])
          ],
        ),
      ),
    );
  }
}