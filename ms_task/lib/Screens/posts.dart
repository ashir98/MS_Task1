import 'package:flutter/material.dart';
import 'package:ms_task/Models/post_model.dart';
import 'package:ms_task/Services/services.dart';
import 'package:ms_task/Theme/theme_settings.dart';

class Posts extends StatefulWidget {
  const Posts({super.key});

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  @override
  Widget build(BuildContext context) {
    Service service = Service();
    return MaterialApp(
      theme: customTheme(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: FutureBuilder(
          future: service.getPost(),
          builder: (context, AsyncSnapshot<List<PostModel>> snapshot) {
            if(!snapshot.hasData){
              return const Center(child: CircularProgressIndicator(),);

            }else if(snapshot.connectionState==ConnectionState.waiting){
              return const Center(child: CircularProgressIndicator(),);

            }else if(snapshot.connectionState==ConnectionState.none){
              return const Center(child: CircularProgressIndicator(),);

            }else if(snapshot.connectionState==ConnectionState.active||snapshot.connectionState==ConnectionState.done){
              return ListView.builder(
                shrinkWrap: true,
                itemCount: service.postList.length,
                itemBuilder: (context, index) {
                  return ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      ListTile(
                        title: Text("${snapshot.data![index].title}",style: const TextStyle(fontWeight: FontWeight.bold),),
                        subtitle: Text("${snapshot.data![index].body}"),
                      ),
                      const Divider()
                    ],
                  );
                },
              );

            }else{
              return const CircularProgressIndicator();

            }
          },
        )
      ),
    );
  }
}