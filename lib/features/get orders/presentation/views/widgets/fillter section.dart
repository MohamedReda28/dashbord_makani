import 'package:flutter/material.dart';

class Fillter_Section extends StatelessWidget {
  const Fillter_Section({super.key});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){},
      child: const Row(
        children: [
          Icon(Icons.filter_list),
          SizedBox(
            width: 16,
          ),
          Text(
            'تصنيف',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
