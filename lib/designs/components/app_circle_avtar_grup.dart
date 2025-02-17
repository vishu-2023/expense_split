import 'package:flutter/material.dart';
import 'package:split_expense/designs/components/select_images.dart';
import 'package:split_expense/utils/app_colors.dart';

class UserAvatarGroups extends StatelessWidget {
  final List<String> imageUrls;
  final double maxRadius;
  final double minRadius;
  final double overlapFactor;
  final double maxWidth;

  const UserAvatarGroups({
    super.key,
    required this.imageUrls,
    this.maxRadius = 18.0,
    this.minRadius = 10.0,
    this.overlapFactor = 0.5,
    this.maxWidth = 200.0,
  });

  @override
  Widget build(BuildContext context) {
    int count = imageUrls.length;

    // Ensure at least 1 avatar
    if (count == 0) return const SizedBox.shrink();

    // Calculate the max possible width at full size
    double fullSizeWidth =
        count > 1 ? maxRadius * 2 + (count - 1) * maxRadius * overlapFactor * 2 : maxRadius * 2;

    // Dynamically adjust avatar radius if it exceeds maxWidth
    double avatarRadius = fullSizeWidth > maxWidth
        ? (maxWidth / ((count - 1) * overlapFactor * 2 + 2)).clamp(minRadius, maxRadius)
        : maxRadius;

    // Calculate the actual width required
    double totalWidth = count > 1
        ? avatarRadius * 2 + (count - 1) * avatarRadius * overlapFactor * 2
        : avatarRadius * 2;

    return SizedBox(
      height: avatarRadius * 2,
      width: totalWidth,
      child: Stack(
        children: List.generate(count, (index) {
          return Positioned(
            left: index * avatarRadius * overlapFactor * 2,
            child: CircleAvatar(
              radius: avatarRadius,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                backgroundColor: surface,
                radius: avatarRadius - 2,
                // backgroundImage: AssetImage(imageUrls[index]),
                child: ClipOval(child: selectIcon(imageUrls[index])),
              ),
            ),
          );
        }),
      ),
    );
  }
}
