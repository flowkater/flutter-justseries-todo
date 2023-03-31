import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:justtodo/config/drift_database.dart';
import 'package:justtodo/widget/add_todo_text_form_field.dart';
import 'package:justtodo/widget/header_tab_menu.dart';
import 'package:justtodo/widget/todo_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                  StreamBuilder<List<Todo>>(
                    stream: GetIt.I<LocalDatabase>().watchAllTodos(),
                    builder: (context, snapshot) {
                      return HeaderTabMenu(
                        text: '오늘의 투두',
                        activeColor: Colors.black,
                        count: snapshot.data?.length ?? 0,
                      );
                    },
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
                child: StreamBuilder<List<Todo>>(
                  stream: GetIt.I<LocalDatabase>().watchAllTodos(),
                  builder: (context, snapshot) {
                    final todos = snapshot.data ?? [];

                    return ListView.builder(
                      padding: const EdgeInsets.all(0),
                      itemCount: todos.length + 1,
                      itemBuilder: (BuildContext context, int index) {
                        if (index == todos.length) {
                          return AddTodoTextFormField(
                            onChanged: (value) {
                              print(value);
                            },
                            onFieldSubmitted: (value) =>
                                GetIt.I<LocalDatabase>().insertTodo(
                              TodosCompanion(
                                title: Value(value),
                                // isCompleted: false,
                              ),
                            ),
                          );
                        }
                        return TodoItem(todoItem: todos[index]);
                      },
                    );
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
