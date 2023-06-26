import 'package:flutter/material.dart';

class AppIconsTheme extends StatelessWidget {
  final String imageUrl;
  const AppIconsTheme({
    super.key,
    required this.imageUrl,
  });

  factory AppIconsTheme.alarmGrey() {
    return const AppIconsTheme(
      imageUrl: 'assets/icons/alarm_grey.png',
    );
  }

  factory AppIconsTheme.alarm() {
    return const AppIconsTheme(
      imageUrl: 'assets/icons/alarm.png',
    );
  }

  factory AppIconsTheme.calendarGrey() {
    return const AppIconsTheme(
      imageUrl: 'assets/icons/calendar_grey.png',
    );
  }

  factory AppIconsTheme.calendar() {
    return const AppIconsTheme(
      imageUrl: 'assets/icons/calendar.png',
    );
  }

  factory AppIconsTheme.editor() {
    return const AppIconsTheme(
      imageUrl: 'assets/icons/editor.png',
    );
  }

  factory AppIconsTheme.list() {
    return const AppIconsTheme(
      imageUrl: 'assets/icons/list.png',
    );
  }

  factory AppIconsTheme.marked() {
    return const AppIconsTheme(
      imageUrl: 'assets/icons/marked.png',
    );
  }

  factory AppIconsTheme.more() {
    return const AppIconsTheme(
      imageUrl: 'assets/icons/more.png',
    );
  }

  factory AppIconsTheme.plus() {
    return const AppIconsTheme(
      imageUrl: 'assets/icons/plus.png',
    );
  }

  factory AppIconsTheme.task() {
    return const AppIconsTheme(
      imageUrl: 'assets/icons/task.png',
    );
  }

  factory AppIconsTheme.trash() {
    return const AppIconsTheme(
      imageUrl: 'assets/icons/trash.png',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(imageUrl);
  }
}
