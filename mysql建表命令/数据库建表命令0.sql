/* 逻辑上最高层次的表：学校表。
一间学校 拆分成以下5个表 进行表示。
拆分原则：可能会被修改的，就独立出去一张表。 */

CREATE TABLE IF NOT EXISTS university (
    'id' INT AUTO_INCREMENT PRIMARY KEY ,
    'unit_number' VARCHAR(255) NOT NULL DEFAULT '' COMMENT '学校事业单位编号',
    /* 指的是什么类型的学校，工业中等专科学校，高等大学 */
    'social_trust_code' VARCHAR(255) NOT NULL UNIQUE COMMENT '统一社会信用代码', /*  12440000456488032C */
    'certification_code' VARCHAR(255) NOT NULL UNIQUE COMMENT '证书识别码', /* 12440000456488032C-01 */
    'enterprise_code' VARCHAR(255) NOT NULL UNIQUE COMMENT '事证号', /* 144000000098 */
    'name' VARCHAR(255) NOT NULL UNIQUE COMMENT '学校名', /* 肇庆学院 */
    'english_name' VARCHAR(255) NOT NULL DEFAULT '' COMMENT '学校英文名称',
    'status' TINYINT NOT NULL DEFAULT 0 COMMENT '单位状态', /* 0-正常 , 其他待定义 */
    'funding_sources' TINYINT NOT NULL DEFAULT 0 COMMENT '经费来源', /* 0-财政核拨 ，其他待定义 */
    'establish_date' INT NOT NULL DEFAULT 0 COMMENT '设立登记时间', /* 2001-11-23 */
    'hosted_by' VARCHAR(255) NOT NULL DEFAULT '' COMMENT '举办单位', /* 广东省教育厅 */
    'admini_by' VARCHAR(255) NOT NULL DEFAULT '' COMMENT '登记管理机关', /* 广东省事业单位改革服务局 */
    'initial_funding' BIGINT NOT NULL DEFAULT 0 COMMENT '开办资金', /* ￥67133.0万元 ，改用“元”为单位 */
    'certification_begin_date' INT NOT NULL DEFAULT 0 COMMENT '证书有效期', /* 2016-06-23 至 2021-06-22 */
    'certification_end_date' INT NOT NULL DEFAULT 0 COMMENT '证书有效期', /* 2016-06-23 至 2021-06-22 */
    'created_at' INT NOT NULL DEFAULT 0 COMMENT '新建时间',
    'updated_at' INT NOT NULL DEFAULT 0 COMMENT '修改时间',
    'deleted_at' INT NOT NULL DEFAULT 0 COMMENT '软删除' /* 删除时间 */
    )ENGINE=InnoDB DEFAULT CHARSET=UTF8 COMMENT='学校表';



/* 用户登陆账号表  复数表名users是沿用自带的Auth的命名
由于下面有表要外键到本表，所以本表提前放在此处 */

CREATE TABLE IF NOT EXISTS users (
    'id' INT AUTO_INCREMENT PRIMARY KEY ,
    'uni_id' INT NOT NULL DEFAULT 0 COMMENT '学校id',
    'name' VARCHAR(255) NOT NULL DEFAULT '' COMMENT '用户名',
    /* 可以是学号、教工号、电话号码 */
    'email' VARCHAR(255) NOT NULL DEFAULT '' COMMENT '邮箱',
    'password' VARCHAR(255) NOT NULL DEFAULT '' COMMENT '用户名',
    'remember_token' VARCHAR(100) ,
    'created_at' INT NOT NULL DEFAULT 0 COMMENT '新建时间',
    'updated_at' INT NOT NULL DEFAULT 0 COMMENT '修改时间',
    'deleted_at' INT NOT NULL DEFAULT 0 COMMENT '软删除' /* 删除时间 */
    )ENGINE=InnoDB DEFAULT CHARSET=UTF8 COMMENT='用户表';



