import 'dart:math';

import 'package:flutter/material.dart';
import 'package:random_user/random_user.dart';
import 'package:whotsapp/widgets/CircularStatus.dart';

class StatusCard extends StatelessWidget {
  const StatusCard({Key key, @required this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    var rng = Random();

    return ListTile(
      title: Text("${user.name.first} ${user.name.last}",
          style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(
        "10 minutes ago",
        overflow: TextOverflow.ellipsis,
      ),
      leading: CustomPaint(
        foregroundPainter:
            CircularStatus(color: Colors.green, count: rng.nextInt(30)),
        child: CircleAvatar(radius: 30),
      ),
    );
  }
}
