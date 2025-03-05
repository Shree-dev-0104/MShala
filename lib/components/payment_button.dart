import 'package:flutter/material.dart';

class PaymentMethodButton extends StatelessWidget {
  final String imagePath;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const PaymentMethodButton({
    super.key,
    required this.imagePath,
    required this.label,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 90,  // Reduced width
        padding: const EdgeInsets.symmetric(vertical: 8),  // Reduced vertical padding
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey.shade300,
            width: 1,  // Thin border
          ),
          borderRadius: BorderRadius.circular(6),  // Slightly smaller border radius
          color: isSelected ? Colors.blue.shade50 : Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,  // Compact column
          children: [
            Image.asset(
              imagePath,
              width: 32,  // Smaller image
              height: 32,
            ),
            const SizedBox(height: 4),  // Reduced spacing
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.blue : Colors.black,
                fontSize: 10,  // Smaller font size
                fontWeight: FontWeight.w500,  // Slightly bolder than default
              ),
              overflow: TextOverflow.ellipsis,  // Handle long text
            ),
          ],
        ),
      ),
    );
  }
}