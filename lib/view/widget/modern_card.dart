import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:application_caisse/theme/app_theme.dart';

class ModernCard extends StatelessWidget {
  final Widget child;
  final Color? accentColor;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;

  const ModernCard({
    super.key,
    required this.child,
    this.accentColor,
    this.padding,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        boxShadow: AppShadows.sm,
        border: accentColor != null
            ? Border(
                top: BorderSide(
                  color: accentColor!,
                  width: 3,
                ),
              )
            : null,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppRadius.lg),
        child: Padding(
          padding: padding ?? const EdgeInsets.all(AppSpacing.lg),
          child: child,
        ),
      ),
    );
  }
}

class ModernFormCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData icon;
  final Color accentColor;
  final Widget child;
  final double? width;

  const ModernFormCard({
    super.key,
    required this.title,
    this.subtitle,
    required this.icon,
    required this.accentColor,
    required this.child,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 360,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        boxShadow: AppShadows.md,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(AppSpacing.lg),
            decoration: BoxDecoration(
              color: accentColor.withValues(alpha: 0.05),
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(AppRadius.lg),
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(AppSpacing.sm + 2),
                  decoration: BoxDecoration(
                    color: accentColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(AppRadius.md),
                  ),
                  child: Icon(
                    icon,
                    color: accentColor,
                    size: 22,
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      if (subtitle != null)
                        Text(
                          subtitle!,
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.textMuted,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: child,
          ),
        ],
      ),
    );
  }
}

class ModernButton extends StatefulWidget {
  final String label;
  final IconData? icon;
  final Color color;
  final VoidCallback onPressed;
  final bool isLoading;
  final bool isOutlined;
  final bool isFullWidth;

  const ModernButton({
    super.key,
    required this.label,
    this.icon,
    required this.color,
    required this.onPressed,
    this.isLoading = false,
    this.isOutlined = false,
    this.isFullWidth = false,
  });

  @override
  State<ModernButton> createState() => _ModernButtonState();
}

class _ModernButtonState extends State<ModernButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: widget.isFullWidth ? double.infinity : null,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: widget.isLoading ? null : widget.onPressed,
            borderRadius: BorderRadius.circular(AppRadius.md),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.lg,
                vertical: AppSpacing.md,
              ),
              decoration: BoxDecoration(
                color: widget.isOutlined
                    ? (_isHovered ? widget.color.withValues(alpha: 0.1) : Colors.transparent)
                    : (_isHovered ? widget.color.withValues(alpha: 0.9) : widget.color),
                borderRadius: BorderRadius.circular(AppRadius.md),
                border: widget.isOutlined
                    ? Border.all(color: widget.color, width: 1.5)
                    : null,
                boxShadow: !widget.isOutlined && _isHovered
                    ? [
                        BoxShadow(
                          color: widget.color.withValues(alpha: 0.3),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ]
                    : null,
              ),
              child: Row(
                mainAxisSize: widget.isFullWidth ? MainAxisSize.max : MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (widget.isLoading)
                    SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: widget.isOutlined ? widget.color : Colors.white,
                      ),
                    )
                  else ...[
                    if (widget.icon != null) ...[
                      Icon(
                        widget.icon,
                        size: 18,
                        color: widget.isOutlined ? widget.color : Colors.white,
                      ),
                      const SizedBox(width: AppSpacing.sm),
                    ],
                    Text(
                      widget.label,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: widget.isOutlined ? widget.color : Colors.white,
                        letterSpacing: 0.3,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ModernTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? hint;
  final IconData? prefixIcon;
  final Color accentColor;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;

  const ModernTextField({
    super.key,
    required this.controller,
    required this.label,
    this.hint,
    this.prefixIcon,
    required this.accentColor,
    this.validator,
    this.keyboardType,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      focusNode: focusNode,
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: AppColors.textPrimary,
      ),
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon, color: accentColor, size: 20)
            : null,
        floatingLabelStyle: TextStyle(
          color: accentColor,
          fontWeight: FontWeight.w600,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
          borderSide: BorderSide(color: accentColor, width: 2),
        ),
      ),
    );
  }
}

class ModernAutocompleteField<T extends Object> extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String? hint;
  final IconData? prefixIcon;
  final Color accentColor;
  final String? Function(String?)? validator;
  final List<T> suggestions;
  final String Function(T) displayStringForOption;
  final void Function(T)? onSelected;

  const ModernAutocompleteField({
    super.key,
    required this.controller,
    required this.label,
    this.hint,
    this.prefixIcon,
    required this.accentColor,
    this.validator,
    required this.suggestions,
    required this.displayStringForOption,
    this.onSelected,
  });

  @override
  State<ModernAutocompleteField<T>> createState() =>
      _ModernAutocompleteFieldState<T>();
}

