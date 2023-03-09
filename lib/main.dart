import 'package:flutter/material.dart';
import 'package:justtodo/widget/header_tab_menu.dart';
import 'package:justtodo/widget/todo_item.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  final todoList = [
    'todo1',
    'todo2',
    'todo3',
    'todo4',
    'todo5',
    'todo6',
    'todo7',
    'todo8',
    'todo9',
    'todo10',
    'todo11',
    'todo12',
    'todo13',
    'todo14',
    'todo15',
    'todo16',
    'todo17',
    'todo18',
    'todo19',
    'todo20',
    'todo21',
  ];

  App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 80.0),
              const Text(
                '4월 10일 월요일',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 24.0),
              Row(
                children: [
                  HeaderTabMenu(
                    text: '오늘의 투두',
                    activeColor: Colors.black,
                    count: todoList.length,
                  ),
                  const SizedBox(width: 16.0),
                  const Text(
                    "|",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Color.fromRGBO(0, 0, 0, 0.2),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  const HeaderTabMenu(
                    text: '미래 투두',
                    activeColor: Color.fromRGBO(0, 0, 0, 0.2),
                    count: 28,
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(0),
                  itemCount: todoList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return TodoItem(todoItem: todoList[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
