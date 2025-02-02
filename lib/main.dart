import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tictok_clone/constants/sizes.dart';
import 'package:tictok_clone/features/main_navigation/main_navigation_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(const TikTokApp());
}

class TikTokApp extends StatelessWidget {
  const TikTokApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'TikTok Clone',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        theme: ThemeData(
            brightness: Brightness.light,
            primaryColor: Color(0xFFE9435A),
            scaffoldBackgroundColor: Colors.white,
            bottomAppBarTheme: BottomAppBarTheme(
              color: Colors.grey.shade50,
            ),
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              elevation: 0,
              titleTextStyle: TextStyle(
                color: Colors.black,
                fontSize: Sizes.size16 + Sizes.size2,
                fontWeight: FontWeight.w600,
              ),
            ),
            tabBarTheme: TabBarTheme(
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey.shade500,
              indicatorColor: Colors.black,
            ),
            listTileTheme: const ListTileThemeData(
              iconColor: Colors.black,
            ),
            textTheme: Typography.blackMountainView
                .copyWith(
                  bodyMedium: const TextStyle(
                    height: 1.1,
                    color: Colors.black,
                  ),
                )
                .apply(
                  bodyColor: Colors.black,
                  displayColor: Colors.black,
                )),
        darkTheme: ThemeData(
            brightness: Brightness.dark,
            primaryColor: Color(0xFFE9435A),
            scaffoldBackgroundColor: Colors.black,
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.grey.shade900,
              titleTextStyle: TextStyle(
                color: Colors.white,
                fontSize: Sizes.size16 + Sizes.size2,
                fontWeight: FontWeight.w600,
              ),
            ),
            bottomAppBarTheme: BottomAppBarTheme(
              color: Colors.grey.shade900,
            ),
            tabBarTheme: TabBarTheme(
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey.shade700,
              indicatorColor: Colors.white,
            ),
            textTheme: Typography.whiteMountainView
                .copyWith(
                  bodyMedium: const TextStyle(
                    height: 1.1,
                    color: Colors.white,
                  ),
                )
                .apply(
                  bodyColor: Colors.white,
                  displayColor: Colors.white,
                )),
        builder: (context, child) {
          return ClipRect(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1024),
                child: Navigator(
                  onGenerateRoute: (settings) {
                    if (settings.name == '/') {
                      return MaterialPageRoute(
                        builder: (context) => child!,
                      );
                    }
                    return null;
                  },
                ),
              ),
            ),
          );
        },
        home: MainNavigationScreen());
  }
}
