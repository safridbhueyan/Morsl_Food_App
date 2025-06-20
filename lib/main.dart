import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:morsl_app_celina0057/core/theme/app_theme.dart';
import 'package:morsl_app_celina0057/data/routes/route_config.dart';

import 'data/services/hive_box_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Set the system UI overlay style
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  await HiveServices.init();


  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      builder: (context, child) => MaterialApp.router(
        title: 'Morsl',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        routerConfig: RouteConfig().goRouter,
      ),
    );
  }
}
