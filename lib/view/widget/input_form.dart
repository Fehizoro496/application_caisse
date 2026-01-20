import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:application_caisse/model/operation_model.dart';
import 'package:application_caisse/controller/main_controller.dart';
import 'package:application_caisse/theme/app_theme.dart';
import 'package:application_caisse/view/widget/modern_card.dart';
import 'package:application_caisse/constants/form_suggestions.dart';

class InputForm extends StatefulWidget {
  const InputForm({super.key});

  @override
  State<InputForm> createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  final formKey = GlobalKey<FormState>();
  final MainController controller = Get.find<MainController>();
  final FocusNode _quantityFocusNode = FocusNode();

  @override
  void dispose() {
    _quantityFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ModernFormCard(
      title: 'Nouvelle operation',
      subtitle: 'Ajouter une ligne a la facture',
      icon: Icons.add_shopping_cart_rounded,
      accentColor: AppColors.entrant,
      width: 380,
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ModernAutocompleteField<ProductSuggestion>(
              controller: controller.designationController,
              label: 'Designation',
              hint: 'Ex: Produit A',
              prefixIcon: Icons.inventory_2_outlined,
              accentColor: AppColors.entrant,
              suggestions: FormSuggestions.produits,
              displayStringForOption: (p) => p.designation,
              onSelected: (produit) {
                controller.priceController.text = produit.prix.toString();
                _quantityFocusNode.requestFocus();
              },
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
              focusNode: _quantityFocusNode,
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
                if (formKey.currentState!.validate()) {
                  controller.addFactureLine(
                    OperationModel(
                      nomOperation: controller.designationController.text,
                      prixOperation: int.parse(controller.priceController.text),
                      quantiteOperation:
                          int.parse(controller.quantityController.text),
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
