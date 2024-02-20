import 'package:anime_ku/components/bottom_bar.dart';
import 'package:anime_ku/components/text.dart';
import 'package:anime_ku/screen/home_screen.dart';
import 'package:anime_ku/utils/navigation_item.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AnimeKu',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  List<NavigationItem> navItems = const [
    NavigationItem('Home', Icons.home_outlined),
    NavigationItem('Search', Icons.search),
    NavigationItem('Library', Icons.video_library_outlined),
    NavigationItem('Profile', Icons.person_outline),
  ];

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = const HomeScreen();
        break;
      case 1:
        page = const Placeholder();
        break;
      case 2:
        page = const Placeholder();
        break;
      case 3:
        page = const Placeholder();
        break;
      default:
        throw UnimplementedError('No Widget for $selectedIndex');
    }

    void onItemTapped(int index) {
      setState(() {
        selectedIndex = index;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const TextWidget(
          text: 'AnimeKu',
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
        actions: const [
          Icon(
            Icons.search,
            color: Colors.black87,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(
              Icons.more_vert,
              color: Colors.black87,
            ),
          ),
        ],
      ),
      body: page,
      bottomNavigationBar: BottomBar(
          navItems: navItems,
          selectedIndex: selectedIndex,
          onItemTapped: onItemTapped),
    );
  }
}
