import 'package:flutter/material.dart';

class TodoItem extends StatefulWidget {
  const TodoItem({
    super.key,
    required this.todoItem,
  });

  final String todoItem;

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                height: 24.0,
                width: 28.0,
                child: Transform.scale(
                  scale: 0.9,
                  child: Checkbox(
                    activeColor: Colors.black,
                    value: _isChecked,
                    onChanged: (value) {
                      setState(() {
                        _isChecked = value!;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(width: 8.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 16.0,
                  ),
                  Text(
                    '투두 타이틀 ${widget.todoItem}',
                    style: _isChecked
                        ? const TextStyle(
                            fontSize: 15.0,
                            decoration: TextDecoration.lineThrough,
                            color: Color.fromRGBO(0, 0, 0, 0.4),
                          )
                        : const TextStyle(
                            fontSize: 15.0,
                          ),
                  ),
                  const SizedBox(
                    height: 3.0,
                  ),
                  const Text(
                    '투두 설명을 추가할 수 있습니다.',
                    style: TextStyle(
                      fontSize: 10.0,
                      color: Color.fromRGBO(0, 0, 0, 0.4),
                    ),
                  ),
                ],
              ),
            ],
          ),
          if (_isChecked)
            const Text(
              "08:32",
              style: TextStyle(
                fontSize: 10.0,
                color: Color.fromRGBO(0, 0, 0, 0.4),
              ),
            ),
        ],
      ),
    );
  }
}
