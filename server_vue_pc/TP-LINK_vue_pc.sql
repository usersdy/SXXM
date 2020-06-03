#设置编码为utf8
SET NAMES UTF8;
#丢弃数据库，如果存在的话
DROP DATABASE IF EXISTS tplink_vue_pc;
#创建新的数据库
CREATE DATABASE tplink_vue_pc  CHARSET=UTF8;
#进入数据库
USE tplink_vue_pc;
-- 创建用户信息表;
create table  tplink_user(
      uid INT  AUTO_INCREMENT PRIMARY KEY,
      uname VARCHAR(128),
      upwd VARCHAR(128),
      phone  BIGINT  
);
INSERT INTO  tplink_user VALUES
(null,'USER11','Aaa123',13980007834),
(null,'USER22','Bbb123',13980007834),
(null,'USER11','Ccc123',13980007834);

-- 创建商品分类表
create table  tplink_family(
    id INT  AUTO_INCREMENT PRIMARY KEY,
    fid INT ,
    fname VARCHAR(32),
    tplink_family_described VARCHAR(128)
);
INSERT INTO tplink_family VALUES
(null,10,'家用商品','domestic'),
(null,20,'商用商品','commercial'),
(null,30,'安防监控','defend');

-- 创建展示商品列表
create table tplink_show_product(
      id INT AUTO_INCREMENT PRIMARY KEY,
      fid INT,
      pid INT,
      title VARCHAR(128),
      price DECIMAL(7,2),
      src VARCHAR(128),
      href VARCHAR(128),
      described VARCHAR(128)
);
INSERT INTO tplink_show_product VALUES
(null,10,1,'TL-WDR7600千兆版AC1900双频千兆无线路由器',199.00,'img/product/normal/TL-WDR7660.png','product_details.html?pid=1','domestic'),
(null,10,2,'TL-WDR5620 珍珠白 AC1200双频无线路由器',119.00,'img/product/normal/TL-WDR5620.png','product_details.html?pid=2','domestic'),
(null,10,3,'TL-WDR5660千兆版 AC1200双频千兆无线路由器',179.00,'img/product/normal/TL-WDR5660.png','product_details.html?pid=3','domestic'),
(null,20,4,'TL-SG1210P 全千兆以太网PoE交换机',420.00,'img/product/normal/TL-SG1210P.png','product_details.html?pid=4','commercial'),
(null,20,5,'TL-ER3220G 双核多WAN口千兆企业VPN路由器',799.00,'img/product/normal/TL-ER3220G.png','product_details.html?pid=5','commercial'),
(null,20,6,'TL-R473GP-AC PoE·AC一体化千兆VPN路由器',499.00 ,'img/product/normal/TL-R473GP-AC.png','product_details.html?pid=6','commercial'),
(null,30,7,'TL-IPC42A-4 200万云台无线网络摄像机 自带语音功能',199.00 ,'img/product/normal/TL-IPC42A-4.png','product_details.html?pid=7','defend'),
(null,30,8,'TL-IPC42C-4 200万云台无线网络摄像机 自带语音功能',189.00  ,'img/product/normal/TL-IPC42C-4.png','product_details.html?pid=8','defend'),
(null,30,9,'TL-IPC53A 全景无线网络摄像机 自带语音功能',199.00 ,'img/product/normal/TL-IPC53A.png','product_details.html?pid=9','defend');


-- 创建主页家用商品表
create table tplink_domestic_product(
      id INT AUTO_INCREMENT PRIMARY KEY,
      fid INT,
      pid INT,
      title VARCHAR(128),
      details VARCHAR(128),
      price DECIMAL(7,2),
      src VARCHAR(128),
      href VARCHAR(128)
);
INSERT INTO tplink_domestic_product VALUES
(null,10,10,'TL-WDR7650千兆易展版套装 AC1900易展Mesh分布式路由','Wi-Fi无缝覆盖，信号无处不在',349.00 ,"img/product/normal/TL-WDR7650.png",'product_details.html?pid=10'),
(null,10,1,'TL-WDR7600千兆版 AC1900双频千兆无线路由器','2019 重新定义主流路由',199.00,'img/product/normal/TL-WDR7660.png','product_details.html?pid=1'),
(null,10,3,'TL-WDR5660千兆版 AC1200双频千兆无线路由器','一见，倾心；端口全千兆，双频更畅通',179.00,'img/product/normal/TL-WDR5660.png','product_details.html?pid=3'),
(null,10,11,'TL-WDR7620千兆易展版 AC1900双频千兆无线路由器','易展分布式路由，单台很强，组合更强',199.00,"img/product/normal/TL-WDR7620.png",'product_details.html?pid=11'),
(null,10,12,'TL-WDR7661千兆易展版 AC1900双频千兆无线路由器','易展分布式路由，单台很强，组合更强',195.00 ,"img/product/normal/TL-WDR7661.png",'product_details.html?pid=12'),
(null,10,13,'TL-WDR8690 AC2600双频千兆无线路由器','魅影疾风，一骑绝尘',299.00 ,"img/product/normal/TL-WDR8690.png",'product_details.html?pid=13'),
(null,10,14,'TL-XDR3020 AX3000双频千兆Wi-Fi6无线路由器','Wi-Fi无缝覆盖，信号无处不在',399.00 ,"img/product/normal/TL-XDR3020.png",'product_details.html?pid=14');

-- 创建主页安防监控表
create table tplink_defend_product(
      id INT AUTO_INCREMENT PRIMARY KEY,
      fid INT,
      pid INT,
      title VARCHAR(128),
      details VARCHAR(128),
      price DECIMAL(7,2),
      src VARCHAR(128),
      href VARCHAR(128)
);

