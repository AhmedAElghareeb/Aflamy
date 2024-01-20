import 'package:film_app/screens/movie_details/view.dart';
import 'package:film_app/screens/movies/cubit.dart';
import 'package:film_app/screens/movies/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'item.dart';

class MoviesView extends StatelessWidget {
  const MoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    MoviesCubit cubit = BlocProvider.of(context);
    cubit.getMovies();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white24,
        centerTitle: true,
        elevation: 0.0,
        title: const Text("Movies"),
      ),
      body: BlocBuilder(
        bloc: cubit,
        buildWhen: (previous, current) => current is! GetMoviesFromPaginationLoadingState && current is! GetMoviesFromPaginationFailState,
        builder: (context, state) {
          if(state is GetMoviesLoadingState)
          {
            return const Center(child: CircularProgressIndicator(color: Colors.black),);
          } else if (state is GetMoviesFailedState)
          {
            return Center(child: Text(state.msg),);
          } else if (state is GetMoviesSuccessState)
          {
            return NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                if(notification.metrics.pixels == notification.metrics.maxScrollExtent && notification is ScrollUpdateNotification)
                {
                  BlocProvider.of<MoviesCubit>(context).getMovies(fromPagination: true);
                }
                return true;
              },
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(18),
                itemBuilder: (context, index) => _Item(model: state.list[index]),
                separatorBuilder: (context, index) => const Divider(color: Colors.black,),
                itemCount: state.list.length,
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
          height: 45,
          child: BlocBuilder<MoviesCubit, MoviesStates>(
            buildWhen: (previous, current) => current is GetMoviesFromPaginationLoadingState || current is GetMoviesSuccessState || current is GetMoviesFromPaginationFailState,
            builder: (context, state) {
            if(state is GetMoviesFromPaginationLoadingState)
            {
              return const Center(
                child: CircularProgressIndicator(color: Colors.black),);
            } else if(state is GetMoviesFromPaginationFailState)
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


