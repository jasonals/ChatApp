import 'package:chat_app/data/providers.dart';
import 'package:chat_app/screens/call_item.dart';
import 'package:chat_app/screens/chat_item.dart';
import 'package:chat_app/screens/chat_screen.dart';
import 'package:chat_app/screens/status_item.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatCount = ref.watch(chatCountProvider);
    final chats = ref.watch(chatsProvider);

    return DefaultTabController(
      // initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('ChatApp'),
          actions: const <Widget>[
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
                          radius: 14,
                          child: Text(
                            "$chatCount",
                            style: TextStyle(fontSize: 12),
                          ),
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
