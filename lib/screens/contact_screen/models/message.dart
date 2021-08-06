import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portfolio/services/api.dart';

class Message {
  Message();

  String name;
  String email;
  String subject;
  String budget;
  String messageText;

  send(Message msg) {
    String currentTime = Timestamp.now().millisecondsSinceEpoch.toString();
    Map<String, dynamic> msgMap = {
      'name': msg.name,
      'email': msg.email,
      'subject': msg.subject,
      'budget': msg.budget,
      'messageText': msg.messageText,
      'time': Timestamp.now()
    };
    Api('Messages').updateDocument(msgMap, currentTime);
  }
}
