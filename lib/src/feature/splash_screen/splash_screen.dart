import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:morsl_app_celina0057/src/feature/Parents_screen/view/parents_screen.dart';

import '../../../core/theme/theme_extension/color_scheme.dart';
import '../../../provider/splash_provider.dart';
import '../home_screen/home_screen.dart';
import 'widgets/splash_content.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final splashState = ref.watch(splashProvider);

    return splashState.when(
      data: (data) {
        return ParentScreen();
      },
      error: (error, stackTrace) {
        return Scaffold(
          backgroundColor: AppColorScheme.secondaryColor,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("Error loading splash screen")],
            ),
          ),
        );
      },
      loading: () {
        return SplashContent(textTheme: textTheme);
      },
    );
  }
}
