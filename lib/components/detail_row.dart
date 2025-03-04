import 'package:flutter/material.dart';

// A reusable widget for displaying a label-value pair in a row
class DetailRow extends StatelessWidget {
  final String label;
  final String value;
  final TextStyle? labelStyle;
  final TextStyle? valueStyle;
  final EdgeInsetsGeometry padding;

  const DetailRow({
    super.key,
    required this.label,
    required this.value,
    this.labelStyle,
    this.valueStyle,
    this.padding = const EdgeInsets.only(bottom: 8.0),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: labelStyle ?? 
              const TextStyle(
                fontSize: 14,
                color: Colors.black87,
              ),
          ),
          Text(
            value,
            style: valueStyle ?? 
              const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
          ),
        ],
      ),
    );
  }
}