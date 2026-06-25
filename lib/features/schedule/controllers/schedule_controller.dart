import 'package:get/get.dart';

class ScheduleController extends GetxController {
  final selectedDate = DateTime.now().obs;
  final focusedDate = DateTime.now().obs;
}
