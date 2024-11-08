//task 1
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'API Fetch with Search Filter',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: PostListScreen(),
//     );
//   }
// }

// class PostListScreen extends StatefulWidget {
//   @override
//   _PostListScreenState createState() => _PostListScreenState();
// }

// class _PostListScreenState extends State<PostListScreen> {
//   List<dynamic> posts = [];
//   List<dynamic> filteredPosts = [];
//   TextEditingController _searchController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     _fetchPosts();
//     _searchController.addListener(_filterPosts);
//   }

//   // Fetch posts from the API
//   Future<void> _fetchPosts() async {
//     final response =
//         await http.get(Uri.parse('https://jsonplaceholder.org/posts'));

//     if (response.statusCode == 200) {
//       setState(() {
//         posts = json.decode(response.body);
//         filteredPosts = posts; // Initialize filteredPosts with all posts
//       });
//     } else {
//       throw Exception('Failed to load posts');
//     }
//   }

//   // Filter posts based on the search input
//   void _filterPosts() {
//     setState(() {
//       filteredPosts = posts.where((post) {
//         return post['title']
//             .toLowerCase()
//             .contains(_searchController.text.toLowerCase());
//       }).toList();
//     });
//   }

//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Posts'),
//       ),
//       body: Column(
//         children: <Widget>[
//           Padding(
//             padding: EdgeInsets.all(8.0),
//             child: TextField(
//               controller: _searchController,
//               decoration: InputDecoration(
//                 labelText: 'Search by Title',
//                 border: OutlineInputBorder(),
//                 prefixIcon: Icon(Icons.search),
//               ),
//             ),
//           ),
//           Expanded(
//             child: filteredPosts.isEmpty
//                 ? Center(child: CircularProgressIndicator())
//                 : ListView.builder(
//                     itemCount: filteredPosts.length,
//                     itemBuilder: (context, index) {
//                       final post = filteredPosts[index];
//                       return Card(
//                         margin: EdgeInsets.all(8.0),
//                         child: ListTile(
//                           title: Text(post['title']),
//                           subtitle: Text(post['body']),
//                         ),
//                       );
//                     },
//                   ),
//           ),
//         ],
//       ),
//     );
//   }
// }

//task 2
// import 'package:flutter/material.dart';
// import 'post.dart';
// import 'api_service.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Posts List',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: PostListPage(),
//     );
//   }
// }

// class PostListPage extends StatefulWidget {
//   @override
//   _PostListPageState createState() => _PostListPageState();
// }

// class _PostListPageState extends State<PostListPage> {
//   late Future<List<Post>> _posts;
//   List<Post> _filteredPosts = [];
//   final TextEditingController _searchController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     _posts = ApiService().fetchPosts();
//     _searchController.addListener(_filterPosts);
//   }

//   void _filterPosts() {
//     final query = _searchController.text.toLowerCase();
//     setState(() {
//       _filteredPosts = _filteredPosts
//           .where((post) => post.title.toLowerCase().contains(query))
//           .toList();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Posts List')),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             // Search bar
//             TextField(
//               controller: _searchController,
//               decoration: InputDecoration(
//                 labelText: 'Search',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 10),
//             // Display list of posts
//             Expanded(
//               child: FutureBuilder<List<Post>>(
//                 future: _posts,
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return Center(child: CircularProgressIndicator());
//                   } else if (snapshot.hasError) {
//                     return Center(child: Text('Error: ${snapshot.error}'));
//                   } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                     return Center(child: Text('No posts available.'));
//                   } else {
//                     // Filtered posts for search
//                     _filteredPosts = snapshot.data!;
//                     return ListView.builder(
//                       itemCount: _filteredPosts.length,
//                       itemBuilder: (context, index) {
//                         final post = _filteredPosts[index];
//                         return ListTile(
//                           title: Text(post.title),
//                           subtitle: Text(post.body),
//                         );
//                       },
//                     );
//                   }
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//task 3
// import 'package:flutter/material.dart';
// import 'post.dart';
// import 'api_service.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Posts List',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: PostListPage(),
//     );
//   }
// }

// class PostListPage extends StatefulWidget {
//   @override
//   _PostListPageState createState() => _PostListPageState();
// }

// class _PostListPageState extends State<PostListPage> {
//   late Future<List<Post>> _posts;
//   List<Post> _filteredPosts = [];
//   final TextEditingController _searchController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     _posts = ApiService().fetchPosts();
//     _searchController.addListener(_filterPosts);
//   }