class _ModernAutocompleteFieldState<T extends Object>
    extends State<ModernAutocompleteField<T>> {
  late final FocusNode _focusNode;
  late TextEditingController _textController;
  final ScrollController _scrollController = ScrollController();
  int _highlightedIndex = 0;
  List<T> _currentOptions = [];
  static const double _itemHeight = 40.0;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode(onKeyEvent: _handleKeyEvent);
    _textController = TextEditingController(text: widget.controller.text);
    _textController.addListener(_onTextChanged);
    widget.controller.addListener(_onExternalControllerChanged);
    _updateOptions(_textController.text);
  }

  @override
  void dispose() {
    _textController.removeListener(_onTextChanged);
    widget.controller.removeListener(_onExternalControllerChanged);
    _textController.dispose();
    _focusNode.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToHighlightedItem() {
    if (!_scrollController.hasClients) return;

    final maxScrollExtent = _scrollController.position.maxScrollExtent;
    final viewportHeight = _scrollController.position.viewportDimension;
    final itemOffset = _highlightedIndex * _itemHeight;

    // Si l'element est au-dessus de la zone visible
    if (itemOffset < _scrollController.offset) {
      _scrollController.animateTo(
        itemOffset,
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeOut,
      );
    }
    // Si l'element est en-dessous de la zone visible
    else if (itemOffset + _itemHeight > _scrollController.offset + viewportHeight) {
      final newOffset = (itemOffset + _itemHeight - viewportHeight).clamp(0.0, maxScrollExtent);
      _scrollController.animateTo(
        newOffset,
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeOut,
      );
    }
  }

  void _onExternalControllerChanged() {
    if (_textController.text != widget.controller.text) {
      _textController.text = widget.controller.text;
    }
  }

  void _onTextChanged() {
    if (widget.controller.text != _textController.text) {
      widget.controller.text = _textController.text;
    }
    _updateOptions(_textController.text);
  }

  void _updateOptions(String text) {
    setState(() {
      if (text.isEmpty) {
        _currentOptions = widget.suggestions;
      } else {
        _currentOptions = widget.suggestions
            .where((option) => widget
                .displayStringForOption(option)
                .toLowerCase()
                .contains(text.toLowerCase()))
            .toList();
      }
      _highlightedIndex = 0;
    });
  }

  void _selectOption(T option) {
    _textController.text = widget.displayStringForOption(option);
    widget.controller.text = _textController.text;
    widget.onSelected?.call(option);
  }

  KeyEventResult _handleKeyEvent(FocusNode node, KeyEvent event) {
    if (event is! KeyDownEvent) return KeyEventResult.ignored;
    if (_currentOptions.isEmpty) return KeyEventResult.ignored;

    if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
      setState(() {
        _highlightedIndex = (_highlightedIndex + 1) % _currentOptions.length;
      });
      WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToHighlightedItem());
      return KeyEventResult.handled;
    } else if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
      setState(() {
        _highlightedIndex =
            (_highlightedIndex - 1 + _currentOptions.length) % _currentOptions.length;
      });
      WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToHighlightedItem());
      return KeyEventResult.handled;
    } else if (event.logicalKey == LogicalKeyboardKey.enter) {
      _selectOption(_currentOptions[_highlightedIndex]);
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  @override
  Widget build(BuildContext context) {
    return RawAutocomplete<T>(
        textEditingController: _textController,
        focusNode: _focusNode,
        optionsBuilder: (TextEditingValue textEditingValue) {
          if (textEditingValue.text.isEmpty) {
            return const Iterable.empty();
          }
          return _currentOptions;
        },
        displayStringForOption: widget.displayStringForOption,
        onSelected: _selectOption,
        fieldViewBuilder: (context, textController, focusNode, onFieldSubmitted) {
          return TextFormField(
            controller: textController,
            focusNode: focusNode,
            validator: widget.validator,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: AppColors.textPrimary,
            ),
            decoration: InputDecoration(
              labelText: widget.label,
              hintText: widget.hint,
              prefixIcon: widget.prefixIcon != null
                  ? Icon(widget.prefixIcon, color: widget.accentColor, size: 20)
                  : null,
              floatingLabelStyle: TextStyle(
                color: widget.accentColor,
                fontWeight: FontWeight.w600,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppRadius.md),
                borderSide: BorderSide(color: widget.accentColor, width: 2),
              ),
            ),
          );
        },
        optionsViewBuilder: (context, onSelected, options) {
          return Align(
            alignment: Alignment.topLeft,
            child: Material(
              elevation: 4,
              borderRadius: BorderRadius.circular(AppRadius.md),
              child: Container(
                constraints: const BoxConstraints(maxHeight: 200, maxWidth: 350),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(AppRadius.md),
                  border: Border.all(
                      color: widget.accentColor.withValues(alpha: 0.3)),
                ),
                child: ListView.builder(
                  controller: _scrollController,
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: options.length,
                  itemExtent: _itemHeight,
                  itemBuilder: (context, index) {
                    final option = options.elementAt(index);
                    final isHighlighted = _highlightedIndex == index;
                    return InkWell(
                      onTap: () => onSelected(option),
                      child: Container(
                        height: _itemHeight,
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.md,
                        ),
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          color: isHighlighted
                              ? widget.accentColor.withValues(alpha: 0.1)
                              : null,
                        ),
                        child: Text(
                          widget.displayStringForOption(option),
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.textPrimary,
                            fontWeight:
                                isHighlighted ? FontWeight.w600 : FontWeight.w400,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        },
      );
  }
}

/// Dialog moderne et cohérent avec le design de l'application
class ModernDialog extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData icon;
  final Color accentColor;
  final Widget? content;
  final List<ModernDialogAction> actions;

  const ModernDialog({
    super.key,
    required this.title,
    this.subtitle,
    required this.icon,
    required this.accentColor,
    this.content,
    required this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: 380,
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppRadius.lg),
          boxShadow: AppShadows.lg,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(AppSpacing.lg),
              decoration: BoxDecoration(
                color: accentColor.withValues(alpha: 0.05),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(AppRadius.lg),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(AppSpacing.sm + 2),
                    decoration: BoxDecoration(
                      color: accentColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(AppRadius.md),
                    ),
                    child: Icon(
                      icon,
                      color: accentColor,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        if (subtitle != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text(
                              subtitle!,
                              style: const TextStyle(
                                fontSize: 13,
                                color: AppColors.textMuted,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Content
            if (content != null)
              Padding(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: content,
              ),
            // Actions
            Container(
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: AppColors.border, width: 1),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: actions.map((action) {
                  final isLast = action == actions.last;
                  return Padding(
                    padding: EdgeInsets.only(left: isLast ? AppSpacing.sm : 0),
                    child: _buildActionButton(action),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(ModernDialogAction action) {
    if (action.isPrimary) {
      return _ModernDialogButton(
        label: action.label,
        color: action.color ?? accentColor,
        onPressed: action.onPressed,
        isPrimary: true,
      );
    }
    return _ModernDialogButton(
      label: action.label,
      color: action.color ?? AppColors.textSecondary,
      onPressed: action.onPressed,
      isPrimary: false,
    );
  }
}

class ModernDialogAction {
  final String label;
  final VoidCallback onPressed;
  final bool isPrimary;
  final Color? color;

  const ModernDialogAction({
    required this.label,
    required this.onPressed,
    this.isPrimary = false,
    this.color,
  });
}

class _ModernDialogButton extends StatefulWidget {
  final String label;
  final Color color;
  final VoidCallback onPressed;
  final bool isPrimary;

  const _ModernDialogButton({
    required this.label,
    required this.color,
    required this.onPressed,
    required this.isPrimary,
  });

  @override
  State<_ModernDialogButton> createState() => _ModernDialogButtonState();
}

class _ModernDialogButtonState extends State<_ModernDialogButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.sm + 2,
          ),
          decoration: BoxDecoration(
            color: widget.isPrimary
                ? (_isHovered ? widget.color.withValues(alpha: 0.9) : widget.color)
                : (_isHovered ? widget.color.withValues(alpha: 0.1) : Colors.transparent),
            borderRadius: BorderRadius.circular(AppRadius.md),
          ),
          child: Text(
            widget.label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: widget.isPrimary ? Colors.white : widget.color,
            ),
          ),
        ),
      ),
    );
  }
}

/// Helper pour afficher facilement un ModernDialog
void showModernDialog({
  required BuildContext context,
  required String title,
  String? subtitle,
  required IconData icon,
  required Color accentColor,
  Widget? content,
  required List<ModernDialogAction> actions,
}) {
  showDialog(
    context: context,
    builder: (context) => ModernDialog(
      title: title,
      subtitle: subtitle,
      icon: icon,
      accentColor: accentColor,
      content: content,
      actions: actions,
    ),
  );
}
