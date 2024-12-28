import 'dart:ffi';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';

class CustomAppBar extends StatelessWidget implements PreferrendSizedWidget {
  CustomAppBar(
      {Key? key,
      this.height,
      this.shape,
      this.leadingWidth,
      this.leading,
      this.title,
      this.centerTitle,
      this.actions})
      : super(
          key: key,
        );

  final double? height;

  final ShapeBorder? shape;

  final double? leadingWidth;

  final Widget? leading;

  final Widget? title;

  final bool? centerTitle;

  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      shape: shape,
      toolbarHeight: height ?? 62.h,
      automaticallyImplyLeading: false,
      backgroundColor: colors.transparent,
      leadingWidth: leadingWidth ?? 0,
      leading: leading,
      title: title,
      titleSpacing: 0,
      centerTitle: centerTitle ?? false,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size(
        SizeUtils.width,
        height ?? 62.h,
      );
}