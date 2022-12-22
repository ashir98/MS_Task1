import 'package:flutter/material.dart';
import 'package:ms_task/Screens/login.dart';
import 'package:ms_task/Screens/posts.dart';
import 'package:ms_task/Screens/profile.dart';
import 'package:ms_task/Theme/theme_settings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  TabController? tabController;
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this, initialIndex: 1);
  }

  PageStorageBucket pageStorageBucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: customTheme(),
      home: Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search_rounded),
              ),
            )
          ],
          title: const Text("Lorem ipsum"),
          bottom: TabBar(
            controller: tabController,
            tabs: const [
              Tab(
                text: "ALL POSTS",
              ),
              Tab(
                text: "PROFILE",
              )
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                child: Center(
                  child: Image.asset("images/logo.png"),
                ),
              ),
              const ListTile(
                title: Text("Profile"),
                leading: Icon(Icons.person),
              ),
              const ListTile(
                title: Text("Posts"),
                leading: Icon(Icons.short_text_rounded),
              ),
              const Divider(),
              GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    )),
                child: const ListTile(
                  leading: Icon(Icons.logout_rounded),
                  title: Text("Sign Out"),
                ),
              )
            ],
          ),
        ),
        body: TabBarView(
          controller: tabController,
          children: const [Posts(), Profile()],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
