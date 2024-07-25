class Chat {
  String id;
  String toId;
  String fromId;
  DateTime createdAt;
  DateTime updatedAt;
  String lastMessage;
  int unreadMessagesCount;

  Chat({
    required this.id,
    required this.toId,
    required this.fromId,
    required this.createdAt,
    required this.updatedAt,
    required this.lastMessage,
    required this.unreadMessagesCount,
  });

  factory Chat.fromJson(Map<String, dynamic> json) {
    return Chat(
      id: json['id'],
      toId: json['toId'],
      fromId: json['fromId'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      lastMessage: json['lastMessage'],
      unreadMessagesCount: json['unreadMessagesCount'],
    );
  }
}
