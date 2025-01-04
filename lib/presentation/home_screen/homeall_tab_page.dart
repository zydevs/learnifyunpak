import 'package:flutter/material.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import '../../core/app_export.dart';
import 'controller/home_controller.dart';
import 'models/coursegrid_item_model.dart';
import 'models/homeall_tab_model.dart';
import 'widgets/coursegrid_item_widget.dart';

//
class HomeallTabPage extends StatelessWidget {
  HomeallTabPage({Key? key})
      : super(
          key: key,
        );

  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 30.h,
        vertical: 8.h,
      ),
      child: Column(
        children: [SizedBox(height: 6.h), _buildCourseGrid()],
      ),
    );
  }

  //
  Widget _buildCourseGrid() {
    return Expanded(
      child: Obx(
        () => ResponsiveGridListBuilder(
          minItemWidth: 1,
          minItemsPerRow: 2,
          maxItemsPerRow: 2,
          horizontalGridSpacing: 30.h,
          verticalGridSpacing: 30.h,
          builder: (context, items) => ListView(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: BouncingScrollPhysics(),
            children: items,
          ),
          gridItems: List.generate(
            controller.homeallTabModelObj.value.coursegridItemList.value.length,
            (index) {
              CoursegridItemModel model = controller
                  .homeallTabModelObj.value.coursegridItemList.value[index];
              return CoursegridItemWidget(
                model,
              );
            },
          ),
        ),
      ),
    );
  }
}
