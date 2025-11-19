import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile/Controllers/TvlistController.dart';
import 'package:pas_mobile/Controllers/bookmarkcontroller.dart';
import 'package:pas_mobile/reusable/custombutton.dart';

class TvlistPage extends StatelessWidget {
  TvlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TvlistController>();
    final bookmarkC = Get.find<BookmarkController>();

    controller.fetchTv();

    return Scaffold(
      appBar: AppBar(title: const Text("TV Shows"), centerTitle: true),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return RefreshIndicator(
          onRefresh: () => controller.fetchTv(),
          child: ListView.builder(
            itemCount: controller.tvlist.length,
            itemBuilder: (context, index) {
              final tv = controller.tvlist[index];

              return Card(
                margin: const EdgeInsets.all(8),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 3,
                child: Column(
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(topLeft: Radius.circular(12), bottomLeft: Radius.circular(12)),
                          child: Image.network(tv.image.medium, height: 120, width: 90, fit: BoxFit.cover),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(tv.name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold), maxLines: 2),
                                const SizedBox(height: 4),
                                Text("Genres: ${tv.genres.join(', ')}", style: const TextStyle(fontSize: 14, color: Colors.grey)),
                                const SizedBox(height: 6),
                                Row(
                                  children: [
                                    const Icon(Icons.star, size: 18, color: Colors.amber),
                                    const SizedBox(width: 4),
                                    Text(tv.rating.average?.toString() ?? "No rating", style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: CustomButton(
                        text: "Bookmark",
                        textColor: Colors.white,
                        color: Colors.blue,
                        press: () => bookmarkC.addBookmark(tv),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
