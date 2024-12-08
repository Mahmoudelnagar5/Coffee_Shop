class IntroModel {
  final String image;
  final String title;
  final String subTitle;

  const IntroModel({
    required this.image,
    required this.title,
    required this.subTitle,
  });
  static const List<IntroModel> introductionList = [
    IntroModel(
      title: 'Rise and Savor the Coffee',
      subTitle: 'Experience the aroma and flavor like never before.',
      image: 'assets/images/intro1.jpeg',
    ),
    IntroModel(
      title: 'Savor the Moment with Our Coffee',
      subTitle: 'Indulge in our artisanal blends and taste the difference.',
      image: 'assets/images/intro2.jpeg',
    ),
    IntroModel(
      title: 'Elevate Your Coffee Experience',
      subTitle:
          'Discover a world of rich, bold flavors with our premium roasts.',
      image: 'assets/images/intro3.jpeg',
    ),
  ];
}
