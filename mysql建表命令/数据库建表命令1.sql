/* 部门概要信息表 */

CREATE TABLE IF NOT EXISTS department (
    'id' INT AUTO_INCREMENT PRIMARY KEY ,
    'uni_id' INT NOT NULL DEFAULT 0 COMMENT '学校id',
    'name' VARCHAR(255) NOT NULL DEFAULT '' COMMENT '部门名称',
    'english_name' VARCHAR(255) NOT NULL DEFAULT '' COMMENT '部门英文名称',
    'created_at' INT NOT NULL DEFAULT 0 COMMENT '新建时间',
    'updated_at' INT NOT NULL DEFAULT 0 COMMENT '修改时间',
    'deleted_at' INT NOT NULL DEFAULT 0 COMMENT '软删除', /* 删除时间 */
    FOREIGN KEY(uni_id) REFERENCES university(id) /* 外键 */
    )ENGINE=InnoDB DEFAULT CHARSET=UTF8 COMMENT='学校部门概要信息表';


/* 科室概要信息表 */

CREATE TABLE IF NOT EXISTS subdepartment (
    'id' INT AUTO_INCREMENT PRIMARY KEY ,
    'uni_id' INT NOT NULL DEFAULT 0 COMMENT '学校id',
    'dep_id' INT NOT NULL DEFAULT 0 COMMENT '部门id',
    'name' VARCHAR(127) NOT NULL DEFAULT '' COMMENT '科室名称',
    'english_name' VARCHAR(255) NOT NULL DEFAULT '' COMMENT '科室英文名称',
    'created_at' INT NOT NULL DEFAULT 0 COMMENT '新建时间',
    'updated_at' INT NOT NULL DEFAULT 0 COMMENT '修改时间',
    'deleted_at' INT NOT NULL DEFAULT 0 COMMENT '软删除', /* 删除时间 */
    FOREIGN KEY(uni_id) REFERENCES university(id), /* 外键 */
    FOREIGN KEY(dep_id) REFERENCES department(id) /* 外键 */
    )ENGINE=InnoDB DEFAULT CHARSET=UTF8 COMMENT='科室概要信息表';


/* 专业概要信息表 ，有一个特殊的专业：公选课专业 */

CREATE TABLE IF NOT EXISTS specialty (
    'id' INT AUTO_INCREMENT PRIMARY KEY ,
    'uni_id' INT NOT NULL DEFAULT 0 COMMENT '学校id',
    'dep_id' INT NOT NULL DEFAULT 0 COMMENT '部门id',

    'name' VARCHAR(255) NOT NULL DEFAULT '' COMMENT '专业中文名称',
    'english_name' VARCHAR(255) NOT NULL DEFAULT '' COMMENT '专业英文名称',

    'schooling_length' TINYINT NOT NULL DEFAULT 0 COMMENT '多少学年',
    'credit' TINYINT NOT NULL DEFAULT 0 COMMENT '总学分', /* 需修够才能毕业 */
    'must_credit' TINYINT NOT NULL DEFAULT 0 COMMENT '必修学分',
    'specialty_credit' TINYINT NOT NULL DEFAULT 0 COMMENT '专业必修学分',
    'specialty_select_credit' TINYINT NOT NULL DEFAULT 0 COMMENT '专业选修学分',
    'specialty_free_credit' TINYINT NOT NULL DEFAULT 0 COMMENT '专业任选学分',
    'free_credit' TINYINT NOT NULL DEFAULT 0 COMMENT '自选学分',

    'created_at' INT NOT NULL DEFAULT 0 COMMENT '新建时间',
    'updated_at' INT NOT NULL DEFAULT 0 COMMENT '修改时间',
    'deleted_at' INT NOT NULL DEFAULT 0 COMMENT '软删除', /* 删除时间 */

    FOREIGN KEY(uni_id) REFERENCES university(id), /* 外键 */
    FOREIGN KEY(dep_id) REFERENCES department(id) /* 外键 */
    )ENGINE=InnoDB DEFAULT CHARSET=UTF8 COMMENT='专业表';




/* 班级概要信息表  如果是公选课的班级， 部门id 定为 教务处 ， 专业id 定为 公选课专业 */

