import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile/Controllers/TvlistController.dart';


class TvlistPage extends StatelessWidget {
   TvlistPage({super.key});

  final controller = Get.put(TvlistController(),permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('tvlist'),),
      body: Obx(() {
        if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
      }
      return RefreshIndicator(
            onRefresh: () async {
              await controller.fetchTv();
            },
          child:  ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(), // wajib untuk refresh
            itemCount: controller.tvlist.length,
            itemBuilder: (context, index) {
              final team = controller.tvlist[index];
              return Card(
                child: ListTile(
                  title: Text(team.name),
                  
                ),
              );
            },
          ),
    );
    }),
    );
  
  }
}