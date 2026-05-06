import 'package:flutter/material.dart';
import 'package:todo_list_05flu/add/add_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

//Выделить память
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  //Инициализироваться - появиться в памяти
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Home Page - initState");
  }

  //Рисует, строит отображение
  @override
  Widget build(BuildContext context) {
    print("Home Page - build");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToAddPage,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

//Уничтожить с памяти, освободить с памяти
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("Home Page - dispose");
  }

  void _navigateToAddPage() async {
   final result = await Navigator.push(context, MaterialPageRoute(builder: (_) => AddPage()));
   if (result != null) {
    print("$result");
   } 
  }
}