CREATE TABLE IF NOT EXISTS class (
    'id' INT AUTO_INCREMENT PRIMARY KEY ,
    'uni_id' INT NOT NULL DEFAULT 0 COMMENT '学校id',
    'dep_id' INT NOT NULL DEFAULT 0 COMMENT '部门id',
    'specialty_id' INT NOT NULL DEFAULT 0 COMMENT '专业id',
    'name' VARCHAR(127) NOT NULL DEFAULT '' COMMENT '班级名称',

    'created_at' INT NOT NULL DEFAULT 0 COMMENT '新建时间',
    'updated_at' INT NOT NULL DEFAULT 0 COMMENT '修改时间',
    'deleted_at' INT NOT NULL DEFAULT 0 COMMENT '软删除', /* 删除时间 */

    FOREIGN KEY(uni_id) REFERENCES university(id), /* 外键 */
    FOREIGN KEY(dep_id) REFERENCES department(id), /* 外键 */
    FOREIGN KEY(specialty_id) REFERENCES specialty(id) /* 外键 */
    )ENGINE=InnoDB DEFAULT CHARSET=UTF8 COMMENT='班级表';


/* 课程大类别
思想政治教育课程 1，公共基础课程 2，通识教育课程 3，
教师教育课程 4，专业教育课程 5，个性发展课程 6
*/

CREATE TABLE IF NOT EXISTS course_type(
    'id' INT AUTO_INCREMENT PRIMARY KEY ,
    'uni_id' INT NOT NULL DEFAULT 0 COMMENT '学校id',
    'name' VARCHAR(127) NOT NULL DEFAULT '' COMMENT '大类别名称',

    'created_at' INT NOT NULL DEFAULT 0 COMMENT '新建时间',
    'updated_at' INT NOT NULL DEFAULT 0 COMMENT '修改时间',
    'deleted_at' INT NOT NULL DEFAULT 0 COMMENT '软删除', /* 删除时间 */

    FOREIGN KEY(uni_id) REFERENCES university(id), /* 外键 */
    )ENGINE=InnoDB DEFAULT CHARSET=UTF8 COMMENT='课程大类别表';


/* 课程性质
公共必修 1、公共选修 2、专业基础 3、专业核心 4、专业选修 5、自由选修 6 等等
*/

CREATE TABLE IF NOT EXISTS course_property(
    'id' INT AUTO_INCREMENT PRIMARY KEY ,
    'uni_id' INT NOT NULL DEFAULT 0 COMMENT '学校id',
    'name' VARCHAR(127) NOT NULL DEFAULT '' COMMENT '课程性质名称',

    'created_at' INT NOT NULL DEFAULT 0 COMMENT '新建时间',
    'updated_at' INT NOT NULL DEFAULT 0 COMMENT '修改时间',
    'deleted_at' INT NOT NULL DEFAULT 0 COMMENT '软删除', /* 删除时间 */

    FOREIGN KEY(uni_id) REFERENCES university(id), /* 外键 */
    )ENGINE=InnoDB DEFAULT CHARSET=UTF8 COMMENT='课程性质表';



/* 考核方式
考试 1、考查 2
*/

CREATE TABLE IF NOT EXISTS exam_type(
    'id' INT AUTO_INCREMENT PRIMARY KEY ,
    'uni_id' INT NOT NULL DEFAULT 0 COMMENT '学校id',
    'name' VARCHAR(127) NOT NULL DEFAULT '' COMMENT '考核方式名称',

    'created_at' INT NOT NULL DEFAULT 0 COMMENT '新建时间',
    'updated_at' INT NOT NULL DEFAULT 0 COMMENT '修改时间',
    'deleted_at' INT NOT NULL DEFAULT 0 COMMENT '软删除', /* 删除时间 */

    FOREIGN KEY(uni_id) REFERENCES university(id), /* 外键 */
    )ENGINE=InnoDB DEFAULT CHARSET=UTF8 COMMENT='考核方式表';




/* 考核方法
笔试 1、机试 2、面谈 3、论文 4、作品 5、表演 6
*/

