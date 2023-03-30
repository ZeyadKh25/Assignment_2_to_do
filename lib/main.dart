import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:todo_iug/views/screens/all_tasks_screen.dart';
import 'package:todo_iug/views/screens/complete_tasks.dart';
import 'package:todo_iug/views/screens/incomplete_tasks.dart';
import 'package:todo_iug/views/screens/main_tasks_screen.dart';

void main() {
  runApp(MaterialApp(home: ResponsiveTest()));
}

class ResponsiveTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: screenWidth > 500 ? LandScapeDesign() : MainTasksScreen());
  }
}

class LandScapeDesign extends StatefulWidget {
  @override
  State<LandScapeDesign> createState() => _LandScapeDesignState();
}

class _LandScapeDesignState extends State<LandScapeDesign> {
  PageController pageController = PageController();
  updateScreen() {
    log('set state from main screen has been excuted');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("zz"),
      ),
      body: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                const UserAccountsDrawerHeader(
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: NetworkImage(""),
                    ),
                    accountName: Text("Zizo khalaf"),
                    accountEmail: Text("zizokhalf25@gmail.com")),
                ListTile(
                  onTap: () {
                    pageController.jumpToPage(0);
                    setState(() {});
                  },
                  leading: const Icon(Icons.list),
                  title: const Text("All Tasks"),
                  subtitle: const Text("go to All Tasks"),
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),
                ListTile(
                  onTap: () {
                    pageController.jumpToPage(1);
                    setState(() {});
                  },
                  leading: const Icon(Icons.done),
                  title: const Text("Complete Tasks"),
                  subtitle: const Text("go to Complete Tasks"),
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),
                ListTile(
                  onTap: () {
                    pageController.jumpToPage(2);
                    setState(() {});
                  },
                  leading: const Icon(Icons.cancel),
                  title: const Text("InComplete Tasks"),
                  subtitle: const Text("go to InComplete Tasks"),
                  trailing: const Icon(Icons.arrow_forward_ios),
                )
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            height: MediaQuery.of(context).size.height,
            child: PageView(
              controller: pageController,
              children: [
                AllTasksScreen(updateScreen),
                CompleteTasksScreen(updateScreen),
                InCompleteTasksScreen(updateScreen)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
