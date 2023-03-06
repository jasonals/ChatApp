// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$chatsHash() => r'bface2ad5fe2ba00912ec7a464535679282bc2a8';

/// See also [chats].
@ProviderFor(chats)
final chatsProvider = FutureProvider<List<RandomUser>>.internal(
  chats,
  name: r'chatsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$chatsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ChatsRef = FutureProviderRef<List<RandomUser>>;
String _$chatCountHash() => r'167f7385b16fc7baa02610f57a2212c3d40687b3';

/// See also [chatCount].
@ProviderFor(chatCount)
final chatCountProvider = AutoDisposeProvider<int>.internal(
  chatCount,
  name: r'chatCountProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$chatCountHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ChatCountRef = AutoDisposeProviderRef<int>;
String _$chatMessagesHash() => r'f2ba9f031656cbb40635630988c04ed1872bc7c6';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

typedef ChatMessagesRef = AutoDisposeProviderRef<List<ChatMessageModel>>;

/// See also [chatMessages].
@ProviderFor(chatMessages)
const chatMessagesProvider = ChatMessagesFamily();

/// See also [chatMessages].
class ChatMessagesFamily extends Family<List<ChatMessageModel>> {
  /// See also [chatMessages].
  const ChatMessagesFamily();

  /// See also [chatMessages].
  ChatMessagesProvider call(
    String userName,
  ) {
    return ChatMessagesProvider(
      userName,
    );
  }

  @override
  ChatMessagesProvider getProviderOverride(
    covariant ChatMessagesProvider provider,
  ) {
    return call(
      provider.userName,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'chatMessagesProvider';
}

/// See also [chatMessages].
class ChatMessagesProvider extends AutoDisposeProvider<List<ChatMessageModel>> {
  /// See also [chatMessages].
  ChatMessagesProvider(
    this.userName,
  ) : super.internal(
          (ref) => chatMessages(
            ref,
            userName,
          ),
          from: chatMessagesProvider,
          name: r'chatMessagesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$chatMessagesHash,
          dependencies: ChatMessagesFamily._dependencies,
          allTransitiveDependencies:
              ChatMessagesFamily._allTransitiveDependencies,
        );

  final String userName;

  @override
  bool operator ==(Object other) {
    return other is ChatMessagesProvider && other.userName == userName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userName.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$messagesHash() => r'9155ea18a92f9d78d0d2a9920fec9d798799a6b3';

/// See also [Messages].
@ProviderFor(Messages)
final messagesProvider =
    NotifierProvider<Messages, List<ChatMessageModel>>.internal(
  Messages.new,
  name: r'messagesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$messagesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Messages = Notifier<List<ChatMessageModel>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
