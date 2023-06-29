import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_full_course/data/model/chat.dart';
import 'package:flutter_full_course/data/model/user.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class AppRepo extends ChangeNotifier {
  String? _token;
  User? user;
  WebSocketChannel? _channel;
  List<Chat> chats = [];

  set token(String? value) {
    _token = value;
    _connectSocket();
  }

  String? get token => _token;

  _connectSocket() {
    final wsUrl = Uri.parse('ws://localhost:8080/ws?token=$_token');
    _channel = WebSocketChannel.connect(wsUrl);
    _channel?.stream.listen((message) {
      print(message);
      chats.add(Chat.fromJson(jsonDecode(message)));
      notifyListeners();
    });
  }
}
