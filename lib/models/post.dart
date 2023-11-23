import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String username;
  final String uid;
  final String description;
  final String postId;
  final String postUrl;
  final String profImage;
  final likes;
  final datePublished;

  Post({
    required this.username,
    required this.uid,
    required this.description,
    required this.likes,
    required this.postId,
    required this.postUrl,
    required this.profImage,
    required this.datePublished,
  });

  Map<String, dynamic> toJson() => {
        'username': username,
        'uid': uid,
        'description': description,
        'likes': likes,
        'postId': postId,
        'postUrl': postUrl,
        'profImage': profImage,
        'datePublished': datePublished,
      };

  static Post fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Post(
      username: snapshot['username'],
      uid: snapshot['uid'],
      description: snapshot['description'],
      likes: snapshot['likes'],
      postId: snapshot['postId'],
      postUrl: snapshot['postUrl'],
      profImage: snapshot['profImage'],
      datePublished: snapshot['datePublished'],
    );
  }
}
