create table user
(
	user_id int auto_increment
		primary key,
	username varchar(20) not null,
	password varchar(100) not null,
	user_type varchar(20) default '用户' null,
	school_name varchar(50) null,
	phone varchar(11) null,
	address varchar(100) null,
	description varchar(300) null,
	gender varchar(5) null,
	birthday date null,
	constraint user_username_uindex
		unique (username)
);

create table school
(
	school_id int auto_increment
		primary key,
	school_name varchar(50) null,
	description varchar(300) null,
	admin_id int null,
	constraint school_school_name_uindex
		unique (school_name),
	constraint school_admin
		foreign key (admin_id) references user (user_id)
);

create table class
(
	class_id int auto_increment
		primary key,
	class_name varchar(50) not null,
	academy varchar(50) null,
	description varchar(300) null,
	admin_id int not null,
	school_id int null,
	constraint class_admin
		foreign key (admin_id) references user (user_id),
	constraint school
		foreign key (school_id) references school (school_id)
);


create table message
(
	message_id int auto_increment
		primary key,
	from_user int not null,
	ref_class int not null,
	message varchar(100) not null,
	to_user int not null
);

create index message_user_user_id_fk_2
	on message (to_user);


create table image
(
	image_id int auto_increment
		primary key,
	suffix varchar(300) null,
	ref_class int null,
	constraint image_class_class_id_fk
		foreign key (ref_class) references class (class_id)
);

create table relation
(
	relation_id int auto_increment
		primary key,
	user_id int not null,
	class_id int not null,
	constraint relation_class_class_id_fk
		foreign key (class_id) references class (class_id),
	constraint relation_user_user_id_fk
		foreign key (user_id) references user (user_id)
);


