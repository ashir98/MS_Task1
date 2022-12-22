import 'dart:convert';

import 'package:ms_task/Models/post_model.dart';
import 'package:ms_task/Models/user_model.dart';
import 'package:http/http.dart' as http;


class Service{

  List<UserModel> userList = [];
  Future<List<UserModel>> getUser()async{
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode==200){
      for(Map i in data){
        userList.add(UserModel.fromJson(i));  
      }

     return userList; 
    }else{
      return userList;
    }
  }



  List<PostModel> postList=[];
  Future<List<PostModel>> getPost()async{
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode==200){
      for(Map i in data){
        postList.add(PostModel.fromJson(i));
      }
      return postList;
    }else{
      return postList;
    }
  }
}







// class Service{


//   List<UserModel> userList =[];
//   Future<List<UserModel>> getUser()async{
//     final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
//     var data = jsonDecode(response.body.toString());
//     if(response.statusCode==200){
//       for(Map i in data){
//         userList.add(UserModel.fromJson(i));
//         return userList;
//       }
//     }else{
//       return userList;
//     }
//   }
// }