import 'package:flutter/material.dart';
import 'package:ms_task/Models/user_model.dart';
import 'package:ms_task/Services/services.dart';
import 'package:ms_task/Theme/theme_settings.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  
  @override
  Widget build(BuildContext context) {
    Service service =Service();
    return MaterialApp(
      theme: customTheme(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: FutureBuilder(
          future: service.getUser() ,
          builder:(context, AsyncSnapshot<List<UserModel>> snapshot) {

          
          
          if(snapshot.connectionState==ConnectionState.none){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }else if(snapshot.connectionState==ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }else if(snapshot.connectionState==ConnectionState.active||snapshot.connectionState==ConnectionState.done){
            return ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index){
                return ListView(
                  shrinkWrap: true,
                  children: [
                    ListTile(
                      leading: const Text("Name",style: TextStyle(fontSize: 18),),
                      trailing: Text(snapshot.data![0].name.toString(),style: const TextStyle(fontSize: 18)),
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Text("Username",style: TextStyle(fontSize: 18)),
                      trailing: Text(snapshot.data![0].username.toString(),style: const TextStyle(fontSize: 18)),
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Text("Address",style: TextStyle(fontSize: 18)),
                      trailing: Text(snapshot.data![0].address!.city.toString(),style: const TextStyle(fontSize: 18)),
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Text("ZipCode",style: TextStyle(fontSize: 18)),
                      trailing: Text(snapshot.data![0].address!.zipcode!.toString(),style: const TextStyle(fontSize: 18)),
                    ),
                  ],
                );
              }
            );
          }else{
            return const Center( 
              child: CircularProgressIndicator(),
            );
          }
        },)
      ),
    );
  }
}