import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:online_shop/features/profile/widgets/profile_tile.dart';

import '../../../router/router.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final theme = Theme.of(context);
    return Center(
      child: Column(
        children: [
          Card(
            child: InkWell(
              onTap: () {
                AutoRouter.of(context).push(CartRoute());
              },
              child: const InkWellChild(name: "To cart"),
            ),
          ),
          Card(
            child: InkWell(
              onTap: () {
                AutoRouter.of(context).push(const ProductAddRoute());
              },
              child: const InkWellChild(name: "Add"),
            ),
          ),
          Card(
            child: InkWell(
              onTap: () {
                AutoRouter.of(context).push(const ProductDeleteRoute());
              },
              child: const InkWellChild(name: "Delete"),
            ),
          ),
        ],
      ),
    );
  }
}
