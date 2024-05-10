import 'package:flutter/material.dart';
import 'package:flutter_learning_demo/screen/dashboard/list_of_screen/2_sqlite_database/model/user_model.dart';
import 'package:flutter_learning_demo/screen/dashboard/list_of_screen/2_sqlite_database/services/user_service.dart';

class EditUser extends StatefulWidget {
  final User user;

  EditUser({super.key, required this.user});

  @override
  State<EditUser> createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  final _userNameController = TextEditingController();
  final _userContactController = TextEditingController();
  final _userDescriptionController = TextEditingController();
  bool _validateName = false;
  bool _validateContact = false;
  bool _validateDescription = false;

  final _userService = UserService();

  @override
  void initState() {
    setState(() {
      _userNameController.text = widget.user.name ?? "";
      _userContactController.text = widget.user.contact ?? "";
      _userDescriptionController.text = widget.user.description ?? "";
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SQLite CRUD"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Edit New User',
                style: TextStyle(fontSize: 20, color: Colors.teal, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                controller: _userNameController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: "Enter Name",
                  labelText: "Name",
                  errorText: _validateName ? 'Name Value can\'t be empty' : null,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                controller: _userContactController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: "Enter Contact",
                  labelText: "Contact",
                  errorText: _validateContact ? 'Contact Value can\'t be empty' : null,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                controller: _userDescriptionController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: "Enter Description",
                  labelText: "Description",
                  errorText: _validateDescription ? 'Description Value can\'t be empty' : null,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.teal,
                      textStyle: const TextStyle(fontSize: 15),
                    ),
                    onPressed: () async {
                      setState(() {
                        _userNameController.text.isEmpty ? _validateName = true : _validateName = false;
                        _userContactController.text.isEmpty ? _validateContact = true : _validateContact = false;
                        _userDescriptionController.text.isEmpty ? _validateDescription = true : _validateDescription = false;
                      });

                      if (_validateName == false && _validateContact == false && _validateDescription == false) {
                        var _user = User();
                        _user.id = widget.user.id;
                        _user.name = _userNameController.text;
                        _user.contact = _userContactController.text;
                        _user.description = _userDescriptionController.text;

                        var result = await _userService.updateUser(_user);
                        Navigator.pop(context, result);
                      }
                    },
                    child: const Text("Update Details"),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.red,
                      textStyle: const TextStyle(fontSize: 15),
                    ),
                    onPressed: () {
                      _userNameController.text = '';
                      _userContactController.text = '';
                      _userDescriptionController.text = '';
                    },
                    child: const Text("Clear Details"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
