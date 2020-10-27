import 'dart:async';

import 'package:bubble/bubble.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:intl/intl.dart';
import 'package:random_user/random_user.dart';
import 'package:whotsapp/data/providers.dart';

class ChatScreen extends HookWidget {
  const ChatScreen({Key key, this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    final messages = useProvider(messagesProvider);
    final textController = useTextEditingController();
    final focusNode = useFocusNode();
    final scrollController = useScrollController();

    useEffect(() {
      Timer(Duration(milliseconds: 50), () {
        scrollController.jumpTo(scrollController.position.maxScrollExtent);
      });

      return null;
    }, [messages.chat.length, MediaQuery.of(context).viewInsets.bottom]);

    BubbleStyle styleSomebody = BubbleStyle(
      nip: BubbleNip.leftTop,
      color: Colors.white,
      margin: BubbleEdges.only(top: 8.0, right: 50.0),
      alignment: Alignment.topLeft,
    );

    BubbleStyle styleMe = BubbleStyle(
      nip: BubbleNip.rightTop,
      color: Color.fromARGB(255, 225, 255, 199),
      margin: BubbleEdges.only(top: 8.0, left: 50.0),
      alignment: Alignment.topRight,
    );

    final dateFormat = new DateFormat("h:mm a");

    // scrollController.position.maxScrollExtent

    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      appBar: AppBar(
        leadingWidth: 25,
        title: Row(
          children: [
            CircleAvatar(
              maxRadius: 18,
              backgroundImage: CachedNetworkImageProvider(
                user.picture.thumbnail,
              ),
            ),
            SizedBox(width: 8),
            Text("${user.name.first} ${user.name.last}"),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView(
              controller: scrollController,
              padding: EdgeInsets.all(8.0),
              children: messages.chat
                  .map(
                    (chat) => Bubble(
                      style: chat.userId == "me" ? styleMe : styleSomebody,
                      child: Wrap(
                        alignment: WrapAlignment.end,
                        crossAxisAlignment: WrapCrossAlignment.end,
                        children: [
                          Text(chat.message),
                          SizedBox(width: 8),
                          Text(
                            dateFormat.format(chat.time),
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      margin: BubbleEdges.only(top: 10),
                    ),
                  )
                  .toList(),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            // color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                    decoration: InputDecoration(
                      focusedBorder: InputBorder.none,
                      border: InputBorder.none,
                    ),
                    focusNode: focusNode,
                    onSubmitted: (txt) {
                      messages.newMessage(
                        message: txt,
                        userId: user.id.value,
                      );

                      textController.clear();
                      focusNode.requestFocus();
                    },
                    controller: textController,
                  )),
                  IconButton(
                    onPressed: () {
                      messages.newMessage(
                        message: textController.text,
                        userId: user.id.value,
                      );

                      textController.clear();
                    },
                    icon: Icon(
                      Icons.send,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
