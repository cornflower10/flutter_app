class Banners {
  int id;
  int type;
  String title;
  String url;
  String destUrl;
  String destParam;
  int createTime;
  int updateTime;

  Banners(
      {this.id,
        this.type,
        this.title,
        this.url,
        this.destUrl,
        this.destParam,
        this.createTime,
        this.updateTime});

  Banners.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    title = json['title'];
    url = json['url'];
    destUrl = json['destUrl'];
    destParam = json['destParam'];
    createTime = json['createTime'];
    updateTime = json['updateTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['title'] = this.title;
    data['url'] = this.url;
    data['destUrl'] = this.destUrl;
    data['destParam'] = this.destParam;
    data['createTime'] = this.createTime;
    data['updateTime'] = this.updateTime;
    return data;
  }
}