INSERT INTO tplink_defend_product VALUES
(null,30,15,'TL-IPC44AN 双目变焦版 双目广角变焦摄像机','一机双画面，广角变焦全',309.00 ,"img/product/normal/TL-IPC44AN.png",'product_details.html?pid=15'),
(null,30,16,'TL-IPC633-D4 300万星光室外无线球机','专业监控，以一顶多，一球到位',299.00,"img/product/normal/TL-IPC633-D4.png",'product_details.html?pid=16'),
(null,30,17,'TL-IPC646-D4  300万星光室外无线球机','专业监控 多样需求，只需一球',399.00,"img/product/normal/TL-IPC646-D4.png",'product_details.html?pid=17'),
(null,30,18,'TL-IPC633-D4G 300万4G星光室外球机','专业监控 球机配4G，监控更便利',459.00,"img/product/normal/TL-IPC633-D4G.png",'product_details.html?pid=18'),
(null,30,19,'TL-IPC534H-WB4 300万黑光全彩网络摄像机','专业监控 黑光全彩，看透黑暗',299.00,"img/product/normal/TL-IPC534H-WB4.png",'product_details.html?pid=19'),
(null,30,20,'TL-NVR6104C 网络硬盘录像机——黑色版','全高清监控录像，智能安防昼夜守候',249.00,"img/product/normal/TL-NVR6104C.png",'product_details.html?pid=20'),
(null,30,21,'TL-TR901 室外防水4G路由器','监控户外工程适用，支持4G全网通，插卡自动联网，随时随地监控',399.00,"img/product/normal/TL-TR901.png",'product_details.html?pid=21');


-- 创建主页商用商品表
create table tplink_commercial_product(
      id INT AUTO_INCREMENT PRIMARY KEY,
      fid INT,
      pid INT,
      title VARCHAR(128),
      details VARCHAR(128),
      price DECIMAL(7,2),
      src VARCHAR(128),
      href VARCHAR(128)
);

INSERT INTO tplink_commercial_product VALUES
(null,20,22,'TL-R488GPM-AC PoE·AC一体化路由模块','监控户外工程适用，支持4G全网通，插卡自动联网，随时随地监控',399.00,"img/product/normal/TL-R488GPM-AC.png",'product_details.html?pid=22'),
(null,20,23,'TL-SG1005D 5口全千兆非网管交换机','全千兆非网管交换机，提供5个RJ45端口，即插即用',109.00,"img/product/normal/TL-SG1005D.png",'product_details.html?pid=23'),
(null,20,24,'TL-FC311A-20 千兆单模单纤光纤收发器 1SC+1GE','单模单纤传输，最长传输距离可达20km',129.00,"img/product/normal/TL-FC311A-20.png",'product_details.html?pid=24'),
(null,20,25,'TL-HDAP1800GC-PoE/DC AC1800四频高密度无线吸顶式AP','11AC双频并发，四个射频同时接入，胖瘦一体',799.00,"img/product/normal/TL-HDAP1800GC-PoE.png",'product_details.html?pid=25'),
(null,20,26,'TL-R470GP-AC PoE·AC一体化千兆路由器','内置AC+PoE功能，简化小微企业/别墅环境无线组网',379.00,"img/product/normal/TL-R470GP-AC.png",'product_details.html?pid=26'),
(null,20,27,'TL-AP1202GI-PoE薄款 AC1200双频千兆无线面板式AP 米兰金','2.4G/5G 双频并发，无线速率高达1167Mbps',329.00,"img/product/normal/TL-AP1202GI-PoE.png",'product_details.html?pid=27'),
(null,20,28,'TL-WVR1200L 企业级AC1200双频无线VPN路由器','全面升级，焕新外观，新1200M企业路由',599.00,"img/product/normal/TL-WVR1200L.png",'product_details.html?pid=28');
-- 创建所有商品表
create table tplink_product(
      id INT  AUTO_INCREMENT PRIMARY KEY,
      fid INT,
      pid INT,
      title VARCHAR(128),
      details VARCHAR(128),
      price DECIMAL(7,2),
      address VARCHAR(128),
      isAvailable  VARCHAR(20),
      src VARCHAR(128),
      described VARCHAR(128),
      href VARCHAR(128)
);
INSERT into tplink_product VALUES
(null,10,1,'TL-WDR7600千兆版 AC1900双频千兆无线路由器','2019 重新定义主流路由',199.00,'广东 深圳','有货','img/product/normal/TL-WDR7660.png','domestic','product_details.html?pid=1'),
(null,10,2,'TL-WDR5620珍珠白 AC1200双频无线路由器','更畅通的双频信号，更简便的设置界面',119.00,'广东 深圳','有货','img/product/normal/TL-WDR5620.png','domestic','product_details.html?pid=2'),
(null,10,3,'TL-WDR5660千兆版 AC1900双频千兆无线路由器','一见，倾心；端口全千兆，双频更畅通',179.00,'广东 深圳','有货','img/product/normal/TL-WDR5660.png','domestic','product_details.html?pid=3'),
(null,20,4,'TL-SG1210P全千兆以太网PoE交换机','提供8个千兆PoE供电网口，1个千兆普通网口和1个千兆光口',420.00,'广东 深圳','有货','img/product/normal/TL-SG1210P.png','commercial','product_details.html?pid=4'),
(null,20,5,'TL-ER3220G 双核多WAN口千兆企业VPN路由器','64位网络专用处理器，高速稳定的多WAN口设备',799.00,'广东 深圳','有货','img/product/normal/TL-ER3220G.png','commercial','product_details.html?pid=5'),
(null,20,6,'TL-R473GP-AC PoE·AC一体化千兆VPN路由器','内置AC+PoE功能，简化小微企业/别墅环境无线组网',499.00,'广东 深圳','有货','img/product/normal/TL-R473GP-AC.png','commercial','product_details.html?pid=6'),
(null,30,7,'TL-IPC42A-4 200万云台无线网络摄像机 自带语音功能','云台旋转，360°全视野无死角；双向语音功能，可录音，可通话',199.00,'广东 深圳','有货','img/product/normal/TL-IPC42A-4.png','defend','product_details.html?pid=7'),
(null,30,8,'TL-IPC42C-4 200万云台无线网络摄像机 自带语音功能','360°全视角，智能追踪跟拍，主动发声警告',189.00,'广东 深圳','有货','img/product/normal/TL-IPC42C-4.png','defend','product_details.html?pid=8'),
(null,30,9,'TL-IPC53A 全景无线网络摄像机 自带语音功能','一眼看全景',239.00,'广东 深圳','有货','img/product/normal/TL-IPC53A.png','defend','product_details.html?pid=9'),
(null,10,10,'TL-WDR7650千兆易展版套装 AC1900易展Mesh分布式路由','Wi-Fi无缝覆盖，信号无处不在',349.00,'广东 深圳','有货',"img/product/normal/TL-WDR7650.png",'domestic','product_details.html?pid=10'),
(null,10,11,'TL-WDR7620千兆易展版 AC1900双频千兆无线路由器','易展分布式路由，单台很强，组合更强',199.00,'广东 深圳','有货',"img/product/normal/TL-WDR7620.png",'domestic','product_details.html?pid=11'),
(null,10,12,'TL-WDR7661千兆易展版 AC1900双频千兆无线路由器','易展分布式路由，单台很强，组合更强',195.00 ,'广东 深圳','有货',"img/product/normal/TL-WDR7661.png",'domestic','product_details.html?pid=12'),
(null,10,13,'TL-WDR8690 AC2600双频千兆无线路由器','魅影疾风，一骑绝尘',299.00,'广东 深圳','有货',"img/product/normal/TL-WDR8690.png",'domestic','product_details.html?pid=13'),
(null,10,14,'TL-XDR3020 AX3000双频千兆Wi-Fi6无线路由器','Wi-Fi无缝覆盖，信号无处不在',399.00,'广东 深圳','有货',"img/product/normal/TL-XDR3020.png",'domestic','product_details.html?pid=14'),

