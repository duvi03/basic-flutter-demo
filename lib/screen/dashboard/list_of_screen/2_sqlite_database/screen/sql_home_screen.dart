import 'package:flutter/material.dart';
import 'package:flutter_learning_demo/screen/dashboard/list_of_screen/2_sqlite_database/model/user_model.dart';
import 'package:flutter_learning_demo/screen/dashboard/list_of_screen/2_sqlite_database/screen/add_user.dart';
import 'package:flutter_learning_demo/screen/dashboard/list_of_screen/2_sqlite_database/screen/edit_user.dart';
import 'package:flutter_learning_demo/screen/dashboard/list_of_screen/2_sqlite_database/screen/view_users.dart';
import 'package:flutter_learning_demo/screen/dashboard/list_of_screen/2_sqlite_database/services/user_service.dart';

class SqlHomeScreen extends StatefulWidget {
  const SqlHomeScreen({super.key});

  @override
  State<SqlHomeScreen> createState() => _SqlHomeScreenState();
}

class _SqlHomeScreenState extends State<SqlHomeScreen> {
  late List<User> _userList = <User>[];
  final _userService = UserService();

  getAllUserDetails() async {
    var users = await _userService.readAllUsers();
    _userList = [];
    users.forEach((user) {
      setState(() {
        var userModel = User();
        userModel.id = user['id'];
        userModel.name = user['name'];
        userModel.contact = user['contact'];
        userModel.description = user['description'];
        _userList.add(userModel);
        print(_userList);
      });
    });
  }

  @override
  void initState() {
    getAllUserDetails();
    super.initState();
  }

  _showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SQLite CRUD"),
      ),
      body:
          _userList.isEmpty
              ? const Center(child: Text('Empty Data'))
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: _userList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ViewUser(user: _userList[index])));
                        },
                        leading: const Icon(Icons.person),
                        title: Text(_userList[index].name ?? ""),
                        subtitle: Text(_userList[index].contact ?? ""),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => EditUser(user: _userList[index]))).then((value) {
                                  if (value != null) {
                                    getAllUserDetails();
                                    _showSuccessSnackBar("User Detail Updated Success");
                                  }
                                });
                              },
                              icon: const Icon(
                                Icons.edit,
                                color: Colors.teal,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                _deleteFormDialog(context, _userList[index].id);
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const AddUser())).then((data) {
            if (data != null) {
              getAllUserDetails();
              _showSuccessSnackBar('User Detail Added Success');
            }
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  _deleteFormDialog(context, userId) {
    return showDialog(
        context: context,
        builder: (param) {
          return AlertDialog(
            title: const Text(
              'Are you sure to delete',
              style: TextStyle(color: Colors.teal, fontSize: 20),
            ),
            actions: [
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.red,
                ),
                onPressed: () async {
                  var result = await _userService.deleteUser(userId);
                  if (result != null) {
                    Navigator.pop(context);
                    setState(() {
                      getAllUserDetails();
                    });
                    _showSuccessSnackBar("User Detail Deleted Success");
                  }
                },
                child: const Text('Delete'),
              ),
              TextButton(
                style: TextButton.styleFrom(foregroundColor: Colors.white, backgroundColor: Colors.teal),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Close'),
              ),
            ],
          );
        });
  }
}
