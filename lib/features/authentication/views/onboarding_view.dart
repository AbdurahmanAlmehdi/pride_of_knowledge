import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prideofknowledge/constants/colors.dart';
import 'package:prideofknowledge/constants/image_strings.dart';
import 'package:prideofknowledge/constants/sizes.dart';
import 'package:prideofknowledge/constants/text_strings.dart';
import 'package:prideofknowledge/features/authentication/providers/onboarding_provider.dart';
import 'package:prideofknowledge/features/authentication/services/bloc/auth_bloc.dart';
import 'package:prideofknowledge/features/authentication/services/bloc/auth_event.dart';
import 'package:prideofknowledge/features/authentication/views/widgets/onboarding_page.dart';
import 'package:prideofknowledge/utilities/helper/helper_functions.dart';
import 'package:prideofknowledge/utilities/theme/widget_themes/text_theme.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends ConsumerWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AColors.primary,
      body: Stack(
        children: [
          PageView(
            onPageChanged: (index) {
              ref.read(onboardingProvider.notifier).updatePageIndicator(index);
            },
            controller: ref.read(onboardingProvider.notifier).pageController,
            children: const [
              OnBoardingPage(
                image: AImages.onBoardingImage1,
                title: ATexts.onBoardingTitle1,
                subtitle: ATexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: AImages.onBoardingImage2,
                title: ATexts.onBoardingTitle2,
                subtitle: ATexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: AImages.onBoardingImage3,
                title: ATexts.onBoardingTitle3,
                subtitle: ATexts.onBoardingSubTitle3,
              ),
            ],
          ),
          Positioned(
            right: ASizes.defaultSpace,
            bottom: AHelperFunctions.getBottomNavigationBarHeight(),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: AColors.buttonSecondary),
              height: 50,
              width: 50,
              child: IconButton(
                color: AColors.buttonPrimary,
                onPressed: () {
                  final bool lastScreen = ref.read(onboardingProvider) == 2;
                  if (lastScreen) {
                    context.read<AuthBloc>().add(const AuthEventLogOut());
                  } else {
                    ref
                        .read(onboardingProvider.notifier)
                        .nextButtonNavigation();
                  }
                },
                icon: const Icon(Icons.arrow_forward_ios_sharp),
              ),
            ),
          ),
          Positioned(
            bottom: AHelperFunctions.getBottomNavigationBarHeight(),
            left: 20,
            child: SmoothPageIndicator(
              effect: const ExpandingDotsEffect(
                  activeDotColor: AColors.textSecondary, dotHeight: 6),
              onDotClicked: (index) {
                ref.read(onboardingProvider.notifier).dotNavigationClick(index);
              },
              controller: ref.read(onboardingProvider.notifier).pageController,
              count: 3,
            ),
          ),
          Positioned(
            top: AHelperFunctions.getAppBarHeight(),
            right: 20,
            child: TextButton(
              onPressed: () {
                ref.read(onboardingProvider.notifier).skipNavigation();
              },
              child: Text(
                'Skip',
                style: ATextTheme.buttonText
                    .copyWith(color: AColors.textSecondary),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
