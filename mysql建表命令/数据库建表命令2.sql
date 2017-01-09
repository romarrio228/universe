/* 学期表 */

CREATE TABLE IF NOT EXISTS semester (
    'id' INT AUTO_INCREMENT PRIMARY KEY ,
    'uni_id' INT NOT NULL DEFAULT 0 COMMENT '学校id',
    'name' VARCHAR(127) NOT NULL DEFAULT '' COMMENT '学期名称', /* 2015-2016第二学期 */
    
    'created_at' INT NOT NULL DEFAULT 0 COMMENT '新建时间',
    'updated_at' INT NOT NULL DEFAULT 0 COMMENT '修改时间',
    'deleted_at' INT NOT NULL DEFAULT 0 COMMENT '软删除', /* 删除时间 */
    FOREIGN KEY(uni_id) REFERENCES university(id) /* 外键 */
    )ENGINE=InnoDB DEFAULT CHARSET=UTF8 COMMENT='学校校区表';


/* 校历表 */

CREATE TABLE IF NOT EXISTS xiaoli (
    'id' INT AUTO_INCREMENT PRIMARY KEY ,
    'uni_id' INT NOT NULL DEFAULT 0 COMMENT '学校id',
    'semester_id' INT NOT NULL DEFAULT 0 COMMENT '学期id',
    'week' TINYINT NOT NULL DEFAULT 0 COMMENT '周次',
    'day' TINYINT NOT NULL DEFAULT 0 COMMENT '星期几',
    'the_date' INT NOT NULL DEFAULT 0 COMMENT '对应的公历日期',
    'holiday' TINYINT NOT NULL DEFAULT 0 COMMENT '公众假期', /* 0否 1是 */
    'created_at' INT NOT NULL DEFAULT 0 COMMENT '新建时间',
    'updated_at' INT NOT NULL DEFAULT 0 COMMENT '修改时间',
    'deleted_at' INT NOT NULL DEFAULT 0 COMMENT '软删除', /* 删除时间 */
    FOREIGN KEY(uni_id) REFERENCES university(id), /* 外键 */
    FOREIGN KEY(semester_id) REFERENCES semester(id) /* 外键 */
    )ENGINE=InnoDB DEFAULT CHARSET=UTF8 COMMENT='校历表';


/* 作息表 */

CREATE TABLE IF NOT EXISTS time_table (
    'id' INT AUTO_INCREMENT PRIMARY KEY ,
    'uni_id' INT NOT NULL DEFAULT 0 COMMENT '学校id',
    'name' VARCHAR(127) NOT NULL DEFAULT '' COMMENT '名称', /* 第一节课，午休，第十节课 */
    'period' VARCHAR(127) NOT NULL DEFAULT '' COMMENT '时间区间', /* 0800-0845 ，1930-2015 */
    'created_at' INT NOT NULL DEFAULT 0 COMMENT '新建时间',
    'updated_at' INT NOT NULL DEFAULT 0 COMMENT '修改时间',
    'deleted_at' INT NOT NULL DEFAULT 0 COMMENT '软删除', /* 删除时间 */
    FOREIGN KEY(uni_id) REFERENCES university(id)  /* 外键 */
    )ENGINE=InnoDB DEFAULT CHARSET=UTF8 COMMENT='作息表';


/* 上课的课程表 */

CREATE TABLE IF NOT EXISTS schedule (
    'id' INT AUTO_INCREMENT PRIMARY KEY ,
    'uni_id' INT NOT NULL DEFAULT 0 COMMENT '学校id',
    'xiaoli_id' INT NOT NULL DEFAULT 0 COMMENT '校历表id',
    'time_table_id' INT NOT NULL DEFAULT 0 COMMENT '作息表id',
    'classroom_id' INT NOT NULL DEFAULT 0 COMMENT '课室id',
    'teacher_id' INT NOT NULL DEFAULT 0 COMMENT '职员id', /* 上课老师 */
    'class_id' INT NOT NULL DEFAULT 0 COMMENT '班级id',
    'course_id' INT NOT NULL DEFAULT 0 COMMENT '课程id',

    'created_at' INT NOT NULL DEFAULT 0 COMMENT '新建时间',
    'updated_at' INT NOT NULL DEFAULT 0 COMMENT '修改时间',
    'deleted_at' INT NOT NULL DEFAULT 0 COMMENT '软删除', /* 删除时间 */

    FOREIGN KEY(uni_id) REFERENCES university(id), /* 外键 */
    FOREIGN KEY(xiaoli_id) REFERENCES xiaoli(id), /* 外键 */
    FOREIGN KEY(time_table_id) REFERENCES time_table(id), /* 外键 */
    FOREIGN KEY(classroom_id) REFERENCES field(id), /* 外键，再根据field.id查到课室名称 */
    FOREIGN KEY(teacher_id) REFERENCES employee(id), /* 外键 */
    FOREIGN KEY(class_id) REFERENCES class(id), /* 外键 */
    FOREIGN KEY(course_id) REFERENCES course(id) /* 外键 */
    )ENGINE=InnoDB DEFAULT CHARSET=UTF8 COMMENT='课程表';



