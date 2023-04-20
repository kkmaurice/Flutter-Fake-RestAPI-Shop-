import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:store_api_flutter_course/providers/users_provider.dart';
import 'package:store_api_flutter_course/widgets/users_widget.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // elevation: 4,
        title: const Text('Users'),
      ),
      body: FutureBuilder(
        future: context.read<UsersProvider>().getUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: context.watch<UsersProvider>().users.take(4).length,
                itemBuilder: (ctx, index) {
                  return ChangeNotifierProvider.value(
                    value: context.watch<UsersProvider>().users[index],
                    child: const UsersWidget(),);
                });
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
