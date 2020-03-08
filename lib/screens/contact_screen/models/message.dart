import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portfolio/services/api.dart';

class Message {
  Message();

  String name;
  String email;
  String website;
  String budget;
  String messageText;

  send(Message msg) {
    Map<String, dynamic> msgMap = {'name':msg.name,'email':msg.email,'website':msg.website,'budget':msg.budget,'messageText':msg.messageText,'time':Timestamp.now()};
    Api('Messages').addDocument(msgMap);
  }
}