CREATE TABLE IF NOT EXISTS university_do_what (
    'id' INT AUTO_INCREMENT PRIMARY KEY ,
    'uni_id' INT NOT NULL DEFAULT 0 COMMENT '学校id',
    'what_to_do' TEXT NOT NULL DEFAULT '' COMMENT '宗旨和业务范围',
    /* 以实施本科教育为主，同时举办专科及函授、自考、各种层次的继续教育 */
    'created_at' INT NOT NULL DEFAULT 0 COMMENT '新建时间',
    'updated_at' INT NOT NULL DEFAULT 0 COMMENT '修改时间',
    'deleted_at' INT NOT NULL DEFAULT 0 COMMENT '软删除', /* 删除时间 */
    FOREIGN KEY(uni_id) REFERENCES university(id) /* 外键 */
    )ENGINE=InnoDB DEFAULT CHARSET=UTF8 COMMENT='学校宗旨和业务范围表';

CREATE TABLE IF NOT EXISTS university_incharge (
    'id' INT AUTO_INCREMENT PRIMARY KEY ,
    'uni_id' INT NOT NULL DEFAULT 0 COMMENT '学校id',
    'legal_person' INT NOT NULL DEFAULT 0 COMMENT '学校当前法人代表', /* 校长，外键，用户表 */
    /* 不唯一：一个自然人可以担任两个学校的法人代表。法定代表人： 和飞 */
    'created_at' INT NOT NULL DEFAULT 0 COMMENT '新建时间',
    'updated_at' INT NOT NULL DEFAULT 0 COMMENT '修改时间',
    'deleted_at' INT NOT NULL DEFAULT 0 COMMENT '软删除', /* 删除时间 */
    FOREIGN KEY(uni_id) REFERENCES university(id), /* 外键 */
    FOREIGN KEY(legal_person) REFERENCES user(id) /* 外键 */
    )ENGINE=InnoDB DEFAULT CHARSET=UTF8 COMMENT='学校负责人表';

CREATE TABLE IF NOT EXISTS university_communication (
    'id' INT AUTO_INCREMENT PRIMARY KEY ,
    'uni_id' INT NOT NULL DEFAULT 0 COMMENT '学校id',
    'home_page' VARCHAR(255) NOT NULL DEFAULT '' COMMENT '学校网站主页',
    'office_tel'  VARCHAR(127) NOT NULL DEFAULT '' COMMENT '校办电话',
    'created_at' INT NOT NULL DEFAULT 0 COMMENT '新建时间',
    'updated_at' INT NOT NULL DEFAULT 0 COMMENT '修改时间',
    'deleted_at' INT NOT NULL DEFAULT 0 COMMENT '软删除', /* 删除时间 */
    FOREIGN KEY(uni_id) REFERENCES university(id) /* 外键 */
    )ENGINE=InnoDB DEFAULT CHARSET=UTF8 COMMENT='学校通信方式表';

CREATE TABLE IF NOT EXISTS university_information_master (
    'id' INT AUTO_INCREMENT PRIMARY KEY ,
    'uni_id' INT NOT NULL DEFAULT 0 COMMENT '学校id',
    'information_master' INT NOT NULL DEFAULT 0 COMMENT '学校当前信息主管', /* 外键，用户表 */
    /* 不唯一：一个自然人可以担任两个学校的信息主管 */
    'created_at' INT NOT NULL DEFAULT 0 COMMENT '新建时间',
    'updated_at' INT NOT NULL DEFAULT 0 COMMENT '修改时间',
    'deleted_at' INT NOT NULL DEFAULT 0 COMMENT '软删除', /* 删除时间 */
    FOREIGN KEY(uni_id) REFERENCES university(id) /* 外键 */
    FOREIGN KEY(information_master) REFERENCES user(id) /* 外键 */
    )ENGINE=InnoDB DEFAULT CHARSET=UTF8 COMMENT='学校信息主管人表';


/* 校区表 */

