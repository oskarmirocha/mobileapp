import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobileapp/components/delete.dart';
import 'package:mobileapp/components/like.dart';

class Posts extends StatefulWidget {
  final String message;
  final String user;
  final String postId;
  final List<String> likes;
  const Posts({
    super.key,
    required this.message,
    required this.user,
    required this.postId,
    required this.likes,
  });

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  bool isLiked = false;

  @override
  void initState() {
    super.initState();
    isLiked = widget.likes.contains(currentUser.email);
  }

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
    });
    DocumentReference postRef =
        FirebaseFirestore.instance.collection('Posts').doc(widget.postId);
    if (isLiked) {
      postRef.update({
        'Likes': FieldValue.arrayUnion([currentUser.email])
      });
    } else {
      postRef.update({
        'Likes': FieldValue.arrayRemove([currentUser.email])
      });
    }
  }
  void deletePost(){
    showDialog(context: context, builder: (context) => AlertDialog(
      title:  const Text("Delete  Post"),
      content: const Text("Are you sure you want to delete this post?"),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context),
        child: const Text("Cancel"),
        ),
        TextButton(onPressed: () async{
          final commentDocs = await FirebaseFirestore.instance
          .collection("Posts")
          .doc(widget.postId)
          .collection("Comments")
          .get();

          for (var doc in commentDocs.docs){
            await FirebaseFirestore.instance
            .collection("Posts")
            .doc(widget.postId)
            .collection("Comments")
            .doc(doc.id)
            .delete();
          }
          FirebaseFirestore.instance
            .collection("Posts")
            .doc(widget.postId)
            .delete()
            .then((value) => print("Post deleted!"))
            .catchError((error)=> print("failed to delete post: $error"));
          Navigator.pop(context);
        }, child: const Text("Delete"),
        )
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
    ),
    margin: const EdgeInsets.only(top: 25, left: 25, right: 25),
    padding: const EdgeInsets.all(25),
    child: Stack(
      children: [
        Row(
          children: [
            Row(
              children: [
                Column(
                  children: [
                    LikeButton(
                      isLiked: isLiked,
                      onTap: toggleLike,
                    ),
                    const SizedBox(height: 5),
                    Text(widget.likes.length.toString()),
                  ],
                ),
              ],
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.user,
                  style: TextStyle(color: Colors.grey[500]),
                ),
                const SizedBox(height: 10),
                Text(widget.message),
              ],
            ),
          ],
        ),
        Positioned(
          top: 8,
          right: 0,
          child: widget.user == currentUser.email
              ? DeleteButton(onTap: deletePost)
              : Container(),
        ),
      ],
    ),
  );
}

}
