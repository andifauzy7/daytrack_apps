import 'package:daytrack_apps/gen/colors.gen.dart';
import 'package:daytrack_apps/gen/fonts.gen.dart';
import 'package:daytrack_apps/shared/calculate_size.dart';
import 'package:flutter/material.dart';

class TimelineNewsCard extends StatelessWidget {
  const TimelineNewsCard({
    Key? key,
    required this.onPressed,
    required this.title,
    required this.desc,
    required this.urlImage,
  }) : super(key: key);

  final String title;
  final String desc;
  final String urlImage;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: CalculateSize.getHeight(10),
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: CalculateSize.getHeight(132),
            decoration: BoxDecoration(
              color: ColorFamily.tealPrimary,
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(urlImage),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: CalculateSize.getWidth(13),
              vertical: CalculateSize.getHeight(10),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.subtitle2!.copyWith(
                              fontWeight: FontWeight.w600,
                              fontFamily: FontFamily.montserrat,
                              color: ColorFamily.blackPrimary,
                            ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        desc,
                        style: Theme.of(context).textTheme.caption!.copyWith(
                              fontWeight: FontWeight.w500,
                              color: ColorFamily.greyPrimary,
                            ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: CalculateSize.getWidth(40),
                  height: CalculateSize.getWidth(40),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  child: InkWell(
                    onTap: onPressed,
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
