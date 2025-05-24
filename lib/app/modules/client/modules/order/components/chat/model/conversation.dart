import 'package:new_marketplace_web/app/models/current_user.dart';

class Conversation {
  static const identificador = "<div><br></div>";

  String? id;
  String? body;

  CurrentUser? sender;
  String? sendAt;
  String? readAt;
  String? sendHr;
  bool isMe;

  Conversation(
      {this.id,
      this.body,
      this.sender,
      this.sendAt,
      this.readAt,
      this.isMe =  false,
      this.sendHr});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'body': body,
      'sender': sender?.toMap(),
      'send_at': sendAt,
      'read_at': readAt,
      'send_hr': sendHr,
      'isMe': isMe,
    };
  }

  factory Conversation.fromMap(dynamic map) {

    return Conversation(
      id: map['id']?.toString() ?? "",
      body: map['body']?.toString() ?? "",
      sender: CurrentUser.fromMap(map['sender']),
      sendAt: map['send_at']?.toString() ?? "",
      sendHr: map['send_hr']?.toString() ?? "",
      readAt: map['read_at']?.toString() ?? "",
      isMe: false,
    );
  }
}
