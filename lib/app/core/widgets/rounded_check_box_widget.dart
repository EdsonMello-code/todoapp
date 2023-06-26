import 'package:flutter/material.dart';
import 'package:todo_app/app/core/extensions/theme_extensions.dart';
import 'package:todo_app/app/core/themes/app_icons_theme.dart';
import 'package:todo_app/app/core/types/types.dart';
import 'package:todo_app/app/core/utils/unit.dart';

class RoundedCheckBoxWidget extends StatefulWidget {
  final bool isChecked;
  final OnChanged<bool>? onChanged;

  const RoundedCheckBoxWidget({
    super.key,
    this.isChecked = false,
    this.onChanged,
  });

  @override
  State<RoundedCheckBoxWidget> createState() => _RoundedCheckBoxWidgetState();
}

class _RoundedCheckBoxWidgetState extends State<RoundedCheckBoxWidget> {
  bool _isChecked = false;

  @override
  void initState() {
    super.initState();

    _isChecked = widget.isChecked;
    widget.onChanged?.call(_isChecked);
  }

  Unit _toggleChecked() {
    setState(() {
      _isChecked = !_isChecked;
    });
    widget.onChanged?.call(_isChecked);
    return unit;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleChecked,
      child: Visibility(
        visible: _isChecked,
        replacement: Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.transparent,
            border: Border.fromBorderSide(
              BorderSide(
                width: 2,
                color: _isChecked
                    ? Colors.transparent
                    : context.appColorsTheme.grey,
              ),
            ),
          ),
        ),
        child: SizedBox(
          width: 28,
          height: 28,
          child: AppIconsTheme.marked(),
        ),
      ),
    );
  }
}