(null,30,15,'TL-IPC44AN 双目变焦版 双目广角变焦摄像机','一机双画面，广角变焦全',309.00 ,'广东 深圳','有货',"img/product/normal/TL-IPC44AN.png",'defend','product_details.html?pid=15'),
(null,30,16,'TL-IPC633-D4 300万星光室外无线球机','专业监控，以一顶多，一球到位',299.00,'广东 深圳','有货',"img/product/normal/TL-IPC633-D4.png",'defend','product_details.html?pid=16'),
(null,30,17,'TL-IPC646-D4  300万星光室外无线球机','专业监控 多样需求，只需一球',399.00,'广东 深圳','有货',"img/product/normal/TL-IPC646-D4.png",'defend','product_details.html?pid=17'),
(null,30,18,'TL-IPC633-D4G 300万4G星光室外球机','专业监控 球机配4G，监控更便利',459.00,'广东 深圳','有货',"img/product/normal/TL-IPC633-D4G.png",'defend','product_details.html?pid=18'),
(null,30,19,'TL-IPC534H-WB4 300万黑光全彩网络摄像机','专业监控 黑光全彩，看透黑暗',299.00 ,'广东 深圳','有货',"img/product/normal/TL-IPC534H-WB4.png",'defend','product_details.html?pid=19'),
(null,30,20,'TL-NVR6104C 网络硬盘录像机——黑色版','全高清监控录像，智能安防昼夜守候',249.00,'广东 深圳','有货',"img/product/normal/TL-NVR6104C.png",'defend','product_details.html?pid=20'),
(null,30,21,'TL-TR901 室外防水4G路由器','监控户外工程适用，支持4G全网通，插卡自动联网，随时随地监控',399.00,'广东 深圳','有货',"img/product/normal/TL-TR901.png",'defend','product_details.html?pid=21'),

