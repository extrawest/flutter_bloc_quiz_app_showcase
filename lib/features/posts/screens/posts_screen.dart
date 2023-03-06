import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/posts_bloc.dart';
import '../widgets/posts_list.dart';

class PostsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Posts')),
      body: BlocProvider(
        create: (_) =>
            PostBloc(postsRepository: RepositoryProvider.of(context))..add(PostsFetchEvent()),
        child: const PostsList(),
      ),
    );
  }
}
