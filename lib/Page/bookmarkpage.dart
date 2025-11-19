import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile/Controllers/bookmarkcontroller.dart';

class BookmarkPage extends StatelessWidget {
  BookmarkPage({super.key});

  final BookmarkController bookmarkC = Get.find<BookmarkController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bookmarks")),
      body: Obx(() {
        if (bookmarkC.bookmarks.isEmpty) {
          return const Center(child: Text("Belum ada bookmark"));
        }
        return ListView.builder(
          itemCount: bookmarkC.bookmarks.length,
          itemBuilder: (context, index) {
            final tv = bookmarkC.bookmarks[index];
            return Card(
              margin: const EdgeInsets.all(8),
              child: ListTile(
                leading: Image.network(tv.image.medium, width: 60, fit: BoxFit.cover),
                title: Text(tv.name),
                subtitle: Text("Genres: ${tv.genres.join(', ')}"),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () => bookmarkC.removeBookmark(tv),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
