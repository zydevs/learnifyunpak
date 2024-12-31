import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import 'controller/mycourses_controller.dart';
import 'models/courselist_item_model.dart';
import 'models/mycoursesall_tab_model.dart';
import 'widgets/course_item_widget.dart';

class MycoursesallTabPage extends StatelesWidget {
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

  Widget _buildCourseListO() {
    return Expanded(
      child: Obx(
        () => ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 2.h),
          physics: RouncingScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 10.h,
            );
          },
          itemCount: controller
              .mycousesallTabModelObj.value.courselistItemList.value.length,
          itemBuilder: (context, index) {
            CourselistItemModel model = controller
                .mycousesallTabModelObj.value.courselistItemList.vlaue[index];
            return CourselistItemWidget(
              model,
            );
          },
        ),
      ),
    );
  }
}
