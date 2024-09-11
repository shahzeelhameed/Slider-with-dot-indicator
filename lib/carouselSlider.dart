import 'package:flutter/material.dart';

class SliderExample extends StatefulWidget {
  const SliderExample({super.key});

  @override
  State<SliderExample> createState() => _SliderState();
}

class _SliderState extends State<SliderExample> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Carousel Slider"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 200,
            child: PageView(
              onPageChanged: (value) {
                setState(() {
                  _currentIndex = value;
                });
              },
              children: const [
                CarouselCard(
                  imageUrl:
                      "https://static.vecteezy.com/system/resources/previews/025/220/125/non_2x/picture-a-captivating-scene-of-a-tranquil-lake-at-sunset-ai-generative-photo.jpg",
                ),
                CarouselCard(
                  imageUrl:
                      "https://media.istockphoto.com/id/1821704693/photo/aerial-top-view-of-green-trees-in-forest-drone-view-of-dense-green-tree-captures-co2-green.jpg?s=2048x2048&w=is&k=20&c=FpkarNb8VCH34kSWRZx8pc7zt1-L1toORjUeBj0RYB0=",
                ),
                CarouselCard(
                  imageUrl:
                      "https://cdn.pixabay.com/photo/2024/05/26/10/15/bird-8788491_1280.jpg",
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Centering the dot indicator using ListView.builder
          SizedBox(
            height: 20,
            child: DotIndicator(
              currentIndex: _currentIndex,
              itemCount: 3, // Number of slides
            ),
          ),
        ],
      ),
    );
  }
}

class CarouselCard extends StatelessWidget {
  const CarouselCard({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    super.key,
    required this.currentIndex,
    required this.itemCount,
  });

  final int currentIndex;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 5),
          height: currentIndex == index ? 20 : 10,
          width: currentIndex == index ? 20 : 10,
          decoration: BoxDecoration(
              color: currentIndex == index ? Colors.purple : Colors.grey,
              shape: BoxShape.circle),
        );
      },
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
    );
  }
}
