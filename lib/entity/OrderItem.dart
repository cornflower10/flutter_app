class OrderItem {
  String orderTime;
  String type;
  String amount;
  String okTime;
  String orderNO;

  OrderItem({this.orderTime, this.type, this.amount, this.okTime, this.orderNO});

  OrderItem.fromJson(Map<String, dynamic> json) {
    orderTime = json['orderTime'];
    type = json['type'];
    amount = json['amount'];
    okTime = json['okTime'];
    orderNO = json['orderNO'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderTime'] = this.orderTime;
    data['type'] = this.type;
    data['amount'] = this.amount;
    data['okTime'] = this.okTime;
    data['orderNO'] = this.orderNO;
    return data;
  }
}