CREATE TABLE IF NOT EXISTS exam_mode(
    'id' INT AUTO_INCREMENT PRIMARY KEY ,
    'uni_id' INT NOT NULL DEFAULT 0 COMMENT '学校id',
    'name' VARCHAR(127) NOT NULL DEFAULT '' COMMENT '考核方法名称',

    'created_at' INT NOT NULL DEFAULT 0 COMMENT '新建时间',
    'updated_at' INT NOT NULL DEFAULT 0 COMMENT '修改时间',
    'deleted_at' INT NOT NULL DEFAULT 0 COMMENT '软删除', /* 删除时间 */

    FOREIGN KEY(uni_id) REFERENCES university(id), /* 外键 */
    )ENGINE=InnoDB DEFAULT CHARSET=UTF8 COMMENT='考核方法表';




/* 课程基本信息表 */

CREATE TABLE IF NOT EXISTS course (
    'id' INT AUTO_INCREMENT PRIMARY KEY ,
    'uni_id' INT NOT NULL DEFAULT 0 COMMENT '学校id',
    'dep_id' INT NOT NULL DEFAULT 0 COMMENT '部门id',
    'specialty_id' INT NOT NULL DEFAULT 0 COMMENT '专业id',
    'serial_number' VARCHAR(127) NOT NULL DEFAULT '' COMMENT '课程编号',
    'name' VARCHAR(127) NOT NULL DEFAULT '' COMMENT '课程中文名称',
    'english_name' VARCHAR(127) NOT NULL DEFAULT '' COMMENT '课程英文名称',

    'type_id' INT NOT NULL DEFAULT 0 COMMENT '课程大类别id',
    'property_id' INT NOT NULL DEFAULT 0 COMMENT '课程性质id',
    'exam_type' INT NOT NULL DEFAULT 0 COMMENT '考核方式id',
    'exam_mode' INT NOT NULL DEFAULT 0 COMMENT '考核方法id',

    'total_class_hours' TINYINT NOT NULL DEFAULT 0 COMMENT '总学时',
    'total_credits' TINYINT NOT NULL DEFAULT 0 COMMENT '总学分',
    'theory_credits' TINYINT NOT NULL DEFAULT 0 COMMENT '理论课时',
    'experiential_hours' TINYINT NOT NULL DEFAULT 0 COMMENT '实践学时',
    'extra_experiential_hours' TINYINT NOT NULL DEFAULT 0 COMMENT '课外实践学时',
    'experiential_credits' TINYINT NOT NULL DEFAULT 0 COMMENT '实践学分',
    'learning_term' TINYINT NOT NULL DEFAULT 0 COMMENT '课程开出时间，第1学期，第7学期',
    'teaching_department' INT NOT NULL DEFAULT 0 COMMENT '开课单位id', /* 只到学院这一级，不到系部或专业级 */

    'intro' TEXT NOT NULL DEFAULT '' COMMENT '课程简介',
    'teaching_object' TEXT NOT NULL DEFAULT '' COMMENT '教学目标',
    'teaching_task' TEXT NOT NULL DEFAULT '' COMMENT '教学任务',
    'teaching_requirement' TEXT NOT NULL DEFAULT '' COMMENT '教学要求',

    'created_at' INT NOT NULL DEFAULT 0 COMMENT '新建时间',
    'updated_at' INT NOT NULL DEFAULT 0 COMMENT '修改时间',
    'deleted_at' INT NOT NULL DEFAULT 0 COMMENT '软删除', /* 删除时间 */

    FOREIGN KEY(uni_id) REFERENCES university(id), /* 外键 */
    FOREIGN KEY(dep_id) REFERENCES department(id), /* 外键 */
    FOREIGN KEY(specialty_id) REFERENCES specialty(id), /* 外键 */
    FOREIGN KEY(type_id) REFERENCES course_type(id), /* 外键 */
    FOREIGN KEY(property_id) REFERENCES course_property(id), /* 外键 */
    FOREIGN KEY(exam_type) REFERENCES exam_type(id), /* 外键 */
    FOREIGN KEY(exam_mode) REFERENCES exam_mode(id), /* 外键 */
    FOREIGN KEY(teaching_department) REFERENCES department(id) /* 外键 */
)ENGINE=InnoDB DEFAULT CHARSET=UTF8 COMMENT='课程基本信息表';




