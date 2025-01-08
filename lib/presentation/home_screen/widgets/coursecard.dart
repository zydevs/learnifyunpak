import 'package:flutter/material.dart';

class CourseCard extends StatelessWidget {
  final String cover;
  final String name;
  final String lecturer;
  final String category;

  const CourseCard({
    Key? key,
    required this.cover,
    required this.name,
    required this.lecturer,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(cover),
        title: Text(name),
        subtitle: Text('$lecturer • $category'),
      ),
    );
  }
}
