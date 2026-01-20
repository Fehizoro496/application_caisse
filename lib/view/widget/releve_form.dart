import 'package:application_caisse/controller/releve_controller.dart';
import 'package:application_caisse/model/releve_model.dart';
import 'package:application_caisse/theme/app_theme.dart';
import 'package:application_caisse/view/widget/modern_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReleveForm extends StatelessWidget {
  ReleveForm({super.key});
  final ReleveController controller = Get.put(ReleveController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ModernFormCard(
      title: 'Nouveau releve',
      subtitle: 'Enregistrer les compteurs',
      icon: Icons.speed_rounded,
      accentColor: AppColors.releve,
      width: 380,
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ModernTextField(
              controller: controller.compteurController,
              label: 'Compteur',
              hint: 'Ex: 12345.67',
              prefixIcon: Icons.speed_outlined,
              accentColor: AppColors.releve,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Ce champ doit etre rempli';
                }
                if (!value.isNum) {
                  return 'Veuillez entrer un nombre';
                }
                if (double.parse(value) <
                    double.parse(controller.sousCompteurController.text.isEmpty
                        ? '0'
                        : controller.sousCompteurController.text)) {
                  return 'Valeur trop petite';
                }
                if (double.parse(value) < controller.lastReleve.sousCompteur) {
                  return 'Plus petite que la derniere';
                }
                return null;
              },
            ),
            const SizedBox(height: AppSpacing.md),
            ModernTextField(
              controller: controller.sousCompteurController,
              label: 'Sous-compteur',
              hint: 'Ex: 1234.56',
              prefixIcon: Icons.speed_outlined,
              accentColor: AppColors.releve,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Ce champ doit etre rempli';
                }
                if (!value.isNum) {
                  return 'Veuillez entrer un nombre';
                }
                if (double.parse(value) >
                    double.parse(controller.compteurController.text.isEmpty
                        ? '0'
                        : controller.compteurController.text)) {
                  return 'Valeur trop grande';
                }
                if (double.parse(value) < controller.lastReleve.sousCompteur) {
                  return 'Plus petite que la derniere';
                }
                return null;
              },
            ),
            const SizedBox(height: AppSpacing.lg),
            ModernButton(
              label: 'Enregistrer',
              icon: Icons.save_rounded,
              color: AppColors.releve,
              isFullWidth: true,
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  controller.saveReleve(ReleveModel(
                    compteur: double.parse(controller.compteurController.text),
                    sousCompteur: double.parse(controller.sousCompteurController.text),
                    dateReleve: DateTime.timestamp(),
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
