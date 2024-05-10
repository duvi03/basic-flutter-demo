import 'package:flutter_learning_demo/screen/dashboard/list_of_screen/2_sqlite_database/db_helper/repository.dart';
import 'package:flutter_learning_demo/screen/dashboard/list_of_screen/2_sqlite_database/model/user_model.dart';

class UserService{
  late Respository _respository;
  UserService(){
    _respository = Respository();
  }

  /// Save User
  saveUser(User user) async{
    return await _respository.insertData('users', user.userMap());
  }

  /// Read All User
  readAllUsers() async{
    return await _respository.readData('users');
  }

  /// Update user
  updateUser(User user) async{
    return await _respository.updateData('users', user.userMap());
  }

  /// Delete User
  deleteUser(userId) async{
    return await _respository.deleteDataById('users', userId);
  }
}