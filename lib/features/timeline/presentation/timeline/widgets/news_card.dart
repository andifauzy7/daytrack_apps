import 'package:daytrack_apps/gen/colors.gen.dart';
import 'package:daytrack_apps/gen/fonts.gen.dart';
import 'package:daytrack_apps/shared/calculate_size.dart';
import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    Key? key,
    required this.index,
    required this.onPressed,
  }) : super(key: key);

  final int index;
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
            decoration: const BoxDecoration(
              color: ColorFamily.tealPrimary,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://kabarjombang.com/wp-content/uploads/2023/01/handphone.jpg'),
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
                        'Daftar Aplikasi Bikin Boros Baterai Ponsel - Kabar Jombang',
                        style: Theme.of(context).textTheme.subtitle2!.copyWith(
                              fontWeight: FontWeight.w600,
                              fontFamily: FontFamily.montserrat,
                              color: ColorFamily.blackPrimary,
                            ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        'JOMBANG, KabarJombang.com - Sejumlah aplikasi yang umum digunakan publik ternyata menguras baterai handphone atau ponsel. Apa saja aplikasinya? Daftar',
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
