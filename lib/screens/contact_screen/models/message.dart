import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portfolio/services/api.dart';

class Message {

  final String? name;
  final String? email;
  final String? subject;
  final String? budget;
  final String? messageText;

  Message({this.name, this.email, this.subject, this.budget, this.messageText});

  send() {
    String currentTime = Timestamp.now().millisecondsSinceEpoch.toString();
    Map<String, dynamic> msgMap = {
      'name': name,
      'email': email,
      'subject': subject,
      'budget': budget,
      'messageText': messageText,
      'time': Timestamp.now()
    };
    Api('Messages').updateDocument(msgMap, currentTime);
  }
}
