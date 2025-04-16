import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../../../core/uitels/App_Color.dart';
import '../../../../../core/uitels/App_TextStyle.dart';
import '../../../../../core/widget/CustomCheckBox.dart';

class IsOrganicCheckBox extends StatefulWidget {
  const IsOrganicCheckBox({super.key, required this.changed});
  final ValueChanged<bool> changed;
  @override
  State<IsOrganicCheckBox> createState() => _IsOrganicCheckBoxState();
}

class _IsOrganicCheckBoxState extends State<IsOrganicCheckBox> {
  bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(
          isCheck: isCheck,
          onChecked: (value) {
            isCheck = value;
            widget.changed(value);
            setState(() {});
          },
        ),
        SizedBox(
          width: 16,
        ),
        Expanded(
          child: Text(
            "Is product Organic?",
            style: AppStyle.bold16.copyWith(
              color: const Color(0xFF949D9E),
            ),
          ),
        ),
      ],
    );
  }
}
