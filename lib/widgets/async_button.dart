import 'package:car_renr_app/constants/styles.dart';
import 'package:flutter/material.dart';

class AsyncButton extends StatefulWidget {
  final String label;
  final Future<void> Function() onPressed;

  const AsyncButton({super.key, required this.label, required this.onPressed});

  @override
  State<AsyncButton> createState() => _AsyncButtonState();
}

class _AsyncButtonState extends State<AsyncButton> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        style: primaryTextButtonStyle,
        onPressed:  () async {
          setState(() => _isLoading = true);
          try {
            await widget.onPressed();
          } finally {
            setState(() => _isLoading = false);
          }
        },
        child: _isLoading
            ? SizedBox(
          height: 24,
          width: 24,
          child: CircularProgressIndicator(
            color: Theme.of(context).colorScheme.onPrimary,
            strokeWidth: 2,
          ),
        )
            : Text(widget.label),
      ),
    );
  }
}
