import 'dart:io';

import 'package:bloc_demo_pagination/cubit/user_cubit.dart';
import 'package:bloc_demo_pagination/cubit_state/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/user_model.dart';

class MainScreen extends StatefulWidget {
  static const route = "main_screen";
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<User> userList = [];
  static int pageCount = 0;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    if (pageCount < 10) {
      BlocProvider.of<UserCubit>(context).fatchUsers(pageCount);
    }
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        if (pageCount < 10) {
          BlocProvider.of<UserCubit>(context).fatchUsers(pageCount);
        }
      }
    });
    super.initState();
  }

  void addToMainList(List<User> userList) {
    setState(() {
    this.userList.addAll(userList);
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pagination using bloc"),
      ),
      body: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (state is FatchUserState) {
            
              addToMainList(state.userList);
            
          }

          return ListView.builder(
            controller: scrollController,
            itemCount: userList.length,
            itemBuilder: (context, index) {
              return SizedBox(
                height: 100,
                child: Text(userList[index].title),
              );
            },
          );
        },
      ),
    );
  }
}
