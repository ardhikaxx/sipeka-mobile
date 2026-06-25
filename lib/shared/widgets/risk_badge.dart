import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

enum RiskLevel { low, warning, high, critical }

class RiskBadge extends StatelessWidget {
  final RiskLevel level;

  const RiskBadge({Key? key, required this.level}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color textColor; Color bgColor; Color borderColor; String label;

    switch (level) {
      case RiskLevel.low:
        textColor = const Color(0xFF0D7A35); bgColor = AppColors.riskGreenBg; borderColor = AppColors.riskGreenBorder; label = "Risiko Rendah"; break;
      case RiskLevel.warning:
        textColor = const Color(0xFF9A6202); bgColor = AppColors.riskYellowBg; borderColor = AppColors.riskYellowBorder; label = "Waspada"; break;
      case RiskLevel.high:
        textColor = const Color(0xFFC41212); bgColor = AppColors.riskRedBg; borderColor = AppColors.riskRedBorder; label = "Preeklampsia"; break;
      case RiskLevel.critical:
        textColor = AppColors.riskCritical; bgColor = AppColors.riskCriticalBg; borderColor = AppColors.riskCriticalBorder; label = "Eklampsia"; break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(20), border: Border.all(color: borderColor)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(width: 7, height: 7, decoration: BoxDecoration(color: textColor, shape: BoxShape.circle)),
          const SizedBox(width: 6),
          Text(label, style: TextStyle(color: textColor, fontSize: 12, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
