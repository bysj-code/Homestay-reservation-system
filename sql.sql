DROP TABLE IF EXISTS `slides`;
CREATE TABLE `slides` (
  `slides_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '轮播图ID：',
  `title` varchar(64) DEFAULT NULL COMMENT '标题：',
  `content` varchar(255) DEFAULT NULL COMMENT '内容：',
  `url` varchar(255) DEFAULT NULL COMMENT '链接：',
  `img` varchar(255) DEFAULT NULL COMMENT '轮播图：',
  `hits` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击量：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`slides_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='轮播图';
DROP TABLE IF EXISTS `auth`;
CREATE TABLE `auth` (
  `auth_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '授权ID：',
  `user_group` varchar(64) DEFAULT NULL COMMENT '用户组：',
  `mod_name` varchar(64) DEFAULT NULL COMMENT '模块名：',
  `table_name` varchar(64) DEFAULT NULL COMMENT '表名：',
  `page_title` varchar(255) DEFAULT NULL COMMENT '页面标题：',
  `path` varchar(255) DEFAULT NULL COMMENT '路由路径：',
  `position` varchar(32) DEFAULT NULL COMMENT '位置：',
  `mode` varchar(32) NOT NULL DEFAULT '_blank' COMMENT '跳转方式：',
  `add` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可增加：',
  `del` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可删除：',
  `set` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可修改：',
  `get` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可查看：',
  `field_add` text COMMENT '添加字段：',
  `field_set` text COMMENT '修改字段：',
  `field_get` text COMMENT '查询字段：',
  `table_nav_name` varchar(500) DEFAULT NULL COMMENT '跨表导航名称：',
  `table_nav` varchar(500) DEFAULT NULL COMMENT '跨表导航：',
  `option` text COMMENT '配置：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`auth_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户权限管理';
DROP TABLE IF EXISTS `upload`;
CREATE TABLE `upload` (
  `upload_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '上传ID',
  `name` varchar(64) DEFAULT NULL COMMENT '文件名',
  `path` varchar(255) DEFAULT NULL COMMENT '访问路径',
  `file` varchar(255) DEFAULT NULL COMMENT '文件路径',
  `display` varchar(255) DEFAULT NULL COMMENT '显示顺序',
  `father_id` int(11) DEFAULT '0' COMMENT '父级ID',
  `dir` varchar(255) DEFAULT NULL COMMENT '文件夹',
  `type` varchar(32) DEFAULT NULL COMMENT '文件类型',
  PRIMARY KEY (`upload_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='文件上传';
insert into `upload` values ('1','movie.mp4','/upload/movie.mp4','',null,'0',null,'video');
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `notice_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '公告id：',
  `title` varchar(125) NOT NULL DEFAULT '' COMMENT '标题：',
  `content` longtext COMMENT '正文：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='公告';
insert into `notice` values ('1','网站公告','<p>公告，是指政府、团体对重大事件当众正式公布或者公开宣告，宣布。国务院2012年4月16日发布、2012年7月1日起施行的《党政机关公文处理工作条例》，对公告的使用表述为：“适用于向国内外宣布重要事项或者法定事项”。其中包含两方面的内容：一是向国内外宣布重要事项，公布依据政策、法令采取的重大行动等；二是向国内外宣布法定事项，公布依据法律规定告知国内外的有关重要规定和重大行动等。</p>','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0');
insert into `notice` values ('2','关于我们','<p>       一个网站要取得成功，要有先进的理念、先进的思想，更为重要的是抢占先机，及时行动。网络世界可谓一日千里、 日新月异，一个网站只有把握先机，抓住机遇，才</p><p>可能有更多的机会获得成功，可能处于网络行业发展的致高点，可能创建出成功的网站，才能能获得成功。要知道一种网站新模式在网络上只有保持几天的优势,因为人们很容易“COPY" 和模仿，因此，唯有不</p><p>断创新，不失时机地推出新的服务、新的模式、新的思想，网站才可能长久立于不败之地。</p>','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0');
insert into `notice` values ('3','联系方式','<h3>网站内容及品牌合作</h3><p>Email：xxxx@qq.com</p><h3>商务合作</h3><p>电话：010-xxxxxxx</p><p>Email：xxxx@qq.com</p><h3><br></h3><h3><br></h3><p><br></p>','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0');
insert into `notice` values ('4','网站介绍','<p>此处可上传文字、图片、视频、超链接、表格等内容区</p>','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0');
DROP TABLE IF EXISTS `user_group`;
CREATE TABLE `user_group` (
  `group_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组ID：[0,8388607]',
  `display` smallint(4) unsigned NOT NULL DEFAULT '100' COMMENT '显示顺序：[0,1000]',
  `name` varchar(16) NOT NULL DEFAULT '' COMMENT '名称：[0,16]',
  `description` varchar(255) DEFAULT NULL COMMENT '描述：[0,255]描述该用户组的特点或权限范围',
  `source_table` varchar(255) DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  `register` smallint(1) unsigned DEFAULT '0' COMMENT '注册位置:',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`group_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户组：用于用户前端身份和鉴权';
DROP TABLE IF EXISTS `article_type`;
CREATE TABLE `article_type` (
  `type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID：[0,10000]',
  `display` smallint(4) unsigned NOT NULL DEFAULT '100' COMMENT '显示顺序：[0,1000]决定分类显示的先后顺序',
  `name` varchar(16) NOT NULL DEFAULT '' COMMENT '分类名称：[2,16]',
  `father_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID：[0,32767]',
  `description` varchar(255) DEFAULT NULL COMMENT '描述：[0,255]描述该分类的作用',
  `icon` text COMMENT '分类图标：',
  `url` varchar(255) DEFAULT NULL COMMENT '外链地址：[0,255]如果该分类是跳转到其他网站的情况下，就在该URL上设置',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`type_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='文章分类';
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `article_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章id：[0,8388607]',
  `title` varchar(125) NOT NULL DEFAULT '' COMMENT '标题：[0,125]用于文章和html的title标签中',
  `type` varchar(64) NOT NULL DEFAULT '0' COMMENT '文章分类：[0,1000]用来搜索指定类型的文章',
  `hits` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击数：[0,1000000000]访问这篇文章的人次',
  `praise_len` int(11) NOT NULL DEFAULT '0' COMMENT '点赞数',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `source` varchar(255) DEFAULT NULL COMMENT '来源：[0,255]文章的出处',
  `url` varchar(255) DEFAULT NULL COMMENT '来源地址：[0,255]用于跳转到发布该文章的网站',
  `tag` varchar(255) DEFAULT NULL COMMENT '标签：[0,255]用于标注文章所属相关内容，多个标签用空格隔开',
  `content` longtext COMMENT '正文：文章的主体内容',
  `img` varchar(255) DEFAULT NULL COMMENT '封面图',
  `description` text COMMENT '文章描述',
  PRIMARY KEY (`article_id`,`title`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='文章：用于内容管理系统的文章';
DROP TABLE IF EXISTS `praise`;
CREATE TABLE `praise` (
  `praise_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '点赞ID：',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '点赞人：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `source_table` varchar(255) DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '点赞状态:1为点赞，0已取消',
  PRIMARY KEY (`praise_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='点赞';
DROP TABLE IF EXISTS `access_token`;
CREATE TABLE `access_token` (
  `token_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '临时访问牌ID',
  `token` varchar(64) DEFAULT NULL COMMENT '临时访问牌',
  `info` text,
  `maxage` int(2) NOT NULL DEFAULT '2' COMMENT '最大寿命：默认2小时',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户编号:',
  PRIMARY KEY (`token_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='登陆访问时长';
insert into `access_token` values ('57','5accf85cb6a7f06f0aa2968deadaec1b',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('58','46ff1d4d07714f046ba07b34bffe0af9',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('59','ed9d6cba9826fda1beafcd9326be7a86',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('60','c99763c1833ea0785d9e2b81da3fd28f',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('61','33fbfaccd6d1cb9143e4129bd919d4b0',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('62','493e13da5f293ba67a56a0fe3e1fa6cf',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('63','c4b48e9e2160db09c703041a8fee0a1f',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('64','d13cdaefd3823c360c959a02a262f71d',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('65','6c6ff426fd77ea5a2025ce5ed2e42c8a',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('66','80930065a61ffcdd5cbb75f60932973c',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('67','94114763cf2e3b020495d8a27096d4ef',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('68','761052c551c97c9317bc3aa475c85b84',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('69','7c44ef14131a0ba7c16aa16cef104065',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('70','96380f3d9542c80d04bdade1cf7635a5',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('71','bfdc7acfcbf5763fda81945b60961222',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('72','170a598e51ae8ae2badde20a42fe171d',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('73','c82c357488c75926a92d8a9608d4b367',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('74','4d35290c023f407a820f37dbbb1ceb09',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('75','8d19162776682b695c0f62f3c7a92fec',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('76','a7ea2cdc9a2be179e19200e593ad5a69',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('77','c79a554f9832adc01f19682c5d576bc4',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('78','1c7d95001fa09951a679841c8100ad1f',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('79','776da1bcdd01ddb3cbf0a37fa13fc5b0',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('80','d336e88e57c329d0166931292c1fac41',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('81','37a40f526a6c82fc6110b512802d35bf',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('82','691ad331771f4109206d58aeee572371',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('83','9942e458886219960d3344b4a6a6fbec',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('84','e9939a8b7ccf9f548f0bbb5664981f96',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('85','f5b27912060d1909bef61fab9d96faae',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('86','7c5888682f1d449eb1b62f0054a79fbf',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('87','00dfdc6ac21c4a9da80fd71c990764d1',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('88','3cce592bc72840ab932ce96d85a194da',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('89','43fdaa989a644ad683ef4b4d488e8629',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('90','d6a3cecadacff0dbd6b43b25372cc2a2',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('91','5570bc5b07b3589f4ef8553bd46eb0d1',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('92','5570bc5b07b3589f4ef8553bd46eb0d1',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('93','26c553bd2ee2ab6605d18dfd310d85f9',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('94','3fd52f81236ed2c37ff91a6696d4e47a',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('95','893332e9ee67d60d8312b3700c58a359',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('96','b7844068ade535b2e517df4a40948703',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('97','179b37a5e1893c3af6b946bd5a1c8625',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('98','3a47b8a040a83ebbc9194cb255dc668c',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('99','afa60196afb77dcc2b520ed13a817560',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('100','7fc6d9b324f8c0a3a1784d04ef132692',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
insert into `access_token` values ('101','84e31b291f2bde6b7ceb27af5fe8eee3',null,'2','2023-05-30 18:21:49.0','2023-05-30 18:21:49.0','1');
DROP TABLE IF EXISTS `hits`;
CREATE TABLE `hits` (
  `hits_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '点赞ID：',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '点赞人：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `source_table` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  PRIMARY KEY (`hits_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC COMMENT='用户点击';
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `comment_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论ID：',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '评论人ID：',
  `reply_to_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '回复评论ID：空为0',
  `content` longtext COMMENT '内容：',
  `nickname` varchar(255) DEFAULT NULL COMMENT '昵称：',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像地址：[0,255]',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `source_table` varchar(255) DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  PRIMARY KEY (`comment_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='评论';
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect` (
  `collect_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '收藏ID：',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏人ID：',
  `source_table` varchar(255) DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  `title` varchar(255) DEFAULT NULL COMMENT '标题：',
  `img` varchar(255) DEFAULT NULL COMMENT '封面：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`collect_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='收藏';
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID：[0,8388607]用户获取其他与用户相关的数据',
  `state` smallint(1) unsigned NOT NULL DEFAULT '1' COMMENT '账户状态：[0,10](1可用|2异常|3已冻结|4已注销)',
  `user_group` varchar(32) DEFAULT NULL COMMENT '所在用户组：[0,32767]决定用户身份和权限',
  `login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '上次登录时间：',
  `phone` varchar(11) DEFAULT NULL COMMENT '手机号码：[0,11]用户的手机号码，用于找回密码时或登录时',
  `phone_state` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '手机认证：[0,1](0未认证|1审核中|2已认证)',
  `username` varchar(16) NOT NULL DEFAULT '' COMMENT '用户名：[0,16]用户登录时所用的账户名称',
  `nickname` varchar(16) DEFAULT '' COMMENT '昵称：[0,16]',
  `password` varchar(64) NOT NULL DEFAULT '' COMMENT '密码：[0,32]用户登录所需的密码，由6-16位数字或英文组成',
  `email` varchar(64) DEFAULT '' COMMENT '邮箱：[0,64]用户的邮箱，用于找回密码时或登录时',
  `email_state` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '邮箱认证：[0,1](0未认证|1审核中|2已认证)',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像地址：[0,255]',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户账户：用于保存用户登录信息';
insert into `user` values ('1','1','管理员','2023-05-04 16:42:42.0',null,'0','admin','admin','bfd59291e825b5f2bbf1eb76569f8fe7','','0','/api/upload/admin_avatar.jpg','2023-05-30 17:35:13.0');
DROP TABLE IF EXISTS `ordinary_users`;
CREATE TABLE `ordinary_users`(ordinary_users_id int(11) NOT NULL AUTO_INCREMENT COMMENT '普通用户ID',
`user_name` varchar(64) comment '用户姓名',
`user_gender` varchar(64) comment '用户性别',
`user_age` varchar(64) comment '用户年龄',
`examine_state` varchar(16) DEFAULT '已通过' NOT NULL comment '审核状态',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`user_id` int(11) DEFAULT '0' NOT NULL comment '用户ID',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (ordinary_users_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '普通用户';

DROP TABLE IF EXISTS `landlord_user`;
CREATE TABLE `landlord_user`(landlord_user_id int(11) NOT NULL AUTO_INCREMENT COMMENT '房东用户ID',
`name_of_homestay` varchar(64) comment '民宿名称',
`landlord_name` varchar(64) comment '房东姓名',
`homestay_address` varchar(64) comment '民宿地址',
`examine_state` varchar(16) DEFAULT '已通过' NOT NULL comment '审核状态',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`user_id` int(11) DEFAULT '0' NOT NULL comment '用户ID',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (landlord_user_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '房东用户';

DROP TABLE IF EXISTS `homestay_information`;
CREATE TABLE `homestay_information`(homestay_information_id int(11) NOT NULL AUTO_INCREMENT COMMENT '民宿信息ID',
`name_of_homestay` varchar(64) comment '民宿名称',
`landlord_user` int(11) DEFAULT 0 comment '房东用户',
`region_name` varchar(64) comment '地区名称',
`homestay_address` varchar(64) comment '民宿地址',
`room_number` varchar(64) comment '房间号',
`room_type` varchar(64) comment '房间类型',
`cover_photo` varchar(255) comment '封面图片',
`check_in_price` varchar(64) comment '入住价格',
`detailed_introduction` text comment '详情介绍',
`hits` int(11) DEFAULT 0 NOT NULL comment '点击数',
`praise_len` int(11) DEFAULT 0 NOT NULL comment '点赞数',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (homestay_information_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '民宿信息';
insert into `homestay_information` values (1,'民宿名称1',0,'地区名称1','民宿地址1','房间号1','房间类型1','/api/upload/1567353480148942849.jpg','入住价格1','详情介绍1',444,452,0,'2023-05-18 14:45:07','2023-05-18 14:45:07');
insert into `homestay_information` values (2,'民宿名称2',0,'地区名称2','民宿地址2','房间号2','房间类型2','/api/upload/1567353541893292033.jpg','入住价格2','详情介绍2',891,3,0,'2023-05-18 14:45:07','2023-05-18 14:45:07');
insert into `homestay_information` values (3,'民宿名称3',0,'地区名称3','民宿地址3','房间号3','房间类型3','/api/upload/1567353600651296769.jpg','入住价格3','详情介绍3',90,575,0,'2023-05-18 14:45:07','2023-05-18 14:45:07');
insert into `homestay_information` values (4,'民宿名称4',0,'地区名称4','民宿地址4','房间号4','房间类型4','/api/upload/1567353790833623040.jpg','入住价格4','详情介绍4',191,704,0,'2023-05-18 14:45:07','2023-05-18 14:45:07');
insert into `homestay_information` values (5,'民宿名称5',0,'地区名称5','民宿地址5','房间号5','房间类型5','/api/upload/1567353722059620353.jpg','入住价格5','详情介绍5',501,669,0,'2023-05-18 14:45:07','2023-05-18 14:45:07');
insert into `homestay_information` values (6,'民宿名称6',0,'地区名称6','民宿地址6','房间号6','房间类型6','/api/upload/1567353417020473344.jpg','入住价格6','详情介绍6',345,178,0,'2023-05-18 14:45:07','2023-05-18 14:45:07');
insert into `homestay_information` values (7,'民宿名称7',0,'地区名称7','民宿地址7','房间号7','房间类型7','/api/upload/1567353662198513664.jpg','入住价格7','详情介绍7',723,883,0,'2023-05-18 14:45:07','2023-05-18 14:45:07');
insert into `homestay_information` values (8,'民宿名称8',0,'地区名称8','民宿地址8','房间号8','房间类型8','/api/upload/1567353365472477184.jpg','入住价格8','详情介绍8',268,322,0,'2023-05-18 14:45:07','2023-05-18 14:45:07');

DROP TABLE IF EXISTS `order_management`;
CREATE TABLE `order_management`(order_management_id int(11) NOT NULL AUTO_INCREMENT COMMENT '订单管理ID',
`order_number` varchar(64) comment '订单编号',
`name_of_homestay` varchar(64) comment '民宿名称',
`room_number` varchar(64) comment '房间号',
`room_type` varchar(64) comment '房间房型',
`check_in_price` varchar(64) comment '入住价格',
`booking_users` int(11) DEFAULT 0 comment '预订用户',
`user_name` varchar(64) comment '用户姓名',
`contact_information` varchar(64) comment '联系方式',
`id_number` varchar(64) comment '身份证号',
`number_of_check_in_days` varchar(64) comment '入住天数',
`total_price` varchar(64) comment '合计总价',
`order_status` varchar(64) comment '订单状态',
`pay_state` varchar(16) DEFAULT '未支付' NOT NULL comment '支付状态',
`pay_type` varchar(16) DEFAULT '' comment '支付类型: 微信、支付宝、网银',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (order_management_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '订单管理';
insert into `order_management` values (1,'订单编号1','民宿名称1','房间号1','房间房型1','入住价格1',0,'用户姓名1','联系方式1','身份证号1','入住天数1','合计总价1','订单状态1','未支付','支付宝',0,'2023-05-18 14:45:07','2023-05-18 14:45:07');
insert into `order_management` values (2,'订单编号2','民宿名称2','房间号2','房间房型2','入住价格2',0,'用户姓名2','联系方式2','身份证号2','入住天数2','合计总价2','订单状态2','未支付','支付宝',0,'2023-05-18 14:45:07','2023-05-18 14:45:07');
insert into `order_management` values (3,'订单编号3','民宿名称3','房间号3','房间房型3','入住价格3',0,'用户姓名3','联系方式3','身份证号3','入住天数3','合计总价3','订单状态3','未支付','支付宝',0,'2023-05-18 14:45:07','2023-05-18 14:45:07');
insert into `order_management` values (4,'订单编号4','民宿名称4','房间号4','房间房型4','入住价格4',0,'用户姓名4','联系方式4','身份证号4','入住天数4','合计总价4','订单状态4','未支付','支付宝',0,'2023-05-18 14:45:07','2023-05-18 14:45:07');
insert into `order_management` values (5,'订单编号5','民宿名称5','房间号5','房间房型5','入住价格5',0,'用户姓名5','联系方式5','身份证号5','入住天数5','合计总价5','订单状态5','未支付','支付宝',0,'2023-05-18 14:45:07','2023-05-18 14:45:07');
insert into `order_management` values (6,'订单编号6','民宿名称6','房间号6','房间房型6','入住价格6',0,'用户姓名6','联系方式6','身份证号6','入住天数6','合计总价6','订单状态6','未支付','支付宝',0,'2023-05-18 14:45:07','2023-05-18 14:45:07');
insert into `order_management` values (7,'订单编号7','民宿名称7','房间号7','房间房型7','入住价格7',0,'用户姓名7','联系方式7','身份证号7','入住天数7','合计总价7','订单状态7','未支付','支付宝',0,'2023-05-18 14:45:07','2023-05-18 14:45:07');
insert into `order_management` values (8,'订单编号8','民宿名称8','房间号8','房间房型8','入住价格8',0,'用户姓名8','联系方式8','身份证号8','入住天数8','合计总价8','订单状态8','未支付','支付宝',0,'2023-05-18 14:45:07','2023-05-18 14:45:07');

DROP TABLE IF EXISTS `cancellation_of_order`;
CREATE TABLE `cancellation_of_order`(cancellation_of_order_id int(11) NOT NULL AUTO_INCREMENT COMMENT '取消订单ID',
`order_number` varchar(64) comment '订单编号',
`name_of_homestay` varchar(64) comment '民宿名称',
`room_number` varchar(64) comment '房间号',
`room_type` varchar(64) comment '房间房型',
`check_in_price` varchar(64) comment '入住价格',
`booking_users` int(11) DEFAULT 0 comment '预订用户',
`user_name` varchar(64) comment '用户姓名',
`reason_for_unsubscription` text comment '退订原因',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (cancellation_of_order_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '取消订单';
insert into `cancellation_of_order` values (1,'订单编号1','民宿名称1','房间号1','房间房型1','入住价格1',0,'用户姓名1','退订原因1',0,'2023-05-18 14:45:07','2023-05-18 14:45:07');
insert into `cancellation_of_order` values (2,'订单编号2','民宿名称2','房间号2','房间房型2','入住价格2',0,'用户姓名2','退订原因2',0,'2023-05-18 14:45:07','2023-05-18 14:45:07');
insert into `cancellation_of_order` values (3,'订单编号3','民宿名称3','房间号3','房间房型3','入住价格3',0,'用户姓名3','退订原因3',0,'2023-05-18 14:45:07','2023-05-18 14:45:07');
insert into `cancellation_of_order` values (4,'订单编号4','民宿名称4','房间号4','房间房型4','入住价格4',0,'用户姓名4','退订原因4',0,'2023-05-18 14:45:07','2023-05-18 14:45:07');
insert into `cancellation_of_order` values (5,'订单编号5','民宿名称5','房间号5','房间房型5','入住价格5',0,'用户姓名5','退订原因5',0,'2023-05-18 14:45:07','2023-05-18 14:45:07');
insert into `cancellation_of_order` values (6,'订单编号6','民宿名称6','房间号6','房间房型6','入住价格6',0,'用户姓名6','退订原因6',0,'2023-05-18 14:45:07','2023-05-18 14:45:07');
insert into `cancellation_of_order` values (7,'订单编号7','民宿名称7','房间号7','房间房型7','入住价格7',0,'用户姓名7','退订原因7',0,'2023-05-18 14:45:07','2023-05-18 14:45:07');
insert into `cancellation_of_order` values (8,'订单编号8','民宿名称8','房间号8','房间房型8','入住价格8',0,'用户姓名8','退订原因8',0,'2023-05-18 14:45:07','2023-05-18 14:45:07');

DROP TABLE IF EXISTS `sales_data`;
CREATE TABLE `sales_data`(sales_data_id int(11) NOT NULL AUTO_INCREMENT COMMENT '销售数据ID',
`report_title` varchar(64) comment '报表标题',
`report_date` date comment '报表日期',
`sales_volumes` varchar(64) comment '销售数量',
`recording_personnel` varchar(64) comment '记录人员',
`remarks` text comment '备注信息',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (sales_data_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '销售数据';
insert into `sales_data` values (1,'报表标题1','2023-05-18','销售数量1','记录人员1','备注信息1',0,'2023-05-18 14:45:07','2023-05-18 14:45:07');
insert into `sales_data` values (2,'报表标题2','2023-05-18','销售数量2','记录人员2','备注信息2',0,'2023-05-18 14:45:07','2023-05-18 14:45:07');
insert into `sales_data` values (3,'报表标题3','2023-05-18','销售数量3','记录人员3','备注信息3',0,'2023-05-18 14:45:07','2023-05-18 14:45:07');
insert into `sales_data` values (4,'报表标题4','2023-05-18','销售数量4','记录人员4','备注信息4',0,'2023-05-18 14:45:07','2023-05-18 14:45:07');
insert into `sales_data` values (5,'报表标题5','2023-05-18','销售数量5','记录人员5','备注信息5',0,'2023-05-18 14:45:07','2023-05-18 14:45:07');
insert into `sales_data` values (6,'报表标题6','2023-05-18','销售数量6','记录人员6','备注信息6',0,'2023-05-18 14:45:07','2023-05-18 14:45:07');
insert into `sales_data` values (7,'报表标题7','2023-05-18','销售数量7','记录人员7','备注信息7',0,'2023-05-18 14:45:07','2023-05-18 14:45:07');
insert into `sales_data` values (8,'报表标题8','2023-05-18','销售数量8','记录人员8','备注信息8',0,'2023-05-18 14:45:07','2023-05-18 14:45:07');

DROP TABLE IF EXISTS `quarterly_analysis`;
CREATE TABLE `quarterly_analysis`(quarterly_analysis_id int(11) NOT NULL AUTO_INCREMENT COMMENT '季度分析ID',
`reporting_quarter` varchar(64) comment '报表季度',
`report_date` varchar(64) comment '报表日期',
`profit_amount` varchar(64) comment '盈利金额',
`recording_personnel` varchar(64) comment '记录人员',
`remarks` text comment '备注信息',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (quarterly_analysis_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '季度分析';
insert into `quarterly_analysis` values (1,'报表季度1','报表日期1','盈利金额1','记录人员1','备注信息1',0,'2023-05-18 14:45:07','2023-05-18 14:45:07');
insert into `quarterly_analysis` values (2,'报表季度2','报表日期2','盈利金额2','记录人员2','备注信息2',0,'2023-05-18 14:45:07','2023-05-18 14:45:07');
insert into `quarterly_analysis` values (3,'报表季度3','报表日期3','盈利金额3','记录人员3','备注信息3',0,'2023-05-18 14:45:07','2023-05-18 14:45:07');
insert into `quarterly_analysis` values (4,'报表季度4','报表日期4','盈利金额4','记录人员4','备注信息4',0,'2023-05-18 14:45:07','2023-05-18 14:45:07');
insert into `quarterly_analysis` values (5,'报表季度5','报表日期5','盈利金额5','记录人员5','备注信息5',0,'2023-05-18 14:45:07','2023-05-18 14:45:07');
insert into `quarterly_analysis` values (6,'报表季度6','报表日期6','盈利金额6','记录人员6','备注信息6',0,'2023-05-18 14:45:07','2023-05-18 14:45:07');
insert into `quarterly_analysis` values (7,'报表季度7','报表日期7','盈利金额7','记录人员7','备注信息7',0,'2023-05-18 14:45:07','2023-05-18 14:45:07');
insert into `quarterly_analysis` values (8,'报表季度8','报表日期8','盈利金额8','记录人员8','备注信息8',0,'2023-05-18 14:45:07','2023-05-18 14:45:07');

DROP TABLE IF EXISTS `profit_and_loss_data`;
CREATE TABLE `profit_and_loss_data`(profit_and_loss_data_id int(11) NOT NULL AUTO_INCREMENT COMMENT '盈亏数据ID',
`report_title` varchar(64) comment '报表标题',
`report_date` date comment '报表日期',
`profit_amount` varchar(64) comment '盈利金额',
`loss_amount` varchar(64) comment '亏损金额',
`recording_personnel` varchar(64) comment '记录人员',
`remarks` text comment '备注信息',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (profit_and_loss_data_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '盈亏数据';
insert into `profit_and_loss_data` values (1,'报表标题1','2023-05-18','盈利金额1','亏损金额1','记录人员1','备注信息1',0,'2023-05-18 14:45:07','2023-05-18 14:45:07');
insert into `profit_and_loss_data` values (2,'报表标题2','2023-05-18','盈利金额2','亏损金额2','记录人员2','备注信息2',0,'2023-05-18 14:45:07','2023-05-18 14:45:07');
insert into `profit_and_loss_data` values (3,'报表标题3','2023-05-18','盈利金额3','亏损金额3','记录人员3','备注信息3',0,'2023-05-18 14:45:07','2023-05-18 14:45:07');
insert into `profit_and_loss_data` values (4,'报表标题4','2023-05-18','盈利金额4','亏损金额4','记录人员4','备注信息4',0,'2023-05-18 14:45:07','2023-05-18 14:45:07');
insert into `profit_and_loss_data` values (5,'报表标题5','2023-05-18','盈利金额5','亏损金额5','记录人员5','备注信息5',0,'2023-05-18 14:45:07','2023-05-18 14:45:07');
insert into `profit_and_loss_data` values (6,'报表标题6','2023-05-18','盈利金额6','亏损金额6','记录人员6','备注信息6',0,'2023-05-18 14:45:07','2023-05-18 14:45:07');
insert into `profit_and_loss_data` values (7,'报表标题7','2023-05-18','盈利金额7','亏损金额7','记录人员7','备注信息7',0,'2023-05-18 14:45:07','2023-05-18 14:45:07');
insert into `profit_and_loss_data` values (8,'报表标题8','2023-05-18','盈利金额8','亏损金额8','记录人员8','备注信息8',0,'2023-05-18 14:45:07','2023-05-18 14:45:07');

DROP TABLE IF EXISTS `regional_classification`;
CREATE TABLE `regional_classification`(regional_classification_id int(11) NOT NULL AUTO_INCREMENT COMMENT '地区分类ID',
`region_name` varchar(64) comment '地区名称',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (regional_classification_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '地区分类';
insert into `regional_classification` values (1,'地区名称1',0,'2023-05-18 14:45:07','2023-05-18 14:45:07');
insert into `regional_classification` values (2,'地区名称2',0,'2023-05-18 14:45:07','2023-05-18 14:45:07');
insert into `regional_classification` values (3,'地区名称3',0,'2023-05-18 14:45:07','2023-05-18 14:45:07');
insert into `regional_classification` values (4,'地区名称4',0,'2023-05-18 14:45:07','2023-05-18 14:45:07');
insert into `regional_classification` values (5,'地区名称5',0,'2023-05-18 14:45:07','2023-05-18 14:45:07');
insert into `regional_classification` values (6,'地区名称6',0,'2023-05-18 14:45:07','2023-05-18 14:45:07');
insert into `regional_classification` values (7,'地区名称7',0,'2023-05-18 14:45:07','2023-05-18 14:45:07');
insert into `regional_classification` values (8,'地区名称8',0,'2023-05-18 14:45:07','2023-05-18 14:45:07');

DROP TABLE IF EXISTS `room_classification`;
CREATE TABLE `room_classification`(room_classification_id int(11) NOT NULL AUTO_INCREMENT COMMENT '房间分类ID',
`room_type` varchar(64) comment '房间类型',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (room_classification_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '房间分类';
insert into `room_classification` values (1,'房间类型1',0,'2023-05-18 14:45:07','2023-05-18 14:45:07');
insert into `room_classification` values (2,'房间类型2',0,'2023-05-18 14:45:07','2023-05-18 14:45:07');
insert into `room_classification` values (3,'房间类型3',0,'2023-05-18 14:45:07','2023-05-18 14:45:07');
insert into `room_classification` values (4,'房间类型4',0,'2023-05-18 14:45:07','2023-05-18 14:45:07');
insert into `room_classification` values (5,'房间类型5',0,'2023-05-18 14:45:07','2023-05-18 14:45:07');
insert into `room_classification` values (6,'房间类型6',0,'2023-05-18 14:45:07','2023-05-18 14:45:07');
insert into `room_classification` values (7,'房间类型7',0,'2023-05-18 14:45:07','2023-05-18 14:45:07');
insert into `room_classification` values (8,'房间类型8',0,'2023-05-18 14:45:07','2023-05-18 14:45:07');

insert into `auth` values ('1','管理员','普通用户','ordinary_users','普通用户','/ordinary_users/table','','_blank','1','1','1','1','user_name,user_gender,user_age','user_name,user_gender,user_age','user_name,user_gender,user_age',null,'0','{}','2023-05-18 14:45:07.0','2023-05-18 14:45:07.0');
insert into `auth` values ('2','管理员','普通用户','ordinary_users','普通用户详情','/ordinary_users/view','','_blank','1','1','1','1','user_name,user_gender,user_age','user_name,user_gender,user_age','user_name,user_gender,user_age',null,'0','{}','2023-05-18 14:45:07.0','2023-05-18 14:45:07.0');
insert into `auth` values ('3','管理员','房东用户','landlord_user','房东用户','/landlord_user/table','','_blank','1','1','1','1','name_of_homestay,landlord_name,homestay_address','name_of_homestay,landlord_name,homestay_address','name_of_homestay,landlord_name,homestay_address',null,'0','{}','2023-05-18 14:45:07.0','2023-05-18 14:45:07.0');
insert into `auth` values ('4','管理员','房东用户','landlord_user','房东用户详情','/landlord_user/view','','_blank','1','1','1','1','name_of_homestay,landlord_name,homestay_address','name_of_homestay,landlord_name,homestay_address','name_of_homestay,landlord_name,homestay_address',null,'0','{}','2023-05-18 14:45:07.0','2023-05-18 14:45:07.0');
insert into `auth` values ('5','管理员','民宿信息','homestay_information','民宿信息','/homestay_information/table','','_blank','1','1','1','1','name_of_homestay,landlord_user,region_name,homestay_address,room_number,room_type,cover_photo,check_in_price,detailed_introduction','name_of_homestay,landlord_user,region_name,homestay_address,room_number,room_type,cover_photo,check_in_price,detailed_introduction','name_of_homestay,landlord_user,region_name,homestay_address,room_number,room_type,cover_photo,check_in_price,detailed_introduction',null,'0','{"can_show_comment":true}','2023-05-18 14:45:07.0','2023-05-18 14:45:07.0');
insert into `auth` values ('6','管理员','民宿信息','homestay_information','民宿信息详情','/homestay_information/view','','_blank','1','1','1','1','name_of_homestay,landlord_user,region_name,homestay_address,room_number,room_type,cover_photo,check_in_price,detailed_introduction','name_of_homestay,landlord_user,region_name,homestay_address,room_number,room_type,cover_photo,check_in_price,detailed_introduction','name_of_homestay,landlord_user,region_name,homestay_address,room_number,room_type,cover_photo,check_in_price,detailed_introduction',null,'0','{}','2023-05-18 14:45:07.0','2023-05-18 14:45:07.0');
insert into `auth` values ('7','管理员','民宿信息','homestay_information','民宿信息','/homestay_information/list','top','_blank','1','1','1','1','name_of_homestay,landlord_user,region_name,homestay_address,room_number,room_type,cover_photo,check_in_price,detailed_introduction','name_of_homestay,landlord_user,region_name,homestay_address,room_number,room_type,cover_photo,check_in_price,detailed_introduction','name_of_homestay,landlord_user,region_name,homestay_address,room_number,room_type,cover_photo,check_in_price,detailed_introduction',null,'0','{}','2023-05-18 14:45:07.0','2023-05-18 14:45:07.0');
insert into `auth` values ('8','管理员','民宿信息','homestay_information','民宿信息详情','/homestay_information/details','','_blank','1','1','1','1','name_of_homestay,landlord_user,region_name,homestay_address,room_number,room_type,cover_photo,check_in_price,detailed_introduction','name_of_homestay,landlord_user,region_name,homestay_address,room_number,room_type,cover_photo,check_in_price,detailed_introduction','name_of_homestay,landlord_user,region_name,homestay_address,room_number,room_type,cover_photo,check_in_price,detailed_introduction',null,'0','{"can_comment":true,"can_show_comment":true}','2023-05-18 14:45:07.0','2023-05-18 14:45:07.0');
insert into `auth` values ('9','管理员','订单管理','order_management','订单管理','/order_management/table','','_blank','1','1','1','1','order_number,name_of_homestay,room_number,room_type,check_in_price,booking_users,user_name,contact_information,id_number,number_of_check_in_days,total_price,order_status','order_number,name_of_homestay,room_number,room_type,check_in_price,booking_users,user_name,contact_information,id_number,number_of_check_in_days,total_price,order_status','order_number,name_of_homestay,room_number,room_type,check_in_price,booking_users,user_name,contact_information,id_number,number_of_check_in_days,total_price,order_status',null,'0','{"pay":true}','2023-05-18 14:45:07.0','2023-05-18 14:45:07.0');
insert into `auth` values ('10','管理员','订单管理','order_management','订单管理详情','/order_management/view','','_blank','1','1','1','1','order_number,name_of_homestay,room_number,room_type,check_in_price,booking_users,user_name,contact_information,id_number,number_of_check_in_days,total_price,order_status','order_number,name_of_homestay,room_number,room_type,check_in_price,booking_users,user_name,contact_information,id_number,number_of_check_in_days,total_price,order_status','order_number,name_of_homestay,room_number,room_type,check_in_price,booking_users,user_name,contact_information,id_number,number_of_check_in_days,total_price,order_status',null,'0','{}','2023-05-18 14:45:07.0','2023-05-18 14:45:07.0');
insert into `auth` values ('11','管理员','订单管理','order_management','订单管理','/order_management/edit','','_blank','1','1','1','1','order_number,name_of_homestay,room_number,room_type,check_in_price,booking_users,user_name,contact_information,id_number,number_of_check_in_days,total_price,order_status','order_number,name_of_homestay,room_number,room_type,check_in_price,booking_users,user_name,contact_information,id_number,number_of_check_in_days,total_price,order_status','order_number,name_of_homestay,room_number,room_type,check_in_price,booking_users,user_name,contact_information,id_number,number_of_check_in_days,total_price,order_status',null,'0','{}','2023-05-18 14:45:07.0','2023-05-18 14:45:07.0');
insert into `auth` values ('12','管理员','取消订单','cancellation_of_order','取消订单','/cancellation_of_order/table','','_blank','1','1','1','1','order_number,name_of_homestay,room_number,room_type,check_in_price,booking_users,user_name,reason_for_unsubscription','order_number,name_of_homestay,room_number,room_type,check_in_price,booking_users,user_name,reason_for_unsubscription','order_number,name_of_homestay,room_number,room_type,check_in_price,booking_users,user_name,reason_for_unsubscription',null,'0','{}','2023-05-18 14:45:07.0','2023-05-18 14:45:07.0');
insert into `auth` values ('13','管理员','取消订单','cancellation_of_order','取消订单详情','/cancellation_of_order/view','','_blank','1','1','1','1','order_number,name_of_homestay,room_number,room_type,check_in_price,booking_users,user_name,reason_for_unsubscription','order_number,name_of_homestay,room_number,room_type,check_in_price,booking_users,user_name,reason_for_unsubscription','order_number,name_of_homestay,room_number,room_type,check_in_price,booking_users,user_name,reason_for_unsubscription',null,'0','{}','2023-05-18 14:45:07.0','2023-05-18 14:45:07.0');
insert into `auth` values ('14','管理员','销售数据','sales_data','销售数据','/sales_data/table','','_blank','1','1','1','1','report_title,report_date,sales_volumes,recording_personnel,remarks','report_title,report_date,sales_volumes,recording_personnel,remarks','report_title,report_date,sales_volumes,recording_personnel,remarks',null,'0','{"figure":true}','2023-05-18 14:45:07.0','2023-05-18 14:45:07.0');
insert into `auth` values ('15','管理员','销售数据','sales_data','销售数据详情','/sales_data/view','','_blank','1','1','1','1','report_title,report_date,sales_volumes,recording_personnel,remarks','report_title,report_date,sales_volumes,recording_personnel,remarks','report_title,report_date,sales_volumes,recording_personnel,remarks',null,'0','{}','2023-05-18 14:45:07.0','2023-05-18 14:45:07.0');
insert into `auth` values ('16','管理员','季度分析','quarterly_analysis','季度分析','/quarterly_analysis/table','','_blank','1','1','1','1','reporting_quarter,report_date,profit_amount,recording_personnel,remarks','reporting_quarter,report_date,profit_amount,recording_personnel,remarks','reporting_quarter,report_date,profit_amount,recording_personnel,remarks',null,'0','{"figure":true}','2023-05-18 14:45:07.0','2023-05-18 14:45:07.0');
insert into `auth` values ('17','管理员','季度分析','quarterly_analysis','季度分析详情','/quarterly_analysis/view','','_blank','1','1','1','1','reporting_quarter,report_date,profit_amount,recording_personnel,remarks','reporting_quarter,report_date,profit_amount,recording_personnel,remarks','reporting_quarter,report_date,profit_amount,recording_personnel,remarks',null,'0','{}','2023-05-18 14:45:07.0','2023-05-18 14:45:07.0');
insert into `auth` values ('18','管理员','盈亏数据','profit_and_loss_data','盈亏数据','/profit_and_loss_data/table','','_blank','1','1','1','1','report_title,report_date,profit_amount,loss_amount,recording_personnel,remarks','report_title,report_date,profit_amount,loss_amount,recording_personnel,remarks','report_title,report_date,profit_amount,loss_amount,recording_personnel,remarks',null,'0','{"figure":true}','2023-05-18 14:45:07.0','2023-05-18 14:45:07.0');
insert into `auth` values ('19','管理员','盈亏数据','profit_and_loss_data','盈亏数据详情','/profit_and_loss_data/view','','_blank','1','1','1','1','report_title,report_date,profit_amount,loss_amount,recording_personnel,remarks','report_title,report_date,profit_amount,loss_amount,recording_personnel,remarks','report_title,report_date,profit_amount,loss_amount,recording_personnel,remarks',null,'0','{}','2023-05-18 14:45:07.0','2023-05-18 14:45:07.0');
insert into `auth` values ('20','管理员','地区分类','regional_classification','地区分类','/regional_classification/table','','_blank','1','1','1','1','region_name','region_name','region_name',null,'0','{}','2023-05-18 14:45:07.0','2023-05-18 14:45:07.0');
insert into `auth` values ('21','管理员','地区分类','regional_classification','地区分类详情','/regional_classification/view','','_blank','1','1','1','1','region_name','region_name','region_name',null,'0','{}','2023-05-18 14:45:07.0','2023-05-18 14:45:07.0');
insert into `auth` values ('22','管理员','房间分类','room_classification','房间分类','/room_classification/table','','_blank','1','1','1','1','room_type','room_type','room_type',null,'0','{}','2023-05-18 14:45:07.0','2023-05-18 14:45:07.0');
insert into `auth` values ('23','管理员','房间分类','room_classification','房间分类详情','/room_classification/view','','_blank','1','1','1','1','room_type','room_type','room_type',null,'0','{}','2023-05-18 14:45:07.0','2023-05-18 14:45:07.0');
insert into `auth` values ('24','管理员','我的收藏','collect','我的收藏','/collect/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-18 14:45:07.0','2023-05-18 14:45:07.0');
insert into `auth` values ('25','管理员','评论','comment','评论列表','/comment/table','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-18 14:45:07.0','2023-05-18 14:45:07.0');
insert into `auth` values ('26','管理员','评论','comment','评论详情','/comment/view','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-18 14:45:07.0','2023-05-18 14:45:07.0');
insert into `auth` values ('27','管理员','评论','comment','我的评论','/comment/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-18 14:45:07.0','2023-05-18 14:45:07.0');
insert into `auth` values ('28','管理员','评论','comment','评论详情','/comment/details','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-18 14:45:07.0','2023-05-18 14:45:07.0');
insert into `auth` values ('29','管理员','新闻','article','新闻资讯','/article/table','','_blank','1','1','1','1','','','',null,'0','{"print":true,"export_db":true,"import_db":true}','2023-05-18 14:45:07.0','2023-05-18 14:45:07.0');
insert into `auth` values ('30','管理员','新闻','article','新闻资讯','/article/view','','_blank','1','1','1','1','','','',null,'0','{"print":true}','2023-05-18 14:45:07.0','2023-05-18 14:45:07.0');
insert into `auth` values ('31','管理员','新闻','article','新闻资讯','/article/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-18 14:45:07.0','2023-05-18 14:45:07.0');
insert into `auth` values ('32','管理员','新闻','article','新闻资讯','/article/details','','_blank','1','1','1','1','','','',null,'0','{"can_comment":true,"can_show_comment":true}','2023-05-18 14:45:07.0','2023-05-18 14:45:07.0');
insert into `auth` values ('33','管理员','新闻分类','article_type','新闻分类列表','/article_type/table','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-18 14:45:07.0','2023-05-18 14:45:07.0');
insert into `auth` values ('34','管理员','新闻分类','article_type','新闻分类详情','/article_type/view','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-18 14:45:07.0','2023-05-18 14:45:07.0');
insert into `auth` values ('35','管理员','公告','notice','公告列表','/notice/table','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-18 14:45:07.0','2023-05-18 14:45:07.0');
insert into `auth` values ('36','管理员','公告','notice','公告详情','/notice/view','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-18 14:45:07.0','2023-05-18 14:45:07.0');
insert into `auth` values ('37','管理员','公告','notice','公告信息','/notice/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-18 14:45:07.0','2023-05-18 14:45:07.0');
insert into `auth` values ('38','管理员','公告','notice','公告详情','/notice/details','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-18 14:45:07.0','2023-05-18 14:45:07.0');
insert into `auth` values ('39','游客','普通用户','ordinary_users','普通用户','/ordinary_users/table','','_blank','1','0','0','0','user_name,user_gender,user_age','user_name,user_gender,user_age','user_name,user_gender,user_age',null,'0','{}','2023-05-18 14:45:07.0','2023-05-18 14:45:07.0');
insert into `auth` values ('40','游客','普通用户','ordinary_users','普通用户详情','/ordinary_users/view','','_blank','1','0','0','0','user_name,user_gender,user_age','user_name,user_gender,user_age','user_name,user_gender,user_age',null,'0','{}','2023-05-18 14:45:07.0','2023-05-18 14:45:07.0');
insert into `auth` values ('41','游客','房东用户','landlord_user','房东用户','/landlord_user/table','','_blank','0','0','0','0','name_of_homestay,landlord_name,homestay_address','name_of_homestay,landlord_name,homestay_address','name_of_homestay,landlord_name,homestay_address',null,'0','{}','2023-05-18 14:45:07.0','2023-05-18 14:45:07.0');
insert into `auth` values ('42','游客','房东用户','landlord_user','房东用户详情','/landlord_user/view','','_blank','0','0','0','0','name_of_homestay,landlord_name,homestay_address','name_of_homestay,landlord_name,homestay_address','name_of_homestay,landlord_name,homestay_address',null,'0','{}','2023-05-18 14:45:07.0','2023-05-18 14:45:07.0');
insert into `auth` values ('43','游客','民宿信息','homestay_information','民宿信息','/homestay_information/table','','_blank','0','0','0','0','name_of_homestay,landlord_user,region_name,homestay_address,room_number,room_type,cover_photo,check_in_price,detailed_introduction','name_of_homestay,landlord_user,region_name,homestay_address,room_number,room_type,cover_photo,check_in_price,detailed_introduction','name_of_homestay,landlord_user,region_name,homestay_address,room_number,room_type,cover_photo,check_in_price,detailed_introduction',null,'0','{"can_show_comment":false}','2023-05-18 14:45:07.0','2023-05-18 14:45:07.0');
insert into `auth` values ('44','游客','民宿信息','homestay_information','民宿信息详情','/homestay_information/view','','_blank','0','0','0','0','name_of_homestay,landlord_user,region_name,homestay_address,room_number,room_type,cover_photo,check_in_price,detailed_introduction','name_of_homestay,landlord_user,region_name,homestay_address,room_number,room_type,cover_photo,check_in_price,detailed_introduction','name_of_homestay,landlord_user,region_name,homestay_address,room_number,room_type,cover_photo,check_in_price,detailed_introduction',null,'0','{}','2023-05-18 14:45:07.0','2023-05-18 14:45:07.0');
insert into `auth` values ('45','游客','民宿信息','homestay_information','民宿信息','/homestay_information/list','top','_blank','0','0','0','1','name_of_homestay,landlord_user,region_name,homestay_address,room_number,room_type,cover_photo,check_in_price,detailed_introduction','name_of_homestay,landlord_user,region_name,homestay_address,room_number,room_type,cover_photo,check_in_price,detailed_introduction','name_of_homestay,landlord_user,region_name,homestay_address,room_number,room_type,cover_photo,check_in_price,detailed_introduction',null,'0','{}','2023-05-18 14:45:07.0','2023-05-18 14:45:07.0');
insert into `auth` values ('46','游客','民宿信息','homestay_information','民宿信息详情','/homestay_information/details','','_blank','0','0','0','1','name_of_homestay,landlord_user,region_name,homestay_address,room_number,room_type,cover_photo,check_in_price,detailed_introduction','name_of_homestay,landlord_user,region_name,homestay_address,room_number,room_type,cover_photo,check_in_price,detailed_introduction','name_of_homestay,landlord_user,region_name,homestay_address,room_number,room_type,cover_photo,check_in_price,detailed_introduction',null,'0','{"can_comment":false,"can_show_comment":false}','2023-05-18 14:45:07.0','2023-05-18 14:45:07.0');
insert into `auth` values ('47','游客','订单管理','order_management','订单管理','/order_management/table','','_blank','0','0','0','0','order_number,name_of_homestay,room_number,room_type,check_in_price,booking_users,user_name,contact_information,id_number,number_of_check_in_days,total_price,order_status','order_number,name_of_homestay,room_number,room_type,check_in_price,booking_users,user_name,contact_information,id_number,number_of_check_in_days,total_price,order_status','order_number,name_of_homestay,room_number,room_type,check_in_price,booking_users,user_name,contact_information,id_number,number_of_check_in_days,total_price,order_status',null,'0','{"pay":false}','2023-05-18 14:45:07.0','2023-05-18 14:45:07.0');
insert into `auth` values ('48','游客','订单管理','order_management','订单管理详情','/order_management/view','','_blank','0','0','0','0','order_number,name_of_homestay,room_number,room_type,check_in_price,booking_users,user_name,contact_information,id_number,number_of_check_in_days,total_price,order_status','order_number,name_of_homestay,room_number,room_type,check_in_price,booking_users,user_name,contact_information,id_number,number_of_check_in_days,total_price,order_status','order_number,name_of_homestay,room_number,room_type,check_in_price,booking_users,user_name,contact_information,id_number,number_of_check_in_days,total_price,order_status',null,'0','{}','2023-05-18 14:45:07.0','2023-05-18 14:45:07.0');
insert into `auth` values ('49','游客','订单管理','order_management','订单管理','/order_management/edit','','_blank','0','0','0','0','order_number,name_of_homestay,room_number,room_type,check_in_price,booking_users,user_name,contact_information,id_number,number_of_check_in_days,total_price,order_status','order_number,name_of_homestay,room_number,room_type,check_in_price,booking_users,user_name,contact_information,id_number,number_of_check_in_days,total_price,order_status','order_number,name_of_homestay,room_number,room_type,check_in_price,booking_users,user_name,contact_information,id_number,number_of_check_in_days,total_price,order_status',null,'0','{}','2023-05-18 14:45:07.0','2023-05-18 14:45:07.0');
insert into `auth` values ('50','游客','取消订单','cancellation_of_order','取消订单','/cancellation_of_order/table','','_blank','0','0','0','0','order_number,name_of_homestay,room_number,room_type,check_in_price,booking_users,user_name,reason_for_unsubscription','order_number,name_of_homestay,room_number,room_type,check_in_price,booking_users,user_name,reason_for_unsubscription','order_number,name_of_homestay,room_number,room_type,check_in_price,booking_users,user_name,reason_for_unsubscription',null,'0','{}','2023-05-18 14:45:07.0','2023-05-18 14:45:07.0');
insert into `auth` values ('51','游客','取消订单','cancellation_of_order','取消订单详情','/cancellation_of_order/view','','_blank','0','0','0','0','order_number,name_of_homestay,room_number,room_type,check_in_price,booking_users,user_name,reason_for_unsubscription','order_number,name_of_homestay,room_number,room_type,check_in_price,booking_users,user_name,reason_for_unsubscription','order_number,name_of_homestay,room_number,room_type,check_in_price,booking_users,user_name,reason_for_unsubscription',null,'0','{}','2023-05-18 14:45:07.0','2023-05-18 14:45:07.0');
insert into `auth` values ('52','游客','销售数据','sales_data','销售数据','/sales_data/table','','_blank','0','0','0','0','report_title,report_date,sales_volumes,recording_personnel,remarks','report_title,report_date,sales_volumes,recording_personnel,remarks','report_title,report_date,sales_volumes,recording_personnel,remarks',null,'0','{"figure":false}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('53','游客','销售数据','sales_data','销售数据详情','/sales_data/view','','_blank','0','0','0','0','report_title,report_date,sales_volumes,recording_personnel,remarks','report_title,report_date,sales_volumes,recording_personnel,remarks','report_title,report_date,sales_volumes,recording_personnel,remarks',null,'0','{}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('54','游客','季度分析','quarterly_analysis','季度分析','/quarterly_analysis/table','','_blank','0','0','0','0','reporting_quarter,report_date,profit_amount,recording_personnel,remarks','reporting_quarter,report_date,profit_amount,recording_personnel,remarks','reporting_quarter,report_date,profit_amount,recording_personnel,remarks',null,'0','{"figure":false}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('55','游客','季度分析','quarterly_analysis','季度分析详情','/quarterly_analysis/view','','_blank','0','0','0','0','reporting_quarter,report_date,profit_amount,recording_personnel,remarks','reporting_quarter,report_date,profit_amount,recording_personnel,remarks','reporting_quarter,report_date,profit_amount,recording_personnel,remarks',null,'0','{}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('56','游客','盈亏数据','profit_and_loss_data','盈亏数据','/profit_and_loss_data/table','','_blank','0','0','0','0','report_title,report_date,profit_amount,loss_amount,recording_personnel,remarks','report_title,report_date,profit_amount,loss_amount,recording_personnel,remarks','report_title,report_date,profit_amount,loss_amount,recording_personnel,remarks',null,'0','{"figure":false}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('57','游客','盈亏数据','profit_and_loss_data','盈亏数据详情','/profit_and_loss_data/view','','_blank','0','0','0','0','report_title,report_date,profit_amount,loss_amount,recording_personnel,remarks','report_title,report_date,profit_amount,loss_amount,recording_personnel,remarks','report_title,report_date,profit_amount,loss_amount,recording_personnel,remarks',null,'0','{}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('58','游客','地区分类','regional_classification','地区分类','/regional_classification/table','','_blank','0','0','0','0','region_name','region_name','region_name',null,'0','{}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('59','游客','地区分类','regional_classification','地区分类详情','/regional_classification/view','','_blank','0','0','0','0','region_name','region_name','region_name',null,'0','{}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('60','游客','房间分类','room_classification','房间分类','/room_classification/table','','_blank','0','0','0','0','room_type','room_type','room_type',null,'0','{}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('61','游客','房间分类','room_classification','房间分类详情','/room_classification/view','','_blank','0','0','0','0','room_type','room_type','room_type',null,'0','{}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('62','游客','我的收藏','collect','我的收藏','/collect/list','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('63','游客','评论','comment','评论列表','/comment/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('64','游客','评论','comment','评论详情','/comment/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('65','游客','评论','comment','我的评论','/comment/list','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('66','游客','评论','comment','评论详情','/comment/details','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('67','游客','新闻','article','新闻列表','/article/table','','_blank','0','0','0','0','','','',null,'0','{"print":false,"export_db":false,"import_db":false}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('68','游客','新闻','article','新闻详情','/article/view','','_blank','0','0','0','0','','','',null,'0','{"print":false}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('69','游客','新闻','article','新闻资讯','/article/list','','_blank','0','0','0','1','','','',null,'0','{}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('70','游客','新闻','article','新闻资讯','/article/details','','_blank','0','0','0','1','','','',null,'0','{"can_comment":false,"can_show_comment":false}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('71','游客','新闻分类','article_type','新闻分类列表','/article_type/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('72','游客','新闻分类','article_type','新闻分类详情','/article_type/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('73','游客','公告','notice','公告列表','/notice/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('74','游客','公告','notice','公告详情','/notice/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('75','游客','公告','notice','公告信息','/notice/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('76','游客','公告','notice','公告详情','/notice/details','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('77','普通用户','普通用户','ordinary_users','普通用户','/ordinary_users/table','','_blank','0','0','0','0','user_name,user_gender,user_age','user_name,user_gender,user_age','user_name,user_gender,user_age',null,'0','{}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('78','普通用户','普通用户','ordinary_users','普通用户详情','/ordinary_users/view','','_blank','0','0','0','0','user_name,user_gender,user_age','user_name,user_gender,user_age','user_name,user_gender,user_age',null,'0','{}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('79','普通用户','房东用户','landlord_user','房东用户','/landlord_user/table','','_blank','0','0','0','0','name_of_homestay,landlord_name,homestay_address','name_of_homestay,landlord_name,homestay_address','name_of_homestay,landlord_name,homestay_address',null,'0','{}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('80','普通用户','房东用户','landlord_user','房东用户详情','/landlord_user/view','','_blank','0','0','0','0','name_of_homestay,landlord_name,homestay_address','name_of_homestay,landlord_name,homestay_address','name_of_homestay,landlord_name,homestay_address',null,'0','{}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('81','普通用户','民宿信息','homestay_information','民宿信息','/homestay_information/table','','_blank','0','0','0','0','name_of_homestay,landlord_user,region_name,homestay_address,room_number,room_type,cover_photo,check_in_price,detailed_introduction','name_of_homestay,landlord_user,region_name,homestay_address,room_number,room_type,cover_photo,check_in_price,detailed_introduction','name_of_homestay,landlord_user,region_name,homestay_address,room_number,room_type,cover_photo,check_in_price,detailed_introduction',null,'0','{"can_show_comment":false}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('82','普通用户','民宿信息','homestay_information','民宿信息详情','/homestay_information/view','','_blank','0','0','0','0','name_of_homestay,landlord_user,region_name,homestay_address,room_number,room_type,cover_photo,check_in_price,detailed_introduction','name_of_homestay,landlord_user,region_name,homestay_address,room_number,room_type,cover_photo,check_in_price,detailed_introduction','name_of_homestay,landlord_user,region_name,homestay_address,room_number,room_type,cover_photo,check_in_price,detailed_introduction',null,'0','{}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('83','普通用户','民宿信息','homestay_information','民宿信息','/homestay_information/list','top','_blank','1','1','1','1','name_of_homestay,landlord_user,region_name,homestay_address,room_number,room_type,cover_photo,check_in_price,detailed_introduction','name_of_homestay,landlord_user,region_name,homestay_address,room_number,room_type,cover_photo,check_in_price,detailed_introduction','name_of_homestay,landlord_user,region_name,homestay_address,room_number,room_type,cover_photo,check_in_price,detailed_introduction',null,'0','{}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('84','普通用户','民宿信息','homestay_information','民宿信息详情','/homestay_information/details','','_blank','1','1','1','1','name_of_homestay,landlord_user,region_name,homestay_address,room_number,room_type,cover_photo,check_in_price,detailed_introduction','name_of_homestay,landlord_user,region_name,homestay_address,room_number,room_type,cover_photo,check_in_price,detailed_introduction','name_of_homestay,landlord_user,region_name,homestay_address,room_number,room_type,cover_photo,check_in_price,detailed_introduction',null,'0','{"can_comment":true,"can_show_comment":true}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('85','普通用户','订单管理','order_management','订单管理','/order_management/table','','_blank','0','0','0','1','order_number,name_of_homestay,room_number,room_type,check_in_price,booking_users,user_name,contact_information,id_number,number_of_check_in_days,total_price,order_status','order_number,name_of_homestay,room_number,room_type,check_in_price,booking_users,user_name,contact_information,id_number,number_of_check_in_days,total_price,order_status','order_number,name_of_homestay,room_number,room_type,check_in_price,booking_users,user_name,contact_information,id_number,number_of_check_in_days,total_price,order_status',null,'0','{"pay":true}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('86','普通用户','订单管理','order_management','订单管理详情','/order_management/view','','_blank','0','0','0','1','order_number,name_of_homestay,room_number,room_type,check_in_price,booking_users,user_name,contact_information,id_number,number_of_check_in_days,total_price,order_status','order_number,name_of_homestay,room_number,room_type,check_in_price,booking_users,user_name,contact_information,id_number,number_of_check_in_days,total_price,order_status','order_number,name_of_homestay,room_number,room_type,check_in_price,booking_users,user_name,contact_information,id_number,number_of_check_in_days,total_price,order_status',null,'0','{}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('87','普通用户','订单管理','order_management','订单管理','/order_management/edit','','_blank','1','1','1','1','order_number,name_of_homestay,room_number,room_type,check_in_price,booking_users,user_name,contact_information,id_number,number_of_check_in_days,total_price','order_number,name_of_homestay,room_number,room_type,check_in_price,booking_users,user_name,contact_information,id_number,number_of_check_in_days,total_price','order_number,name_of_homestay,room_number,room_type,check_in_price,booking_users,user_name,contact_information,id_number,number_of_check_in_days,total_price',null,'0','{}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('88','普通用户','取消订单','cancellation_of_order','取消订单','/cancellation_of_order/table','','_blank','1','0','0','1','order_number,name_of_homestay,room_number,room_type,check_in_price,booking_users,user_name,reason_for_unsubscription','order_number,name_of_homestay,room_number,room_type,check_in_price,booking_users,user_name,reason_for_unsubscription','order_number,name_of_homestay,room_number,room_type,check_in_price,booking_users,user_name,reason_for_unsubscription',null,'0','{}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('89','普通用户','取消订单','cancellation_of_order','取消订单详情','/cancellation_of_order/view','','_blank','1','0','0','1','order_number,name_of_homestay,room_number,room_type,check_in_price,booking_users,user_name,reason_for_unsubscription','order_number,name_of_homestay,room_number,room_type,check_in_price,booking_users,user_name,reason_for_unsubscription','order_number,name_of_homestay,room_number,room_type,check_in_price,booking_users,user_name,reason_for_unsubscription',null,'0','{}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('90','普通用户','销售数据','sales_data','销售数据','/sales_data/table','','_blank','0','0','0','0','report_title,report_date,sales_volumes,recording_personnel,remarks','report_title,report_date,sales_volumes,recording_personnel,remarks','report_title,report_date,sales_volumes,recording_personnel,remarks',null,'0','{"figure":false}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('91','普通用户','销售数据','sales_data','销售数据详情','/sales_data/view','','_blank','0','0','0','0','report_title,report_date,sales_volumes,recording_personnel,remarks','report_title,report_date,sales_volumes,recording_personnel,remarks','report_title,report_date,sales_volumes,recording_personnel,remarks',null,'0','{}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('92','普通用户','季度分析','quarterly_analysis','季度分析','/quarterly_analysis/table','','_blank','0','0','0','0','reporting_quarter,report_date,profit_amount,recording_personnel,remarks','reporting_quarter,report_date,profit_amount,recording_personnel,remarks','reporting_quarter,report_date,profit_amount,recording_personnel,remarks',null,'0','{"figure":false}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('93','普通用户','季度分析','quarterly_analysis','季度分析详情','/quarterly_analysis/view','','_blank','0','0','0','0','reporting_quarter,report_date,profit_amount,recording_personnel,remarks','reporting_quarter,report_date,profit_amount,recording_personnel,remarks','reporting_quarter,report_date,profit_amount,recording_personnel,remarks',null,'0','{}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('94','普通用户','盈亏数据','profit_and_loss_data','盈亏数据','/profit_and_loss_data/table','','_blank','0','0','0','0','report_title,report_date,profit_amount,loss_amount,recording_personnel,remarks','report_title,report_date,profit_amount,loss_amount,recording_personnel,remarks','report_title,report_date,profit_amount,loss_amount,recording_personnel,remarks',null,'0','{"figure":false}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('95','普通用户','盈亏数据','profit_and_loss_data','盈亏数据详情','/profit_and_loss_data/view','','_blank','0','0','0','0','report_title,report_date,profit_amount,loss_amount,recording_personnel,remarks','report_title,report_date,profit_amount,loss_amount,recording_personnel,remarks','report_title,report_date,profit_amount,loss_amount,recording_personnel,remarks',null,'0','{}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('96','普通用户','地区分类','regional_classification','地区分类','/regional_classification/table','','_blank','0','0','0','0','region_name','region_name','region_name',null,'0','{}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('97','普通用户','地区分类','regional_classification','地区分类详情','/regional_classification/view','','_blank','0','0','0','0','region_name','region_name','region_name',null,'0','{}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('98','普通用户','房间分类','room_classification','房间分类','/room_classification/table','','_blank','0','0','0','0','room_type','room_type','room_type',null,'0','{}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('99','普通用户','房间分类','room_classification','房间分类详情','/room_classification/view','','_blank','0','0','0','0','room_type','room_type','room_type',null,'0','{}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('100','普通用户','我的收藏','collect','我的收藏','/collect/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('101','普通用户','评论','comment','评论列表','/comment/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('102','普通用户','评论','comment','评论详情','/comment/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('103','普通用户','评论','comment','我的评论','/comment/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('104','普通用户','评论','comment','评论详情','/comment/details','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('105','普通用户','新闻','article','新闻列表','/article/table','','_blank','0','0','0','0','','','',null,'0','{"print":false,"export_db":false,"import_db":false}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('106','普通用户','新闻','article','新闻详情','/article/view','','_blank','0','0','0','0','','','',null,'0','{"print":false}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('107','普通用户','新闻','article','新闻资讯','/article/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('108','普通用户','新闻','article','新闻资讯','/article/details','','_blank','1','1','1','1','','','',null,'0','{"can_comment":true,"can_show_comment":true}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('109','普通用户','新闻分类','article_type','新闻分类列表','/article_type/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('110','普通用户','新闻分类','article_type','新闻分类详情','/article_type/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('111','普通用户','公告','notice','公告列表','/notice/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('112','普通用户','公告','notice','公告详情','/notice/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('113','普通用户','公告','notice','公告信息','/notice/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('114','普通用户','公告','notice','公告详情','/notice/details','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('115','房东用户','普通用户','ordinary_users','普通用户','/ordinary_users/table','','_blank','0','0','0','0','user_name,user_gender,user_age','user_name,user_gender,user_age','user_name,user_gender,user_age',null,'0','{}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('116','房东用户','普通用户','ordinary_users','普通用户详情','/ordinary_users/view','','_blank','0','0','0','0','user_name,user_gender,user_age','user_name,user_gender,user_age','user_name,user_gender,user_age',null,'0','{}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('117','房东用户','房东用户','landlord_user','房东用户','/landlord_user/table','','_blank','0','0','0','0','name_of_homestay,landlord_name,homestay_address','name_of_homestay,landlord_name,homestay_address','name_of_homestay,landlord_name,homestay_address',null,'0','{}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('118','房东用户','房东用户','landlord_user','房东用户详情','/landlord_user/view','','_blank','0','0','0','0','name_of_homestay,landlord_name,homestay_address','name_of_homestay,landlord_name,homestay_address','name_of_homestay,landlord_name,homestay_address',null,'0','{}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('119','房东用户','民宿信息','homestay_information','民宿信息','/homestay_information/table','','_blank','1','1','1','1','name_of_homestay,landlord_user,region_name,homestay_address,room_number,room_type,cover_photo,check_in_price,detailed_introduction','name_of_homestay,landlord_user,region_name,homestay_address,room_number,room_type,cover_photo,check_in_price,detailed_introduction','name_of_homestay,landlord_user,region_name,homestay_address,room_number,room_type,cover_photo,check_in_price,detailed_introduction',null,'0','{"can_show_comment":true}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('120','房东用户','民宿信息','homestay_information','民宿信息详情','/homestay_information/view','','_blank','1','1','1','1','name_of_homestay,landlord_user,region_name,homestay_address,room_number,room_type,cover_photo,check_in_price,detailed_introduction','name_of_homestay,landlord_user,region_name,homestay_address,room_number,room_type,cover_photo,check_in_price,detailed_introduction','name_of_homestay,landlord_user,region_name,homestay_address,room_number,room_type,cover_photo,check_in_price,detailed_introduction',null,'0','{}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('121','房东用户','民宿信息','homestay_information','民宿信息','/homestay_information/list','top','_blank','1','1','1','1','name_of_homestay,landlord_user,region_name,homestay_address,room_number,room_type,cover_photo,check_in_price,detailed_introduction','name_of_homestay,landlord_user,region_name,homestay_address,room_number,room_type,cover_photo,check_in_price,detailed_introduction','name_of_homestay,landlord_user,region_name,homestay_address,room_number,room_type,cover_photo,check_in_price,detailed_introduction',null,'0','{}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('122','房东用户','民宿信息','homestay_information','民宿信息详情','/homestay_information/details','','_blank','1','1','1','1','name_of_homestay,landlord_user,region_name,homestay_address,room_number,room_type,cover_photo,check_in_price,detailed_introduction','name_of_homestay,landlord_user,region_name,homestay_address,room_number,room_type,cover_photo,check_in_price,detailed_introduction','name_of_homestay,landlord_user,region_name,homestay_address,room_number,room_type,cover_photo,check_in_price,detailed_introduction',null,'0','{"can_comment":true,"can_show_comment":true}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('123','房东用户','订单管理','order_management','订单管理','/order_management/table','','_blank','1','1','1','1','order_number,name_of_homestay,room_number,room_type,check_in_price,booking_users,user_name,contact_information,id_number,number_of_check_in_days,total_price,order_status','order_number,name_of_homestay,room_number,room_type,check_in_price,booking_users,user_name,contact_information,id_number,number_of_check_in_days,total_price,order_status','order_number,name_of_homestay,room_number,room_type,check_in_price,booking_users,user_name,contact_information,id_number,number_of_check_in_days,total_price,order_status',null,'0','{"pay":false}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('124','房东用户','订单管理','order_management','订单管理详情','/order_management/view','','_blank','1','1','1','1','order_number,name_of_homestay,room_number,room_type,check_in_price,booking_users,user_name,contact_information,id_number,number_of_check_in_days,total_price,order_status','order_number,name_of_homestay,room_number,room_type,check_in_price,booking_users,user_name,contact_information,id_number,number_of_check_in_days,total_price,order_status','order_number,name_of_homestay,room_number,room_type,check_in_price,booking_users,user_name,contact_information,id_number,number_of_check_in_days,total_price,order_status',null,'0','{}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('125','房东用户','订单管理','order_management','订单管理','/order_management/edit','','_blank','0','0','0','0','order_number,name_of_homestay,room_number,room_type,check_in_price,booking_users,user_name,contact_information,id_number,number_of_check_in_days,total_price,order_status','order_number,name_of_homestay,room_number,room_type,check_in_price,booking_users,user_name,contact_information,id_number,number_of_check_in_days,total_price,order_status','order_number,name_of_homestay,room_number,room_type,check_in_price,booking_users,user_name,contact_information,id_number,number_of_check_in_days,total_price,order_status',null,'0','{}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('126','房东用户','取消订单','cancellation_of_order','取消订单','/cancellation_of_order/table','','_blank','1','1','1','1','order_number,name_of_homestay,room_number,room_type,check_in_price,booking_users,user_name,reason_for_unsubscription','order_number,name_of_homestay,room_number,room_type,check_in_price,booking_users,user_name,reason_for_unsubscription','order_number,name_of_homestay,room_number,room_type,check_in_price,booking_users,user_name,reason_for_unsubscription',null,'0','{}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('127','房东用户','取消订单','cancellation_of_order','取消订单详情','/cancellation_of_order/view','','_blank','1','1','1','1','order_number,name_of_homestay,room_number,room_type,check_in_price,booking_users,user_name,reason_for_unsubscription','order_number,name_of_homestay,room_number,room_type,check_in_price,booking_users,user_name,reason_for_unsubscription','order_number,name_of_homestay,room_number,room_type,check_in_price,booking_users,user_name,reason_for_unsubscription',null,'0','{}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('128','房东用户','销售数据','sales_data','销售数据','/sales_data/table','','_blank','0','0','0','0','report_title,report_date,sales_volumes,recording_personnel,remarks','report_title,report_date,sales_volumes,recording_personnel,remarks','report_title,report_date,sales_volumes,recording_personnel,remarks',null,'0','{"figure":false}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('129','房东用户','销售数据','sales_data','销售数据详情','/sales_data/view','','_blank','0','0','0','0','report_title,report_date,sales_volumes,recording_personnel,remarks','report_title,report_date,sales_volumes,recording_personnel,remarks','report_title,report_date,sales_volumes,recording_personnel,remarks',null,'0','{}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('130','房东用户','季度分析','quarterly_analysis','季度分析','/quarterly_analysis/table','','_blank','0','0','0','0','reporting_quarter,report_date,profit_amount,recording_personnel,remarks','reporting_quarter,report_date,profit_amount,recording_personnel,remarks','reporting_quarter,report_date,profit_amount,recording_personnel,remarks',null,'0','{"figure":false}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('131','房东用户','季度分析','quarterly_analysis','季度分析详情','/quarterly_analysis/view','','_blank','0','0','0','0','reporting_quarter,report_date,profit_amount,recording_personnel,remarks','reporting_quarter,report_date,profit_amount,recording_personnel,remarks','reporting_quarter,report_date,profit_amount,recording_personnel,remarks',null,'0','{}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('132','房东用户','盈亏数据','profit_and_loss_data','盈亏数据','/profit_and_loss_data/table','','_blank','0','0','0','0','report_title,report_date,profit_amount,loss_amount,recording_personnel,remarks','report_title,report_date,profit_amount,loss_amount,recording_personnel,remarks','report_title,report_date,profit_amount,loss_amount,recording_personnel,remarks',null,'0','{"figure":false}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('133','房东用户','盈亏数据','profit_and_loss_data','盈亏数据详情','/profit_and_loss_data/view','','_blank','0','0','0','0','report_title,report_date,profit_amount,loss_amount,recording_personnel,remarks','report_title,report_date,profit_amount,loss_amount,recording_personnel,remarks','report_title,report_date,profit_amount,loss_amount,recording_personnel,remarks',null,'0','{}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('134','房东用户','地区分类','regional_classification','地区分类','/regional_classification/table','','_blank','0','0','0','0','region_name','region_name','region_name',null,'0','{}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('135','房东用户','地区分类','regional_classification','地区分类详情','/regional_classification/view','','_blank','0','0','0','0','region_name','region_name','region_name',null,'0','{}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('136','房东用户','房间分类','room_classification','房间分类','/room_classification/table','','_blank','0','0','0','0','room_type','room_type','room_type',null,'0','{}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('137','房东用户','房间分类','room_classification','房间分类详情','/room_classification/view','','_blank','0','0','0','0','room_type','room_type','room_type',null,'0','{}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('138','房东用户','我的收藏','collect','我的收藏','/collect/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('139','房东用户','评论','comment','评论列表','/comment/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('140','房东用户','评论','comment','评论详情','/comment/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('141','房东用户','评论','comment','我的评论','/comment/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('142','房东用户','评论','comment','评论详情','/comment/details','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('143','房东用户','新闻','article','新闻列表','/article/table','','_blank','0','0','0','0','','','',null,'0','{"print":false,"export_db":false,"import_db":false}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('144','房东用户','新闻','article','新闻详情','/article/view','','_blank','0','0','0','0','','','',null,'0','{"print":false}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('145','房东用户','新闻','article','新闻资讯','/article/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('146','房东用户','新闻','article','新闻资讯','/article/details','','_blank','1','1','1','1','','','',null,'0','{"can_comment":true,"can_show_comment":true}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('147','房东用户','新闻分类','article_type','新闻分类列表','/article_type/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('148','房东用户','新闻分类','article_type','新闻分类详情','/article_type/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('149','房东用户','公告','notice','公告列表','/notice/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('150','房东用户','公告','notice','公告详情','/notice/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('151','房东用户','公告','notice','公告信息','/notice/list','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `auth` values ('152','房东用户','公告','notice','公告详情','/notice/details','','_blank','1','1','1','1','','','',null,'0','{}','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `user_group` values ('1','100','管理员',null,'','','0','0','2023-05-18 14:45:07.0','2023-05-18 14:45:07.0');
insert into `user_group` values ('2','100','游客',null,'','','0','0','2023-05-18 14:45:07.0','2023-05-18 14:45:07.0');
insert into `user_group` values ('3','100','普通用户',null,'ordinary_users','ordinary_users_id','0','3','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `user_group` values ('4','100','房东用户',null,'landlord_user','landlord_user_id','0','0','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `slides` values ('1','轮播图1','内容1','/article/details?article=1','/api/upload/1567352834586836992.jpg','557','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `slides` values ('2','轮播图2','内容2','/article/details?article=2','/api/upload/1567352933438193665.jpg','387','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `slides` values ('3','轮播图3','内容3','/article/details?article=3','/api/upload/1567353000677081088.jpg','395','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
insert into `article` values ('1','老宅“蝶变”带热古城旅游','民宿','800','0','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0',null,null,null,'<p class="ql-align-justify">	<span style="color: rgb(51, 51, 51);">据潮州市文化广电旅游体育局统计，该市民宿客栈共有162家，民宿客栈不仅保留了潮州古建筑的原貌，也成为展示古城历史文脉和潮州文化的重要平台，逐渐将旅客引向古城的内街小巷，为古城集聚越来越多的人气。</span>	走进潮州的民宿客栈，能追寻到一串串的历史往事。历史上韩江水路是潮客地区的货物往来的主要通道，上水门和竹木门就是往来客家货物的码头。在广济楼边的李厝巷就成了与客家有生意往来的商家及客家人的聚居地。在李厝巷靠近城墙处的巷口，有着一中一洋两座不同风格的小楼。因年久失修等原因，两座楼逐渐变成了危楼。</p><p class="ql-align-justify">	这两座危楼，却被偏爱古建筑的丁先生相中了。接手后的丁先生为了修复小楼费尽心思，翻阅了大量的史料，力求还原他原本的面貌。修葺一新的小楼变成了东门客栈，红砖、彩绘地砖、彩色玻璃、木制栏杆等历史文化元素在小楼随处可见，独有的内天井格局让公共客厅宽敞明亮。与此同时，在不影响建筑美观的前提下，还将现代化的升降电梯巧妙地融入了小楼中，提升了民宿的体验。从这里推窗望去，韩江、广济楼、湘子桥尽收眼底，步行不远就是牌坊群集的牌坊街。有游客感慨道：“这里不单是为游客提供一个舒适的居住环境，更是集中了解潮州文化的一个非常好的窗口。”</p><p><br></p>','/api/upload/1567356779371692032.jpg','走进潮州的民宿客栈，能追寻到一串串的历史往事');
insert into `article` values ('2','上榜全国甲级旅游民宿  丽江古城的这家民宿凭什么？','民宿','630','0','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0',null,null,null,'<p>丽江，素称被遗忘的王国，丽江的美富于神奇，它不缺柔软的时光，缺的是可润心的去处。在丽江，什么样的休闲方式最能体现丽江的柔软时光呢？在思考问这个问题之前，闭上眼、静下心，让一幅幅与“丽江时光”有关的画面在脑海里浮现。当你选一个晴天，闲坐在丽江文晋院客栈的阳台或茶室里，那些画面就渐趋圆满了。</p><p><img src="http://n.sinaimg.cn/sinakd20111/300/w1620h1080/20230214/332f-9167e7357049b02c90538362811bf634.jpg"></p>','/api/upload/1625342064428318721.jpg',null);
insert into `article` values ('3','打造旅游民宿高质量发展','民宿','510','0','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0',null,null,null,'<p><span style="color: rgb(51, 51, 51);">民宿是丰富旅游产品供给的重要领域，是调整和优化旅游住宿业结构的重要形态，有助于推动旅游业供给侧结构性改革，在一定程度上帮助解决旅游发展不平衡不充分问题，大力发展民宿业势在必行。疫情两年多来，多次实行跨省熔断，多地要求“非必要不出市”，乡村旅游这种近程型旅游产品成为疫情下很多游客释放旅游需求的首选产品。数据显示，2021年，全省乡村旅游监测点共接待游客量达3.89亿人次，乡村旅游消费收入达1212.65亿元。今年以来，随着各地疫情逐步得到控制，乡村旅游消费收入的总量还在继续攀高。这无疑是一个巨大的市场，乡村旅游的蛋糕越做越大，乡村民宿的发展之路也就越走越宽。江苏省民宿行业要充分借助近年来国家和省里的政策利好，全面开启高质量发展的新阶段，让民宿成为产业发展的新抓手，在城乡民宿业态的不断演化和升级中，促进度假、健康疗养、生态农业等多种产业的融合发展。</span></p>','/api/upload/1567358091417092096.jpg','让民宿成为产业发展的新抓手');
insert into `article` values ('4','乡村民宿、房车露营任你选！','民宿','487','0','2023-05-18 14:45:08.0','2023-05-18 14:45:08.0',null,null,null,'<p><span style="background-color: rgb(237, 237, 237); color: rgb(80, 80, 80);">朱家角镇张马村是全国乡村旅游重点村，生态环境优美。进入九月，村内早稻田已呈现金黄色，義田民宿就坐落在充满稻香的农田旁。结合当地的文化历史底蕴和乡村风貌，義田民宿设计了以酒文化、纸文化、菌菇文化、健康养生为主的四类主题民宿，打造一片带有浓郁文化气息的民宿群，深受市民欢迎。</span></p>','/api/upload/1567356162108555265.jpg','在严格落实常态化疫情防控各项措施的基础上，沪郊旅游成为不少市民休闲度假的首选。');
insert into `article_type` values ('1','100','民宿','0',null,null,null,'2023-05-18 14:45:08.0','2023-05-18 14:45:08.0');
