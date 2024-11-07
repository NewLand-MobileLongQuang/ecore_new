import 'package:flutter/material.dart';
import '../../extensions/context_extension.dart';

class NestedBackButton extends StatelessWidget {
  const NestedBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop){
        if (didPop) {
          return;
        }
        context.pop();

      },
      child: IconButton(
          onPressed: () {
            try {
              context.pop();
            } catch (_) {
              Navigator.of(context).pop();
            }
          },
          icon: Theme.of(context).platform == TargetPlatform.iOS
              ? const Icon(Icons.arrow_back_ios_new)
              : const Icon(Icons.arrow_back)),
    );
  }
}
