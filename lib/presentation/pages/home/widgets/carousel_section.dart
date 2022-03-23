import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../core/utils/resources.dart';

class CarouselSection extends StatelessWidget {
  const CarouselSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: PhysicalModel(
          color: Colors.transparent,
          clipBehavior: Clip.hardEdge,
          borderRadius: BorderRadius.circular(16),
          child: SizedBox(
            height: 200,
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Swiper.children(
                  autoplay: true,
                  autoplayDelay: 5000,
                  scrollDirection: Axis.vertical,
                  children: [
                    WeatherWidget(
                      value: '0°',
                      city: 'New York',
                      description: 'Snowing',
                      background: Colors.blue,
                      animationPath: LottieAnimations.heavySnow,
                      height: constraints.maxHeight,
                      width: constraints.maxWidth,
                    ),
                    WeatherWidget(
                      value: '8°',
                      city: 'Buenos Aires',
                      description: 'Thunderstorm',
                      background: Colors.black,
                      animationPath: LottieAnimations.stormshowersday,
                      height: constraints.maxHeight,
                      width: constraints.maxWidth,
                    ),
                  ],
                  pagination: const SwiperPagination(
                    builder: SwiperPagination.dots,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class WeatherWidget extends StatelessWidget {
  final String city;
  final String value;
  final String description;
  final double width;
  final double height;
  final String animationPath;
  final Color background;

  const WeatherWidget({
    Key? key,
    required this.width,
    required this.height,
    required this.city,
    required this.value,
    required this.animationPath,
    required this.description,
    required this.background,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(
      children: [
        Container(
          color: background.withOpacity(0.8),
        ),
        Positioned(
          top: 60,
          left: 80,
          child: Lottie.asset(
            animationPath,
            height: 100,
            width: MediaQuery.of(context).size.width,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    city,
                    style: theme.textTheme.headline6
                        ?.copyWith(color: Colors.white),
                  ),
                  const SizedBox(width: 6),
                  const Icon(
                    Icons.near_me,
                    color: Colors.white,
                    size: 14,
                  )
                ],
              ),
              Text(
                value,
                style: theme.textTheme.headline2?.copyWith(color: Colors.white),
              ),
              const Spacer(),
              Text(
                description,
                style: theme.textTheme.headline5?.copyWith(color: Colors.white),
              ),
            ],
          ),
        )
      ],
    );
  }
}
