import 'package:chats_app_firebase/wigets/chat/message_bubbles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('chat')
          .orderBy('createdAt', descending: true)
          .snapshots(),
      builder: (ctx, AsyncSnapshot snapShot) {
        if (snapShot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        var docs = snapShot.data?.docs;
        final user = FirebaseAuth.instance.currentUser;

        return ListView.builder(
          reverse: true,
          itemCount: docs!.length,
          itemBuilder: (ctx, index) => MessageBubble(
            key: ValueKey(docs[index].documentID),
            message: docs[index]['text'],
            username: docs[index]['username'],
            userImage: docs[index]['userImage'],
            isMe: docs[index]['userId'] == user!.uid,
          ),
        );
      },
    );
  }
}
