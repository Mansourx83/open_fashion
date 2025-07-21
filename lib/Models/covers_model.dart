class CoversModel {
  final String image;
  final String title;

  CoversModel({required this.image, required this.title});
  static List<CoversModel> covers = [
    CoversModel(image: 'assets/cover/cover3.png', title: 'Black collection'),
    CoversModel(image: 'assets/cover/cover2.png', title: 'Ikhtain Collectio'),
    CoversModel(image: 'assets/cover/cover1.png', title: 'Women In Black  '),
  ];
}
