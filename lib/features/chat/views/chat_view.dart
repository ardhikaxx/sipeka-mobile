import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';

class ChatView extends StatelessWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgApp,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(icon: const Icon(Icons.arrow_back_rounded, color: AppColors.gray900), onPressed: () => Get.back()),
        title: Row(
          children: [
            const CircleAvatar(backgroundColor: AppColors.primaryPale, child: Icon(Icons.person, color: AppColors.primary)),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Bidan Siti', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.gray900)),
                Row(
                  children: [
                    Container(width: 8, height: 8, decoration: const BoxDecoration(color: AppColors.riskGreen, shape: BoxShape.circle)),
                    const SizedBox(width: 4),
                    const Text('Online', style: TextStyle(fontSize: 12, color: AppColors.gray500)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                Center(child: Container(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6), decoration: BoxDecoration(color: AppColors.gray200, borderRadius: BorderRadius.circular(12)), child: const Text('Hari ini', style: TextStyle(fontSize: 12, color: AppColors.gray600)))),
                const SizedBox(height: 24),
                _buildChatBubble('Halo Bidan, saya sering merasa mual akhir-akhir ini padahal sudah masuk trimester 2.', true),
                const SizedBox(height: 16),
                _buildChatBubble('Halo Bu Siti Aisyah. Mual di trimester 2 terkadang masih normal. Pastikan Ibu makan dalam porsi kecil tapi sering ya, dan hindari makanan pedas.', false),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: Colors.white, boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, -5))]),
            child: Row(
              children: [
                Container(padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: AppColors.gray100, shape: BoxShape.circle), child: const Icon(Icons.add_rounded, color: AppColors.gray600)),
                const SizedBox(width: 12),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                    decoration: BoxDecoration(color: AppColors.gray100, borderRadius: BorderRadius.circular(24)),
                    child: const Text('Ketik pesan...', style: TextStyle(color: AppColors.gray500)),
                  ),
                ),
                const SizedBox(width: 12),
                Container(padding: const EdgeInsets.all(12), decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle), child: const Icon(Icons.send_rounded, color: Colors.white)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChatBubble(String text, bool isMe) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        maxWidth: 280,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isMe ? AppColors.primary : Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(20),
            topRight: const Radius.circular(20),
            bottomLeft: isMe ? const Radius.circular(20) : Radius.zero,
            bottomRight: isMe ? Radius.zero : const Radius.circular(20),
          ),
          boxShadow: [if (!isMe) BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 5))],
        ),
        child: Text(text, style: TextStyle(fontSize: 15, color: isMe ? Colors.white : AppColors.gray800, height: 1.4)),
      ),
    );
  }
}
