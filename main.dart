import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

void main(List<String> args) {
  runApp(Roptob());
}

class Roptob extends StatelessWidget {
  const Roptob({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Chalo(),
    );
  }
}

class Chalo extends StatefulWidget {
  const Chalo({Key? key}) : super(key: key);

  @override
  State<Chalo> createState() => _ChaloState();
}

class _ChaloState extends State<Chalo> {
  List<Post> _posts = [];
  List<Album> _albums = [];
  List<Comment> _comments = [];

  @override
  void initState() {
    super.initState();
    _fetchPosts();
    _fetchAlbums();
    _fetchComments();
  }

  Future<void> _fetchPosts() async {
    List<Post> posts = await fetchPosts();
    setState(() {
      _posts = posts;
    });
  }

  Future<void> _fetchAlbums() async {
    List<Album> albums = await fetchAlbums();
    setState(() {
      _albums = albums;
    });
  }

  Future<void> _fetchComments() async {
    List<Comment> comments = await fetchComments();
    setState(() {
      _comments = comments;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Luis'),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              child: UserAccountsDrawerHeader(
                accountName: Text('Luis v'),
                accountEmail: Text('kuisvanegas@gmail.com'),
              ),
            ),
            ListTile(
              title: Text('inicio'),
              leading: Icon(Icons.home),
              trailing: Icon(Icons.arrow_right_alt_sharp),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('servicios'),
              leading: Icon(Icons.room_service),
              trailing: Icon(Icons.arrow_right_alt_sharp),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ServiciosPage(posts: _posts),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('productos'),
              leading: Icon(Icons.production_quantity_limits_sharp),
              trailing: Icon(Icons.arrow_right_alt_sharp),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ProductosPage(albums: _albums),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('hola'),
              leading: Icon(Icons.production_quantity_limits_sharp),
              trailing: Icon(Icons.arrow_right_alt_sharp),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => HolaPage(comments: _comments),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('desarrollador'),
              leading: Icon(Icons.developer_board),
              trailing: Icon(Icons.arrow_right_alt_sharp),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Rato(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          CircleAvatar(
            radius: 120,
            backgroundColor: Colors.amber,
            backgroundImage: NetworkImage(
                'https://lh3.googleusercontent.com/a/ACg8ocJ66ZA-lrnCXAChlkfvV7A0G842xWBalpa6eLdEahBUYTinXJAn=s288-c-no'),
          ),
          Text(''),
          Text(''),
          Text(''),
        ],
      ),
    );
  }
}

class ServiciosPage extends StatelessWidget {
  final List<Post> posts;

  const ServiciosPage({Key? key, required this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Servicios')),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(posts[index].title),
            subtitle: Text(posts[index].body),
            onTap: () {
              // Agregar acción al hacer clic en la publicación
            },
          );
        },
      ),
    );
  }
}

class ProductosPage extends StatelessWidget {
  final List<Album> albums;

  const ProductosPage({Key? key, required this.albums}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Productos')),
      body: ListView.builder(
        itemCount: albums.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(albums[index].title),
            onTap: () {
              // Agregar acción al hacer clic en el álbum
            },
          );
        },
      ),
    );
  }
}

class HolaPage extends StatelessWidget {
  final List<Comment> comments;

  const HolaPage({Key? key, required this.comments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hola')),
      body: ListView.builder(
        itemCount: comments.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(comments[index].name),
            subtitle: Text(comments[index].body),
            onTap: () {
              // Agregar acción al hacer clic en el comentario
            },
          );
        },
      ),
    );
  }
}

class Rato extends StatefulWidget {
  const Rato({Key? key}) : super(key: key);

  @override
  State<Rato> createState() => _RatoState();
}

class _RatoState extends State<Rato> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Desarrollador')),
      body: Column(
        children: [
          ListTile(
            title: Text('Luis Vanegas'),
            subtitle: Text('Luis Vanegas'),
            leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://lh3.googleusercontent.com/a/ACg8ocJ66ZA-lrnCXAChlkfvV7A0G842xWBalpa6eLdEahBUYTinXJAn=s288-c-no')),
            trailing: Icon(Icons.arrow_right_alt_sharp),
          ),
          ListTile(
            title: Text('contacto'),
            subtitle: Text('310 508 7013'),
            leading: Icon(Icons.phone),
            trailing: Icon(Icons.arrow_right_alt_sharp),
          ),
          ListTile(
            title: Text('coreo'),
            subtitle: Text('kuisvanegas@gmail.com'),
            leading: Icon(Icons.email_sharp),
            trailing: Icon(Icons.arrow_right_alt_sharp),
          ),
          ListTile(
            title: Text('Hora de Atencion'),
            subtitle: Text('8:00 am - 12:00 pm, 2:00 pm - 6:00 pm'),
            leading: Icon(Icons.call_end_sharp),
            trailing: Icon(Icons.arrow_right_alt_sharp),
          ),
        ],
      ),
    );
  }
}

Future<List<Post>> fetchPosts() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

  if (response.statusCode == 200) {
    List<dynamic> data = json.decode(response.body);
    List<Post> posts = data.map((json) => Post.fromJson(json)).toList();
    return posts;
  } else {
    throw Exception('Failed to load posts');
  }
}

Future<List<Album>> fetchAlbums() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));

  if (response.statusCode == 200) {
    List<dynamic> data = json.decode(response.body);
    List<Album> albums = data.map((json) => Album.fromJson(json)).toList();
    return albums;
  } else {
    throw Exception('Failed to load albums');
  }
}

Future<List<Comment>> fetchComments() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));

  if (response.statusCode == 200) {
    List<dynamic> data = json.decode(response.body);
    List<Comment> comments =
        data.map((json) => Comment.fromJson(json)).toList();
    return comments;
  } else {
    throw Exception('Failed to load comments');
  }
}

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}

class Album {
  final int userId;
  final int id;
  final String title;

  Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}

class Comment {
  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;

  Comment({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      postId: json['postId'],
      id: json['id'],
      name: json['name'],
      email: json['email'],
      body: json['body'],
    );
  }
}