CREATE TABLE IF NOT EXISTS school (
    'id' INT AUTO_INCREMENT PRIMARY KEY ,
    'uni_id' INT NOT NULL DEFAULT 0 COMMENT '学校id',
    'name' VARCHAR(255) NOT NULL DEFAULT '' COMMENT '校区名称',
    'address' TEXT NOT NULL DEFAULT '' COMMENT '校区地址', /* 广东省肇庆市端州区东岗 */
    'zip' VARCHAR(127) NOT NULL DEFAULT '' COMMENT '邮政编码',
    'duty_room_tel'  VARCHAR(127) NOT NULL DEFAULT '' COMMENT '值班室电话',
    'created_at' INT NOT NULL DEFAULT 0 COMMENT '新建时间',
    'updated_at' INT NOT NULL DEFAULT 0 COMMENT '修改时间',
    'deleted_at' INT NOT NULL DEFAULT 0 COMMENT '软删除', /* 删除时间 */
    FOREIGN KEY(uni_id) REFERENCES university(id) /* 外键 */
    )ENGINE=InnoDB DEFAULT CHARSET=UTF8 COMMENT='学校校区表';


/* 学校功能区表 */

CREATE TABLE IF NOT EXISTS area (
    'id' INT AUTO_INCREMENT PRIMARY KEY ,
    'uni_id' INT NOT NULL DEFAULT 0 COMMENT '学校id',
    'school_id' INT NOT NULL DEFAULT 0 COMMENT '校区id',
    'name' VARCHAR(255) NOT NULL DEFAULT '' COMMENT '功能区名称', /* 如 第一教学楼，实验大楼 */
    'discription' TEXT NOT NULL DEFAULT '' COMMENT '描述',
    'created_at' INT NOT NULL DEFAULT 0 COMMENT '新建时间',
    'updated_at' INT NOT NULL DEFAULT 0 COMMENT '修改时间',
    'deleted_at' INT NOT NULL DEFAULT 0 COMMENT '软删除', /* 删除时间 */
    FOREIGN KEY(uni_id) REFERENCES university(id), /* 外键 */
    FOREIGN KEY(school_id) REFERENCES school(id) /* 外键 */
    )ENGINE=InnoDB DEFAULT CHARSET=UTF8 COMMENT='学校功能区表';



/* 场地类型表，公共字典类 */

CREATE TABLE IF NOT EXISTS field_type (
    'id' INT AUTO_INCREMENT PRIMARY KEY ,
    'uni_id' INT NOT NULL DEFAULT 0 COMMENT '学校id',
    'name' VARCHAR(127) NOT NULL DEFAULT '' COMMENT '场地类型名称',
    /* 0：普通教室，1：多媒体教室，2：音乐室，3：视听室，4：舞蹈室，5：羽毛球场，
    6：网球场，7：篮球场，8：乒乓球场，9：画室，10：机房，11：物理实验室，
    12：化学实验室，13：网络实验室，14：动画实验室，15：办公室，16：广场，
    17：校道，18：宿舍，19：音乐厅，20：大会堂 */
    'created_at' INT NOT NULL DEFAULT 0 COMMENT '新建时间',
    'updated_at' INT NOT NULL DEFAULT 0 COMMENT '修改时间',
    'deleted_at' INT NOT NULL DEFAULT 0 COMMENT '软删除', /* 删除时间 */
    FOREIGN KEY(uni_id) REFERENCES university(id), /* 外键 */
    )ENGINE=InnoDB DEFAULT CHARSET=UTF8 COMMENT='场地类型表';

/* 学校场地表 */