(null,20,22,'TL-R488GPM-AC PoE·AC一体化路由模块','内置AC+PoE功能，轻松组网',599.00,'广东 深圳','有货',"img/product/normal/TL-R488GPM-AC.png",'commercial','product_details.html?pid=22'),
(null,20,23,'TL-SG1005D 5口全千兆非网管交换机','全千兆非网管交换机，提供5个RJ45端口，即插即用',109.00,'广东 深圳','有货',"img/product/normal/TL-SG1005D.png",'commercial','product_details.html?pid=23'),
(null,20,24,'TL-FC311A-20 千兆单模单纤光纤收发器 1SC+1GE','单模单纤传输，最长传输距离可达20km',129.00,'广东 深圳','有货',"img/product/normal/TL-FC311A-20.png",'commercial','product_details.html?pid=24'),
(null,20,25,'TL-HDAP1800GC-PoE/DC AC1800四频高密度无线吸顶式AP','11AC双频并发，四个射频同时接入，胖瘦一体',799.00,'广东 深圳','有货',"img/product/normal/TL-HDAP1800GC-PoE.png",'commercial','product_details.html?pid=25'),
(null,20,26,'TL-R470GP-AC PoE·AC一体化千兆路由器','内置AC+PoE功能，简化小微企业/别墅环境无线组网',379.00,'广东 深圳','有货',"img/product/normal/TL-R470GP-AC.png",'commercial','product_details.html?pid=26'),
(null,20,27,'TL-AP1202GI-PoE薄款 AC1200双频千兆无线面板式AP 米兰金','2.4G/5G 双频并发，无线速率高达1167Mbps',329.00,'广东 深圳','有货',"img/product/normal/TL-AP1202GI-PoE.png",'commercial','product_details.html?pid=27'),
(null,20,28,'TL-WVR1200L 企业级AC1200双频无线VPN路由器','全面升级，焕新外观，新1200M企业路由',599.00,'广东 深圳','有货',"img/product/normal/TL-WVR1200L.png",'commercial','product_details.html?pid=28');
-- 创建商品大小图片表
-- 创建商品大小图片表
create table tplink_product_picture(
      id INT  AUTO_INCREMENT PRIMARY KEY,
      pid INT,
      sm  VARCHAR(128),
      lg VARCHAR(128)
);
INSERT INTO tplink_product_picture VALUES
(null,1,'img/product/sm/TL-WDR7660_sm.png','img/product/lg/TL-WDR7660_lg.png'),
(null,1,'img/product/sm/TL-WDR7660_sm1.png','img/product/lg/TL-WDR7660_lg1.png'),
(null,1,'img/product/sm/TL-WDR7660_sm2.png','img/product/lg/TL-WDR7660_lg2.png'),
(null,1,'img/product/sm/TL-WDR7660_sm3.png','img/product/lg/TL-WDR7660_lg3.jpg'),
(null,1,'img/product/sm/TL-WDR7660_sm4.png','img/product/lg/TL-WDR7660_lg4.jpg'),

(null,2,'img/product/sm/TL-WDR5620_sm.png','img/product/lg/TL-WDR5620_lg.png'),
(null,2,'img/product/sm/TL-WDR5620_sm1.jpg','img/product/lg/TL-WDR5620_lg1.jpg'),
(null,2,'img/product/sm/TL-WDR5620_sm2.jpg','img/product/lg/TL-WDR5620_lg2.jpg'),
(null,2,'img/product/sm/TL-WDR5620_sm3.jpg','img/product/lg/TL-WDR5620_lg3.jpg'),
(null,2,'img/product/sm/TL-WDR5620_sm4.jpg','img/product/lg/TL-WDR5620_lg4.jpg'),

(null,3,'img/product/sm/TL-WDR5660_sm.png','img/product/lg/TL-WDR5660_lg.png'),
(null,3,'img/product/sm/TL-WDR5660_sm1.jpg','img/product/lg/TL-WDR5660_lg1.jpg'),
(null,3,'img/product/sm/TL-WDR5660_sm2.jpg','img/product/lg/TL-WDR5660_lg2.jpg'),
(null,3,'img/product/sm/TL-WDR5660_sm3.jpg','img/product/lg/TL-WDR5660_lg3.jpg'),
(null,3,'img/product/sm/TL-WDR5660_sm4.jpg','img/product/lg/TL-WDR5660_lg4.jpg'),

(null,4,'img/product/sm/TL-SG1210P_sm.png','img/product/lg/TL-SG1210P_lg.png'),
(null,4,'img/product/sm/TL-SG1210P_sm1.jpg','img/product/lg/TL-SG1210P_lg1.jpg'),
(null,4,'img/product/sm/TL-SG1210P_sm2.jpg','img/product/lg/TL-SG1210P_lg2.jpg'),
(null,4,'img/product/sm/TL-SG1210P_sm3.jpg','img/product/lg/TL-SG1210P_lg3.jpg'),
(null,4,'img/product/sm/TL-SG1210P_sm4.jpg','img/product/lg/TL-SG1210P_lg4.jpg'),

(null,5,'img/product/sm/TL-ER3220G_sm.png','img/product/lg/TL-ER3220G_lg.png'),
(null,5,'img/product/sm/TL-ER3220G_sm1.jpg','img/product/lg/TL-ER3220G_lg1.jpg'),
(null,5,'img/product/sm/TL-ER3220G_sm2.jpg','img/product/lg/TL-ER3220G_lg2.jpg'),
(null,5,'img/product/sm/TL-ER3220G_sm3.jpg','img/product/lg/TL-ER3220G_lg3.jpg'),
(null,5,'img/product/sm/TL-ER3220G_sm4.jpg','img/product/lg/TL-ER3220G_lg4.jpg'),

(null,6,'img/product/sm/TL-R473GP-AC_sm.png','img/product/lg/TL-R473GP-AC_lg.png'),
(null,6,'img/product/sm/TL-R473GP-AC_sm1.jpg','img/product/lg/TL-R473GP-AC_lg1.jpg'),
(null,6,'img/product/sm/TL-R473GP-AC_sm2.jpg','img/product/lg/TL-R473GP-AC_lg2.jpg'),
(null,6,'img/product/sm/TL-R473GP-AC_sm3.jpg','img/product/lg/TL-R473GP-AC_lg3.jpg'),

(null,7,'img/product/sm/TL-IPC42A-4_sm.png','img/product/lg/TL-IPC42A-4_lg.png'),
(null,7,'img/product/sm/TL-IPC42A-4_sm1.jpg','img/product/lg/TL-IPC42A-4_lg1.jpg'),
(null,7,'img/product/sm/TL-IPC42A-4_sm2.jpg','img/product/lg/TL-IPC42A-4_lg2.jpg'),
(null,7,'img/product/sm/TL-IPC42A-4_sm3.jpg','img/product/lg/TL-IPC42A-4_lg3.jpg'),
(null,7,'img/product/sm/TL-IPC42A-4_sm4.jpg','img/product/lg/TL-IPC42A-4_lg4.jpg'),

