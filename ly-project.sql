#设置客户端连接服务器使用UTF8字符集
SET NAMES UTF8;
#丢弃数据库ly_project，如果存在的话
DROP DATABASE IF EXISTS ly_project;
#创建数据库xm，使用UTF8字符集
CREATE DATABASE ly_project CHARSET=UTF8;
#进入数据库ly_project;
USE ly_project;

/***用户模块相关的表***/
#用户表 ly_user
-------------------------------------
CREATE TABLE `ly_user` (
  `uid` int(11) NOT NULL auto_increment,
  `uname` varchar(64) default NULL,
  `upwd` varchar(32) default NULL,
  `email` varchar(64) default NULL,
  `phone` varchar(16) default NULL,
  `user_name` varchar(32) default NULL,
  `gender` int(11) default NULL,
  PRIMARY KEY  (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;

INSERT INTO ly_user VALUES
(NULL,'xiaoxu','123456','xiaoxu@123.com','16634567689','张小许','0'),
(NULL,'dingding','123456','dingding@qq.com','18862170605','dingding','1'),
(NULL,'wuhao','aassdd','wuhao@123.com','18862170506','吴昊','0'),
(NULL,'xiaoyu','zzss12','xiaoyu@qq.com','15662170121','小雨','0'),
(NULL,'xixi','124578','xixi@123.com','13145478954','李茜','0'),
(NULL,'jinjin','jinjin123','jinjin@qq.com','14652124569','古晋','1');

#banner表
------------------------------------
CREATE TABLE ly_index_carousel(
 cid INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
 img varchar(128),
 href varchar(64)
);
INSERT INTO ly_index_carousel VALUES
(NULL,'img/banner/AD0I__v7BBACGAAg9aefvgUo5NCLYDCADzicBA.jpg',null),
(NULL,'img/banner/AD0I__v7BBACGAAg8ImzxwUoto2TzAQwhw840wU.jpg',null); 

#ly_index_product
----------------------------------
CREATE TABLE `ly_index_product` (
  `pid` int(11) NOT NULL auto_increment,
  `title` varchar(64) default NULL,
  `type` varchar(128) default NULL,
  `cities` varchar(128) default NULL,
  `pic` varchar(128) default NULL,
  `price` decimal(10,2) default NULL,
  `href` varchar(128) default NULL,
   PRIMARY KEY  (`pid`)
);

INSERT INTO `ly_index_product`(`pid`,`title`,`type`,`cities`,`pic`,`price`,`href`) VALUES
('1', '东京+富士山+京都+奈良+大阪6天5晚或8天7晚游','出境游', '南京出发','img/selectBox/select1.jpg', '5699', 'product_details.html?lid=55'),
('2', '芽庄4晚5日半自助游','出境游', '常州出发','img/selectBox/select2.jpg', '2499', 'product_details.html?lid=56'),
('3', '世纪游轮重回上海滩【世纪天子号】南京-上海 张家港双山岛+香山风景区+泰州一日 4天3晚行程','邮轮', '南京出发','img/selectBox/select3.jpg', '2798', 'product_details.html?lid=57'),
('4', '【天海邮轮-新世纪号】2018年7月4日 上海-佐世保-上海 4晚5日游','邮轮', '上海出发','img/selectBox/select4.jpg', '4698', 'product_details.html?lid=58'),
('5', '成都+新都桥+稻城亚丁双飞8日跟团游','国内游', '扬州出发','img/selectBox/select5.jpg', '3103', 'product_details.html?lid=59'),
('6', '桂林+阳朔+游轮百里大漓江+龙脊梯田+银子岩+象鼻山双飞5日跟团游','国内游', '扬州出发','img/selectBox/select5.jpg', '2394', 'product_details.html?lid=60'),
('7', '遇道北京双飞5日跟团游','国内游', '扬州出发','img/selectBox/select6.jpg', '2635', 'product_details.html?lid=61'),
('8', '重庆双飞4日自由行','国内游', '上海出发','img/selectBox/select7.jpg', '1546', 'product_details.html?lid=62'),
('9', '住扬州中集格兰云天大酒店+双人自助早餐+自选扬州瘦西湖/个园/何园/大明寺','国内游', '南京出发','img/selectBox/select8.jpg', '628', 'product_details.html?lid=63'),
('10', '句容茅山祈福+得撒石磨豆腐村巴士1日跟团游 成人含中餐','周边游', '南京出发','img/selectBox/select9.jpg', '569', 'product_details.html?lid=64'),
('11', '【爆款推荐】天目湖山水园-南山竹海-自理御水温泉2日跟团游;登山泡温泉','跟团游', '南通-常州','img/zb/3gIGb5_464x236_00.jpg', '398', 'product_details.html?lid=65'),
('12', '【旅居参观】雅居乐·山湖城旅居地产+东方盐湖城双人票1日跟团游 仅售199','跟团游', '上海-常州','img/zb/rBLkCVrWy12ADelfAAGOQ4tJzs4266_242x150_00.jpg', '199', 'product_details.html?lid=66'),
('13', '【夜上海】东方明珠+透明观光廊+城隍庙+浦江游船纯玩1日跟团游 特价促销  O自费景点  让您一天轻松玩转上海滩','跟团游', '上海-上海','img/zb/pmdr1p_242x150_00.jpg', '168', 'product_details.html?lid=67'),
('14', '【百旅乐居】<浙江果圣山庄度假旅居>2日跟团游 端午假期热卖，入住木屋别墅，篝火晚会烧烤，欢聚果圣粽香传情，携家人一起过端午','跟团游', '上海-湖州','img/zb/rBLkCVsGcNSAExtbAAC4diCw1qQ806_242x150_00.jpg', '550', 'product_details.html?lid=68'),
('15', '自选东方盐湖城/镇江茅山住常州宝盛园房车营地','自由行', '常州-镇江','img/zb/eGUJ9e_242x150_00.jpg', '180', 'product_details.html?lid=69'),
('16', '住无锡灵山君来波罗蜜多酒店自选灵山小镇·拈花湾/君来波罗蜜多酒店自助晚餐/禅食【灵山胜境】【拈花一笑·禅意生活】','自由行', '无锡','img/zb/rBANDFj_CT2APZ0lAAQAAJOlRtc568_242x150_00.jpg', '1239', 'product_details.html?lid=70'),
('17', '【2晚3天】自选无锡拈花客栈/禅意村舍【景区内】畅玩灵山拈花小镇+波罗密多酒店自助晚餐。【灵山胜境】【非凡周边游】【太湖精选酒店】','自由行', '无锡','img/selectBox/select9.jpg', '1650', 'product_details.html?lid=71'),
('18', '思君不见下渝州','跟团游', '重庆','img/gonglve/x1.jpg', '1599', 'product_details.html?lid=72'),
('19', '感受泰式"七夕"','跟团游', '清迈','img/gonglve/x2.jpg', '1599', 'product_details.html?lid=73'),
('20', '去希腊拍甜蜜写真','跟团游', '圣托里尼','img/gonglve/x3.jpg', '1599', 'product_details.html?lid=74'),
('21', '滨海的文艺小城','跟团游', '厦门','img/gonglve/x4.jpg', '1599', 'product_details.html?lid=75'),
('22', '东方夏威夷','跟团游',  '三亚','img/gonglve/x5.jpg', '1599', 'product_details.html?lid=76'),
('23', '环海修养胜地','跟团游', '舟山','img/gonglve/x6.jpg', '1599', 'product_details.html?lid=77'),
('24', '东方明珠避暑胜地','跟团游', '大连','img/gonglve/x7.jpg', '1599', 'product_details.html?lid=78'),
('25', '韩国的夏威夷','跟团游','济州','img/gonglve/x8.jpg','1599', 'product_details.html?lid=79');




#ly_laptop
----------------------------------
CREATE TABLE `ly_laptop` (
  `lid` int(11) NOT NULL auto_increment,
  `title` varchar(128) default NULL,
  `days` varchar(128) default NULL,
  `destination` varchar(128) default NULL,
  `price` decimal(10,2) default NULL,
  `pic` varchar(128) default NULL,
  `href` varchar(128) default NULL,		
   PRIMARY KEY  (`lid`)
);
INSERT INTO `ly_laptop` (`lid`, `title`, `days`, `destination`, `price`, `pic`,`href`) VALUES
(1, '边塞风情-伊宁草原之夜4日游', '4', '伊宁', '5000.00', 'img/products/AD0ItOahBxACGAAg0tTkzwUonPPUygcw1gM4mAI!400x400.jpg','product_details.html?lid=1'),
(2, '畅游北京故宫', '3', '北京', '2499.00', 'img/products/AD0ItOahBxACGAAg5crgzwUo1OC5rgMw1gM4mAI!400x400.jpg','product_details.html?lid=2'),
(3, '法国巴黎蒙马特圣心堂三日游', '3', '巴黎蒙马特圣心堂', '1499.00', 'img/products/AD0ItOahBxACGAAg9ajhzwUooI6qswQw1gM4mAI!400x400.jpg','product_details.html?lid=3'),
(4, '古城西安,古墓兵马俑', '3', '西安', '1999.00', 'img/products/AD0ItOahBxACGAAgi_zgzwUo3fSr4wUw1gM4mAI!400x400.jpg','product_details.html?lid=4'),
(5, '海岛4日跟团游', '4', '海岛', '1499.00', 'img/products/AD0ItOahBxACGAAgrsngzwUo1J6ptAYw1gM4mAI!400x400.jpg','product_details.html?lid=5'),
(6, '海南5日游,沉醉蜈支洲', '5', '海南', '3000.00', 'img/products/AD0ItOahBxACGAAgmdTkzwUo9Ynz9AEw1gM4mAI!400x400.jpg','product_details.html?lid=6'),
(7, '沪沽湖3日酣畅夜游', '3', '沪沽湖', '1499.00', 'img/products/AD0ItOahBxACGAAgzrrgzwUo-f_21gUw1gM4mAI!400x400.jpg','product_details.html?lid=7'),
(8, '九寨沟4日跟团游', '4', '千岛湖', '1499.00', 'img/products/AD0ItOahBxACGAAgmbjgzwUojtTzCzDWAziYAg!400x400.jpg','product_details.html?lid=8'),
(9, '马尔代夫5晚7日自由行', '7', '马尔代夫', '2990.00', 'img/products/AD0ItOahBxACGAAguMrgzwUogpnywgYw1gM4mAI!400x400.jpg','product_details.html?lid=9'),
(10, '曼谷—芭提雅7日团队游', '7', '曼谷—芭提雅', '1499.00', 'img/products/AD0ItOahBxACGAAgxOvgzwUo4KuPhwUw1gM4mAI!400x400.jpg','product_details.html?lid=10'),
(11, '美国旧金山+拉斯维加斯10日公司游', '10', '旧金山+拉斯维加斯', '1499.00', 'img/products/AD0ItOahBxACGAAgzrrgzwUo-f_21gUw1gM4mAI!400x400.jpg','product_details.html?lid=11'),
(12, '民谣成都,安顺大桥', '3', '成都', '1499.00', 'img/products/AD0ItOahBxACGAAgzurgzwUoq4u98QYw1gM4mAI!400x400.jpg','product_details.html?lid=12'),
(13, '海岛4日跟团游', '4', '海岛', '1499.00', 'img/products/AD0ItOahBxACGAAgrsngzwUo1J6ptAYw1gM4mAI!400x400.jpg','product_details.html?lid=13'),
(14, '海南5日游,沉醉蜈支洲', '5', '海南', '3000.00', 'img/products/AD0ItOahBxACGAAgmdTkzwUo9Ynz9AEw1gM4mAI!400x400.jpg','product_details.html?lid=14'),
(15, '沪沽湖3日酣畅夜游', '3', '沪沽湖', '1499.00', 'img/products/AD0ItOahBxACGAAgzrrgzwUo-f_21gUw1gM4mAI!400x400.jpg','product_details.html?lid=15'),
(16, '九寨沟4日跟团游', '4', '千岛湖', '1499.00', 'img/products/AD0ItOahBxACGAAgmbjgzwUojtTzCzDWAziYAg!400x400.jpg','product_details.html?lid=16'),
(17, '马尔代夫5晚7日自由行', '7', '马尔代夫', '2990.00', 'img/products/AD0ItOahBxACGAAguMrgzwUogpnywgYw1gM4mAI!400x400.jpg','product_details.html?lid=17'),
(18, '曼谷—芭提雅7日团队游', '7', '曼谷—芭提雅', '1499.00', 'img/products/AD0ItOahBxACGAAgxOvgzwUo4KuPhwUw1gM4mAI!400x400.jpg','product_details.html?lid=18'),
(19, '美国旧金山+拉斯维加斯10日公司游', '10', '旧金山+拉斯维加斯', '1499.00', 'img/products/AD0ItOahBxACGAAgzrrgzwUo-f_21gUw1gM4mAI!400x400.jpg','product_details.html?lid=19'),
(20, '民谣成都,安顺大桥', '3', '成都', '1499.00', 'img/products/AD0ItOahBxACGAAgzurgzwUoq4u98QYw1gM4mAI!400x400.jpg','product_details.html?lid=20'),
(21, '海岛4日跟团游', '4', '海岛', '1499.00', 'img/products/AD0ItOahBxACGAAgrsngzwUo1J6ptAYw1gM4mAI!400x400.jpg','product_details.html?lid=21'),
(22, '海南5日游,沉醉蜈支洲', '5', '海南', '3000.00', 'img/products/AD0ItOahBxACGAAgmdTkzwUo9Ynz9AEw1gM4mAI!400x400.jpg','product_details.html?lid=22'),
(23, '沪沽湖3日酣畅夜游', '3', '沪沽湖', '1499.00', 'img/products/AD0ItOahBxACGAAgzrrgzwUo-f_21gUw1gM4mAI!400x400.jpg','product_details.html?lid=23'),
(24, '九寨沟4日跟团游', '4', '千岛湖', '1499.00', 'img/products/AD0ItOahBxACGAAgmbjgzwUojtTzCzDWAziYAg!400x400.jpg','product_details.html?lid=24'),
(25, '马尔代夫5晚7日自由行', '7', '马尔代夫', '2990.00', 'img/products/AD0ItOahBxACGAAguMrgzwUogpnywgYw1gM4mAI!400x400.jpg','product_details.html?lid=25'),
(26, '曼谷—芭提雅7日团队游', '7', '曼谷—芭提雅', '1499.00', 'img/products/AD0ItOahBxACGAAgxOvgzwUo4KuPhwUw1gM4mAI!400x400.jpg','product_details.html?lid=26'),
(27, '美国旧金山+拉斯维加斯10日公司游', '10', '旧金山+拉斯维加斯', '1499.00', 'img/products/AD0ItOahBxACGAAgzrrgzwUo-f_21gUw1gM4mAI!400x400.jpg','product_details.html?lid=27'),
(28, '民谣成都,安顺大桥', '3', '成都', '1499.00', 'img/products/AD0ItOahBxACGAAgzurgzwUoq4u98QYw1gM4mAI!400x400.jpg','product_details.html?lid=28'),
(29, '民谣成都,安顺大桥', '4', '成都', '1599.00', 'img/products/AD0ItOahBxACGAAgzurgzwUoq4u98QYw1gM4mAI!400x400.jpg','product_details.html?lid=29'),
(30, '民谣成都,安顺大桥', '3', '成都', '1499.00', 'img/products/AD0ItOahBxACGAAgzurgzwUoq4u98QYw1gM4mAI!400x400.jpg','product_details.html?lid=30'),
(31, '民谣成都,安顺大桥', '5', '成都', '1999.00', 'img/products/AD0ItOahBxACGAAgzurgzwUoq4u98QYw1gM4mAI!400x400.jpg','product_details.html?lid=31'),
(32, '民谣成都,安顺大桥', '2', '成都', '1099.00', 'img/products/AD0ItOahBxACGAAgzurgzwUoq4u98QYw1gM4mAI!400x400.jpg','product_details.html?lid=32'),
(33, '民谣成都,安顺大桥', '3', '成都', '1499.00', 'img/products/AD0ItOahBxACGAAgzurgzwUoq4u98QYw1gM4mAI!400x400.jpg','product_details.html?lid=33'),
(34, '民谣成都,安顺大桥', '3', '成都', '1499.00', 'img/products/AD0ItOahBxACGAAgzurgzwUoq4u98QYw1gM4mAI!400x400.jpg','product_details.html?lid=34'),
(35, '民谣成都,安顺大桥', '3', '成都', '1499.00', 'img/products/AD0ItOahBxACGAAgzurgzwUoq4u98QYw1gM4mAI!400x400.jpg','product_details.html?lid=35'),
(36, '民谣成都,安顺大桥', '3', '成都', '1499.00', 'img/products/AD0ItOahBxACGAAgzurgzwUoq4u98QYw1gM4mAI!400x400.jpg','product_details.html?lid=36'),
(37, '民谣成都,安顺大桥', '3', '成都', '1499.00', 'img/products/AD0ItOahBxACGAAgzurgzwUoq4u98QYw1gM4mAI!400x400.jpg','product_details.html?lid=37'),
(38, '民谣成都,安顺大桥', '3', '成都', '1499.00', 'img/products/AD0ItOahBxACGAAgzurgzwUoq4u98QYw1gM4mAI!400x400.jpg','product_details.html?lid=38'),
(39, '民谣成都,安顺大桥', '3', '成都', '1499.00', 'img/products/AD0ItOahBxACGAAgzurgzwUoq4u98QYw1gM4mAI!400x400.jpg','product_details.html?lid=39'),
(40, '民谣成都,安顺大桥', '4', '成都', '1899.00', 'img/products/AD0ItOahBxACGAAgzurgzwUoq4u98QYw1gM4mAI!400x400.jpg','product_details.html?lid=40'),
(55, '东京+富士山+京都+奈良+大阪6天5晚或8天7晚游','6', '日本', '5699','img/selectBox/select1.jpg', 'product_details.html?lid=55'),
(56, '芽庄4晚5日半自助游','5', '芽庄','2499','img/selectBox/select2.jpg', 'product_details.html?lid=56'),
(57, '世纪游轮重回上海滩【世纪天子号】南京-上海 张家港双山岛+香山风景区+泰州一日 4天3晚行程','4', '南京-上海','2798','img/selectBox/select3.jpg','product_details.html?lid=57'),
(58, '【天海邮轮-新世纪号】2018年7月4日 上海-佐世保-上海 4晚5日游','5', '上海', '4698','img/selectBox/select4.jpg','product_details.html?lid=58'),
(59, '成都+新都桥+稻城亚丁双飞8日跟团游','8', '成都','3103','img/selectBox/select5.jpg', 'product_details.html?lid=59'),
(60, '桂林+阳朔+游轮百里大漓江+龙脊梯田+银子岩+象鼻山双飞5日跟团游','5','桂林','2394','img/selectBox/select5.jpg','product_details.html?lid=60'),
(61, '遇道北京双飞5日跟团游','5','北京','2635','img/selectBox/select6.jpg','product_details.html?lid=61'),
(62, '重庆双飞4日自由行','4','重庆','1546','img/selectBox/select7.jpg','product_details.html?lid=62'),
(63, '住扬州中集格兰云天大酒店+双人自助早餐+自选扬州瘦西湖/个园/何园/大明寺','2', '扬州','628','img/selectBox/select8.jpg','product_details.html?lid=63'),
(64, '句容茅山祈福+得撒石磨豆腐村巴士1日跟团游 成人含中餐','1','茅山祈福+得撒石磨豆腐村','569','img/selectBox/select9.jpg','product_details.html?lid=64'),
(65, '【爆款推荐】天目湖山水园-南山竹海-自理御水温泉2日跟团游;登山泡温泉','2', '南通-常州','img/zb/3gIGb5_464x236_00.jpg', '398', 'product_details.html?lid=65'),
(66, '【旅居参观】雅居乐·山湖城旅居地产+东方盐湖城双人票1日跟团游 仅售199','1', '上海-常州','img/zb/rBLkCVrWy12ADelfAAGOQ4tJzs4266_242x150_00.jpg', '199', 'product_details.html?lid=66'),
(67, '【夜上海】东方明珠+透明观光廊+城隍庙+浦江游船纯玩1日跟团游 特价促销  O自费景点  让您一天轻松玩转上海滩','1', '上海-上海','img/zb/pmdr1p_242x150_00.jpg', '168', 'product_details.html?lid=67'),
(68, '【百旅乐居】<浙江果圣山庄度假旅居>2日跟团游 端午假期热卖，入住木屋别墅，篝火晚会烧烤，欢聚果圣粽香传情，携家人一起过端午','2', '上海-湖州','img/zb/rBLkCVsGcNSAExtbAAC4diCw1qQ806_242x150_00.jpg', '550', 'product_details.html?lid=68'),
(69, '自选东方盐湖城/镇江茅山住常州宝盛园房车营地','2', '常州-镇江','img/zb/eGUJ9e_242x150_00.jpg', '180', 'product_details.html?lid=69'),
(70, '住无锡灵山君来波罗蜜多酒店自选灵山小镇·拈花湾/君来波罗蜜多酒店自助晚餐/禅食【灵山胜境】【拈花一笑·禅意生活】','3', '无锡','img/zb/rBANDFj_CT2APZ0lAAQAAJOlRtc568_242x150_00.jpg', '1239', 'product_details.html?lid=70'),
(71, '【2晚3天】自选无锡拈花客栈/禅意村舍【景区内】畅玩灵山拈花小镇+波罗密多酒店自助晚餐。【灵山胜境】【非凡周边游】【太湖精选酒店】','3', '无锡','img/selectBox/select9.jpg', '1650', 'product_details.html?lid=71'),
(72, '思君不见下渝州','4', '重庆','img/gonglve/x1.jpg', '1499', 'product_details.html?lid=72'),
(73, '感受泰式"七夕"','5', '清迈','img/gonglve/x2.jpg', '3099', 'product_details.html?lid=73'),
(74, '去希腊拍甜蜜写真','6', '圣托里尼','img/gonglve/x3.jpg', '4999', 'product_details.html?lid=74'),
(75, '滨海的文艺小城','4', '厦门','img/gonglve/x4.jpg', '1599', 'product_details.html?lid=75'),
(76, '东方夏威夷','5',  '三亚','img/gonglve/x5.jpg', '3999', 'product_details.html?lid=76'),
(77, '环海修养胜地','3', '舟山','img/gonglve/x6.jpg', '1099', 'product_details.html?lid=77'),
(78, '东方明珠避暑胜地','6', '大连','img/gonglve/x7.jpg', '2599', 'product_details.html?lid=78'),
(79, '韩国的夏威夷','6','济州','img/gonglve/x8.jpg','3699', 'product_details.html?lid=79');


#ly_laptop_pic
-----------------------------------
CREATE TABLE `ly_laptop_pic` (
  `iid` int(11) NOT NULL auto_increment,
  `laptop_lid` int(11) default NULL,
  `img` varchar(128) default NULL,
  PRIMARY KEY  (`pid`)
);

INSERT INTO `ly_laptop_pic` (`iid`, `laptop_id`,`img`) VALUES 
('1', '1', 'img/product/AD0ItOahBxACGAAg0tTkzwUonPPUygcw1gM4mAI!400x400.jpg'),
('2', '2', 'img/products/AD0ItOahBxACGAAg0tTkzwUonPPUygcw1gM4mAI!400x400.jpg'),
('3', '3', 'img/products/AD0ItOahBxACGAAg5crgzwUo1OC5rgMw1gM4mAI!400x400.jpg'),
('4', '4', 'img/products/AD0ItOahBxACGAAg9ajhzwUooI6qswQw1gM4mAI!400x400.jpg'),
('5', '5', 'img/products/AD0ItOahBxACGAAgi_zgzwUo3fSr4wUw1gM4mAI!400x400.jpg'),
('6', '6', 'img/products/AD0ItOahBxACGAAgmbjgzwUojtTzCzDWAziYAg!400x400.jpg'),
('7', '7', 'img/products/AD0ItOahBxACGAAgmdTkzwUo9Ynz9AEw1gM4mAI!400x400.jpg'),
('8', '8', 'img/products/AD0ItOahBxACGAAgrsngzwUo1J6ptAYw1gM4mAI!400x400.jpg'),
('9', '9', 'img/products/AD0ItOahBxACGAAgttPkzwUojP28lgUw1gM4mAI!400x400.jpg'),
('10', '10', 'img/products/AD0ItOahBxACGAAguMrgzwUogpnywgYw1gM4mAI!400x400.jpg'),
('11', '11', 'img/products/AD0ItOahBxACGAAgxOvgzwUo4KuPhwUw1gM4mAI!400x400.jpg'),
('12', '12', 'img/products/AD0ItOahBxACGAAgzrrgzwUo-f_21gUw1gM4mAI!400x400.jpg'),
('13', '13', 'img/products/AD0ItOahBxACGAAgzurgzwUoq4u98QYw1gM4mAI!400x400.jpg');


#ly_index_zb
----------------------------------
CREATE TABLE `ly_index_zb` (
  `zid` int(11) NOT NULL auto_increment,
  `title` varchar(64) default NULL,
  `type` varchar(128) default NULL,
  `cities` varchar(128) default NULL,
  `pic` varchar(128) default NULL,
  `price` decimal(10,2) default NULL,
  `href` varchar(128) default NULL,
   PRIMARY KEY  (`zid`)
);
INSERT INTO `ly_index_zb`(`zid`,`title`,`type`,`cities`,`pic`,`price`,`href`) VALUES
('1', '【爆款推荐】天目湖山水园-南山竹海-自理御水温泉2日跟团游;登山泡温泉','跟团游', '南通-常州','img/zb/3gIGb5_464x236_00.jpg', '398', 'product_details.html?lid=65'),
('2', '【旅居参观】雅居乐·山湖城旅居地产+东方盐湖城双人票1日跟团游 仅售199','跟团游', '上海-常州','img/zb/rBLkCVrWy12ADelfAAGOQ4tJzs4266_242x150_00.jpg', '199', 'product_details.html?lid=66'),
('3', '【夜上海】东方明珠+透明观光廊+城隍庙+浦江游船纯玩1日跟团游 特价促销  O自费景点  让您一天轻松玩转上海滩','跟团游', '上海-上海','img/zb/pmdr1p_242x150_00.jpg', '168', 'product_details.html?lid=67'),
('4', '【百旅乐居】<浙江果圣山庄度假旅居>2日跟团游 端午假期热卖，入住木屋别墅，篝火晚会烧烤，欢聚果圣粽香传情，携家人一起过端午','跟团游', '上海-湖州','img/zb/rBLkCVsGcNSAExtbAAC4diCw1qQ806_242x150_00.jpg', '550', 'product_details.html?lid=68'),
('5', '自选东方盐湖城/镇江茅山住常州宝盛园房车营地','自由行', '常州-镇江','img/zb/eGUJ9e_242x150_00.jpg', '180', 'product_details.html?lid=69'),
('6', '住无锡灵山君来波罗蜜多酒店自选灵山小镇·拈花湾/君来波罗蜜多酒店自助晚餐/禅食【灵山胜境】【拈花一笑·禅意生活】','自由行', '无锡','img/zb/rBANDFj_CT2APZ0lAAQAAJOlRtc568_242x150_00.jpg', '1239', 'product_details.html?lid=70'),
('7', '【2晚3天】自选无锡拈花客栈/禅意村舍【景区内】畅玩灵山拈花小镇+波罗密多酒店自助晚餐。【灵山胜境】【非凡周边游】【太湖精选酒店】','自由行', '无锡','img/selectBox/select9.jpg', '1650', 'product_details.html?lid=71');
