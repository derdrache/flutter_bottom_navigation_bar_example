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
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
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
  int selectedIndex = 0;
  List colors = [Colors.purple, Colors.pink, Colors.orange, Colors.lightBlue];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    animationTest({icon, label, index, color}) {
      return AnimatedContainer(
        duration: const Duration(seconds: 1),
        width: selectedIndex == index ? 100 : 40,
        curve: Curves.fastOutSlowIn,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: selectedIndex == index ? color.withOpacity(0.5) : null,
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: selectedIndex == index ? color : Colors.black,),
            if (selectedIndex == index) const SizedBox(width: 5),
            if (selectedIndex == index)
              Flexible(
                  child: SizedBox(
                      height: 20,
                      child: Text(label,
                          overflow: TextOverflow.fade,
                          style: TextStyle(color: selectedIndex == index ? color : Colors.white))))
          ],
        ),
      );
    }

    return Scaffold(
      body: Container(
        color: colors[selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon:
                animationTest(icon: Icons.home_outlined, label: "Home", index: 0, color: colors[0]),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: animationTest(
                icon: Icons.favorite_outline, label: "Likes", index: 1, color: colors[1]),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: animationTest(
                icon: Icons.search_outlined, label: "Search", index: 2, color: colors[2]),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: animationTest(
                icon: Icons.person_outline, label: "Profil", index: 3, color: colors[3],),
            label: '',
          ),
        ],
        currentIndex: selectedIndex,
        //selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
