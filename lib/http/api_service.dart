import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:simple_view_list/entity/models/Chats.dart';

class ApiService {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'http://localhost:3000'));

  Future<List<Chat>> fetchChats() async {
    try {
      Response response = await _dio.get('/chats');
      List<dynamic> data = response.data;
      List<Chat> chats = data.map((json) => Chat.fromJson(json)).toList();
      return chats;
    } catch (error) {
      throw Exception('Failed to fetch chats: $error');
    }
  }

}