CREATE TABLE IF NOT EXISTS field (
    'id' INT AUTO_INCREMENT PRIMARY KEY ,
    'uni_id' INT NOT NULL DEFAULT 0 COMMENT '学校id',
    'school_id' INT NOT NULL DEFAULT 0 COMMENT '校区id',
    'area_id' INT NOT NULL DEFAULT 0 COMMENT '功能区id',
    'name' VARCHAR(255) NOT NULL DEFAULT '' COMMENT '场地名称',
    /* 如 多媒体教室201， 软件工程系办公室 ， 基础实验室228  ，软件专业实验室 */
    'discription' TEXT NOT NULL DEFAULT '' COMMENT '描述',
    'length' INT NOT NULL DEFAULT 0 COMMENT '场地长度',
    'width'  INT NOT NULL DEFAULT 0 COMMENT '场地宽度',
    'height' INT NOT NULL DEFAULT 0 COMMENT '场地高度',
    'max_volumn' INT NOT NULL DEFAULT 0 COMMENT '容纳人数上限',
    'type_id' TINYINT NOT NULL DEFAULT 0 COMMENT '场地类型id',
    'in_out_door' TINYINT NOT NULL DEFAULT 0 COMMENT '室内/室外', /* 0：室内，1：室外 */
    
    'level' TINYINT NOT NULL DEFAULT 0 COMMENT '楼层', /* 1:一楼  2:二楼  -1:负一层  8:八楼 */
    'room' VARCHAR(127) NOT NULL DEFAULT '' COMMENT '房间号', /* 228 */

    'created_at' INT NOT NULL DEFAULT 0 COMMENT '新建时间',
    'updated_at' INT NOT NULL DEFAULT 0 COMMENT '修改时间',
    'deleted_at' INT NOT NULL DEFAULT 0 COMMENT '软删除', /* 删除时间 */
    FOREIGN KEY(uni_id) REFERENCES university(id), /* 外键 */
    FOREIGN KEY(school_id) REFERENCES school(id), /* 外键 */
    FOREIGN KEY(area_id) REFERENCES area(id), /* 外键 */
    FOREIGN KEY(type_id) REFERENCES field_type(id) /* 外键 */
    )ENGINE=InnoDB DEFAULT CHARSET=UTF8 COMMENT='学校场地表';




/* 用户账号表群 有：
用户登陆账号表 已提到前面，
密码重置表、登陆日志表、注册用户主要信息、用户电子通讯方式表、用户住址表、用户照片表、
角色表、权限表、角色-用户、权限分配表 4张entrust的表、
*/

CREATE TABLE IF NOT EXISTS password_resets (
    'email' VARCHAR(255) NOT NULL DEFAULT '',
    'token' VARCHAR(255) NOT NULL DEFAULT '',
    'created_at' INT DEFAULT 0 COMMENT '新建时间',
    )ENGINE=InnoDB DEFAULT CHARSET=UTF8 COMMENT='密码重置表';


CREATE TABLE IF NOT EXISTS login_log (
    'id' INT AUTO_INCREMENT PRIMARY KEY ,
    'user_id' INT NOT NULL DEFAULT 0 COMMENT '用户id', /* 外键，用户表 */
    'login_cnt' INT NOT NULL DEFAULT 0 COMMENT '总登陆次数',
    'last_time' INT DEFAULT 0 COMMENT '最近登陆时间',
    'last_IP' VARCHAR(127) NOT NULL DEFAULT '' COMMENT '最近登陆的IP地址',
    'created_at' INT NOT NULL DEFAULT 0 COMMENT '新建时间',
    FOREIGN KEY(user_id) REFERENCES user(id) /* 外键 */
    )ENGINE=InnoDB DEFAULT CHARSET=UTF8 COMMENT='登陆日志表';


