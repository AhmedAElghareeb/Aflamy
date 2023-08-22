import 'package:film_app/screens/film_details/film_detail.dart';
import 'package:film_app/screens/films/cubit.dart';
import 'package:film_app/screens/films/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'item.dart';

class FilmView extends StatelessWidget {
  const FilmView({super.key});

  @override
  Widget build(BuildContext context) {
    FilmsCubit cubit = BlocProvider.of(context);
    cubit.getMovies();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        shape: const OutlineInputBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25.0),
            bottomRight: Radius.circular(25.0),
          ),
        ),
        title: const Text(
          "Your List Of Movies",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder(
        bloc: cubit,
        buildWhen: (previous, current) => current is! GetFilmsFromPaginationLoadingState && current is! GetFilmsFromPaginationFailState,
        builder: (context, state) {
          if(state is GetFilmsLoadingState)
          {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetFilmsFailedState)
          {
            return Center(child: Text(state.msg),);
          } else if (state is GetFilmsSuccessState)
          {
            return NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                if(notification.metrics.pixels == notification.metrics.maxScrollExtent && notification is ScrollUpdateNotification)
                {
                  BlocProvider.of<FilmsCubit>(context).getMovies(fromPagination: true);
                }
                return true;
                },
              child: GridView.builder(
                padding: const EdgeInsets.all(10.0),
                physics: const BouncingScrollPhysics(),
                itemCount: state.list.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 5.0,
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) => _Item(model: state.list[index]),
              ),
            );
          } else
          {
            return const Text("Un Handled State..");
          }
          },
      ),
      bottomNavigationBar: SafeArea(
        child: SizedBox(
          height: 50.0,
          child: BlocBuilder(
            bloc: cubit,
            buildWhen: (previous, current) => current is GetFilmsFromPaginationLoadingState || current is GetFilmsSuccessState || current is GetFilmsFromPaginationFailState,
            builder: (context, state) {
              if(state is GetFilmsFromPaginationLoadingState)
              {
                return const Center(
                  child: CircularProgressIndicator(color: Colors.orange),);
              } else if(state is GetFilmsFromPaginationFailState)
              {
                return Center(
                  child: Text(state.msg),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ),
      ),
    );
  }
}



