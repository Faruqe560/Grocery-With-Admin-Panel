import 'package:flutter/cupertino.dart';
import 'package:fshop2/models/products_model.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> get getProducts {
    return _productsList;
  }

  List<ProductModel> get getOnsaleProducts {
    return _productsList.where((element) => element.isOnSale).toList();
  }

  ProductModel findProductById(String productId) {
    return _productsList.firstWhere((element) => element.id == productId);
  }

  List<ProductModel> findByCategory(String categoryName) {
    List<ProductModel> _categoryList = _productsList
        .where((element) => element.productCategoryName
            .toLowerCase()
            .contains(categoryName.toLowerCase()))
        .toList();
    return _categoryList;
  }

  static final List<ProductModel> _productsList = [
    ProductModel(
      id: "1",
      title: "fruits1",
      imgUrl: "https://i.ibb.co/9VKXw5L/Avocat.png",
      productCategoryName: "fruits",
      price: 0.99,
      salePrice: 59,
      isOnSale: false,
      isPiece: true,
    ),
    ProductModel(
      id: "2",
      title: "fruits2",
      imgUrl: "https://i.ibb.co/bbjvgcD/spinach.png",
      productCategoryName: "fruits",
      price: 20,
      salePrice: 11,
      isOnSale: true,
      isPiece: false,
    ),
    ProductModel(
      id: "3",
      title: "fruits3",
      imgUrl: "https://i.ibb.co/c8QtSr2/almand.png",
      productCategoryName: "fruits",
      price: 12,
      salePrice: 11,
      isOnSale: false,
      isPiece: true,
    ),
    ProductModel(
      id: "4",
      title: "fruits4",
      imgUrl: "https://www.pngmart.com/files/22/Nut-PNG.png",
      productCategoryName: "fruits",
      price: 199,
      salePrice: 111,
      isOnSale: false,
      isPiece: false,
    ),
    ProductModel(
      id: "5",
      title: "vegetable1",
      imgUrl: "https://i.ibb.co/F0s3FHQ/Apricots.png",
      productCategoryName: "Vegetables",
      price: 33,
      salePrice: 30,
      isOnSale: true,
      isPiece: true,
    ),
    ProductModel(
      id: "6",
      title: "vegetable2",
      imgUrl:
          "https://e1.pngegg.com/pngimages/338/516/png-clipart-autumn-variety-of-nuts.png",
      productCategoryName: "Vegetables",
      price: 12,
      salePrice: 11,
      isOnSale: false,
      isPiece: false,
    ),
    ProductModel(
      id: "7",
      title: "vegetable3",
      imgUrl: "https://i.ibb.co/F0s3FHQ/Apricots.png",
      productCategoryName: "Vegetables",
      price: 12,
      salePrice: 11,
      isOnSale: false,
      isPiece: false,
    ),
    ProductModel(
      id: "8",
      title: "vegetable4",
      imgUrl: "https://i.ibb.co/F0s3FHQ/Apricots.png",
      productCategoryName: "Vegetables",
      price: 12,
      salePrice: 11,
      isOnSale: false,
      isPiece: false,
    ),
    ProductModel(
      id: "9",
      title: "Herbs1",
      imgUrl: "https://i.ibb.co/F0s3FHQ/Apricots.png",
      productCategoryName: "Herbs",
      price: 12,
      salePrice: 11,
      isOnSale: true,
      isPiece: false,
    ),
    ProductModel(
      id: "10",
      title: "Herbs2",
      imgUrl: "https://i.ibb.co/F0s3FHQ/Apricots.png",
      productCategoryName: "Herbs",
      price: 12,
      salePrice: 11,
      isOnSale: false,
      isPiece: false,
    ),
    ProductModel(
      id: "11",
      title: "Herbs3",
      imgUrl: "https://i.ibb.co/F0s3FHQ/Apricots.png",
      productCategoryName: "Herbs",
      price: 12,
      salePrice: 11,
      isOnSale: false,
      isPiece: false,
    ),
    ProductModel(
      id: "12",
      title: "Herbs4",
      imgUrl: "https://i.ibb.co/F0s3FHQ/Apricots.png",
      productCategoryName: "Herbs",
      price: 12,
      salePrice: 11,
      isOnSale: false,
      isPiece: false,
    ),
    ProductModel(
      id: "13",
      title: "Nuts1",
      imgUrl: "https://i.ibb.co/F0s3FHQ/Apricots.png",
      productCategoryName: "Muts",
      price: 12,
      salePrice: 11,
      isOnSale: true,
      isPiece: false,
    ),
    ProductModel(
      id: "14",
      title: "Nuts2",
      imgUrl: "https://i.ibb.co/F0s3FHQ/Apricots.png",
      productCategoryName: "Muts",
      price: 12,
      salePrice: 11,
      isOnSale: false,
      isPiece: false,
    ),
    ProductModel(
      id: "15",
      title: "Nuts3",
      imgUrl: "https://i.ibb.co/F0s3FHQ/Apricots.png",
      productCategoryName: "Muts",
      price: 12,
      salePrice: 11,
      isOnSale: false,
      isPiece: false,
    ),
    ProductModel(
      id: "16",
      title: "Nuts4",
      imgUrl: "https://i.ibb.co/F0s3FHQ/Apricots.png",
      productCategoryName: "Muts",
      price: 12,
      salePrice: 11,
      isOnSale: false,
      isPiece: false,
    ),
    ProductModel(
      id: "17",
      title: "Spices1",
      imgUrl: "https://i.ibb.co/F0s3FHQ/Apricots.png",
      productCategoryName: "Spices",
      price: 12,
      salePrice: 11,
      isOnSale: true,
      isPiece: false,
    ),
    ProductModel(
      id: "18",
      title: "Spices2",
      imgUrl: "https://i.ibb.co/F0s3FHQ/Apricots.png",
      productCategoryName: "Spices",
      price: 12,
      salePrice: 11,
      isOnSale: false,
      isPiece: false,
    ),
    ProductModel(
      id: "19",
      title: "Spices3",
      imgUrl: "https://i.ibb.co/F0s3FHQ/Apricots.png",
      productCategoryName: "Spices",
      price: 12,
      salePrice: 11,
      isOnSale: false,
      isPiece: false,
    ),
    ProductModel(
      id: "20",
      title: "Spices4",
      imgUrl: "https://i.ibb.co/F0s3FHQ/Apricots.png",
      productCategoryName: "Spices",
      price: 12,
      salePrice: 11,
      isOnSale: false,
      isPiece: false,
    ),
    ProductModel(
      id: "21",
      title: "Grains1",
      imgUrl: "https://i.ibb.co/F0s3FHQ/Apricots.png",
      productCategoryName: "Grains",
      price: 12,
      salePrice: 11,
      isOnSale: true,
      isPiece: false,
    ),
    ProductModel(
      id: "22",
      title: "Grains2",
      imgUrl:
          "https://e1.pngegg.com/pngimages/338/516/png-clipart-autumn-variety-of-nuts.png",
      productCategoryName: "Grains",
      price: 12,
      salePrice: 11,
      isOnSale: false,
      isPiece: false,
    ),
    ProductModel(
      id: "23",
      title: "Grains3",
      imgUrl: "https://i.ibb.co/F0s3FHQ/Apricots.png",
      productCategoryName: "Grains",
      price: 12,
      salePrice: 11,
      isOnSale: false,
      isPiece: false,
    ),
    ProductModel(
      id: "24",
      title: "Grains4",
      imgUrl: "https://i.ibb.co/F0s3FHQ/Apricots.png",
      productCategoryName: "Grains",
      price: 12,
      salePrice: 11,
      isOnSale: false,
      isPiece: false,
    ),
  ];
}