/* 注册用户主要信息 
   在注册一个账号时，users表和本表同时增加一条记录，两张表保持同步，记录条数也是一一对应，
   因此，users表的id字段和本表的id字段，保持同步增长。
*/
CREATE TABLE IF NOT EXISTS user_main_info(
    'id' INT AUTO_INCREMENT PRIMARY KEY ,
    'name' VARCHAR(255) NOT NULL DEFAULT '' COMMENT '用户中文实名',
    'english_name' VARCHAR(255) NOT NULL DEFAULT '' COMMENT '用户外文实名',
    'nick_name' VARCHAR(255) NOT NULL DEFAULT '' COMMENT '昵称',
    'identification' VARCHAR(64) NOT NULL DEFAULT '' COMMENT '身份证号码',  /* 外国人有没有可能长一点？所以干脆64位 */
    'gender' TINYINT NOT NULL DEFAULT 0 COMMENT '性别', /* 0 女  1 男  2 未知 */
    'birthday' INT NOT NULL DEFAULT 0 COMMENT '出生日期',
    'dep_id' INT NOT NULL DEFAULT 0 COMMENT '当前学院',  /* 当前 就读 工作 学院，因为可以有转学院的 */
    'created_at' INT NOT NULL DEFAULT 0 COMMENT '新建时间',
    'updated_at' INT NOT NULL DEFAULT 0 COMMENT '修改时间',
    'deleted_at' INT NOT NULL DEFAULT 0 COMMENT '软删除', /* 删除时间 */
    FOREIGN KEY(dep_id) REFERENCES department(id) /* 外键 */
)ENGINE=InnoDB DEFAULT CHARSET=UTF8 COMMENT='用户主要信息表';


/* 用户电子通讯方式表 */
CREATE TABLE IF NOT EXISTS user_communication (
    'id' INT AUTO_INCREMENT PRIMARY KEY ,
    'user_id' INT NOT NULL DEFAULT 0 COMMENT '用户id', /* 外键，用户表 */
    'how' VARCHAR(127) NOT NULL DEFAULT '' COMMENT '内容',
    'flag' TINYINT NOT NULL DEFAULT 0 COMMENT '标志', 
    /* 0 QQ号码  1 微信号  2 电子邮箱  3 手机  4 手机短号  5 办公室座机  6 办公室座机短号  7 家庭座机 */
    'created_at' INT NOT NULL DEFAULT 0 COMMENT '新建时间',
    'updated_at' INT NOT NULL DEFAULT 0 COMMENT '修改时间',
    'deleted_at' INT NOT NULL DEFAULT 0 COMMENT '软删除', /* 删除时间 */
    FOREIGN KEY(user_id) REFERENCES user(id) /* 外键 */
)ENGINE=InnoDB DEFAULT CHARSET=UTF8 COMMENT='电子通讯方式表';


/* 用户住址表 */
CREATE TABLE IF NOT EXISTS user_communication (
    'id' INT AUTO_INCREMENT PRIMARY KEY ,
    'user_id' INT NOT NULL DEFAULT 0 COMMENT '用户id', /* 外键，用户表 */
    'address' TEXT NOT NULL DEFAULT '' COMMENT '地址，住址',
    'zip' VARCHAR(127) NOT NULL DEFAULT '' COMMENT '邮政编码',
    'flag' TINYINT NOT NULL DEFAULT 0 COMMENT '标志',
    /* 0 本人住址  1 监护人住址  2 收信地址  3 租住地址 */
    'created_at' INT NOT NULL DEFAULT 0 COMMENT '新建时间',
    'updated_at' INT NOT NULL DEFAULT 0 COMMENT '修改时间',
    'deleted_at' INT NOT NULL DEFAULT 0 COMMENT '软删除', /* 删除时间 */
    FOREIGN KEY(user_id) REFERENCES user(id) /* 外键 */
)ENGINE=InnoDB DEFAULT CHARSET=UTF8 COMMENT='用户住址表';


