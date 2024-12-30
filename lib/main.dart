import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/helper_function/onGenerateRoutes.dart';
import 'core/services/custom_bloc_observer.dart';
import 'core/services/git_it_service.dart';
import 'core/services/shared_preferences_singleton.dart';
import 'core/utils/app_colors.dart';
import 'features/splash/presentaion/view/splash_view.dart';
import 'generated/l10n.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  Bloc.observer = CustomBlocObserver();
  setupGetIt();
  Prefs.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // Design size (width, height)
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          locale: const Locale('en'),
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            fontFamily: 'Cairo',
            colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primayColor),
            useMaterial3: true,
          ),
          onGenerateRoute: AppRouter().onGenerateRoutes,
          initialRoute: SplashView.routeName,
        );
      },
    );
  }
}