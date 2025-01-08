import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../controller/home_controller.dart';
import '../models/coursegrid_item_model.dart';

class CoursegridItemWidget extends StatelessWidget {
  final CoursegridItemModel coursegridItemModelobj;

  CoursegridItemWidget(this.coursegridItemModelobj, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 4.h),
      decoration: AppDecoration.outlineOnprimary1.copyWith(
        borderRadius: BorderRadiusStyle.rounderBorder5,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: coursegridItemModelobj.covercourse,
            height: 135.h,
            width: double.maxFinite,
            radius: BorderRadius.circular(5.h),
          ),
          SizedBox(height: 4.h),
          Obx(
            () => Text(
              coursegridItemModelobj.namecourse.value,
              style: theme.textTheme.labelMedium,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(height: 4.h),
          Obx(
            () => Text(
              coursegridItemModelobj.lecturer.value,
              style: CustomTextStyles.plusJakartaSansGray600Medium,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(height: 6.h),
          Row(
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgClassIcon,
                height: 14.h,
                width: 14.h,
              ),
              SizedBox(width: 8.h),
              Obx(
                () => Text(
                  coursegridItemModelobj.catcourse.value,
                  style: CustomTextStyles.plusJakartaSansGray600Medium,
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: _CustomIcon(coursegridItemModelobj: coursegridItemModelobj),
          ),
        ],
      ),
    );
  }
}

class _CustomIcon extends StatefulWidget {
  final CoursegridItemModel coursegridItemModelobj;

  _CustomIcon({required this.coursegridItemModelobj, Key? key}) : super(key: key);

  @override
  State<_CustomIcon> createState() => _CustomIconState();
}

class _CustomIconState extends State<_CustomIcon> {
  bool isClicked = false;

  @override
  void initState() {
    super.initState();
    _checkIfCourseSelected(widget.coursegridItemModelobj);
  }

  Future<void> _checkIfCourseSelected(CoursegridItemModel course) async {
    final uid = FirebaseAuth.instance.currentUser?.uid;

    if (uid == null) {
      print('User not logged in');
      return;
    }

    final snapshot = await FirebaseFirestore.instance
        .collection('selectedCourses')
        .where('fullName', isEqualTo: uid)
        .where('namecourse', isEqualTo: course.namecourse.value)
        .get();

    if (snapshot.docs.isNotEmpty) {
      setState(() {
        isClicked = true; // Status tombol menjadi "X"
      });
    }
  }

  Future<void> _addCourseToFirestore(CoursegridItemModel course) async {
    final uid = FirebaseAuth.instance.currentUser?.uid;

    if (uid == null) {
      print('User not logged in');
      return;
    }

    try {
      await FirebaseFirestore.instance.collection('selectedCourses').add({
        'fullName': uid,
        'namecourse': course.namecourse.value,
        'lecturer': course.lecturer.value,
        'catcourse': course.catcourse.value,
        'covercourse': course.covercourse,
        'timestamp': FieldValue.serverTimestamp(),
      });
      print('Course added successfully');
    } catch (e) {
      print('Failed to add course: $e');
    }
  }

  Future<void> _removeCourseFromFirestore(CoursegridItemModel course) async {
    final uid = FirebaseAuth.instance.currentUser?.uid;

    if (uid == null) {
      print('User not logged in');
      return;
    }

    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('selectedCourses')
          .where('fullName', isEqualTo: uid)
          .where('namecourse', isEqualTo: course.namecourse.value)
          .get();

      for (var doc in snapshot.docs) {
        await doc.reference.delete();
      }
      print('Course removed successfully');
    } catch (e) {
      print('Failed to remove course: $e');
    }
  }

  Future<void> _showConfirmationDialog(BuildContext context, CoursegridItemModel course) async {
    final shouldDelete = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Konfirmasi'),
        content: Text('Apakah Anda yakin ingin membatalkan pengambilan course ini?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('Batal'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text('Ya'),
          ),
        ],
      ),
    );

    if (shouldDelete == true) {
      await _removeCourseFromFirestore(course);
    } else {
      setState(() {
        isClicked = true; // Kembalikan status ke clicked jika pengguna membatalkan penghapusan
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (isClicked) {
          setState(() {
            isClicked = false;
          });
          await _showConfirmationDialog(context, widget.coursegridItemModelobj);
        } else {
          setState(() {
            isClicked = true;
          });
          await _addCourseToFirestore(widget.coursegridItemModelobj);
        }
      },
      child: Container(
        width: 35.0,
        height: 35.0,
        decoration: BoxDecoration(
          color: isClicked ? Colors.grey : Colors.purple,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(
            isClicked ? Icons.close : Icons.add,
            color: Colors.white,
            size: 25.0,
          ),
        ),
      ),
    );
  }
}
