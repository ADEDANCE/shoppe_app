import 'package:flutter/material.dart';

class CirclecheckboxWidget extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final double size;
  final Color activeColor;
  final Color inactiveColor;
  const CirclecheckboxWidget({
    super.key,
    required this.value,
    required this.onChanged,
    this.size = 22,
    this.activeColor = Colors.blue,
    this.inactiveColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: value ? activeColor : Colors.transparent,
          border: Border.all(
            color: value ? activeColor : inactiveColor,
            width: 2,
          ),
        ),
        child: value
            ? Icon(Icons.check, size: size * 0.65, color: Colors.white)
            : null,
      ),
    );
  }
}
