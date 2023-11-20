class User {
  final String username;
  final String uid;
  final String email;
  final String bio;
  final List followers;
  final List following;
  final String photoUrl;

  User({
    required this.username,
    required this.bio,
    required this.email,
    required this.followers,
    required this.following,
    required this.photoUrl,
    required this.uid,
  });

  Map<String, dynamic> toJson() => {
        'username': username,
        'uid': uid,
        'email': email,
        'photoUrl': photoUrl,
        'bio': bio,
        'followers': followers,
        'following': following,
      };
}
