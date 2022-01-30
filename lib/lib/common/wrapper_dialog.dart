import 'package:h8urs_sleep_timer/lib/constants.dart';
import 'package:h8urs_sleep_timer/lib/state/state_container.dart';
import 'package:flutter/material.dart';

/// Just a simple [Dialog] with common styling
class WrapperDialog extends StatelessWidget {
  /// The child [Widget] to render
  final Widget child;

  /// Constructor for the [Widget]
  WrapperDialog({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final timeState = TimeModelBinding.of(context);
    final borderRadius = 30.0;
    final elevation = timeState.widget.elevation ?? ELEVATION;

    return Dialog(
      insetPadding: timeState.widget.dialogInsetPadding,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      elevation: elevation,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: child,
      ),
    );
  }
}
