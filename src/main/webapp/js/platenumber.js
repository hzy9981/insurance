function Province(name,code) {
    this.name = name;
    this.code = code;
    this.citys = new Array();
}

function City(name,code,pre,provCode) {
    this.name = name;
    this.code = code;
    this.pre = pre;
    this.provCode = provCode;
}


/**
 * 给省份设置城市信息
 **/
Province.prototype.setCitys = function() {
    //如果该省份没有城市信息，则到城市数组中查找，如果查找过一次则无需再查找
    if(this.citys.length == 0) {
        for(var i = 0; i < cityArrayLength; i++) {
            var city = cityArray[i];
            if(city["provCode"] == this.code) {
                this.citys.push(city);
            }
        }
    }
}

Province.prototype.getCitys = function() {
    return this.citys;
}


Array.prototype.getObject = function(code) {
    if(null == code || "" == code) {
        return null;
    }
    for(var i = 0; i < this.length; i++) {
        var object = this[i];
        if(object["code"] == code) {
            return object;
        }
    }
    return null;
}
/** ========================= **/

/**
 * 创建省份的下拉列表框
 **/
function createProvSelect(select) {
    //删除下拉列表框中的所有选项，保留第一行
    clearSelect(select);

    for(var i = 0; i < provinceArray.length; i++) {
        var province = provinceArray[i];
        var provOption = document.createElement('OPTION');
        provOption.text = province["name"];
        provOption.value = province["code"];
        select.options.add(provOption);
    }
}

/**
 * 当省份下拉列表框改变时，获取城市下拉列表
 *
 * provSelect:省份下拉列表对象
 * citySelect:城市下拉列表对象
 **/
function changeCitySelect(provSelect,citySelect) {
    //将城市下拉框清空，保留第一行
    clearSelect(citySelect);

    //获取选中的省份下拉框的值
    var provCode = provSelect[provSelect.selectedIndex].value;
    //获取该省份对象
    var prov = provinceArray.getObject(provCode);
    if(prov == null) return;
    //给省份设置城市信息
    prov.setCitys();
    createCitySelect(citySelect, prov);
}

//自动匹配生成车牌
function changeCodeText(citySelect,codeText) {
    var cityOption = citySelect[citySelect.selectedIndex];
    if(cityOption.value != "") {
        codeText.value = cityOption["pre"];
    }else{
        codeText.value = "";
    }
}


/** ================================ **/

/**
 * 根据省份信息创建该省份下城市的下拉列表框
 *
 * citySelect:城市下拉列表框对象
 * province:省份对象
 **/
function createCitySelect(citySelect, province) {
    var citys = province.getCitys();
    if(citys.length == 0) return;

    for(var i = 0; i < citys.length; i++) {
        var city = citys[i];
        var cityOption = document.createElement('OPTION');
        cityOption.text = city["name"];
        cityOption.value = city["code"];
        cityOption.pre = city["pre"];
        citySelect.options.add(cityOption);
    }
}

/**
 * 清除下拉列表框，保留第一项
 *
 * select 下拉列表框对象
 **/
function clearSelect(select) {
    for(var i = select.options.length-1; i > 0; i--) {
        select.options[i] = null;
    }
}


var provinceArray = new Array(
    new Province("北京市","110000"),
    new Province("天津市","120000"),
    new Province("河北省","130000"),
    new Province("山西省","140000"),
    new Province("内蒙古自治区","150000"),
    new Province("辽宁省","210000"),
    new Province("吉林省","220000"),
    new Province("黑龙江省","230000"),
    new Province("上海市","310000"),
    new Province("江苏省","320000"),
    new Province("浙江省","330000"),
    new Province("安徽省","340000"),
    new Province("福建省","350000"),
    new Province("江西省","360000"),
    new Province("山东省","370000"),
    new Province("河南省","410000"),
    new Province("湖北省","420000"),
    new Province("湖南省","430000"),
    new Province("广东省","440000"),
    new Province("广西壮族自治区","450000"),
    new Province("海南省","460000"),
    new Province("重庆市","500000"),
    new Province("四川省","510000"),
    new Province("贵州省","520000"),
    new Province("云南省","530000"),
    new Province("西藏自治区","540000"),
    new Province("陕西省","610000"),
    new Province("甘肃省","620000"),
    new Province("青海省","630000"),
    new Province("宁夏回族自治区","640000"),
    new Province("新疆维吾尔自治区","650000")
);
var provinceArrayLength = provinceArray.length;

