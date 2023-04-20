import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:store_api_flutter_course/consts/global_colors.dart';
import 'package:store_api_flutter_course/models/users_model.dart';

class UsersWidget extends StatelessWidget {
  const UsersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    UserModel user = context.watch<UserModel>();
    Size size = MediaQuery.of(context).size;
    return ListTile(
      leading: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: lightCardColor,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: FancyShimmerImage(
            height: size.height * 0.15,
            width: size.width * 0.15,
            errorWidget: const Icon(
              IconlyBold.danger,
              color: Colors.red,
              size: 28,
            ),
            imageUrl: user.avatar!,
            boxFit: BoxFit.cover,
          ),
        ),
      ),
      title: Text(user.name!),
      subtitle: Text(user.email!),
      trailing: Text(
        user.role!,
        style: TextStyle(color: lightIconsColor, fontWeight: FontWeight.bold),
      ),
    );
  }
}