(null,8,'img/product/sm/TL-IPC42C-4_sm.png','img/product/lg/TL-IPC42C-4_lg.png'),
(null,8,'img/product/sm/TL-IPC42C-4_sm1.jpg','img/product/lg/TL-IPC42C-4_lg1.jpg'),

(null,9,'img/product/sm/TL-IPC53A_sm.png','img/product/lg/TL-IPC53A_lg.png'),
(null,9,'img/product/sm/TL-IPC53A_sm1.jpg','img/product/lg/TL-IPC53A_lg1.jpg'),
(null,9,'img/product/sm/TL-IPC53A_sm2.jpg','img/product/lg/TL-IPC53A_lg2.jpg'),
(null,9,'img/product/sm/TL-IPC53A_sm3.jpg','img/product/lg/TL-IPC53A_lg3.jpg'),
(null,9,'img/product/sm/TL-IPC53A_sm4.jpg','img/product/lg/TL-IPC53A_lg4.jpg'),

(null,10,'img/product/sm/TL-WDR7650_sm.png','img/product/lg/TL-WDR7650_lg.png'),
(null,10,'img/product/sm/TL-WDR7650_sm1.jpg','img/product/lg/TL-WDR7650_lg1.jpg'),
(null,10,'img/product/sm/TL-WDR7650_sm2.jpg','img/product/lg/TL-WDR7650_lg2.jpg'),
(null,10,'img/product/sm/TL-WDR7650_sm3.jpg','img/product/lg/TL-WDR7650_lg3.jpg'),
(null,10,'img/product/sm/TL-WDR7650_sm4.jpg','img/product/lg/TL-WDR7650_lg4.jpg'),

(null,11,'img/product/sm/TL-WDR7620_sm.png','img/product/lg/TL-WDR7620_lg.png'),
(null,11,'img/product/sm/TL-WDR7620_sm1.jpg','img/product/lg/TL-WDR7620_lg1.jpg'),
(null,11,'img/product/sm/TL-WDR7620_sm2.jpg','img/product/lg/TL-WDR7620_lg2.jpg'),
(null,11,'img/product/sm/TL-WDR7620_sm3.jpg','img/product/lg/TL-WDR7620_lg3.jpg'),

(null,12,'img/product/sm/TL-WDR7661_sm.png','img/product/lg/TL-WDR7661_lg.png'),
(null,12,'img/product/sm/TL-WDR7661_sm1.jpg','img/product/lg/TL-WDR7661_lg1.jpg'),
(null,12,'img/product/sm/TL-WDR7661_sm2.jpg','img/product/lg/TL-WDR7661_lg2.jpg'),
(null,12,'img/product/sm/TL-WDR7661_sm3.jpg','img/product/lg/TL-WDR7661_lg3.jpg'),
(null,12,'img/product/sm/TL-WDR7661_sm4.jpg','img/product/lg/TL-WDR7661_lg4.jpg'),


(null,13,'img/product/sm/TL-WDR8690_sm.png','img/product/lg/TL-WDR8690_lg.png'),
(null,13,'img/product/sm/TL-WDR8690_sm1.jpg','img/product/lg/TL-WDR8690_lg1.jpg'),
(null,13,'img/product/sm/TL-WDR8690_sm2.jpg','img/product/lg/TL-WDR8690_lg2.jpg'),
(null,13,'img/product/sm/TL-WDR8690_sm3.jpg','img/product/lg/TL-WDR8690_lg3.jpg'),
(null,13,'img/product/sm/TL-WDR8690_sm4.jpg','img/product/lg/TL-WDR8690_lg4.jpg'),

(null,14,'img/product/sm/TL-XDR3020_sm.png','img/product/lg/TL-XDR3020_lg.png'),

(null,15,'img/product/sm/TL-IPC44AN_sm.png','img/product/lg/TL-IPC44AN_lg.png'),
(null,15,'img/product/sm/TL-IPC44AN_sm1.jpg','img/product/lg/TL-IPC44AN_lg1.jpg'),
(null,15,'img/product/sm/TL-IPC44AN_sm2.jpg','img/product/lg/TL-IPC44AN_lg2.jpg'),
(null,15,'img/product/sm/TL-IPC44AN_sm3.jpg','img/product/lg/TL-IPC44AN_lg3.jpg'),
(null,15,'img/product/sm/TL-IPC44AN_sm4.jpg','img/product/lg/TL-IPC44AN_lg4.jpg'),

(null,16,'img/product/sm/TL-IPC633-D4_sm.png','img/product/lg/TL-IPC633-D4_lg.png'),
(null,16,'img/product/sm/TL-IPC633-D4_sm1.jpg','img/product/lg/TL-IPC633-D4_lg1.jpg'),
(null,16,'img/product/sm/TL-IPC633-D4_sm2.jpg','img/product/lg/TL-IPC633-D4_lg2.jpg'),
(null,16,'img/product/sm/TL-IPC633-D4_sm3.jpg','img/product/lg/TL-IPC633-D4_lg3.jpg'),
(null,16,'img/product/sm/TL-IPC633-D4_sm4.jpg','img/product/lg/TL-IPC633-D4_lg4.jpg'),

(null,17,'img/product/sm/TL-IPC646-D4_sm.png','img/product/lg/TL-IPC646-D4_lg.png'),
(null,17,'img/product/sm/TL-IPC646-D4_sm1.jpg','img/product/lg/TL-IPC646-D4_lg1.jpg'),
(null,17,'img/product/sm/TL-IPC646-D4_sm2.jpg','img/product/lg/TL-IPC646-D4_lg2.jpg'),
(null,17,'img/product/sm/TL-IPC646-D4_sm3.jpg','img/product/lg/TL-IPC646-D4_lg3.jpg'),
(null,17,'img/product/sm/TL-IPC646-D4_sm4.jpg','img/product/lg/TL-IPC646-D4_lg4.jpg'),