INSERT INTO addresslist.user (user_id, username, password, user_type, school_name, phone, address, description, gender, birthday) VALUES (1, '小明', 'C4CA4238A0B923820DCC509A6F75849B', '用户', '师大', '13806183213', '无锡', '哈哈哈', '女', '2019-03-01');
INSERT INTO addresslist.user (user_id, username, password, user_type, school_name, phone, address, description, gender, birthday) VALUES (2, '小红', 'C4CA4238A0B923820DCC509A6F75849B', '用户', '江师大', '13806183213', '常州21', '哈哈哈', '女', '2019-03-15');
INSERT INTO addresslist.user (user_id, username, password, user_type, school_name, phone, address, description, gender, birthday) VALUES (3, '小强', 'C4CA4238A0B923820DCC509A6F75849B', '用户', '师大', '13806183213', '无锡', 'hhh', '男', '2019-05-01');
INSERT INTO addresslist.user (user_id, username, password, user_type, school_name, phone, address, description, gender, birthday) VALUES (4, '小黑', 'C4CA4238A0B923820DCC509A6F75849B', '用户', '江师大', '13807863245', '徐州', '哈哈哈', '女', '2019-03-14');
INSERT INTO addresslist.user (user_id, username, password, user_type, school_name, phone, address, description, gender, birthday) VALUES (5, '小兰', 'C4CA4238A0B923820DCC509A6F75849B', '用户', '江师大', '13806183213', '徐州', '哈哈哈', '女', '2019-03-01');
INSERT INTO addresslist.user (user_id, username, password, user_type, school_name, phone, address, description, gender, birthday) VALUES (6, '小黄', 'C4CA4238A0B923820DCC509A6F75849B', '用户', '师大', '13507173892', '徐州', '无敌是多么寂寞', '男', '2019-03-22');
INSERT INTO addresslist.user (user_id, username, password, user_type, school_name, phone, address, description, gender, birthday) VALUES (8, '小绿', 'C4CA4238A0B923820DCC509A6F75849B', '用户', '师大', '13806183213', '徐州', '哈哈哈', '女', '2019-03-01');
INSERT INTO addresslist.user (user_id, username, password, user_type, school_name, phone, address, description, gender, birthday) VALUES (9, '小粉', 'C4CA4238A0B923820DCC509A6F75849B', '用户', '师大', '13806183213', '徐州', '哈哈哈', '女', '2019-03-01');
INSERT INTO addresslist.user (user_id, username, password, user_type, school_name, phone, address, description, gender, birthday) VALUES (10, '小白', 'C4CA4238A0B923820DCC509A6F75849B', '用户', '师大', '13806183213', '徐州', '哈哈哈', '女', '2019-03-01');
INSERT INTO addresslist.user (user_id, username, password, user_type, school_name, phone, address, description, gender, birthday) VALUES (11, '小紫', 'C4CA4238A0B923820DCC509A6F75849B', '用户', '师大', '13806183213', '常州', '努力', '女', '2019-03-01');
INSERT INTO addresslist.user (user_id, username, password, user_type, school_name, phone, address, description, gender, birthday) VALUES (12, '大明', 'C4CA4238A0B923820DCC509A6F75849B', '用户', '师大', '13806183213', '徐州', '哈哈哈', '女', '2019-03-01');
INSERT INTO addresslist.user (user_id, username, password, user_type, school_name, phone, address, description, gender, birthday) VALUES (13, '大红', 'C4CA4238A0B923820DCC509A6F75849B', '用户', '师大', '13806183213', null, null, null, null);
INSERT INTO addresslist.user (user_id, username, password, user_type, school_name, phone, address, description, gender, birthday) VALUES (14, '大紫', 'C4CA4238A0B923820DCC509A6F75849B', '用户', '师大', null, '常州', '无敌是多么寂寞', '男', '2019-03-01');
INSERT INTO addresslist.user (user_id, username, password, user_type, school_name, phone, address, description, gender, birthday) VALUES (15, '大强', 'C4CA4238A0B923820DCC509A6F75849B', '用户', '师大', '13806183213', null, null, null, null);
INSERT INTO addresslist.user (user_id, username, password, user_type, school_name, phone, address, description, gender, birthday) VALUES (16, '大黑', 'C4CA4238A0B923820DCC509A6F75849B', '用户', '师大', null, '常州', '无敌是多么寂寞', '男', '2019-03-01');
INSERT INTO addresslist.user (user_id, username, password, user_type, school_name, phone, address, description, gender, birthday) VALUES (17, '大绿', 'C4CA4238A0B923820DCC509A6F75849B', '用户', '师大', '13806183213', null, null, null, null);
INSERT INTO addresslist.user (user_id, username, password, user_type, school_name, phone, address, description, gender, birthday) VALUES (18, '大蓝', 'C4CA4238A0B923820DCC509A6F75849B', '用户', '师大', null, '常州', '无敌是多么寂寞', '男', '2019-03-02');
INSERT INTO addresslist.user (user_id, username, password, user_type, school_name, phone, address, description, gender, birthday) VALUES (19, '大白', 'C4CA4238A0B923820DCC509A6F75849B', '用户', '师大', '13806183213', null, null, null, null);
INSERT INTO addresslist.user (user_id, username, password, user_type, school_name, phone, address, description, gender, birthday) VALUES (20, '大粉', 'C4CA4238A0B923820DCC509A6F75849B', '用户', '师大', null, '常州', '无敌是多么寂寞', '男', '2019-03-02');
INSERT INTO addresslist.user (user_id, username, password, user_type, school_name, phone, address, description, gender, birthday) VALUES (21, '大大', 'C4CA4238A0B923820DCC509A6F75849B', '用户', '师大', '13806183213', null, null, null, null);
INSERT INTO addresslist.user (user_id, username, password, user_type, school_name, phone, address, description, gender, birthday) VALUES (22, 'admin', 'C4CA4238A0B923820DCC509A6F75849B', '管理员', '北大青鸟', '', null, '我是管理员', '男', null);

INSERT INTO addresslist.school (school_id, school_name, description, admin_id) VALUES (1, '江苏师范大学', '位于徐州。。。', 22);
INSERT INTO addresslist.school (school_id, school_name, description, admin_id) VALUES (2, '中国矿业大学', '矿大是一所采矿大学', 22);
INSERT INTO addresslist.school (school_id, school_name, description, admin_id) VALUES (3, '江南大学', '在无锡', 22);
INSERT INTO addresslist.school (school_id, school_name, description, admin_id) VALUES (4, '苏州大学', '在苏州', 22);
INSERT INTO addresslist.school (school_id, school_name, description, admin_id) VALUES (5, '南京大学', '江苏最强', 22);
INSERT INTO addresslist.school (school_id, school_name, description, admin_id) VALUES (6, '北京大学', 'top2', 22);
INSERT INTO addresslist.school (school_id, school_name, description, admin_id) VALUES (7, '清华大学', 'top2', 22);
INSERT INTO addresslist.school (school_id, school_name, description, admin_id) VALUES (8, '天津大学', '', 22);
INSERT INTO addresslist.school (school_id, school_name, description, admin_id) VALUES (10, '上海大学', '上海', 22);


