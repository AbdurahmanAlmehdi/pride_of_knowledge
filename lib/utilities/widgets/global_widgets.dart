import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prideofknowledge/constants/image_strings.dart';
import 'package:prideofknowledge/features/course_detail/services/controllers/creator_info_controller.dart';

class Tile extends StatelessWidget {
  final double? height;
  final Widget? child;
  const Tile({super.key, this.height = 120, this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 2.5,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: double.infinity,
          height: height,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: child,
        ),
      ),
    );
  }
}

enum CreatorInfoType { name, specialaty, image }

class CreatorInfo extends ConsumerWidget {
  final String creatorId;
  final CreatorInfoType infoType;
  final TextStyle? style;
  final int? maxLines;
  final double? height;
  final double? width;
  final BoxFit? boxFit;
  final TextOverflow? overflow;
  final bool addSpace;

  const CreatorInfo(
      {this.height,
      this.width,
      this.boxFit,
      this.style,
      this.maxLines,
      this.overflow,
      this.addSpace = false,
      required this.creatorId,
      required this.infoType,
      super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final creator = ref.watch(creatorInfoControllerProvider(creatorId));
    return creator.when(
      data: (data) => switch (infoType) {
        CreatorInfoType.name => Text(
            addSpace ? '${data.name}   ' : data.name,
            style: style,
            overflow: overflow,
            textAlign: TextAlign.center,
          ),
        CreatorInfoType.specialaty => Text(
            data.specialty,
            style: style,
            maxLines: maxLines,
          ),
        CreatorInfoType.image => Image.network(
            data.image,
            fit: boxFit,
            width: width,
            height: height,
          ),
      },
      error: (error, stackTrace) => switch (infoType) {
        CreatorInfoType.name => const Text('Error'),
        CreatorInfoType.specialaty => const Text('Error'),
        CreatorInfoType.image => Image.asset(
            AImages.error,
            fit: boxFit,
            width: width,
            height: height,
          ),
      },
      loading: () => Container(),
    );
  }
}
