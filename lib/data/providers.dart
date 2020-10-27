import 'package:hooks_riverpod/all.dart';
import 'package:random_user/random_user.dart';
import 'package:whotsapp/data/models.dart';

final fakeChatNumber = StateProvider<int>((ref) {
  return 99;
});

final chatsProvider = FutureProvider<List<User>>((ref) async {
  final amt = ref.watch(fakeChatNumber);
  final api = RandomUser();

  return api.getUsers(
    results: amt.state,
    nationalities: "US",
  );
});

final chatCountProvider = Provider<int>((ref) {
  final chats = ref.watch(chatsProvider);

  if (chats?.data?.value != null) return chats.data.value.length;
  return 0;
});

final messagesProvider = ChangeNotifierProvider<ChatModel>((ref) {
  return ChatModel();
});
