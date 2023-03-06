import 'package:chat_app/data/models.dart';
import 'package:flutter_random_user/flutter_random_user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'generated/providers.g.dart';

@Riverpod(keepAlive: true)
Future<List<RandomUser>> chats(ChatsRef ref) async {
  return Future(() =>
      userGenerator(max: 99, loremIpsumParagraphs: 1, loremIpsumWords: 20));
}

@riverpod
int chatCount(ChatCountRef ref) {
  final chats = ref.watch(chatsProvider);

  return chats.maybeWhen(
    orElse: () => 0,
    data: (data) => data.length,
  );
}

@riverpod
List<ChatMessageModel> chatMessages(ChatMessagesRef ref, String userName) {
  final messages = ref.watch(messagesProvider);

  return messages.where((element) => element.chatId == userName).toList();
}

@Riverpod(keepAlive: true)
class Messages extends _$Messages {
  final uuid = Uuid();

  @override
  List<ChatMessageModel> build() {
    return [];
  }

  void newMessage({required String message, required String userName}) {
    state = ([
      ...state,
      ChatMessageModel(
        message: message,
        time: DateTime.now(),
        userName: "me",
        chatId: userName,
        id: uuid.v4(),
      )
    ]);

    if (state.length % 3 == 0) {
      state = ([
        ...state,
        ChatMessageModel(
          message: "ok",
          time: DateTime.now(),
          userName: userName,
          chatId: userName,
          id: uuid.v4(),
        )
      ]);
    }
  }
}
