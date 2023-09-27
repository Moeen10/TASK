import 'package:agg/bloc/InternetCubit.dart';
import 'package:agg/bloc/PostsCubit/post_Cubit.dart';
import 'package:agg/bloc/PostsCubit/state_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("test"),
      ),
      body: SafeArea(

        child: Column(
          children: [

            Expanded(
              child: BlocBuilder<PostCubit,PostState >(
                builder: (context, state) {
                  if(state is LoadingState){
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  else if(state is GetDataState){
                    return ListView.builder(

                      itemCount: state.posts.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(state.posts[index].name.toString()),
                        );
                      },
                    );
                  }

                  return  Center(
                    child: Text("Here have an error"),
                  );
                },
              ),
            )


            // BlocConsumer<InternetCubit , InternetState>(
            //   listener: (context, state)  {
            //     if(state == InternetState.connect){
            //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Connected"),backgroundColor: Colors.blue));
            //     }
            //     if(state == InternetState.disconnect){
            //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Disconnected"), backgroundColor: Colors.red,));
            //     }
            //   },
            //   builder: (context, state)  {
            //     if(state == InternetState.connect){
            //       return  Expanded(
            //         child: BlocBuilder<PostCubit,PostState >(
            //           builder: (context, state) {
            //             if(state is LoadingState){
            //               return Center(
            //                 child: CircularProgressIndicator(),
            //               );
            //             }
            //             else if(state is GetDataState){
            //               return ListView.builder(
            //
            //                 itemCount: state.posts.length,
            //                 itemBuilder: (context, index) {
            //                   return ListTile(
            //                     title: Text(state.posts[index].name.toString()),
            //                   );
            //                 },
            //               );
            //             }
            //             return  Center(
            //               child: Text("Here have an error"),
            //             );
            //           },
            //         ),
            //       );
            //     }
            //     if(state == InternetState.disconnect){
            //       return Text("Disconnected");
            //     }
            //     return Text("Connecting...");
            //   },
            //
            // ),

          ],
        ),
      ),
    );
  }
}