(null,18,'img/product/sm/TL-IPC633-D4G_sm.png','img/product/lg/TL-IPC633-D4G_lg.png'),
(null,18,'img/product/sm/TL-IPC633-D4G_sm1.jpg','img/product/lg/TL-IPC633-D4G_lg1.jpg'),
(null,18,'img/product/sm/TL-IPC633-D4G_sm2.jpg','img/product/lg/TL-IPC633-D4G_lg2.jpg'),
(null,18,'img/product/sm/TL-IPC633-D4G_sm3.jpg','img/product/lg/TL-IPC633-D4G_lg3.jpg'),

(null,19,'img/product/sm/TL-IPC534H-WB4_sm.png','img/product/lg/TL-IPC534H-WB4_lg.png'),
(null,19,'img/product/sm/TL-IPC534H-WB4_sm1.jpg','img/product/lg/TL-IPC534H-WB4_lg1.jpg'),
(null,19,'img/product/sm/TL-IPC534H-WB4_sm2.jpg','img/product/lg/TL-IPC534H-WB4_lg2.jpg'),
(null,19,'img/product/sm/TL-IPC534H-WB4_sm3.jpg','img/product/lg/TL-IPC534H-WB4_lg3.jpg'),
(null,19,'img/product/sm/TL-IPC534H-WB4_sm4.jpg','img/product/lg/TL-IPC534H-WB4_lg4.jpg'),

(null,20,'img/product/sm/TL-NVR6104C_sm.png','img/product/lg/TL-NVR6104C_lg.png'),
(null,20,'img/product/sm/TL-NVR6104C_sm1.jpg','img/product/lg/TL-NVR6104C_lg1.jpg'),
(null,20,'img/product/sm/TL-NVR6104C_sm2.jpg','img/product/lg/TL-NVR6104C_lg2.jpg'),
(null,20,'img/product/sm/TL-NVR6104C_sm3.jpg','img/product/lg/TL-NVR6104C_lg3.jpg'),
(null,20,'img/product/sm/TL-NVR6104C_sm4.jpg','img/product/lg/TL-NVR6104C_lg4.jpg'),

(null,21,'img/product/sm/TL-TR901_sm.png','img/product/lg/TL-TR901_lg.png'),
(null,21,'img/product/sm/TL-TR901_sm1.jpg','img/product/lg/TL-TR901_lg1.jpg'),
(null,21,'img/product/sm/TL-TR901_sm2.jpg','img/product/lg/TL-TR901_lg2.jpg'),
(null,21,'img/product/sm/TL-TR901_sm3.jpg','img/product/lg/TL-TR901_lg3.jpg'),
(null,21,'img/product/sm/TL-TR901_sm4.jpg','img/product/lg/TL-TR901_lg4.jpg'),

(null,22,'img/product/sm/TL-R488GPM-AC_sm.png','img/product/lg/TL-R488GPM-AC_lg.png'),
(null,22,'img/product/sm/TL-R488GPM-AC_sm1.jpg','img/product/lg/TL-R488GPM-AC_lg1.jpg'),
(null,22,'img/product/sm/TL-R488GPM-AC_sm2.jpg','img/product/lg/TL-R488GPM-AC_lg2.jpg'),
(null,22,'img/product/sm/TL-R488GPM-AC_sm3.jpg','img/product/lg/TL-R488GPM-AC_lg3.jpg'),
(null,22,'img/product/sm/TL-R488GPM-AC_sm4.jpg','img/product/lg/TL-R488GPM-AC_lg4.jpg'),

(null,23,'img/product/sm/TL-SG1005D_sm.png','img/product/lg/TL-SG1005D_lg.png'),
(null,23,'img/product/sm/TL-SG1005D_sm1.jpg','img/product/lg/TL-SG1005D_lg1.jpg'),
(null,23,'img/product/sm/TL-SG1005D_sm2.jpg','img/product/lg/TL-SG1005D_lg2.jpg'),
(null,23,'img/product/sm/TL-SG1005D_sm3.jpg','img/product/lg/TL-SG1005D_lg3.jpg'),
(null,23,'img/product/sm/TL-SG1005D_sm4.jpg','img/product/lg/TL-SG1005D_lg4.jpg'),

(null,24,'img/product/sm/TL-FC311A-20_sm.png','img/product/lg/TL-FC311A-20_lg.png'),
(null,24,'img/product/sm/TL-FC311A-20_sm1.jpg','img/product/lg/TL-FC311A-20_lg1.jpg'),
(null,24,'img/product/sm/TL-FC311A-20_sm2.jpg','img/product/lg/TL-FC311A-20_lg2.jpg'),
(null,24,'img/product/sm/TL-FC311A-20_sm3.jpg','img/product/lg/TL-FC311A-20_lg3.jpg'),
(null,24,'img/product/sm/TL-FC311A-20_sm4.jpg','img/product/lg/TL-FC311A-20_lg4.jpg'),

