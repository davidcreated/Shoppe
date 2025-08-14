import 'package:flutter/material.dart';

// A reusable and customizable primary button widget for your app.
class PrimaryButton extends StatelessWidget {
  // The text to be displayed on the button.
  final String text;

  // The callback function that is executed when the button is pressed.
  final VoidCallback onPressed;

  // The background color of the button. Defaults to a nice blue.
  final Color color;

  // The color of the text. Defaults to white.
  final Color textColor;

  /// Creates a primary button.
  ///
  /// The [text] and [onPressed] arguments must not be null.
  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed, 
    this.color = const Color(0xFF004CFF), // Default color
    this.textColor = Colors.white, // Default text color
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // Make the button expand to the full width of its parent,
      // minus some horizontal padding.
      width: double.infinity,
      height: 58, // Set a fixed height for the button.
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          // The background color of the button.
          backgroundColor: color,
          // The shape of the button. We use a rounded rectangle.
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8), // Highly rounded corners
          ),
          // Disable the shadow/elevation for a flatter look.
          elevation: 0,
        ),
        // The function to call when the button is tapped.
        onPressed: onPressed,
        // The content of the button.
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
