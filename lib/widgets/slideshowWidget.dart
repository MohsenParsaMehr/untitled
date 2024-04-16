import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:untitled/utilities/settings.dart';

class SlideShowWidget extends StatelessWidget {
  const SlideShowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: ImageSlideshow(
          /// Width of the [ImageSlideshow].
          width: double.infinity,

          /// Height of the [ImageSlideshow].
          height: 200,

          /// The page to show when first creating the [ImageSlideshow].
          initialPage: 0,

          /// The color to paint the indicator.
          indicatorColor: Colors.blue,

          /// The color to paint behind th indicator.
          indicatorBackgroundColor: Colors.grey,

          /// Called whenever the page in the center of the viewport changes.
          onPageChanged: (value) {
            //print('Page changed: $value');
          },

          /// Auto scroll interval.
          /// Do not auto scroll with null or 0.
          autoPlayInterval: 3000,

          /// Loops back to first slide.
          isLoop: true,

          /// The widgets to display in the [ImageSlideshow].
          /// Add the sample image file into the images folder
          children: [
            // CachedNetworkImage(
            //   alignment: Alignment.topCenter,
            //   imageUrl:
            //       "${Settings.protocol}://${Settings.baseUrl}/images/logo.jpg",
            //   errorWidget: (context, url, error) => const Icon(Icons.error),
            //   imageBuilder: (context, imageProvider) {
            //     return Ink.image(
            //         image: imageProvider,
            //         //fit: BoxFit.contain,
            //         width: 480,
            //         height: 260);
            //   },
            //   placeholder: (context, url) => const CircularProgressIndicator(),
            // ),
            Image.asset(
              'assets/images/hazrat.png',
              errorBuilder: (ctx, error, stackTrace) =>
                  const FlutterLogo() /*Image.asset('fallback.png')*/,
              width: 480,
              height: 260,
              //fit: BoxFit.cover,
            ),
            Image.asset(
              'assets/images/library.png',
              errorBuilder: (ctx, error, stackTrace) => const FlutterLogo(),
              width: 480,
              height: 260,
              //fit: BoxFit.cover,
            ),
            Image.asset('assets/images/speeches.png',
                errorBuilder: (ctx, error, stackTrace) => const FlutterLogo()
                //fit: BoxFit.cover,
                ),
          ],
        ));
  }
}
