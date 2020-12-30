class ProductQueryModel {
  String subCategoryId;
  String mainCategoryId;
  String keyword;
  int terlaris;
  int diskon;
  int search;
  int view;
  int rating;
  String pengiriman;
  double hargaMin;
  double hargaMax;
  int favourite;
  int seen;
  String sorting;

  ProductQueryModel({
    this.subCategoryId,
    this.mainCategoryId,
    this.keyword,
    this.terlaris,
    this.diskon,
    this.search,
    this.view,
    this.rating,
    this.pengiriman,
    this.hargaMin,
    this.hargaMax,
    this.favourite,
    this.seen,
    this.sorting,
  });

  ProductQueryModel copyWith({
    String subCategoryId,
    String mainCategoryId,
    String keyword,
    int terlaris,
    int diskon,
    int search,
    int view,
    int rating,
    String pengiriman,
    double hargaMin,
    double hargaMax,
    int favourite,
    int seen,
    String sorting,
  }) {
    return ProductQueryModel(
      subCategoryId: subCategoryId ?? this.subCategoryId,
      mainCategoryId: mainCategoryId ?? this.mainCategoryId,
      keyword: keyword ?? this.keyword,
      terlaris: terlaris ?? this.terlaris,
      diskon: diskon ?? this.diskon,
      search: search ?? this.search,
      view: view ?? this.view,
      rating: rating ?? this.rating,
      pengiriman: pengiriman ?? this.pengiriman,
      hargaMin: hargaMin ?? this.hargaMin,
      hargaMax: hargaMax ?? this.hargaMax,
      favourite: favourite ?? this.favourite,
      seen: seen ?? this.seen,
      sorting: sorting ?? this.sorting,
    );
  }
}
