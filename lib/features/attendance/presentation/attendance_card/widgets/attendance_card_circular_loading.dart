import 'package:flutter/material.dart';

class AttendanceCardCircularLoading extends StatelessWidget {
  const AttendanceCardCircularLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
