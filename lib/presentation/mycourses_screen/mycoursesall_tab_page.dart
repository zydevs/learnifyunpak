import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import 'controller/mycourses_controller.dart';
import 'models/courselist_item_model.dart';
import 'models/mycoursesall_tab_model.dart';
import 'widgets/course_item_widget.dart';

// ignore_for_file: must_be_immutable
class MycoursesallTabPage extends StatelessWidget {
  MycoursesallTabPage({Key? key}) : super(key: key);

  final MycoursesController controller = Get.find<MycoursesController>();

 @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.h),
      child: Column(
        children: [SizedBox(height: 14.h), _buildCourseList()],
      ),
    );
  }

  Widget _buildCourseList() {
    return Expanded(
      child: Obx(
        () {
          final courseList = controller
              .mycoursesallTabModelObj.value.courselistItemList.value;

          // Handle empty course list
          if (courseList.isEmpty) {
            return Center(
              child: Text(
                "No courses available",
                style: CustomTextStyles.bodySmall12,
              ),
            );
          }

          return ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 2.h),
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return SizedBox(height: 10.h);
            },
            itemCount: courseList.length,
            itemBuilder: (context, index) {
              CourselistItemModel model = courseList[index];
              return CourselistItemWidget(model);
            },
          );
        },
      ),
    );
  }
}
