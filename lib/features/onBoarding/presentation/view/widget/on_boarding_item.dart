
import 'package:flutter/material.dart';

class OnboardingItem {
  final String image;
  final String title;
  final String description;
  final IconData icon;

  OnboardingItem({
    required this.image,
    required this.title,
    required this.description,
    required this.icon,
  });
}

final List<OnboardingItem> onboardingData = [
  OnboardingItem(
    image: 'assets/images/onboarding1 image.png',
    title: 'Discover Egypt with Ease',
    description: 'Explore attractions, hidden gems, and unforgettable experiences all in one place',
    icon: Icons.explore,
  ),
  OnboardingItem(
    image: 'assets/images/onboarding2 image.png',
    title: 'Find What\'s Around You',
    description: 'Get nearby attractions, hotels, and restaurants based on your location',
    icon: Icons.location_on,
  ),
  OnboardingItem(
    image: 'assets/images/onboarding3 image.png',
    title: 'Plan Your Perfect Trip',
    description: 'Save your favorite places, browse trips, and organize your travel experience',
    icon: Icons.route,
  ),
];