(null,25,'img/product/sm/TL-HDAP1800GC-PoE_sm.png','img/product/lg/TL-HDAP1800GC-PoE_lg.png'),
(null,25,'img/product/sm/TL-HDAP1800GC-PoE_sm1.jpg','img/product/lg/TL-HDAP1800GC-PoE_lg1.jpg'),
(null,25,'img/product/sm/TL-HDAP1800GC-PoE_sm2.jpg','img/product/lg/TL-HDAP1800GC-PoE_lg2.jpg'),
(null,25,'img/product/sm/TL-HDAP1800GC-PoE_sm3.jpg','img/product/lg/TL-HDAP1800GC-PoE_lg3.jpg'),
(null,25,'img/product/sm/TL-HDAP1800GC-PoE_sm4.jpg','img/product/lg/TL-HDAP1800GC-PoE_lg4.jpg'),

(null,26,'img/product/sm/TL-R470GP-AC_sm.png','img/product/lg/TL-R470GP-AC_lg.png'),
(null,26,'img/product/sm/TL-R470GP-AC_sm1.jpg','img/product/lg/TL-R470GP-AC_lg1.jpg'),
(null,26,'img/product/sm/TL-R470GP-AC_sm2.jpg','img/product/lg/TL-R470GP-AC_lg2.jpg'),
(null,26,'img/product/sm/TL-R470GP-AC_sm3.jpg','img/product/lg/TL-R470GP-AC_lg3.jpg'),
(null,26,'img/product/sm/TL-R470GP-AC_sm4.jpg','img/product/lg/TL-R470GP-AC_lg4.jpg'),

(null,27,'img/product/sm/TL-AP1202GI-PoE_sm.png','img/product/lg/TL-AP1202GI-PoE_lg.png'),
(null,27,'img/product/sm/TL-AP1202GI-PoE_sm1.jpg','img/product/lg/TL-AP1202GI-PoE_lg1.jpg'),
(null,27,'img/product/sm/TL-AP1202GI-PoE_sm2.jpg','img/product/lg/TL-AP1202GI-PoE_lg2.jpg'),
(null,27,'img/product/sm/TL-AP1202GI-PoE_sm3.jpg','img/product/lg/TL-AP1202GI-PoE_lg3.jpg'),
(null,27,'img/product/sm/TL-AP1202GI-PoE_sm4.jpg','img/product/lg/TL-AP1202GI-PoE_lg4.jpg'),

(null,28,'img/product/sm/TL-WVR1200L_sm.png','img/product/lg/TL-WVR1200L_lg.png'),
(null,28,'img/product/sm/TL-WVR1200L_sm1.jpg','img/product/lg/TL-WVR1200L_lg1.jpg'),
(null,28,'img/product/sm/TL-WVR1200L_sm2.jpg','img/product/lg/TL-WVR1200L_lg2.jpg'),
(null,28,'img/product/sm/TL-WVR1200L_sm3.jpg','img/product/lg/TL-WVR1200L_lg3.jpg');
-- 创建商品详情图片表
create table tplink_product_detial_picture(
      id INT  AUTO_INCREMENT PRIMARY KEY,
      pid INT,
      src VARCHAR(128)
);
INSERT INTO tplink_product_detial_picture VALUES
(null,1,'img/product/detail/TL-WDR7660_detail.jpg'),
(null,1,'img/product/detail/TL-WDR7660_detail1.jpg'),
(null,1,'img/product/detail/TL-WDR7660_detail2.jpg'),
(null,1,'img/product/detail/TL-WDR7660_detail3.jpg'),

(null,2,'img/product/detail/TL-WDR5620_detail.jpg'),
(null,2,'img/product/detail/TL-WDR5620_detail1.jpg'),
(null,2,'img/product/detail/TL-WDR5620_detail2.jpg'),

(null,3,'img/product/detail/TL-WDR5660_detail.jpg'),
(null,3,'img/product/detail/TL-WDR5660_detail1.jpg'),
(null,3,'img/product/detail/TL-WDR5660_detail2.jpg'),
(null,3,'img/product/detail/TL-WDR5660_detail3.jpg'),

(null,4,'img/product/detail/TL-SG1210P_detail.jpg'),

(null,5,'img/product/detail/TL-ER3220G_detail.jpg'),

(null,6,'img/product/detail/TL-R473GP-AC_detail.jpg'),

(null,7,'img/product/detail/TL-IPC42A-4_detail.jpg'),
(null,7,'img/product/detail/TL-IPC42A-4_detail1.jpg'),
(null,7,'img/product/detail/TL-IPC42A-4_detail2.jpg'),

(null,8,'img/product/detail/TL-IPC42C-4_detail.jpg'),
(null,8,'img/product/detail/TL-IPC42C-4_detail1.jpg'),

(null,8,'img/product/detail/TL-IPC42C-4_detail.jpg'),
(null,8,'img/product/detail/TL-IPC42C-4_detail1.jpg'),

(null,9,'img/product/detail/TL-IPC53A_detail.jpg'),
(null,9,'img/product/detail/TL-IPC53A_detail1.jpg'),
(null,9,'img/product/detail/TL-IPC53A_detail2.jpg'),

(null,10,'img/product/detail/TL-WDR7650_detail.jpg'),
(null,10,'img/product/detail/TL-WDR7650_detail1.jpg'),

(null,11,'img/product/detail/TL-WDR7620_detail.jpg'),
(null,11,'img/product/detail/TL-WDR7620_detail1.jpg'),
(null,11,'img/product/detail/TL-WDR7620_detail2.jpg'),


(null,12,'img/product/detail/TL-WDR7661_detail.jpg'),
(null,12,'img/product/detail/TL-WDR7661_detail1.jpg'),
(null,12,'img/product/detail/TL-WDR7661_detail2.jpg'),
(null,12,'img/product/detail/TL-WDR7661_detail3.jpg'),

