import 'package:flutter/material.dart';
import 'package:rachinha_top_app/shared/app_routes.dart';

class AppDrawer extends StatelessWidget {
  final List<DrawerItem> drawerItems;

  const AppDrawer({super.key, required this.drawerItems});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: drawerItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(drawerItems[index].icon),
            title: Text(drawerItems[index].title),
            onTap: () {
              drawerItems[index]
                  .onTap(context); // Execute a ação ao selecionar o item
            },
          );
        },
      ),
    );
  }
}

class DrawerItem {
  final IconData icon;
  final String title;
  final Function(BuildContext) onTap;

  DrawerItem({
    required this.icon,
    required this.title,
    required this.onTap,
  });
}

List<DrawerItem> drawerItems = [
  DrawerItem(
    icon: Icons.home,
    title: 'Página Inicial',
    onTap: (BuildContext context) {
      Navigator.pop(context); // Feche o Drawer
      Navigator.pushNamed(
          context, AppRoutes.login); // Navegue para a rota da página inicial
    },
  ),
  DrawerItem(
    icon: Icons.person,
    title: 'Perfil',
    onTap: (BuildContext context) {
      Navigator.pop(context); // Feche o Drawer
      Navigator.pushNamed(
          context, AppRoutes.profile); // Navegue para a rota de perfil
    },
  ),
];
