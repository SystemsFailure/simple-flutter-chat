import 'package:flutter/material.dart';
import 'package:simple_view_list/entity/models/Chats.dart';
import 'package:simple_view_list/http/api_service.dart';

// Модель для представления чатов
class Chat {
  final String id;
  final String lastMessage;
  final int unreadMessagesCount;

  Chat({
    required this.id,
    required this.lastMessage,
    required this.unreadMessagesCount,
  });
}

class ListChats extends StatefulWidget {
  const ListChats({super.key});

  @override
  _ListChatsState createState() => _ListChatsState();
}

class _ListChatsState extends State<ListChats> {
  List<Chat> chats = [];
  ApiService apiService = ApiService();

  @override
  void initState() {
    super.initState();
    // fetchChats();
    loadDummyChats(); // Загружаем заглушки данных
  }

  // Загрузка заглушек данных чатов
  void loadDummyChats() {
    List<Chat> dummyChats = [
      Chat(id: '1', lastMessage: 'Hello!', unreadMessagesCount: 3),
      Chat(id: '2', lastMessage: 'How are you?', unreadMessagesCount: 1),
      Chat(id: '3', lastMessage: 'Flutter is awesome!', unreadMessagesCount: 0),
      Chat(id: '4', lastMessage: 'See you later!', unreadMessagesCount: 2),
    ];

    setState(() {
      chats = dummyChats;
    });
  }

  // Future<void> fetchChats() async {
  //   try {
  //     List<Chat> fetchedChats = await apiService.fetchChats();
  //     setState(() {
  //       chats = fetchedChats;
  //     });
  //   } catch (error) {
  //     print('Error fetching chats: $error');
  //     // Handle error gracefully (show error message, retry logic, etc.)
  //   }
  // }

  void addChat(Chat newChat) {
    setState(() {
      chats.add(newChat);
    });
  }

  void removeChat(int index) {
    setState(() {
      chats.removeAt(index);
    });
  }

  void clearChats() {
    setState(() {
      chats.clear();
    });
  }

  void addChatsAtBeginning(List<Chat> newChats) {
    setState(() {
      chats.insertAll(0, newChats);
    });
  }

  void addChatsAtEnd(List<Chat> newChats) {
    setState(() {
      chats.addAll(newChats);
    });
  }

  // Chat? findChatById(String id) {
  //   return chats.firstWhere((chat) => chat.id == id, orElse: () => null);
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chats'),
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(chats[index].lastMessage),
            subtitle: Text('Unread: ${chats[index].unreadMessagesCount.toString()}'),
            onTap: () {
              String chatId = chats[index].id; // Получение id чата
              Navigator.pushNamed(
                context,
                '/chat/:id',
                arguments: {'id': chatId},
              );
            },
          );
        },
      ),
    );
  }
}