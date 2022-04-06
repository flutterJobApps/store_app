class HomeDataModel {
  HomeDataModel({
    this.success,
    this.data,
  });

  HomeDataModel.fromJson(dynamic json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? success;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

class Data {
  Data({
    this.banners,
    this.categories,
    this.latestProducts,
  });

  Data.fromJson(dynamic json) {
    if (json['banners'] != null) {
      banners = [];
      json['banners'].forEach((v) {
        banners?.add(Banners.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = [];
      json['categories'].forEach((v) {
        categories?.add(Categories.fromJson(v));
      });
    }
    if (json['latest_products'] != null) {
      latestProducts = [];
      json['latest_products'].forEach((v) {
        latestProducts?.add(LatestProduct.fromJson(v));
      });
    }
  }
  List<Banners>? banners;
  List<Categories>? categories;
  List<LatestProduct>? latestProducts;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (banners != null) {
      map['banners'] = banners?.map((v) => v.toJson()).toList();
    }
    if (categories != null) {
      map['categories'] = categories?.map((v) => v.toJson()).toList();
    }
    if (latestProducts != null) {
      map['latest_products'] = latestProducts?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class LatestProduct {
  LatestProduct({
    this.id,
    this.category,
    this.name,
    this.description,
    this.price,
    this.discount,
    this.image,
    this.subImages,
    this.rate,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  LatestProduct.fromJson(dynamic json) {
    id = json['_id'];
    category = json['category'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    discount = json['discount'];
    image = json['image'];
    subImages = json['sub_images'];
    rate = json['rate'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }
  String? id;
  String? category;
  String? name;
  String? description;
  int? price;
  int? discount;
  String? image;
  List<dynamic>? subImages;
  int? rate;
  String? createdAt;
  String? updatedAt;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['category'] = category;
    map['name'] = name;
    map['description'] = description;
    map['price'] = price;
    map['discount'] = discount;
    map['image'] = image;
    if (subImages != null) {
      map['sub_images'] = subImages?.map((v) => v.toJson()).toList();
    }
    map['rate'] = rate;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }
}

class Categories {
  Categories({
    this.id,
    this.image,
    this.name,
    this.parent,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.slug,
    this.v,
    this.products,
  });

  Categories.fromJson(dynamic json) {
    id = json['_id'];
    image = json['image'];
    name = json['name'];
    parent = json['parent'];
    description = json['description'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    slug = json['slug'];
    v = json['__v'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(Products.fromJson(v));
      });
    }
  }
  String? id;
  String? image;
  String? name;
  dynamic parent;
  String? description;
  String? createdAt;
  String? updatedAt;
  String? slug;
  int? v;
  List<Products>? products;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['image'] = image;
    map['name'] = name;
    map['parent'] = parent;
    map['description'] = description;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['slug'] = slug;
    map['__v'] = v;
    if (products != null) {
      map['products'] = products?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Products {
  Products({
    this.id,
    this.category,
    this.name,
    this.description,
    this.price,
    this.discount,
    this.image,
    this.subImages,
    this.rate,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  Products.fromJson(dynamic json) {
    id = json['_id'];
    category = json['category'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    discount = json['discount'];
    image = json['image'];
    subImages = json['sub_images'];
    rate = json['rate'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }
  String? id;
  String? category;
  String? name;
  String? description;
  int? price;
  int? discount;
  String? image;
  List<dynamic>? subImages;
  int? rate;
  String? createdAt;
  String? updatedAt;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['category'] = category;
    map['name'] = name;
    map['description'] = description;
    map['price'] = price;
    map['discount'] = discount;
    map['image'] = image;
    if (subImages != null) {
      map['sub_images'] = subImages?.map((v) => v.toJson()).toList();
    }
    map['rate'] = rate;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }
}

class Banners {
  Banners({
    this.id,
    this.image,
    this.name,
    this.parent,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.slug,
    this.v,
  });

  Banners.fromJson(dynamic json) {
    id = json['_id'];
    image = json['image'];
    name = json['name'];
    parent = json['parent'];
    description = json['description'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    slug = json['slug'];
    v = json['__v'];
  }
  String? id;
  String? image;
  String? name;
  dynamic parent;
  String? description;
  String? createdAt;
  String? updatedAt;
  String? slug;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['image'] = image;
    map['name'] = name;
    map['parent'] = parent;
    map['description'] = description;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['slug'] = slug;
    map['__v'] = v;
    return map;
  }
}
