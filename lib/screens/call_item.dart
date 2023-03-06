import 'package:flutter/material.dart';

class CallCard extends StatelessWidget {
  const CallCard({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const <Widget>[
          Text(
            "August 28, 1:34 PM",
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
      leading: CircleAvatar(
        radius: 25,
      ),
      trailing: Icon(
        Icons.phone,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
