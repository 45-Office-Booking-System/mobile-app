class Message {
  List<Messages> messages;

  Message({required this.messages});

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        messages: json['Messages'] != null
            ? List<Messages>.from(json['Messages'].map((item) => Messages.fromJson(item)))
            : [],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Messages'] = messages.map((v) => v.toJson()).toList();
    return data;
  }
}

class Messages {
  String userName;
  String body;
  String timestamp;

  Messages({
    required this.userName,
    required this.body,
    required this.timestamp,
  });

  factory Messages.fromJson(Map<String, dynamic> json) => Messages(
        userName: json['userName'] ?? '',
        body: json['body'] ?? '',
        timestamp: json['timestamp'] ?? '',
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userName'] = userName;
    data['body'] = body;
    data['timestamp'] = timestamp;
    return data;
  }
}