INSERT INTO addresslist.class (class_id, class_name, academy, description, admin_id, school_id) VALUES (3, '11班', '测绘学院', '11班最棒', 1, 1);
INSERT INTO addresslist.class (class_id, class_name, academy, description, admin_id, school_id) VALUES (5, '13班', '美术学院', '13班最棒', 1, 1);
INSERT INTO addresslist.class (class_id, class_name, academy, description, admin_id, school_id) VALUES (6, '14班', '体育学院', null, 2, 1);
INSERT INTO addresslist.class (class_id, class_name, academy, description, admin_id, school_id) VALUES (7, '15班', '音乐学院', '15班最棒', 2, 1);
INSERT INTO addresslist.class (class_id, class_name, academy, description, admin_id, school_id) VALUES (11, '17班', '智慧教育', null, 1, 1);
INSERT INTO addresslist.class (class_id, class_name, academy, description, admin_id, school_id) VALUES (12, '小红班', null, '小红真美', 2, 1);

INSERT INTO addresslist.image (image_id, suffix, ref_class) VALUES (8, 'png', 3);
INSERT INTO addresslist.image (image_id, suffix, ref_class) VALUES (10, 'jpg', 3);
INSERT INTO addresslist.image (image_id, suffix, ref_class) VALUES (11, 'jpg', 3);
INSERT INTO addresslist.image (image_id, suffix, ref_class) VALUES (12, 'png', 3);
INSERT INTO addresslist.image (image_id, suffix, ref_class) VALUES (13, 'jpg', 3);
INSERT INTO addresslist.image (image_id, suffix, ref_class) VALUES (14, 'jpg', 3);
INSERT INTO addresslist.image (image_id, suffix, ref_class) VALUES (16, 'png', 3);
INSERT INTO addresslist.image (image_id, suffix, ref_class) VALUES (17, 'png', 3);
INSERT INTO addresslist.image (image_id, suffix, ref_class) VALUES (18, 'jpg', 3);
INSERT INTO addresslist.image (image_id, suffix, ref_class) VALUES (19, 'jpg', 3);


