import 'package:flutter/material.dart';

class PostDetailPage extends StatelessWidget {
  // const PostDetailPage({Key? key}) : super(key: key);

  final int id;
  final String title;
  final String body;
  PostDetailPage(this.id, this.title, this.body);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ApiCall'),
        ),
        body: Container(
          color: Colors.red,
          child: Card(
            color: Colors.yellow,
            elevation: 2,
            margin: const EdgeInsets.only(
              top: 30,
              bottom: 30,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 50,
                vertical: 60,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    id.toString(),
                    style: const TextStyle(
                        color: Colors.teal,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                        color: Colors.teal,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    body,
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
