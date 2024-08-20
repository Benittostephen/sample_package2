library sample;

import 'package:flutter/material.dart';

class CustomInkWellButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final Color color;

  const CustomInkWellButton({
    Key? key,
    required this.label,
    required this.onTap,
    this.color = Colors.blue, // Default color if none is provided
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('data'),
        SizedBox(
          width: 170,
          child: Material(
            child: Ink(
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: InkWell(
                onTap: onTap,
                borderRadius: BorderRadius.circular(10.0),
                splashColor: Colors.white.withOpacity(0.3),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                  child: Center(
                    child: Text(
                      label,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