INSERT INTO addresslist.message (message_id, from_user, ref_class, message, to_user) VALUES (6, 3, 11, '申请', 1);
INSERT INTO addresslist.message (message_id, from_user, ref_class, message, to_user) VALUES (7, 4, 11, '申请', 1);
INSERT INTO addresslist.message (message_id, from_user, ref_class, message, to_user) VALUES (8, 5, 11, '申请', 1);
INSERT INTO addresslist.message (message_id, from_user, ref_class, message, to_user) VALUES (9, 6, 11, '申请', 1);
INSERT INTO addresslist.message (message_id, from_user, ref_class, message, to_user) VALUES (15, 1, 12, '申请', 2);
INSERT INTO addresslist.message (message_id, from_user, ref_class, message, to_user) VALUES (23, 1, 11, '同意', 8);
INSERT INTO addresslist.message (message_id, from_user, ref_class, message, to_user) VALUES (25, 2, 12, '拒绝', 8);
INSERT INTO addresslist.message (message_id, from_user, ref_class, message, to_user) VALUES (26, 8, 3, '退出', 1);
INSERT INTO addresslist.relation (relation_id, user_id, class_id) VALUES (26, 1, 3);
INSERT INTO addresslist.relation (relation_id, user_id, class_id) VALUES (28, 3, 3);
INSERT INTO addresslist.relation (relation_id, user_id, class_id) VALUES (29, 4, 3);
INSERT INTO addresslist.relation (relation_id, user_id, class_id) VALUES (30, 5, 3);
INSERT INTO addresslist.relation (relation_id, user_id, class_id) VALUES (31, 6, 3);
INSERT INTO addresslist.relation (relation_id, user_id, class_id) VALUES (32, 16, 3);
INSERT INTO addresslist.relation (relation_id, user_id, class_id) VALUES (34, 9, 3);
INSERT INTO addresslist.relation (relation_id, user_id, class_id) VALUES (35, 10, 3);
INSERT INTO addresslist.relation (relation_id, user_id, class_id) VALUES (36, 11, 3);
INSERT INTO addresslist.relation (relation_id, user_id, class_id) VALUES (37, 12, 3);
INSERT INTO addresslist.relation (relation_id, user_id, class_id) VALUES (38, 13, 3);
INSERT INTO addresslist.relation (relation_id, user_id, class_id) VALUES (39, 14, 3);
INSERT INTO addresslist.relation (relation_id, user_id, class_id) VALUES (40, 15, 3);
INSERT INTO addresslist.relation (relation_id, user_id, class_id) VALUES (53, 1, 5);
INSERT INTO addresslist.relation (relation_id, user_id, class_id) VALUES (54, 3, 5);
INSERT INTO addresslist.relation (relation_id, user_id, class_id) VALUES (55, 5, 5);
INSERT INTO addresslist.relation (relation_id, user_id, class_id) VALUES (56, 8, 5);
INSERT INTO addresslist.relation (relation_id, user_id, class_id) VALUES (57, 9, 5);
INSERT INTO addresslist.relation (relation_id, user_id, class_id) VALUES (58, 11, 5);
INSERT INTO addresslist.relation (relation_id, user_id, class_id) VALUES (59, 2, 5);
INSERT INTO addresslist.relation (relation_id, user_id, class_id) VALUES (60, 4, 5);
INSERT INTO addresslist.relation (relation_id, user_id, class_id) VALUES (61, 6, 5);
INSERT INTO addresslist.relation (relation_id, user_id, class_id) VALUES (62, 10, 5);
INSERT INTO addresslist.relation (relation_id, user_id, class_id) VALUES (63, 8, 5);
INSERT INTO addresslist.relation (relation_id, user_id, class_id) VALUES (64, 12, 5);
INSERT INTO addresslist.relation (relation_id, user_id, class_id) VALUES (65, 1, 6);
INSERT INTO addresslist.relation (relation_id, user_id, class_id) VALUES (66, 2, 6);
INSERT INTO addresslist.relation (relation_id, user_id, class_id) VALUES (67, 3, 6);
INSERT INTO addresslist.relation (relation_id, user_id, class_id) VALUES (68, 20, 6);
INSERT INTO addresslist.relation (relation_id, user_id, class_id) VALUES (69, 19, 6);
INSERT INTO addresslist.relation (relation_id, user_id, class_id) VALUES (70, 18, 6);
INSERT INTO addresslist.relation (relation_id, user_id, class_id) VALUES (71, 17, 6);
INSERT INTO addresslist.relation (relation_id, user_id, class_id) VALUES (72, 16, 6);
INSERT INTO addresslist.relation (relation_id, user_id, class_id) VALUES (73, 15, 6);
INSERT INTO addresslist.relation (relation_id, user_id, class_id) VALUES (74, 14, 6);
INSERT INTO addresslist.relation (relation_id, user_id, class_id) VALUES (75, 13, 6);
INSERT INTO addresslist.relation (relation_id, user_id, class_id) VALUES (76, 12, 6);
INSERT INTO addresslist.relation (relation_id, user_id, class_id) VALUES (77, 1, 7);
INSERT INTO addresslist.relation (relation_id, user_id, class_id) VALUES (78, 10, 7);
INSERT INTO addresslist.relation (relation_id, user_id, class_id) VALUES (79, 20, 7);
INSERT INTO addresslist.relation (relation_id, user_id, class_id) VALUES (80, 2, 7);
INSERT INTO addresslist.relation (relation_id, user_id, class_id) VALUES (81, 1, 11);
INSERT INTO addresslist.relation (relation_id, user_id, class_id) VALUES (82, 2, 12);
INSERT INTO addresslist.relation (relation_id, user_id, class_id) VALUES (83, 2, 11);
INSERT INTO addresslist.relation (relation_id, user_id, class_id) VALUES (84, 8, 11);


