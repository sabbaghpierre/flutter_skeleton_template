import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_skeleton_template/routes/app_router.dart';
import 'package:flutter_skeleton_template/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp(
        theme: ThemeData(
            pageTransitionsTheme: const PageTransitionsTheme(builders: {
              TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
              TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            }),
            colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black)),
        title: 'Flutter Skeleton Template',
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: Routes.exampleScreen,
      ),
    );
  }
}
