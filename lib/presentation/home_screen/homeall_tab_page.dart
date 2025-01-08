import 'package:flutter/material.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import '../../core/app_export.dart';
import 'controller/home_controller.dart';
import 'models/coursegrid_item_model.dart';
import 'widgets/coursegrid_item_widget.dart';

class HomeallTabPage extends StatelessWidget {
  HomeallTabPage({Key? key}) : super(key: key);

  final HomeController controller = Get.put(HomeController());

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

  Widget _buildCourseGrid() {
    return Expanded(
      child: Obx(
        () => ResponsiveGridList(
          minItemWidth: 150.h, // Minimum lebar item grid
          minItemsPerRow: 2, // Minimal jumlah item per baris
          maxItemsPerRow: 2, // Maksimal jumlah item per baris
          horizontalGridSpacing: 16.h, // Spasi horizontal antar item
          verticalGridSpacing: 16.h, // Spasi vertikal antar item
          listViewBuilderOptions: ListViewBuilderOptions(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
          ),
          children: List.generate(
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
