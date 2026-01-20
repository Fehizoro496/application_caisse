import 'package:application_caisse/controller/prelevement_controller.dart';
import 'package:application_caisse/model/prelevement_model.dart';
import 'package:application_caisse/theme/app_theme.dart';
import 'package:application_caisse/view/widget/modern_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrelevementForm extends StatelessWidget {
  PrelevementForm({super.key});
  final PrelevementController controller = Get.put(PrelevementController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ModernFormCard(
      title: 'Nouveau prelevement',
      subtitle: 'Retrait de caisse',
      icon: Icons.account_balance_wallet_rounded,
      accentColor: AppColors.prelevement,
      width: 380,
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ModernTextField(
              controller: controller.montantController,
              label: 'Montant',
              hint: 'Ex: 100000',
              prefixIcon: Icons.payments_outlined,
              accentColor: AppColors.prelevement,
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
              color: AppColors.prelevement,
              isFullWidth: true,
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  controller.savePrelelevement(PrelevementModel(
                    montant: int.parse(controller.montantController.text),
                  ));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
