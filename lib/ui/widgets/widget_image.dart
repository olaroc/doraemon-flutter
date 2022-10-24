import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var img = const AssetImage('images/avatar.png');
    return Center(
      child: SingleChildScrollView(
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Image>[
              // Image.network(
              //   'https://avatars2.githubusercontent.com/u/20411648?s=460&v=4',
              //   width: 100.0,
              //   height: 100.0,
              // ),
              Image(
                image: img,
                height: 50.0,
                width: 100.0,
                fit: BoxFit.fill,
              ),
              Image(
                image: img,
                height: 50,
                width: 50.0,
                fit: BoxFit.contain,
              ),
              Image(
                image: img,
                width: 100.0,
                height: 50.0,
                fit: BoxFit.cover,
              ),
              Image(
                image: img,
                width: 100.0,
                height: 50.0,
                fit: BoxFit.fitWidth,
              ),
              Image(
                image: img,
                width: 100.0,
                height: 50.0,
                fit: BoxFit.fitHeight,
              ),
              Image(
                image: img,
                width: 100.0,
                height: 50.0,
                fit: BoxFit.scaleDown,
              ),
              Image(
                image: img,
                height: 50.0,
                width: 100.0,
                fit: BoxFit.none,
              ),
              Image(
                image: img,
                width: 100.0,
                color: Colors.blue,
                colorBlendMode: BlendMode.difference,
                fit: BoxFit.fill,
              ),
              Image(
                image: img,
                width: 100.0,
                height: 200.0,
                repeat: ImageRepeat.repeatY,
              )
            ]
                .map((image) =>
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SizedBox(
                        width: 100.0,
                        child: image,
                      ),
                    ),
                    Text(image.fit.toString())
                  ],
                ))
                .toList(),
          ),
      ),
    );
  }
}

void run() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Image widget'),
      ),
      body: const Center(
        child: ImageWidget(),
      ),
    ),
  ));
}