//   // Function to filter the posts based on search query
//   void _filterPosts() {
//     final query = _searchController.text.toLowerCase();
//     setState(() {
//       _filteredPosts = _filteredPosts
//           .where((post) => post.title.toLowerCase().contains(query))
//           .toList();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Posts List')),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             // Search bar
//             TextField(
//               controller: _searchController,
//               decoration: InputDecoration(
//                 labelText: 'Search',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 10),
//             // Display list of posts
//             Expanded(
//               child: FutureBuilder<List<Post>>(
//                 future: _posts,
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return Center(child: CircularProgressIndicator());
//                   } else if (snapshot.hasError) {
//                     return Center(child: Text('Error: ${snapshot.error}'));
//                   } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                     return Center(child: Text('No posts available.'));
//                   } else {
//                     // Store posts data to _filteredPosts
//                     _filteredPosts = snapshot.data!;
//                     return ListView.builder(
//                       itemCount: _filteredPosts.length,
//                       itemBuilder: (context, index) {
//                         final post = _filteredPosts[index];
//                         return ListTile(
//                           title: Text(post.title),
//                           subtitle: Text(post.body),
//                           leading:
//                               CircleAvatar(child: Text(post.id.toString())),
//                         );
//                       },
//                     );
//                   }
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//task 4
// import 'package:flutter/material.dart';
// import 'post.dart';
// import 'api_service.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Posts List',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: PostListPage(),
//     );
//   }
// }

// class PostListPage extends StatefulWidget {
//   @override
//   _PostListPageState createState() => _PostListPageState();
// }

// class _PostListPageState extends State<PostListPage> {
//   late Future<List<Post>> _posts;
//   List<Post> _filteredPosts = [];
//   final TextEditingController _searchController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     _posts = ApiService().fetchPosts();
//     _searchController.addListener(_filterPosts);
//   }

//   // Function to filter the posts based on the search query
//   void _filterPosts() {
//     final query = _searchController.text.toLowerCase();
//     setState(() {
//       _filteredPosts = _filteredPosts
//           .where((post) => post.title.toLowerCase().contains(query))
//           .toList();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Posts List')),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             // Search bar
//             TextField(
//               controller: _searchController,
//               decoration: InputDecoration(
//                 labelText: 'Search by title',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 10),
//             // Display list of posts
//             Expanded(
//               child: FutureBuilder<List<Post>>(
//                 future: _posts,
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return Center(child: CircularProgressIndicator());
//                   } else if (snapshot.hasError) {
//                     return Center(child: Text('Error: ${snapshot.error}'));
//                   } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                     return Center(child: Text('No posts available.'));
//                   } else {
//                     // Store the fetched posts and initialize the filtered list
//                     _filteredPosts = snapshot.data!;
//                     return ListView.builder(
//                       itemCount: _filteredPosts.length,
//                       itemBuilder: (context, index) {
//                         final post = _filteredPosts[index];
//                         return ListTile(
//                           title: Text(post.title),
//                           subtitle: Text(post.body),
//                           leading:
//                               CircleAvatar(child: Text(post.id.toString())),
//                         );
//                       },
//                     );
//                   }
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//task 5
import 'package:flutter/material.dart';
import 'post.dart';
import 'api_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Posts List',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: PostListPage(),
    );
  }
}

class PostListPage extends StatefulWidget {
  @override
  _PostListPageState createState() => _PostListPageState();
}

class _PostListPageState extends State<PostListPage> {
  late Future<List<Post>> _posts;
  List<Post> _filteredPosts = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _posts = ApiService().fetchPosts();
    _searchController.addListener(_filterPosts);
  }

  // Function to filter the posts based on the search query
  void _filterPosts() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredPosts = _filteredPosts
          .where((post) => post.title.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Posts List')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Search bar
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search by title',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            // Display list of posts
            Expanded(
              child: FutureBuilder<List<Post>>(
                future: _posts,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No posts available.'));
                  } else {
                    // Store the fetched posts and initialize the filtered list
                    _filteredPosts = snapshot.data!;
                    // Return ListView with filtered posts
                    return ListView.builder(
                      itemCount: _filteredPosts.length,
                      itemBuilder: (context, index) {
                        final post = _filteredPosts[index];
                        return ListTile(
                          title: Text(post.title),
                          subtitle: Text(post.body),
                          leading:
                              CircleAvatar(child: Text(post.id.toString())),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