var cityArray = new Array(
    new City("石家庄市","130100","冀A","130000"),
    new City("唐山市","130200","冀B","130000"),
    new City("秦皇岛市","130300","冀C","130000"),
    new City("邯郸市","130400","冀D","130000"),
    new City("邢台市","130500","冀E","130000"),
    new City("保定市","130600","冀F","130000"),
    new City("张家口市","130700","冀H","130000"),
    new City("承德市","130800","冀J","130000"),
    new City("沧州市","130900","冀R","130000"),
    new City("廊坊市","131000","冀S","130000"),
    new City("衡水市","131100","冀T","130000"),
    new City("太原市","140100","晋A","140000"),
    new City("大同市","140200","晋B","140000"),
    new City("阳泉市","140300","晋C","140000"),
    new City("长治市","140400","晋D","140000"),
    new City("晋城市","140500","晋E","140000"),
    new City("朔州市","140600","晋F","140000"),
    new City("忻州市","140900","晋G","140000"),
    new City("吕梁市","141100","晋H","140000"),
    new City("晋中市","140700","晋J","140000"),
    new City("临汾市","141000","晋L","140000"),
    new City("运城市","140800","晋M","140000"),
    new City("呼和浩特市","150100","蒙A","150000"),
    new City("包头市","150200","蒙B","150000"),
    new City("乌海市","150300","蒙C","150000"),
    new City("赤峰市","150400","蒙D","150000"),
    new City("通辽市","150500","蒙G","150000"),
    new City("鄂尔多斯市","150600","蒙K","150000"),
    new City("呼伦贝尔市","150700","蒙E","150000"),
    new City("巴彦淖尔市","150800","蒙L","150000"),
    new City("乌兰察布市","150900","蒙J","150000"),
    new City("兴安盟","152200","蒙F","150000"),
    new City("锡林郭勒盟","152500","蒙H","150000"),
    new City("阿拉善盟","152900","蒙M","150000"),
    new City("沈阳市","210100","辽A","210000"),
    new City("大连市","210200","辽B","210000"),
    new City("鞍山市","210300","辽C","210000"),
    new City("抚顺市","210400","辽D","210000"),
    new City("本溪市","210500","辽E","210000"),
    new City("丹东市","210600","辽F","210000"),
    new City("锦州市","210700","辽G","210000"),
    new City("营口市","210800","辽H","210000"),
    new City("阜新市","210900","辽J","210000"),
    new City("辽阳市","211000","辽K","210000"),
    new City("盘锦市","211100","辽L","210000"),
    new City("铁岭市","211200","辽M","210000"),
    new City("朝阳市","211300","辽N","210000"),
    new City("葫芦岛市","211400","辽P","210000"),
    new City("长春市","220100","吉A","220000"),
    new City("吉林市","220200","吉B","220000"),
    new City("四平市","220300","吉C","220000"),
    new City("辽源市","220400","吉D","220000"),
    new City("通化市","220500","吉E","220000"),
    new City("白山市","220600","吉F","220000"),
    new City("松原市","220700","吉J","220000"),
    new City("白城市","220800","吉G","220000"),
    new City("延边朝鲜族自治州","222400","吉H","220000"),
    new City("哈尔滨市","230100","黑A","230000"),
    new City("齐齐哈尔市","230200","黑B","230000"),
    new City("鸡西市","230300","黑G","230000"),
    new City("鹤岗市","230400","黑H","230000"),
    new City("双鸭山市","230500","黑J","230000"),
    new City("大庆市","230600","黑E","230000"),
    new City("伊春市","230700","黑F","230000"),
    new City("佳木斯市","230800","黑D","230000"),
    new City("七台河市","230900","黑K","230000"),
    new City("牡丹江市","231000","黑C","230000"),
    new City("黑河市","231100","黑N","230000"),
    new City("绥化市","232700","黑M","230000"),
    new City("南京市","320100","苏A","320000"),
    new City("无锡市","320200","苏B","320000"),
    new City("徐州市","320300","苏C","320000"),
    new City("常州市","320400","苏D","320000"),
    new City("苏州市","320500","苏E","320000"),
    new City("南通市","320600","苏F","320000"),
    new City("连云港市","320700","苏G","320000"),
    new City("淮安市","320800","苏H","320000"),
    new City("盐城市","320900","苏J","320000"),
    new City("扬州市","321000","苏K","320000"),
    new City("镇江市","321100","苏L","320000"),
    new City("泰州市","321200","苏M","320000"),
    new City("宿迁市","321300","苏N","320000"),
    new City("杭州市","330100","浙A","330000"),
    new City("宁波市","330200","浙B","330000"),
    new City("温州市","330300","浙C","330000"),
    new City("嘉兴市","330400","浙F","330000"),
    new City("湖州市","330500","浙E","330000"),
    new City("绍兴市","330600","浙D","330000"),
    new City("金华市","330700","浙G","330000"),
    new City("衢州市","330800","浙H","330000"),
    new City("舟山市","330900","浙L","330000"),
    new City("台州市","331000","浙J","330000"),
    new City("丽水市","331100","浙K","330000"),
    new City("合肥市","340100","皖A","340000"),
    new City("芜湖市","340200","皖B","340000"),
    new City("蚌埠市","340300","皖C","340000"),
    new City("淮南市","340400","皖D","340000"),
    new City("马鞍山市","340500","皖E","340000"),
    new City("淮北市","340600","皖F","340000"),
    new City("铜陵市","340700","皖G","340000"),
    new City("安庆市","340800","皖H","340000"),
    new City("黄山市","341000","皖J","340000"),
    new City("滁州市","341100","皖M","340000"),
    new City("阜阳市","341200","皖K","340000"),
    new City("宿州市","341300","皖L","340000"),
    new City("巢湖市","341400","皖Q","340000"),
    new City("六安市","341500","皖N","340000"),
    new City("池州市","341600","皖R","340000"),
    new City("亳州市","341700","皖S","340000"),
    new City("宣城市","341800","皖P","340000"),
    new City("福州市","350100","闽A","350000"),
    new City("厦门市","350200","闽D","350000"),
    new City("莆田市","350300","闽B","350000"),
    new City("三明市","350400","闽G","350000"),
    new City("泉州市","350500","闽C","350000"),
    new City("漳州市","350600","闽E","350000"),
    new City("南平市","350700","闽H","350000"),
    new City("龙岩市","350800","闽F","350000"),
    new City("宁德市","350900","闽J","350000"),
    new City("南昌市","360100","赣A","360000"),
    new City("景德镇市","360200","赣H","360000"),
    new City("萍乡市","360300","赣J","360000"),
    new City("九江市","360400","赣G","360000"),
    new City("新余市","360500","赣K","360000"),
    new City("鹰潭市","360600","赣L","360000"),
    new City("赣州市","360700","赣B","360000"),
    new City("吉安市","360800","赣D","360000"),
    new City("宜春市","360900","赣C","360000"),
    new City("抚州市","361000","赣F","360000"),
    new City("上饶市","361100","赣E","360000"),
    new City("济南市","370100","鲁A","370000"),
    new City("青岛市","370200","鲁B","370000"),
    new City("淄博市","370300","鲁C","370000"),
    new City("枣庄市","370400","鲁D","370000"),
    new City("东营市","370500","鲁E","370000"),
    new City("烟台市","370600","鲁F","370000"),
    new City("潍坊市","370700","鲁G","370000"),
    new City("济宁市","370800","鲁H","370000"),
    new City("泰安市","370900","鲁J","370000"),
    new City("威海市","371000","鲁K","370000"),
    new City("日照市","371100","鲁L","370000"),
    new City("莱芜市","371200","鲁S","370000"),
    new City("临沂市","371300","鲁Q","370000"),
    new City("德州市","371400","鲁N","370000"),
    new City("聊城市","371500","鲁P","370000"),
    new City("滨州市","371600","鲁M","370000"),
    new City("荷泽市","371700","鲁R","370000"),
    new City("郑州市","410100","豫A","410000"),
    new City("开封市","410200","豫B","410000"),
    new City("洛阳市","410300","豫C","410000"),
    new City("平顶山市","410400","豫D","410000"),
    new City("安阳市","410500","豫E","410000"),
    new City("鹤壁市","410600","豫F","410000"),
    new City("新乡市","410700","豫G","410000"),
    new City("焦作市","410800","豫H","410000"),
    new City("濮阳市","410900","豫J","410000"),
    new City("许昌市","411000","豫K","410000"),
    new City("漯河市","411100","豫L","410000"),
    new City("三门峡市","411200","豫M","410000"),
    new City("南阳市","411300","豫R","410000"),
    new City("商丘市","411400","豫N","410000"),
    new City("信阳市","411500","豫S","410000"),
    new City("周口市","411600","豫P","410000"),
    new City("驻马店市","411700","豫Q","410000"),
    new City("济源市","419000","豫U","410000"),
    new City("武汉市","420100","鄂A","420000"),
    new City("黄石市","420200","鄂B","420000"),
    new City("十堰市","420300","鄂C","420000"),
    new City("宜昌市","420500","鄂E","420000"),
    new City("襄樊市","420600","鄂F","420000"),
    new City("鄂州市","420700","鄂G","420000"),
    new City("荆门市","420800","鄂H","420000"),
    new City("孝感市","420900","鄂K","420000"),
    new City("荆州市","421000","鄂M","420000"),
    new City("黄冈市","421100","鄂J","420000"),
    new City("咸宁市","421200","鄂L","420000"),
    new City("随州市","421300","鄂S","420000"),
    new City("恩施土家族苗族自治州","422800","鄂Q","420000"),
    new City("仙桃市","429000","鄂M","420000"),
    new City("长沙市","430100","湘A","430000"),
    new City("株洲市","430200","湘B","430000"),
    new City("湘潭市","430300","湘C","430000"),
    new City("衡阳市","430400","湘D","430000"),
    new City("邵阳市","430500","湘E","430000"),
    new City("岳阳市","430600","湘F","430000"),
    new City("常德市","430700","湘J","430000"),
    new City("张家界市","430800","湘G","430000"),
    new City("益阳市","430900","湘H","430000"),
    new City("郴州市","431000","湘L","430000"),
    new City("永州市","431100","湘M","430000"),
    new City("怀化市","431200","湘N","430000"),
    new City("娄底市","431300","湘K","430000"),
    new City("湘西土家族苗族自治州","433100","湘U","430000"),
    new City("广州市","440100","粤A","440000"),
    new City("韶关市","440200","粤F","440000"),
    new City("深圳市","440300","粤B","440000"),
    new City("珠海市","440400","粤C","440000"),
    new City("汕头市","440500","粤D","440000"),
    new City("佛山市","440600","粤E","440000"),
    new City("江门市","440700","粤J","440000"),
    new City("湛江市","440800","粤G","440000"),
    new City("茂名市","440900","粤K","440000"),
    new City("肇庆市","441200","粤H","440000"),
    new City("惠州市","441300","粤L","440000"),
    new City("梅州市","441400","粤M","440000"),
    new City("汕尾市","441500","粤N","440000"),
    new City("河源市","441600","粤P","440000"),
    new City("阳江市","441700","粤Q","440000"),
    new City("清远市","441800","粤R","440000"),
    new City("东莞市","441900","粤S","440000"),
    new City("中山市","442000","粤T","440000"),
    new City("潮州市","445100","粤U","440000"),
    new City("揭阳市","445200","粤V","440000"),
    new City("云浮市","445300","粤W","440000"),
    new City("南宁市","450100","桂A","450000"),
    new City("柳州市","450200","桂B","450000"),
    new City("桂林市","450300","桂C","450000"),
    new City("梧州市","450400","桂D","450000"),
    new City("北海市","450500","桂E","450000"),
    new City("防城港市","450600","桂P","450000"),
    new City("钦州市","450700","桂N","450000"),
    new City("贵港市","450800","桂R","450000"),
    new City("玉林市","450900","桂K","450000"),
    new City("百色市","451000","桂L","450000"),
    new City("贺州市","451100","桂J","450000"),
    new City("河池市","451200","桂M","450000"),
    new City("来宾市","451300","桂G","450000"),
    new City("崇左市","451400","桂F","450000"),
    new City("成都市","510100","川A","510000"),
    new City("自贡市","510300","川C","510000"),
    new City("攀枝花市","510400","川D","510000"),
    new City("泸州市","510500","川E","510000"),
    new City("德阳市","510600","川F","510000"),
    new City("绵阳市","510700","川B","510000"),
    new City("广元市","510800","川H","510000"),
    new City("遂宁市","510900","川J","510000"),
    new City("内江市","511000","川K","510000"),
    new City("乐山市","511100","川L","510000"),
    new City("南充市","511300","川R","510000"),
    new City("眉山市","511400","川Z","510000"),
    new City("宜宾市","511500","川Q","510000"),
    new City("广安市","511600","川X","510000"),
    new City("达州市","511700","川S","510000"),
    new City("雅安市","511800","川T","510000"),
    new City("巴中市","511900","川Y","510000"),
    new City("资阳市","512000","川M","510000"),
    new City("贵阳市","520100","贵A","520000"),
    new City("六盘水市","520200","贵B","520000"),
    new City("遵义市","520300","贵C","520000"),
    new City("安顺市","520400","贵G","520000"),
    new City("毕节地区","520500","贵F","520000"),
    new City("铜仁地区","520600","贵D","520000"),
    new City("黔西南布依族苗族自治州","522300","贵E","520000"),
    new City("黔东南苗族侗族自治州","522600","贵H","520000"),
    new City("黔南布依族苗族自治州","522700","贵J","520000"),
    new City("昆明市","530100","云A","530000"),
    new City("曲靖市","530300","云D","530000"),
    new City("玉溪市","530400","云F","530000"),
    new City("保山市","530500","云M","530000"),
    new City("昭通市","530600","云B","530000"),
    new City("丽江市","530700","云P","530000"),
    new City("思茅市","530800","云J","530000"),
    new City("临沧市","530900","云S","530000"),
    new City("楚雄彝族自治州","532300","云E","530000"),
    new City("红河哈尼族彝族自治州","532500","云G","530000"),
    new City("文山壮族苗族自治州","532600","云H","530000"),
    new City("西双版纳傣族自治州","532800","云K","530000"),
    new City("大理白族自治州","云L","532900","530000"),
    new City("德宏傣族景颇族自治州","533100","云N","530000"),
    new City("怒江傈僳族自治州","533300","云Q","530000"),
    new City("迪庆藏族自治州","533400","云R","530000"),
    new City("拉萨市","540100","藏A","540000"),
    new City("西安市","610100","陕A","610000"),
    new City("铜川市","610200","陕B","610000"),
    new City("宝鸡市","610300","陕C","610000"),
    new City("咸阳市","610400","陕D","610000"),
    new City("渭南市","610500","陕E","610000"),
    new City("延安市","610600","陕J","610000"),
    new City("汉中市","610700","陕F","610000"),
    new City("榆林市","610800","陕K","610000"),
    new City("安康市","610900","陕G","610000"),
    new City("商洛市","611000","陕H","610000"),
    new City("兰州市","620100","甘A","620000"),
    new City("嘉峪关市","620200","甘B","620000"),
    new City("金昌市","620300","甘C","620000"),
    new City("白银市","620400","甘D","620000"),
    new City("天水市","620500","甘E","620000"),
    new City("武威市","620600","甘H","620000"),
    new City("张掖市","620700","甘G","620000"),
    new City("平凉市","620800","甘L","620000"),
    new City("酒泉市","620900","甘F","620000"),
    new City("庆阳市","621000","甘M","620000"),
    new City("定西市","621100","甘J","620000"),
    new City("陇南市","621200","甘K","620000"),
    new City("临夏回族自治州","622900","甘N","620000"),
    new City("甘南藏族自治州","623000","甘P","620000"),
    new City("西宁市","630100","青A","630000"),
    new City("海东地区","630200","青B","630000"),
    new City("海北藏族自治州","632200","青C","630000"),
    new City("黄南藏族自治州","632300","青D","630000"),
    new City("藏族自治州","632500","青E","630000"),
    new City("果洛藏族自治州","632600","青F","630000"),
    new City("玉树藏族自治州","632700","青G","630000"),
    new City("海西蒙古族藏族自治州","632800","青H","630000"),
    new City("银川市","640100","宁A","640000"),
    new City("石嘴山市","640200","宁B","640000"),
    new City("银南市","640300","宁C","640000"),
    new City("固原市","640400","宁D","640000"),
    new City("中卫市","640500","宁E","640000"),
    new City("乌鲁木齐市","650100","新A","650000"),
    new City("克拉玛依市","650200","新J","650000"),
    new City("吐鲁番地区","652100","新K","650000"),
    new City("哈密地区","652200","新L","650000"),
    new City("昌吉回族自治州","652300","新B","650000"),
    new City("博尔塔拉蒙古自治州","652700","新E","650000"),
    new City("巴音郭楞蒙古自治州","652800","新M","650000"),
    new City("阿克苏地区","652900","新N","650000"),
    new City("克孜勒苏柯尔克孜自治州","653000","新P","650000"),
    new City("喀什地区","653100","新Q","650000"),
    new City("和田地区","653200","新R","650000"),
    new City("伊犁哈萨克自治州","654000","新F","650000"),
    new City("塔城地区","654200","新G","650000"),
    new City("阿勒泰地区","654300","新H","650000"),
    new City("石河子市","659000","新C","650000"),
    new City("海口市","460100","琼A","460000"),
    new City("三亚市","460200","琼B","460000"),
    new City("三沙市","460300","琼","460000")
);
var cityArrayLength = cityArray.length;