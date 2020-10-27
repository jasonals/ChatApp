import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class ChatMessageModel {
  String message;
  DateTime time;
  String id;
  String userId;
  String chatId;

  ChatMessageModel({this.message, this.time, this.userId, this.id});
}

class ChatModel extends ChangeNotifier {
  List<ChatMessageModel> chat = [];
  final uuid = Uuid();

  void newMessage({@required String message, @required String userId}) {
    chat.add(ChatMessageModel(
      message: message,
      time: new DateTime.now(),
      userId: "me",
      id: uuid.v4(),
    ));

    if (chat.length % 3 == 0) {
      chat.add(ChatMessageModel(
        message: "ok",
        time: new DateTime.now(),
        userId: userId,
        id: uuid.v4(),
      ));
    }

    notifyListeners();
  }
}
