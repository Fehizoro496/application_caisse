import 'package:application_caisse/theme/app_theme.dart';
import 'package:application_caisse/view/widget/moder_app_bar.dart';
import 'package:application_caisse/view/widget/my_drawer.dart';
import 'package:flutter/material.dart';

class ModernPageLayout extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color accentColor;
  final IconData icon;
  final int drawerIndex;
  final Widget child;
  final List<Widget>? actions;

  const ModernPageLayout({
    super.key,
    required this.title,
    required this.subtitle,
    required this.accentColor,
    required this.icon,
    required this.drawerIndex,
    required this.child,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      drawer: MyDrawer(currentIndex: drawerIndex),
      body: Column(
        children: [
          ModernAppBar(
            title: title,
            subtitle: subtitle,
            color: accentColor,
            icon: icon,
            actions: actions,
          ),
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(AppSpacing.xl),
                child: child,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
