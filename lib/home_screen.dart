import 'package:bloc_ex/internet_bloc/internet_bloc.dart';
import 'package:bloc_ex/internet_bloc/internet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocConsumer<InternetBloc, InternetState>(
          listener: (context, state) {
            if (state is InternetOffState) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Internet Disconnected'),
                backgroundColor: Colors.red,
              ));
            } else if (state is InternetOnState) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Internet Connected'),
                backgroundColor: Colors.green,
              ));
            }
          },
          builder: (context, state) {
            if (state is InternetOffState) {
              return const Text("Internet OFF");
            } else if (state is InternetOnState) {
              return const Text("Internet ON");
            } else {
              return const Text("Loading...");
            }
          },
        ),

        // child: BlocBuilder<InternetBloc, InternetState>(
        //   builder: (context, state) {
        //     if (state is InternetOffState) {
        //       return const Text("Internet OFF");
        //     } else if (state is InternetOnState) {
        //       return const Text("Internet ON");
        //     } else {
        //       return const Text("Loading...");
        //     }
        //   },
        // ),
      ),
    );
  }
}


//use BlocConsumer to take advantage of both BlocListener and BlocBuilder

//use BlocListener when page ui need not to be redrawn/rebuild : runs in background : 
// : show snackbar, use navigator...

//use BlocBuilder when page ui need to be redrawn/rebuild