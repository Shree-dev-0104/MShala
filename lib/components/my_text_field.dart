import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final String hintText;
  final bool obscureText;

  const MyTextField(
      {super.key, required this.hintText, this.obscureText = false});

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: SizedBox(
        height: 40, // Fixed height for all text fields
        child: TextField(
          obscureText: _obscureText,
          style: const TextStyle(fontSize: 14),
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: const TextStyle(fontSize: 14),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
            isDense: true,
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 0.8),
                borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 0.8),
                borderRadius: BorderRadius.circular(10)),
            // Add suffix icon only for password fields
            suffixIcon: widget.obscureText
                ? Container(
                    width: 40, 
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      child: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                        size: 18,
                        color: Colors.grey,
                      ),
                    ),
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
