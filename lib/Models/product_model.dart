class ProductModel {
  final String name;
  final String image;
  final double price;
  final String description;

  ProductModel({
    required this.name,
    required this.image,
    required this.price,
    required this.description,
  });

 static List<ProductModel> products = [
    ProductModel(
      name: "Black Boots",
      image: "assets/product/product1.png",
      price: 199.99,
      description:
          "A pair of stylish and durable black boots, perfect for both casual and semi-formal occasions. Made with high-quality leather for long-lasting comfort and support.",
    ),
    ProductModel(
      name: "Earrings",
      image: "assets/product/product2.png",
      price: 49.99,
      description:
          "Chic and elegant earrings designed to enhance any look. Suitable for daily wear or special occasions, these earrings provide the perfect balance of style and comfort.",
    ),
    ProductModel(
      name: "Women's Rings",
      image: "assets/product/product3.png",
      price: 79.99,
      description:
          "A selection of sophisticated women's rings crafted with precision. These rings feature unique designs that can be paired with both formal and casual outfits.",
    ),
    ProductModel(
      name: "Gold Ring from Lazurde",
      image: "assets/product/product4.png",
      price: 249.99,
      description:
          "An exquisite gold ring from Lazurde, renowned for its luxurious design. The ring features a timeless aesthetic, making it a perfect gift or a prized addition to any jewelry collection.",
    ),
    ProductModel(
      name: "Diamond Ring from Lazurde",
      image: "assets/product/product5.png",
      price: 799.99,
      description:
          "A stunning diamond ring from Lazurde, designed to sparkle with unmatched brilliance. Crafted for special occasions, this ring features high-quality diamonds set in a premium gold band.",
    ),
    ProductModel(
      name: "Women's Abaya",
      image: "assets/product/product6.png",
      price: 129.99,
      description:
          "An elegant and stylish women's abaya, perfect for formal gatherings or casual wear. This abaya is made from soft, breathable fabric, offering comfort and grace for any occasion.",
    ),
  ];
}
