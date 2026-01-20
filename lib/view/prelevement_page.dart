import 'package:application_caisse/theme/app_theme.dart';
import 'package:application_caisse/view/widget/page_layout.dart';
import 'package:application_caisse/view/widget/prelevement_form.dart';
import 'package:application_caisse/view/widget/prelevement_list_view.dart';
import 'package:flutter/material.dart';

class PrelevementPage extends StatelessWidget {
  const PrelevementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ModernPageLayout(
      title: 'Prelevement',
      subtitle: 'Gestion des retraits',
      accentColor: AppColors.prelevement,
      icon: Icons.account_balance_wallet_rounded,
      drawerIndex: 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PrelevementForm(),
          const SizedBox(width: AppSpacing.xl),
          prelevementListView(),
        ],
      ),
    );
  }
}
