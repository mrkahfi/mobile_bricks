part of '../home_screen.dart';

class _SkeletonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      itemBuilder: (context, index) => Container(
        margin: const EdgeInsets.only(top: 16),
        height: 300,
        child: ZeroCard(
          style: const ZeroCardElevatedStyle(
            elevation: 8,
          ),
          child: SkeletonItem(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                      ZeroSkeletonAvatar(
                        style: const SkeletonAvatarStyle(
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: ZeroSkeletonParagraph(
                          style: SkeletonParagraphStyle(
                            lines: 2,
                            spacing: 6,
                            lineStyle: SkeletonLineStyle(
                              randomLength: true,
                              height: 10,
                              borderRadius: BorderRadius.circular(8),
                              minLength: MediaQuery.of(context).size.width / 6,
                              maxLength: MediaQuery.of(context).size.width / 3,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 16),
                  Flexible(
                    child: ZeroSkeletonAvatar(
                      style: const SkeletonAvatarStyle(
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
