import 'package:application_caisse/theme/app_theme.dart';
import 'package:application_caisse/view/widget/input_form.dart';
import 'package:application_caisse/view/widget/invoice_list_view.dart';
import 'package:application_caisse/view/widget/page_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/main_controller.dart';

class MainPage extends StatelessWidget {
  late final MainController c;

  MainPage({super.key}) {
    c = Get.put(MainController());
  }

  @override
  Widget build(BuildContext context) {
    return ModernPageLayout(
      title: 'Entrant',
      subtitle: 'Gestion des entrees',
      accentColor: AppColors.entrant,
      icon: Icons.arrow_downward_rounded,
      drawerIndex: 0,
      actions: [
        GestureDetector(
          onTap: () => c.backupDatabaseToDesktop(),
          child: const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
              vertical: AppSpacing.sm,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.file_download_outlined, size: 18),
                SizedBox(width: AppSpacing.xs),
                Text('Exporter', style: TextStyle(fontSize: 13)),
              ],
            ),
          ),
        ),
      ],
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InputForm(),
          SizedBox(width: AppSpacing.xl),
          InvoiceListView(),
        ],
      ),
    );
  }
}
