import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:kantoor_app/models/message.dart';

class LivechatApi {
  final Dio _dio = Dio();

  final String _baseUrl = 'https://gauri-golang-chat.herokuapp.com/';

  final JsonDecoder decoder = const JsonDecoder();

  Future<List<Messages>> getAllMessages() async {
    try {
      final response = await _dio.get('${_baseUrl}getAllMessages');
      final listMessage = Message.fromJson(json.decode(response.data!));

      return listMessage.messages;
    } catch (e) {
      throw Exception('Connection Timed Out');
    }
  }
}
