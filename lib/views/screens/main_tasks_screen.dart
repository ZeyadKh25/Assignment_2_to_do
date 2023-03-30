import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:todo_iug/views/screens/all_tasks_screen.dart';
import 'package:todo_iug/views/screens/complete_tasks.dart';
import 'package:todo_iug/views/screens/incomplete_tasks.dart';

class MainTasksScreen extends StatefulWidget {
  @override
  State<MainTasksScreen> createState() => _MainTasksScreenState();
}

class _MainTasksScreenState extends State<MainTasksScreen> {
  PageController pageController = PageController();

  updateScreen() {
    log('set state from main screen has been excuted');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo App"),
      ),
      drawer: Drawer(
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
              Navigator.of(context).pop();
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
              Navigator.of(context).pop();
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
              Navigator.of(context).pop();
            },
            leading: const Icon(Icons.cancel),
            title: const Text("InComplete Tasks"),
            subtitle: const Text("go to InComplete Tasks"),
            trailing: const Icon(Icons.arrow_forward_ios),
          )
        ],
      )),
      body: PageView(
        controller: pageController,
        children: [
          AllTasksScreen(updateScreen),
          CompleteTasksScreen(updateScreen),
          InCompleteTasksScreen(updateScreen)
        ],
      ),
    );
  }
}
