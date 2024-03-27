import 'package:flutter/material.dart';
import 'package:login/log.dart';
import 'package:login/utils/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodoItem {
  String name;
  String email;
  String age;

  TodoItem({required this.name, required this.email, required this.age});
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _ageController = TextEditingController();

  List<TodoItem> itemAdd = [
    TodoItem(name: "joy", email: "joythedon@gmail.com", age: "24"),
    TodoItem(name: "mamoon", email: "mamoonthedon@gmail.com", age: "44"),
  ];

  @override
  void initState() {
    super.initState();
    // itemAdd = [];
  }

  _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);

    // Navigate back to the LoginScreen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => logScreen()),
    );
  }

  // Function to remove an item from the list
  _removeItem(int index) {
    setState(() {
      itemAdd.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: bgColor,
        title: Text("I t e m   L i s t"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              _logout();
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: itemAdd.length,
        itemBuilder: (context, index) {
          TodoItem currentItem = itemAdd[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 30,
              shadowColor: const Color.fromARGB(255, 68, 156, 228),
              child: ListTile(
                leading: Text((1 + index).toString()),
                title: Text(currentItem.name),
                subtitle: Text(
                  "Age: ${currentItem.age}, Email: ${currentItem.email}",
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    // Call the remove function with the index of the item
                    _removeItem(index);
                  },
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    TextField(
                      controller: _nameController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(labelText: "Name"),
                      // Add validation if needed
                    ),
                    TextField(
                      controller: _emailController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(labelText: "Email"),
                      // Add validation if needed
                    ),
                    TextField(
                      controller: _ageController,
                      decoration: InputDecoration(labelText: "Age"),
                      // Add validation if needed
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        if (_nameController.text.isNotEmpty &&
                            _emailController.text.isNotEmpty &&
                            _ageController.text.isNotEmpty) {
                          // Add the entered data to the list
                          TodoItem newItem = TodoItem(
                            name: _nameController.text,
                            email: _emailController.text,
                            age: _ageController.text,
                          );
                          setState(() {
                            itemAdd.add(newItem);
                          });

                          // Clear the text fields
                          _nameController.clear();
                          _emailController.clear();
                          _ageController.clear();

                          // Close the bottom sheet
                          Navigator.pop(context);
                        }
                      },
                      child: Text("Save"),
                    )
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