(null,13,'img/product/detail/TL-WDR8690_detail.jpg'),
(null,13,'img/product/detail/TL-WDR8690_detail1.jpg'),
(null,13,'img/product/detail/TL-WDR8690_detail2.jpg'),
(null,13,'img/product/detail/TL-WDR8690_detail3.jpg'),

(null,14,'img/product/detail/TL-XDR3020_detail.jpg'),
(null,14,'img/product/detail/TL-XDR3020_detail1.jpg'),
(null,14,'img/product/detail/TL-XDR3020_detail2.jpg'),
(null,14,'img/product/detail/TL-XDR3020_detail3.jpg'),

(null,15,'img/product/detail/TL-IPC44AN_detail.jpg'),
(null,15,'img/product/detail/TL-IPC44AN_detail1.jpg'),
(null,15,'img/product/detail/TL-IPC44AN_detail2.jpg'),
(null,15,'img/product/detail/TL-IPC44AN_detail3.jpg'),


(null,16,'img/product/detail/TL-IPC633-D4_detail.jpg'),
(null,16,'img/product/detail/TL-IPC633-D4_detail1.jpg'),
(null,16,'img/product/detail/TL-IPC633-D4_detail2.jpg'),
(null,16,'img/product/detail/TL-IPC633-D4_detail3.jpg'),

(null,17,'img/product/detail/TL-IPC646-D4_detail.jpg'),
(null,17,'img/product/detail/TL-IPC646-D4_detail1.jpg'),
(null,17,'img/product/detail/TL-IPC646-D4_detail2.jpg'),
(null,17,'img/product/detail/TL-IPC646-D4_detail3.jpg'),

(null,18,'img/product/detail/TL-IPC633-D4G_detail.jpg'),
(null,18,'img/product/detail/TL-IPC633-D4G_detail1.jpg'),
(null,18,'img/product/detail/TL-IPC633-D4G_detail2.jpg'),
(null,18,'img/product/detail/TL-IPC633-D4G_detail3.jpg'),

(null,19,'img/product/detail/TL-IPC534H-WB4_detail.jpg'),
(null,19,'img/product/detail/TL-IPC534H-WB4_detail1.jpg'),
(null,19,'img/product/detail/TL-IPC534H-WB4_detail2.jpg'),
(null,19,'img/product/detail/TL-IPC534H-WB4_detail3.jpg'),

(null,20,'img/product/detail/TL-NVR6104C_detail.jpg'),
(null,20,'img/product/detail/TL-NVR6104C_detail1.jpg'),
(null,20,'img/product/detail/TL-NVR6104C_detail2.jpg'),
(null,20,'img/product/detail/TL-NVR6104C_detail3.jpg'),

(null,21,'img/product/detail/TL-TR901_detail.jpg'),
(null,21,'img/product/detail/TL-TR901_detail1.jpg'),
(null,21,'img/product/detail/TL-TR901_detail2.jpg'),
(null,21,'img/product/detail/TL-TR901_detail3.jpg'),

(null,22,'img/product/detail/TL-R488GPM-AC_detail.jpg'),
(null,22,'img/product/detail/TL-R488GPM-AC_detail1.jpg'),
(null,22,'img/product/detail/TL-R488GPM-AC_detail2.jpg'),
(null,22,'img/product/detail/TL-R488GPM-AC_detail3.jpg'),

(null,23,'img/product/detail/TL-SG1005D_detail.jpg'),

(null,24,'img/product/detail/TL-FC311A-20_detail.jpg'),

(null,25,'img/product/detail/TL-HDAP1800GC-PoE_detail.jpg'),
(null,25,'img/product/detail/TL-HDAP1800GC-PoE_detail1.jpg'),
(null,25,'img/product/detail/TL-HDAP1800GC-PoE_detail2.jpg'),
(null,25,'img/product/detail/TL-HDAP1800GC-PoE_detail3.jpg'),

(null,26,'img/product/detail/TL-R470GP-AC_detail.jpg'),
(null,26,'img/product/detail/TL-R470GP-AC_detail1.jpg'),
(null,26,'img/product/detail/TL-R470GP-AC_detail2.jpg'),
(null,26,'img/product/detail/TL-R470GP-AC_detail3.jpg'),

(null,27,'img/product/detail/TL-AP1202GI-PoE_detail.jpg'),
(null,27,'img/product/detail/TL-AP1202GI-PoE_detail1.jpg'),
(null,27,'img/product/detail/TL-AP1202GI-PoE_detail2.jpg'),
(null,27,'img/product/detail/TL-AP1202GI-PoE_detail3.jpg'),

(null,28,'img/product/detail/TL-WVR1200L_detail.jpg');
-- 创建购物车表
create table shop_car(
      uid INT,
      pid INT,
      num INT,
      cid INT AUTO_INCREMENT PRIMARY KEY
);
INSERT INTO shop_car VALUES
(1,4,1,null),
(1,3,1,null),
(1,2,1,null),
(1,1,1,null);

-- 轮播图片
create table banner(
       id INT  AUTO_INCREMENT PRIMARY KEY,
       src VARCHAR(128),
       href VARCHAR(128)
);
INSERT INTO banner VALUES
(null,'img/product/banner/banner1.jpg','product_details.html?pid=14'),
(null,'img/product/banner/banner2.jpg','product_details.html?pid=10'),
(null,'img/product/banner/banner3.jpg','product_details.html?pid=15'),
(null,'img/product/banner/banner4.jpg','product_details.html?pid=25');

create  table comment(
      id INT  AUTO_INCREMENT PRIMARY KEY,
      pid INT,
      nice INT,
      wrong INT,
      url VARCHAR(128),
      uid INT,
      uname VARCHAR(20),
      comment VARCHAR(128),
      niced boolean,
      wronged boolean
);