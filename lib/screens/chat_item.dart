import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_random_user/flutter_random_user.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({Key? key, required this.user}) : super(key: key);

  final RandomUser user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("${user.firstName} ${user.lastName}",
              style: TextStyle(fontWeight: FontWeight.bold)),
          Text("5:50 PM", style: TextStyle(fontWeight: FontWeight.normal)),
        ],
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const <Widget>[
          Expanded(
            child: Text(
              "Chat message goes here and it might be too long to be shown all at once but I dont know what happens if it is so long.",
              overflow: TextOverflow.ellipsis,
            ),
          ),
          // Icon(Icons.)
        ],
      ),
      leading: CircleAvatar(
        backgroundImage: CachedNetworkImageProvider(
          user.thumbNail,
        ),
        radius: 25,
      ),
    );
  }
}
