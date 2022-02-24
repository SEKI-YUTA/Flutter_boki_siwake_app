class DataSet {
  static List<Map<String, dynamic>> questions = [
    {
      "question": "商品を1000円分仕入れ、代金は現金で支払った。",
      "karikata": [
        {"仕入れ", 1000}
      ],
      "kasikata": [
        {"現金", 1000}
      ],
      "hint": "この取引は資産の増加と資産の減少の取引である。"
    },
    {
      "question": "商品500円分を販売し、代金を現金で受け取った",
      "karikata": [
        {"現金", 500}
      ],
      "kasikata": [
        {"売上", 500}
      ],
      "hint": "この取引は資産の増加と収益の増加取引である。"
    },
    {
      "question": "商品を1000円分仕入れ、代金は掛けとした。",
      "karikata": [
        {"仕入れ", 1000}
      ],
      "kasikata": [
        {"買掛金", 1000}
      ],
      "hint": "この取引は資産の増加と負債の増加の取引である。"
    },
  ];
}
