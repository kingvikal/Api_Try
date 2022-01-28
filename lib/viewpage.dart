import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:new_api/post_detail.dart';

class Post {
  final int id;
  final String title;
  final String body;
  Post({
    required this.id,
    required this.title,
    required this.body,
  });
}

class ViewPage extends StatefulWidget {
  const ViewPage({Key? key}) : super(key: key);

  @override
  _ViewPageState createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  Future<List<Post>> getPosts() async {
    const url = 'https://jsonplaceholder.typicode.com/posts/';
    List<Post> posts = [];
    var dio = Dio();
    try {
      final response = await dio.get(
        url,
      );

      for (var i in response.data) {
        posts.add(
          Post(
            id: i['id'],
            title: i['title'],
            body: i['body'],
          ),
        );
      }
    } catch (e) {
      rethrow;
    }

    return posts;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("ApiCall"),
        ),
        body: FutureBuilder(
          future: getPosts(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Container(
                  height: 40,
                  width: 40,
                  child: const CircularProgressIndicator(
                    color: Colors.green,
                    strokeWidth: 4.0,
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  snapshot.error.toString(),
                ),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 150,
                  vertical: 50,
                ),
                child: ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Center(
                            child: Text(
                          'Post',
                          style: TextStyle(
                              color: Colors.teal,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        )),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PostDetailPage(
                                    snapshot.data[index].id,
                                    snapshot.data[index].title,
                                    snapshot.data[index].body),
                              ),
                            );
                          },
                          child: Text(
                            snapshot.data[index].id.toString(),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    );
                  },
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
