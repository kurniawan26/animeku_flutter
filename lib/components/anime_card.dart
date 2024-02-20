import 'package:anime_ku/components/text.dart';
import 'package:flutter/material.dart';

class AnimeCard extends StatelessWidget {
  final String animeName;
  final String animeImage;

  const AnimeCard({
    Key? key,
    required this.animeName,
    required this.animeImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            width: 150,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: NetworkImage(
                  animeImage,
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(
                        text: animeName,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        maxWidth: 100, // Set maxWidth to 100
                        maxLines: 2, // Set maxLines to 2
                      ),
                    ],
                  ),
                ),
              ],
            )),
        const SizedBox(
          width: 10,
        )
      ],
    );
  }
}
