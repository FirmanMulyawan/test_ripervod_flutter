import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'component/config/app_const.dart';
import 'component/config/app_route.dart';
// import 'component/config/app_theme.dart';
import 'component/di/injector.dart';

// import 'package:provider/provider.dart';

class AppNav {
  static final _navigatorKey = GlobalKey<NavigatorState>();
  static GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  static BuildContext? get maybeContext => navigatorKey.currentContext;
  static BuildContext get context => maybeContext!;

  static bool get hasNavigator => navigatorKey.currentState != null;
  static NavigatorState get navigator => _navigatorKey.currentState!;
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initPreAppServices();

  // runApp(
  //   MultiProvider(
  //     providers: [
  //       Provider<AppTheme>(create: (_) => AppTheme()),
  //     ],
  //     child: const MyApp(),
  //   ),
  // );

  // riverpod
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

Future<void> _initPreAppServices() async {
  await dotenv.load(fileName: '.env');

  await dependencyInjection();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context)
          .copyWith(textScaler: const TextScaler.linear(1.0)),
      child: MaterialApp.router(
        title: AppConst.appName,
        debugShowCheckedModeBanner: false,
        // theme: context.read<AppTheme>().themeData(),
        routerConfig: AppRoute.router,
      ),
    );
  }
}
