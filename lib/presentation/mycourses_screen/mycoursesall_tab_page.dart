import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import 'controller/mycourses_controller.dart';
import 'models/courselist_item_model.dart';
import 'models/mycoursesall_tab_model.dart';
import 'widgets/course_item_widget.dart';

// ignore_for_file: must_be_immutable
class MycoursesallTabPage extends StatelessWidget {
  MycoursesallTabPage({Key? key})
      : super(
          key: key,
        );

  MycoursesController controller = Get.put(MycoursesController());

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
        () => ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 2.h),
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 10.h,
            );
          },
          itemCount: controller
              .mycoursesallTabModelObj.value.courselistItemList.value.length,
          itemBuilder: (context, index) {
            CourselistItemModel model = controller
                .mycoursesallTabModelObj.value.courselistItemList.value[index];
            return CourselistItemWidget(
              model,
            );
          },
        ),
      ),
    );
  }
}
