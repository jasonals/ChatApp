import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:whotsapp/data/providers.dart';
import 'package:whotsapp/screens/call_item.dart';
import 'package:whotsapp/screens/chat_item.dart';
import 'package:whotsapp/screens/chat_screen.dart';
import 'package:whotsapp/screens/status_item.dart';

class HomeScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final chatCount = useProvider(chatCountProvider);
    final chats = useProvider(chatsProvider);

    return DefaultTabController(
      // initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('ChatApp'),
          actions: <Widget>[
            Icon(Icons.search),
            SizedBox(width: 8),
            Icon(Icons.more_vert),
            SizedBox(width: 8),
          ],
          bottom: TabBar(
            // isScrollable: true,
            labelPadding: EdgeInsets.symmetric(horizontal: 10.0),
            tabs: [
              // Tab(
              //   icon: Icon(Icons.camera),
              //   iconMargin: EdgeInsets.all(0),
              // ),
              SizedBox(
                child: Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("CHATS"),
                      SizedBox(width: 8),
                      if (chatCount > 0)
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          foregroundColor: Theme.of(context).primaryColor,
                          child: Text(
                            "$chatCount",
                            style: TextStyle(fontSize: 12),
                          ),
                          radius: 14,
                        ),
                    ],
                  ),
                ),
              ),
              Tab(text: 'STATUS'),
              Tab(text: 'CALLS'),
            ],
            indicatorColor: Colors.white,
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            // Center(
            //   child: Text("Camera"),
            // ),
            chats.when(
                data: (data) => ListView(
                      children: data
                          .map(
                            (chat) => InkWell(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ChatScreen(
                                          user: chat,
                                        )),
                              ),
                              child: ChatCard(
                                user: chat,
                              ),
                            ),
                          )
                          .toList(),
                    ),
                loading: () => Center(child: CircularProgressIndicator()),
                error: (a, b) =>
                    Center(child: Text("error: check connection"))),
            chats.when(
                data: (data) => ListView(
                      children: data
                          .map(
                            (chat) => StatusCard(
                              user: chat,
                            ),
                          )
                          .toList(),
                    ),
                loading: () => Center(child: CircularProgressIndicator()),
                error: (a, b) =>
                    Center(child: Text("error: check connection"))),
            // ListView(
            //   children: List<Widget>.generate(
            //     1000,
            //     (index) => StatusCard(user: user),
            //   ).toList(),
            // ),
            ListView(
              children: List<Widget>.generate(
                1000,
                (index) => CallCard(name: "Person${index + 1}"),
              ).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
