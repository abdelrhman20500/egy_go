import 'package:egy_go/Core/utilities/styles.dart';
import 'package:egy_go/features/auth/presentation/view/login_view.dart';
import 'package:egy_go/features/onBoarding/presentation/view/widget/on_boarding_item.dart';
import 'package:egy_go/features/onBoarding/presentation/view/widget/wave_clipper.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnBoardingView> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: onboardingData.length,
            onPageChanged: (index) {
              setState(() => currentIndex = index);
            },
            itemBuilder: (context, index) {
              return Image.asset(
                onboardingData[index].image,
                fit: BoxFit.cover,
                width: size.width,
                height: size.height,
              );
            },
          ),
          Positioned(
            top: 50,
            right: 20,
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginView()),
                );
              },
              child: Text('skip', style: Styles.style20),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ClipPath(
              clipper: WaveClipper(),
              child: Container(
                width: double.infinity,
                color: const Color(0xFFFFF8F0),
                padding: const EdgeInsets.fromLTRB(24, 50, 24, 30),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 56,
                      width: 56,
                      decoration: BoxDecoration(
                        color: const Color(0xFF0B3D2E),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xFFC8A84B),
                          width: 2,
                        ),
                      ),
                      child: Icon(
                        onboardingData[currentIndex].icon,
                        color: const Color(0xFFC8A84B),
                        size: 28,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      onboardingData[currentIndex].title,
                      textAlign: TextAlign.center,
                      style: Styles.style22,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      onboardingData[currentIndex].description,
                      textAlign: TextAlign.center,
                      style: Styles.style14,
                    ),
                    const SizedBox(height: 24),
                    SmoothPageIndicator(
                      controller: _controller,
                      count: onboardingData.length,
                      effect: const WormEffect(
                        activeDotColor: Color(0xFF0B3D2E),
                        dotColor: Color(0xFFD9D9D9),
                        dotHeight: 8,
                        dotWidth: 8,
                        spacing: 8,
                      ),
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        onPressed: () {
                          if (currentIndex == onboardingData.length - 1) {
                            // Get Started → Home
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginView(),
                              ),
                            );
                          } else {
                            _controller.nextPage(
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeInOut,
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFC8A84B),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          currentIndex == onboardingData.length - 1
                              ? 'Get started'
                              : 'Next',
                          style: Styles.style20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
