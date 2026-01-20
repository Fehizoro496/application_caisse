import 'package:application_caisse/theme/app_theme.dart';
import 'package:application_caisse/view/widget/modern_card.dart';
import 'package:application_caisse/view/widget/page_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:application_caisse/controller/depense_controller.dart';

class DepensePage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  late final DepenseController controller;

  DepensePage({super.key}) {
    controller = Get.put(DepenseController());
  }

  @override
  Widget build(BuildContext context) {
    return ModernPageLayout(
      title: 'Sortant',
      subtitle: 'Enregistrement des depenses',
      accentColor: AppColors.sortant,
      icon: Icons.arrow_upward_rounded,
      drawerIndex: 1,
      child: ModernFormCard(
        title: 'Nouvelle depense',
        subtitle: 'Enregistrer une sortie de caisse',
        icon: Icons.remove_circle_outline_rounded,
        accentColor: AppColors.sortant,
        width: 400,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ModernTextField(
                controller: controller.libelleController,
                label: 'Libelle',
                hint: 'Ex: Achat fournitures',
                prefixIcon: Icons.description_outlined,
                accentColor: AppColors.sortant,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ce champ doit etre rempli';
                  }
                  return null;
                },
              ),
              const SizedBox(height: AppSpacing.md),
              ModernTextField(
                controller: controller.montantController,
                label: 'Montant',
                hint: 'Ex: 50000',
                prefixIcon: Icons.payments_outlined,
                accentColor: AppColors.sortant,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ce champ doit etre rempli';
                  }
                  if (!value.isNum) {
                    return 'Le montant doit etre un nombre';
                  }
                  return null;
                },
              ),
              const SizedBox(height: AppSpacing.lg),
              ModernButton(
                label: 'Enregistrer',
                icon: Icons.save_rounded,
                color: AppColors.sortant,
                isFullWidth: true,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    controller.handleSubmit();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
