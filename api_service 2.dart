//Task 1 and  2
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'post.dart';

// class ApiService {
//   static const String url =
//       'https://jsonplaceholder.typicode.com/posts';

//   Future<List<Post>> fetchPosts() async {
//     final response = await http.get(Uri.parse(url));

//     if (response.statusCode == 200) {

//       List<dynamic> data = json.decode(response.body);
//       return data.map((json) => Post.fromJson(json)).toList();
//     } else {
//       throw Exception('Failed to load posts');
//     }
//   }
// }

//task 3
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'post.dart';

// class ApiService {
//   static const String url =
//       'https://jsonplaceholder.typicode.com/posts'; // Sample API URL

//   // Fetch posts from the API
//   Future<List<Post>> fetchPosts() async {
//     final response = await http.get(Uri.parse(url));

//     if (response.statusCode == 200) {
//       // Parse the JSON response
//       List<dynamic> data = json.decode(response.body);
//       return data.map((json) => Post.fromJson(json)).toList();
//     } else {
//       throw Exception('Failed to load posts');
//     }
//   }
// }

//task 4 and 5
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'post.dart';

class ApiService {
  static const String url =
      'https://jsonplaceholder.typicode.com/posts'; // Example API

  // Fetch the data from the API
  Future<List<Post>> fetchPosts() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // If the response is successful, parse the JSON data
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Post.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
