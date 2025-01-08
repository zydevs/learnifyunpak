import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/home_controller.dart';
import 'widgets/coursegrid_item_widget.dart';

class HomeallTabPage extends StatelessWidget {
  final String filter;

  HomeallTabPage({required this.filter, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();

    // Set filter ke controller sebelum widget dibangun
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (controller.currentCategory.value != filter) {
        controller.filterCourses(filter);
      }
    });

    return Obx(
      () {
        final courses = controller.filteredCourses;

        if (courses.isEmpty) {
          return const Center(
            child: Text(
              "No courses available in this category.",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          );
        }

        return GridView.builder(
          padding: const EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 0.75,
          ),
          itemCount: courses.length,
          itemBuilder: (context, index) {
            final course = courses[index];
            return CoursegridItemWidget(course);
          },
        );
      },
    );
  }
}
