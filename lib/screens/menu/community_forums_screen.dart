import 'package:flutter/material.dart';
import 'package:paw_world/models/forum_thread_models.dart';
import 'package:paw_world/screens/app_color.dart';
import 'package:paw_world/screens/menu/new_thread_screen.dart';

class CommunityForumsScreen extends StatefulWidget {
  const CommunityForumsScreen({Key? key}) : super(key: key);

  @override
  _CommunityForumsScreenState createState() => _CommunityForumsScreenState();
}

class _CommunityForumsScreenState extends State<CommunityForumsScreen> {
  List<ForumThreadModel> threads = [
    ForumThreadModel(
      title: 'Adopting a cat',
      author: 'John Doe',
      date: '2 days ago',
      replies: 5,
    ),
    ForumThreadModel(
      title: 'How to train a dog',
      author: 'Jane Smith',
      date: '1 week ago',
      replies: 12,
    ),
    ForumThreadModel(
      title: 'Caring for a bird',
      author: 'Bob Johnson',
      date: '3 weeks ago',
      replies: 8,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Community Forums'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: threads.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(threads[index].title),
            subtitle:
                Text('By ${threads[index].author} - ${threads[index].date}'),
            trailing: Text('${threads[index].replies} replies'),
            onTap: () {
              // Navigate to the selected thread.
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const NewThreadScreen()));
        },
        backgroundColor: AppColor.primary,
        child: const Icon(Icons.add),
      ),
    );
  }
}
