import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {
  final String text;
  final Color color;
  final BorderRadius borderRadius;
  final VoidCallback onPressed;
  final bool isLoading; // New property to indicate loading state

  const ButtonWidget({
    Key? key,
    required this.text,
    required this.color,
    required this.borderRadius,
    required this.onPressed,
    required this.isLoading, // Initialize isLoading property
  }) : super(key: key);

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: widget.color,
      borderRadius: widget.borderRadius,
      child: InkWell(
        onTap: widget.isLoading ? null : widget.onPressed, // Disable onTap if loading
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: widget.isLoading
              ? CircularProgressIndicator( // Show loading indicator if isLoading is true
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          )
              : Text( // Show button text otherwise
            widget.text,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
