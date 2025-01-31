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
        theme: ThemeData(
          primaryColor: Color(0xFFE9435A),
          scaffoldBackgroundColor: Colors.white,
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
          textTheme: TextTheme(
            // 모든 Text 위젯에 적용될 기본 스타일
            bodyMedium: TextStyle(
              // 자간 줄이기
              height: 1.1, // 행간
            ),
          ).apply(
            bodyColor: Colors.black, // 기본 텍스트 색상
            displayColor: Colors.black,
          ),
        ),
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
