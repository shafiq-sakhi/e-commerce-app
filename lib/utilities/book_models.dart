
class BooksModel{
  int? percentage;
  String? grade;
  String? language;
  String? name;
  String? benefits;
  bool? popular;
  String? subcategory;
  bool? feature;
  int? quantity;
  String? category;
  int? price;
  String? brand;
  bool? stock;
  bool? newarrival;
  String? id;
  dynamic? discount;
  List<dynamic>? images;
  String? ageGroup;
  bool? bundle;
  String? description;

  BooksModel({
        this.percentage,
        this.grade,
        this.language,
        this.name,
        this.benefits,
        this.popular,
        this.subcategory,
        this.feature,
        this.quantity,
        this.category,
        this.price,
        this.brand,
        this.stock,
        this.newarrival,
        this.id,
        this.discount,
        this.images,
        this.ageGroup,
        this.bundle,
        this.description
      });

  BooksModel.fromJson(Map<String, dynamic> json) {
    percentage = json['percentage'];
    grade = json['grade'];
    language = json['language'];
    name = json['name'];
    benefits = json['benefits'];
    popular = json['popular'];
    subcategory = json['subcategory'];
    feature = json['feature'];
    quantity = json['quantity'];
    category = json['category'];
    price = json['price'];
    brand = json['brand'];
    stock = json['stock'];
    newarrival = json['newarrival'];
    id = json['id'];
    discount = json['discount'];
    images = json['images'];
    ageGroup = json['ageGroup'];
    bundle = json['bundle'];
    description = json['description'];
  }

}