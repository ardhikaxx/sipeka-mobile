import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class VitalCard extends StatelessWidget {
  final String title; final String value; final String unit; final IconData icon; final Color iconColor; final bool isWarning; final String trendMessage; final VoidCallback? onTap;

  const VitalCard({
    Key? key, required this.title, required this.value, required this.unit, required this.icon, required this.iconColor, this.isWarning = false, this.trendMessage = '', this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14), border: Border.all(color: AppColors.gray200), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 6, offset: const Offset(0, 3))]),
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 16, color: iconColor),
              const SizedBox(width: 6),
              Text(title.toUpperCase(), style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.gray500, letterSpacing: 0.5)),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.baseline, textBaseline: TextBaseline.alphabetic,
            children: [
              Text(value, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w800, color: AppColors.gray900)),
              const SizedBox(width: 4),
              Text(unit, style: const TextStyle(fontSize: 12, color: AppColors.gray500)),
            ],
          ),
          if (trendMessage.isNotEmpty) ...[
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(isWarning ? Icons.arrow_upward : Icons.arrow_downward, size: 14, color: isWarning ? AppColors.riskYellow : AppColors.riskGreen),
                const SizedBox(width: 4),
                Expanded(child: Text(trendMessage, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 11, color: isWarning ? const Color(0xFF92400E) : AppColors.gray500))),
              ],
            ),
          ]
        ],
      ),
    );
  }
}
