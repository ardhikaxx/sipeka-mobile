import 'package:get/get.dart';

class FetalDetailController extends GetxController {
  final currentWeek = 32.obs;
  
  // Mock data for week 32
  final fruitName = 'Terong'.obs;
  final fruitEmoji = '🍆'.obs;
  final length = '42.4 cm'.obs;
  final weight = '1.7 kg'.obs;
  
  final development = 'Paru-paru janin semakin matang. Rambut halus (lanugo) yang menutupi tubuhnya mulai rontok. Janin mulai berlatih membuka dan menutup mata, serta pergerakannya mungkin terasa lebih kuat.'.obs;
  
  final motherSymptoms = 'Anda mungkin sering merasa sesak napas karena rahim yang membesar menekan diafragma. Sering buang air kecil dan nyeri punggung juga merupakan keluhan umum di trimester ketiga ini.'.obs;
}
