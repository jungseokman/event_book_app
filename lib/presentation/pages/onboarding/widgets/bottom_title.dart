import 'package:event_book_app/config/styles.dart';
import 'package:flutter/material.dart';

class BottomTitle extends StatelessWidget {
  const BottomTitle({
    super.key,
    required this.onboardingType,
  });

  final int onboardingType;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      transitionBuilder: (child, animation) {
        final isEntering = child.key == ValueKey(onboardingType);
        final offsetAnimation = animation.drive(
          Tween<Offset>(
            begin: isEntering ? const Offset(1.5, 0) : const Offset(-1.5, 0),
            end: Offset.zero,
          ).chain(
            CurveTween(curve: Curves.easeInOut),
          ),
        );
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
      child: onboardingType == 1
          ? Column(
              key: const ValueKey<int>(1),
              children: [
                Text(
                  'Explore Upcoming and',
                  style: TextStyles.title3,
                ),
                Text(
                  'Nearby Events',
                  style: TextStyles.title3,
                ),
              ],
            )
          : onboardingType == 2
              ? Column(
                  key: const ValueKey<int>(2),
                  children: [
                    Text(
                      'Web Have Modern Events',
                      style: TextStyles.title3,
                    ),
                    Text(
                      'Calendar Feature',
                      style: TextStyles.title3,
                    ),
                  ],
                )
              : Column(
                  key: const ValueKey<int>(3),
                  children: [
                    Text(
                      'To Look Up More Events or',
                      style: TextStyles.title3,
                    ),
                    Text(
                      'Activities Nearby By Map',
                      style: TextStyles.title3,
                    ),
                  ],
                ),
    );
  }
}
