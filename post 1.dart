//task 1 and 2
// class Post {
//   final int id;
//   final String title;
//   final String body;

//   Post({
//     required this.id,
//     required this.title,
//     required this.body,
//   });

//   // Factory method to create a Post from a JSON object
//   factory Post.fromJson(Map<String, dynamic> json) {
//     return Post(
//       id: json['id'],
//       title: json['title'],
//       body: json['body'],
//     );
//   }
// }

//task 3
// class Post {
//   final int id;
//   final String title;
//   final String body;

//   Post({
//     required this.id,
//     required this.title,
//     required this.body,
//   });

//   // Factory method to create a Post from a JSON object
//   factory Post.fromJson(Map<String, dynamic> json) {
//     return Post(
//       id: json['id'],
//       title: json['title'],
//       body: json['body'],
//     );
//   }
// }

//task 4 and 5
class Post {
  final int id;
  final String title;
  final String body;

  Post({
    required this.id,
    required this.title,
    required this.body,
  });

  // Factory method to create a Post from JSON data
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'] ?? 'No title', // Provide default if null
      body: json['body'] ?? 'No description', // Provide default if null
    );
  }
}
