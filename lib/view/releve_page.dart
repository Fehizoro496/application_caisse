import 'package:application_caisse/theme/app_theme.dart';
import 'package:application_caisse/view/widget/page_layout.dart';
import 'package:application_caisse/view/widget/releve_list_view.dart';
import 'package:application_caisse/view/widget/releve_form.dart';
import 'package:flutter/material.dart';

class RelevePage extends StatelessWidget {
  const RelevePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ModernPageLayout(
      title: 'Releve',
      subtitle: 'Gestion des compteurs',
      accentColor: AppColors.releve,
      icon: Icons.speed_rounded,
      drawerIndex: 3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReleveForm(),
          const SizedBox(width: AppSpacing.xl),
          releveListView(),
        ],
      ),
    );
  }
}