/* 用户照片表 */
CREATE TABLE IF NOT EXISTS user_picture (
    'id' INT AUTO_INCREMENT PRIMARY KEY ,
    'user_id' INT NOT NULL DEFAULT 0 COMMENT '用户id', /* 外键，用户表 */
    'picture_file' VARCHAR(127) NOT NULL DEFAULT '' COMMENT '照片文件名',
    'picture_path' VARCHAR(255) NOT NULL DEFAULT '' COMMENT '照片所在文件夹路径',
    'flag' TINYINT NOT NULL DEFAULT 0 COMMENT '标志',
    /* 0 黑白证件照  1 彩色白底证件照  2 彩色红底证件照  3 生活照半身  4 生活照全身 */
    'created_at' INT NOT NULL DEFAULT 0 COMMENT '新建时间',
    'updated_at' INT NOT NULL DEFAULT 0 COMMENT '修改时间',
    'deleted_at' INT NOT NULL DEFAULT 0 COMMENT '软删除', /* 删除时间 */
    FOREIGN KEY(user_id) REFERENCES user(id) /* 外键 */
)ENGINE=InnoDB DEFAULT CHARSET=UTF8 COMMENT='电子通讯方式表';



/* 角色表、权限表、角色-用户、权限分配表 4张entrust的表 */

CREATE TABLE IF NOT EXISTS roles (
    'id' INT AUTO_INCREMENT PRIMARY KEY ,
    'name'         VARCHAR(127) NOT NULL DEFAULT '' COMMENT '角色名称',
    'display_name' VARCHAR(127) NOT NULL DEFAULT '' COMMENT '显示名称',
    'description'  VARCHAR(127) NOT NULL DEFAULT '' COMMENT '角色描述',
    'created_at' INT NOT NULL DEFAULT 0 COMMENT '新建时间',
    'updated_at' INT NOT NULL DEFAULT 0 COMMENT '修改时间',
    'deleted_at' INT NOT NULL DEFAULT 0 COMMENT '软删除', /* 删除时间 */
)ENGINE=InnoDB DEFAULT CHARSET=UTF8 COMMENT='角色表';

CREATE TABLE IF NOT EXISTS permissions (
    'id' INT AUTO_INCREMENT PRIMARY KEY ,
    'name'         VARCHAR(127) NOT NULL DEFAULT '' COMMENT '权限名称',
    'display_name' VARCHAR(127) NOT NULL DEFAULT '' COMMENT '显示名称',
    'description'  VARCHAR(127) NOT NULL DEFAULT '' COMMENT '权限描述',  /* 一般写法：display_name 允许用户做 description */
    'created_at' INT NOT NULL DEFAULT 0 COMMENT '新建时间',
    'updated_at' INT NOT NULL DEFAULT 0 COMMENT '修改时间',
    'deleted_at' INT NOT NULL DEFAULT 0 COMMENT '软删除', /* 删除时间 */
)ENGINE=InnoDB DEFAULT CHARSET=UTF8 COMMENT='权限表';

CREATE TABLE IF NOT EXISTS role_user (
    'user_id' INT NOT NULL DEFAULT 0 COMMENT '用户id',  /* 外键，用户表 */   /* 哪个用户拥有什么角色 */
    'role_id' INT NOT NULL DEFAULT 0 COMMENT '角色id',  /* 外键，角色表 */
    'created_at' INT NOT NULL DEFAULT 0 COMMENT '新建时间',
    'updated_at' INT NOT NULL DEFAULT 0 COMMENT '修改时间',
    'deleted_at' INT NOT NULL DEFAULT 0 COMMENT '软删除', /* 删除时间 */
)ENGINE=InnoDB DEFAULT CHARSET=UTF8 COMMENT='角色-用户表';

CREATE TABLE IF NOT EXISTS permission_role (
    'permission_id' INT NOT NULL DEFAULT 0 COMMENT '权限id',  /* 外键，用户表 */   /* 哪个角色拥有什么权限 */
    'role_id'       INT NOT NULL DEFAULT 0 COMMENT '角色id',  /* 外键，角色表 */
    'created_at' INT NOT NULL DEFAULT 0 COMMENT '新建时间',
    'updated_at' INT NOT NULL DEFAULT 0 COMMENT '修改时间',
    'deleted_at' INT NOT NULL DEFAULT 0 COMMENT '软删除', /* 删除时间 */
)ENGINE=InnoDB DEFAULT CHARSET=UTF8 COMMENT='权限分配表';


