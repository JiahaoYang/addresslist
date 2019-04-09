create schema addresslist collate utf8mb4_0900_ai_ci;

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

create table image
(
	image_id int auto_increment
		primary key,
	suffix varchar(300) null,
	ref_class int null,
	constraint image_class_class_id_fk
		foreign key (ref_class) references class (class_id)
);

create table message
(
	message_id int auto_increment
		primary key,
	from_user int not null,
	ref_class int not null,
	message varchar(100) not null,
	to_user int not null,
	constraint message_class_class_id_fk
		foreign key (ref_class) references class (class_id),
	constraint message_user_user_id_fk
		foreign key (from_user) references user (user_id),
	constraint message_user_user_id_fk_2
		foreign key (to_user) references user (user_id)
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

create table video
(
	video_id int auto_increment
		primary key,
	suffix varchar(20) not null,
	ref_class int not null,
	constraint video_class_class_id_fk
		foreign key (ref_class) references class (class_id)
);

create table words
(
	words_id int auto_increment
		primary key,
	user_id int not null,
	title varchar(255) default '未命名' null,
	content varchar(10000) default '无内容' null,
	leave_time datetime default CURRENT_TIMESTAMP null,
	class_id int not null,
	constraint words_class_class_id_fk
		foreign key (class_id) references class (class_id),
	constraint words_user_user_id_fk
		foreign key (user_id) references user (user_id)
);

create table reply
(
	reply_id int auto_increment
		primary key,
	user_id int not null,
	words_id int not null,
	content varchar(10000) default '无内容' null,
	leave_time datetime default CURRENT_TIMESTAMP null,
	constraint reply_user_user_id_fk
		foreign key (user_id) references user (user_id),
	constraint reply_words_words_id_fk
		foreign key (words_id) references words (words_id)
);



