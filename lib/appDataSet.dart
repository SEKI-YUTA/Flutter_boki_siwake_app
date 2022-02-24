class DataSet {
  static List<Map<String, dynamic>> questions = [
    {
      "question": "商品を1000円分仕入れ、代金は現金で支払った。",
      "siwake": {
        "karikataKanjou": [
          "仕入",
        ],
        "kasikataKanjou": [
          "現金",
        ],
        "karikataKingaku": [
          1000,
        ],
        "kasikataKingaku": [
          1000,
        ],
      },
      "hint": "この取引は資産の増加と資産の減少の取引である。"
    },
    {
      "question": "商品500円分を販売し、代金を現金で受け取った",
      "siwake": {
        "karikataKanjou": [
          "現金",
        ],
        "kasikataKanjou": [
          "売上",
        ],
        "karikataKingaku": [
          500,
        ],
        "kasikataKingaku": [
          500,
        ],
      },
      "hint": "この取引は資産の増加と収益の増加取引である。"
    },
    {
      "question": "商品を1000円分仕入れ、代金は掛けとした。",
      "siwake": {
        "karikataKanjou": [
          "仕入",
        ],
        "kasikataKanjou": [
          "買掛金",
        ],
        "karikataKingaku": [
          1000,
        ],
        "kasikataKingaku": [
          1000,
        ],
      },
      "hint": "この取引は資産の増加と負債の増加の取引である。"
    },
  ];
}
