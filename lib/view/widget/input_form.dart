import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:application_caisse/model/operation_model.dart';
import 'package:application_caisse/controller/main_controller.dart';
import 'package:application_caisse/theme/app_theme.dart';
import 'package:application_caisse/view/widget/modern_card.dart';

class InputForm extends StatelessWidget {
  InputForm({super.key});
  final MainController controller = Get.find<MainController>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ModernFormCard(
      title: 'Nouvelle operation',
      subtitle: 'Ajouter une ligne a la facture',
      icon: Icons.add_shopping_cart_rounded,
      accentColor: AppColors.entrant,
      width: 380,
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ModernTextField(
              controller: controller.designationController,
              label: 'Designation',
              hint: 'Ex: Produit A',
              prefixIcon: Icons.inventory_2_outlined,
              accentColor: AppColors.entrant,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Ce champ ne doit pas etre vide';
                }
                return null;
              },
            ),
            const SizedBox(height: AppSpacing.md),
            ModernTextField(
              controller: controller.priceController,
              label: 'Prix unitaire',
              hint: 'Ex: 10000',
              prefixIcon: Icons.payments_outlined,
              accentColor: AppColors.entrant,
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Ce champ ne doit pas etre vide';
                }
                if (!value.isNum) {
                  return 'Le prix unitaire doit etre un nombre';
                }
                return null;
              },
            ),
            const SizedBox(height: AppSpacing.md),
            ModernTextField(
              controller: controller.quantityController,
              label: 'Quantite',
              hint: 'Ex: 1',
              prefixIcon: Icons.numbers_rounded,
              accentColor: AppColors.entrant,
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Ce champ doit etre rempli';
                }
                if (!value.isNum) {
                  return 'La quantite doit etre un nombre';
                }
                return null;
              },
            ),
            const SizedBox(height: AppSpacing.lg),
            ModernButton(
              label: 'Ajouter',
              icon: Icons.add_rounded,
              color: AppColors.entrant,
              isFullWidth: true,
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  controller.addFactureLine(
                    OperationModel(
                      nomOperation: controller.designationController.text,
                      prixOperation: int.parse(controller.priceController.text),
                      quantiteOperation: int.parse(controller.quantityController.text),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
