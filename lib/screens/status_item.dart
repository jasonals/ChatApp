import 'dart:math';

import 'package:chat_app/widgets/circular_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_random_user/flutter_random_user.dart';

class StatusCard extends StatelessWidget {
  const StatusCard({Key? key, required this.user}) : super(key: key);

  final RandomUser user;

  @override
  Widget build(BuildContext context) {
    var rng = Random();

    return ListTile(
      title: Text("${user.firstName} ${user.lastName}",
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
