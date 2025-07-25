import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:open_fashion/Screens/checkout.dart';
import '../Models/product_model.dart';
import '../Components/custom_text.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  List<ProductModel> _results = [];

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onSearch(String value) {
    setState(() {
      final query = value.trim().toLowerCase();
      if (query.isEmpty) {
        _results = [];
      } else {
        _results = ProductModel.products.where((product) {
          final name = product.name.toLowerCase();
          return name == query || name.startsWith(query);
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: true,
        title: Container(
          height: 44,
          child: TextField(
            controller: _controller,
            focusNode: _focusNode,
            decoration: InputDecoration(
              hintText: 'Search',
              filled: true,
              fillColor: _focusNode.hasFocus
                  ? Colors.transparent
                  : Colors.grey.shade200,
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                  color: _focusNode.hasFocus
                      ? Colors.black
                      : Colors.grey.shade300,
                  width: 1.5,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.black, width: 2),
              ),
              prefixIcon: Icon(Icons.search, color: Colors.black),
            ),
            style: TextStyle(color: Colors.black),
            onChanged: _onSearch,
          ),
        ),
      ),
      body: Column(
        children: [
          Gap(40),
          Expanded(
            child: _controller.text.isEmpty
                ? Center(
                    child: Image.asset('assets/vec/Searching.gif', height: 400),
                  )
                : _results.isEmpty
                ? Center(
                    child: Image.asset(
                      'assets/vec/no_products.png',
                      height: 320,
                    ),
                  )
                : GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 0,
                          crossAxisSpacing: 15,
                          childAspectRatio: 0.50,
                        ),
                    itemCount: _results.length,
                    itemBuilder: (context, index) {
                      final item = _results[index];
                      return GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return Checkout(
                                name: item.name,
                                image: item.image,
                                price: item.price,
                                description: item.description,
                              );
                            },
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(item.image),
                            SizedBox(height: 10),
                            CustomText(text: item.name, color: Colors.black),
                            CustomText(
                              text: item.description,
                              size: 12,
                              color: Colors.grey,
                            ),
                            CustomText(
                              text: "\$ ${item.price.toString()}",
                              color: const Color.fromARGB(189, 239, 154, 154),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
