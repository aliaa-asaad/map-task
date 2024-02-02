import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map_task/features/home/data/view_model/cubit/home_cubit.dart';
import 'package:flutter_map_task/features/home/presentation/screens/home_screen.dart';
import 'package:flutter_map_task/routing/navigator.dart';
import 'package:flutter_map_task/utilities/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  /* await SharedHandler.init();
  Network.init(); */
  runApp(
    ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeCubit>(
          create: (BuildContext context) => HomeCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Title',
        theme: ThemeHelper().lightTheme,
        onGenerateRoute: AppRoutes.onGenerateRoute,
        //initialRoute: Routes.onboarding,
        navigatorKey: AppRoutes.navigatorState,
        navigatorObservers: [AppRoutes.routeObserver],
        scaffoldMessengerKey: AppRoutes.scaffoldState,
        /*  localizationsDelegates: const [
          AppLocale.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale("ar")],
        locale: const Locale("ar"), */
        home: const HomeScreen(),
      ),
    );
  }
}
