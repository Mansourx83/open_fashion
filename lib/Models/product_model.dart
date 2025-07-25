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
      name: "Blouse",
      image: "assets/product/product9.png",
      price: 39.99,
      description:
          "A sophisticated blouse with a modern design. Features a comfortable fit and elegant style, making it ideal for both business and casual wear.",
    ),
    ProductModel(
      name: "Women's Abaya",
      image: "assets/product/product6.png",
      price: 129.99,
      description:
          "An elegant women's abaya suitable for any occasion. This abaya is made with soft, breathable fabric that provides comfort while maintaining a sophisticated look. Perfect for formal gatherings or casual wear, offering both style and modesty.",
    ),
    ProductModel(
      name: "Diamond Ring ",
      image: "assets/product/product5.png",
      price: 799.99,
      description:
          "A premium diamond ring from Lazurde for special occasions. The ring is crafted from high-quality materials and features a brilliant diamond that catches the light from every angle. It is a symbol of elegance and prestige, making it a perfect choice for engagements, anniversaries, or other significant milestones.",
    ),
    ProductModel(
      name: "Jacket",
      image: "assets/product/product7.png",
      price: 159.99,
      description:
          "A stylish classic jacket perfect for daily use. Crafted with premium materials, it offers both elegance and practicality for any occasion.",
    ),
    ProductModel(
      name: "Coat",
      image: "assets/product/product10.png",
      price: 189.99,
      description:
          "A warm and stylish coat, perfect for cold weather. Made from high-quality materials to ensure comfort and durability while keeping you fashionable.",
    ),
    ProductModel(
      name: "Gold Ring ",
      image: "assets/product/product4.png",
      price: 249.99,
      description:
          "A luxurious gold ring from Lazurde with a fine design. The intricate craftsmanship of the ring makes it a perfect gift for your loved ones. The smooth finish and the rich gold color add an elegant touch to any outfit, making it ideal for special occasions.",
    ),
    ProductModel(
      name: "Tank Top",
      image: "assets/product/product8.png",
      price: 299.99,
      description:
          "A soft and elegant tank top that adds a touch of style to any outfit. Lightweight and comfortable, suitable for all seasons.",
    ),
    ProductModel(
      name: "Women's Rings",
      image: "assets/product/product3.png",
      price: 79.99,
      description:
          "A variety of stylish and elegant rings for women. These rings are designed to add a subtle, yet chic, touch to any outfit. Whether you're looking for something understated or a bold statement piece, these rings offer a range of styles that suit every occasion and personality.",
    ),
    ProductModel(
      name: "Earrings",
      image: "assets/product/product2.png",
      price: 49.99,
      description:
          "Elegant earrings for women that match any look. These earrings are designed to provide both charm and elegance, featuring a delicate balance of simplicity and class. Perfect for adding a touch of sophistication to both casual and formal outfits.",
    ),
    ProductModel(
      name: "Black Boots",
      image: "assets/product/product1.png",
      price: 199.99,
      description:
          "Elegant and practical black boots for daily wear. Made from high-quality leather, these boots offer both durability and comfort. They feature a timeless design that works well with both casual and semi-formal attire, making them an essential part of any wardrobe.",
    ),
  ];
}
