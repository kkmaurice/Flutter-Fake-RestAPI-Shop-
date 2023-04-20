import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:store_api_flutter_course/consts/global_colors.dart';
import 'package:store_api_flutter_course/providers/product_provider.dart';
import 'package:store_api_flutter_course/screens/category_screen.dart';
import 'package:store_api_flutter_course/screens/users_screen.dart';
import 'package:store_api_flutter_course/services/api_handler.dart';
import 'package:store_api_flutter_course/widgets/appbar_icons.dart';
import 'package:store_api_flutter_course/widgets/feeds_widget.dart';

import '../widgets/sale_widget.dart';
import 'feeds_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();

//  @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     ApiHandler.getAllProducts();
//   }
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
            appBar: AppBar(
              title: const Text("Home"),
              leading: AppBarIcons(
                function: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          child: const CategoriesScreen(),
                          type: PageTransitionType.fade));
                },
                icon: IconlyBold.category,
              ),
              actions: [
                AppBarIcons(
                  function: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            child: const UsersScreen(),
                            type: PageTransitionType.fade));
                  },
                  icon: IconlyBold.user3,
                ),
              ],
            ),
            body: FutureBuilder(
                future: context.read<ProductProvider>().getProducts(),
                builder: (context, data) {
                  if (data.hasData) {
                    return Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                            controller: searchController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: "Search",
                              filled: true,
                              fillColor: Theme.of(context).cardColor,
                              suffixIcon: Icon(
                                IconlyLight.search,
                                color: lightIconsColor,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Theme.of(context).cardColor,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  width: 1,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                              ),
                            )),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                          child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: size.height * 0.25,
                              child: Swiper(
                                itemCount: 3,
                                itemBuilder: (ctx, index) {
                                  return const SaleWidget();
                                },
                                autoplay: true,
                                pagination: const SwiperPagination(
                                    alignment: Alignment.bottomCenter,
                                    builder: DotSwiperPaginationBuilder(
                                        color: Colors.white,
                                        activeColor: Colors.red)),
                                // control: const SwiperControl(),
                              ),
                            ),
                            //FeedsWidget()
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  const Text(
                                    "Latest Products",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                    ),
                                  ),
                                  const Spacer(),
                                  AppBarIcons(
                                      function: () {
                                        Navigator.push(
                                            context,
                                            PageTransition(
                                                type: PageTransitionType.fade,
                                                child: const FeedsScreen()));
                                      },
                                      icon: IconlyBold.arrowRight2),
                                ],
                              ),
                            ),
                            GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 5,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 4,
                                      mainAxisSpacing: 6),
                              itemBuilder: (ctx, index) {
                                final provider =
                                    context.watch<ProductProvider>().products;
                                return ChangeNotifierProvider.value(
                                  value: provider[index],
                                  child: const FeedsWidget(),
                                );
                              },
                            )
                          ],
                        ),
                      )),
                    ]);
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                })));
  }
}
