import 'package:flutter/material.dart';
import 'package:todo_app/app/core/widgets/rounded_check_box_widget.dart';
import 'package:todo_app/app/core/widgets/text_widget.dart';

class TodoTileWidget extends StatelessWidget {
  final String title;

  const TodoTileWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SizedBox(
      height: 40,
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 16.0),
                child: RoundedCheckBoxWidget(),
              ),
              Flexible(child: TextWidget.normal(title)),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 60.0 - 25,
            ),
            child: Divider(
              height: 1,
            ),
          ),
        ],
      ),
    );
  }
}
