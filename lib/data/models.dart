class ChatMessageModel {
  String message;
  DateTime time;
  String id;
  String userName;
  String chatId;

  ChatMessageModel({
    required this.message,
    required this.time,
    required this.userName,
    required this.id,
    required this.chatId,
  });
}
