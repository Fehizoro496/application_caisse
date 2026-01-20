import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:application_caisse/theme/app_theme.dart';

class ModernSnackBar {
  static void showSuccess(String title, String message) {
    _showSnackBar(
      title: title,
      message: message,
      icon: Icons.check_circle_rounded,
      backgroundColor: AppColors.success,
    );
  }

  static void showError(String title, String message) {
    _showSnackBar(
      title: title,
      message: message,
      icon: Icons.error_rounded,
      backgroundColor: AppColors.error,
    );
  }

  static void showInfo(String title, String message) {
    _showSnackBar(
      title: title,
      message: message,
      icon: Icons.info_rounded,
      backgroundColor: AppColors.entrant,
    );
  }

  static void showWarning(String title, String message) {
    _showSnackBar(
      title: title,
      message: message,
      icon: Icons.warning_rounded,
      backgroundColor: AppColors.warning,
    );
  }

  static void _showSnackBar({
    required String title,
    required String message,
    required IconData icon,
    required Color backgroundColor,
  }) {
    Get.snackbar(
      title,
      message,
      titleText: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
      messageText: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 13,
        ),
      ),
      icon: Container(
        margin: const EdgeInsets.only(left: 8),
        child: Icon(
          icon,
          color: Colors.white,
          size: 24,
        ),
      ),
      snackPosition: SnackPosition.TOP,
      backgroundColor: backgroundColor.withValues(alpha: 0.85),
      borderRadius: 20, // Rounded "pill" style
      margin: const EdgeInsets.only(top: 20), // Floating from top
      maxWidth: 400, // Narrower width
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 12,
      ),
      colorText: Colors.white,
      duration: const Duration(seconds: 1),
      isDismissible: true,
      dismissDirection: DismissDirection.up,
      forwardAnimationCurve: Curves.easeOutBack, // Playful entry
      borderWidth: 1,
      borderColor: Colors.white.withValues(alpha: 0.2),
      boxShadows: [
        BoxShadow(
          color: backgroundColor.withValues(alpha: 0.3),
          blurRadius: 15,
          offset: const Offset(0, 8),
          spreadRadius: -2,
        ),
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.1),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    );
  }
}
