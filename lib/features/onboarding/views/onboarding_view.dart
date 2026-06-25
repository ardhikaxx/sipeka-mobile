import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/onboarding_controller.dart';
import '../../../core/theme/app_colors.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OnboardingController());
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Elegant abstract background
          Positioned(
            top: -150, right: -50,
            child: Container(
              width: 300, height: 300,
              decoration: BoxDecoration(shape: BoxShape.circle, gradient: RadialGradient(colors: [AppColors.primary.withOpacity(0.15), Colors.transparent])),
            ),
          ),
          
          SafeArea(
            child: Column(
              children: [
                // Top Skip Button
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextButton(
                      onPressed: controller.skip,
                      style: TextButton.styleFrom(foregroundColor: AppColors.gray500),
                      child: const Text('Lewati', style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                
                // Pages
                Expanded(
                  child: PageView.builder(
                    controller: controller.pageController,
                    onPageChanged: controller.onPageChanged,
                    physics: const BouncingScrollPhysics(),
                    itemCount: controller.onboardingData.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(40),
                              decoration: BoxDecoration(
                                color: AppColors.primaryLight.withOpacity(0.2),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                _getIcon(controller.onboardingData[index]['icon']!),
                                size: 100,
                                color: AppColors.primary,
                              ),
                            ),
                            const SizedBox(height: 60),
                            Text(
                              controller.onboardingData[index]['title']!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w900, color: AppColors.gray900, height: 1.2),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              controller.onboardingData[index]['description']!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 16, color: AppColors.gray600, height: 1.6),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                
                // Bottom Controls
                Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Dots
                      Obx(() => Row(
                        children: List.generate(
                          controller.onboardingData.length,
                          (index) => AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.only(right: 8),
                            height: 8,
                            width: controller.currentPage.value == index ? 24 : 8,
                            decoration: BoxDecoration(
                              color: controller.currentPage.value == index ? AppColors.primary : AppColors.gray300,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      )),
                      
                      // Next / Start Button
                      Obx(() {
                        final isLastPage = controller.currentPage.value == controller.onboardingData.length - 1;
                        return InkWell(
                          onTap: controller.next,
                          borderRadius: BorderRadius.circular(isLastPage ? 20 : 30),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            height: 60,
                            width: isLastPage ? 140 : 60,
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(isLastPage ? 20 : 30),
                              boxShadow: [
                                BoxShadow(color: AppColors.primary.withOpacity(0.4), blurRadius: 15, offset: const Offset(0, 8))
                              ],
                            ),
                            child: isLastPage 
                                ? const Center(child: Text('Mulai', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)))
                                : const Icon(Icons.arrow_forward_rounded, color: Colors.white, size: 28),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  IconData _getIcon(String name) {
    switch (name) {
      case 'pregnant_woman':
        return Icons.pregnant_woman_rounded;
      case 'medical_services':
        return Icons.medical_services_rounded;
      case 'folder_special':
        return Icons.folder_special_rounded;
      default:
        return Icons.star_rounded;
    }
  }
}
