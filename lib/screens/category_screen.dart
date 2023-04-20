import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:store_api_flutter_course/models/categories_model.dart';
import 'package:store_api_flutter_course/providers/category_provider.dart';
import 'package:store_api_flutter_course/widgets/category_widget.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // elevation: 4,
          title: const Text('Categories'),
        ),
        body: FutureBuilder(
            future: context.read<CategoryProvider>().getCategories(),
            builder: (context, data) {
              return GridView.builder(
                  itemCount: context
                      .watch<CategoryProvider>()
                      .categories
                      .take(6)
                      .length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 0.0,
                      mainAxisSpacing: 0.0,
                      childAspectRatio: 1.2),
                  itemBuilder: (ctx, index) {
                    return ChangeNotifierProvider.value(
                        value:
                            context.watch<CategoryProvider>().categories[index],
                        child: const CategoryWidget());
                  });
            }));
  }
}
