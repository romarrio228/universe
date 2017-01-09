/* ѧ�ڱ� */

CREATE TABLE IF NOT EXISTS semester (
    'id' INT AUTO_INCREMENT PRIMARY KEY ,
    'uni_id' INT NOT NULL DEFAULT 0 COMMENT 'ѧУid',
    'name' VARCHAR(127) NOT NULL DEFAULT '' COMMENT 'ѧ������', /* 2015-2016�ڶ�ѧ�� */
    
    'created_at' INT NOT NULL DEFAULT 0 COMMENT '�½�ʱ��',
    'updated_at' INT NOT NULL DEFAULT 0 COMMENT '�޸�ʱ��',
    'deleted_at' INT NOT NULL DEFAULT 0 COMMENT '��ɾ��', /* ɾ��ʱ�� */
    FOREIGN KEY(uni_id) REFERENCES university(id) /* ��� */
    )ENGINE=InnoDB DEFAULT CHARSET=UTF8 COMMENT='ѧУУ����';


/* У���� */

CREATE TABLE IF NOT EXISTS xiaoli (
    'id' INT AUTO_INCREMENT PRIMARY KEY ,
    'uni_id' INT NOT NULL DEFAULT 0 COMMENT 'ѧУid',
    'semester_id' INT NOT NULL DEFAULT 0 COMMENT 'ѧ��id',
    'week' TINYINT NOT NULL DEFAULT 0 COMMENT '�ܴ�',
    'day' TINYINT NOT NULL DEFAULT 0 COMMENT '���ڼ�',
    'the_date' INT NOT NULL DEFAULT 0 COMMENT '��Ӧ�Ĺ�������',
    'holiday' TINYINT NOT NULL DEFAULT 0 COMMENT '���ڼ���', /* 0�� 1�� */
    'created_at' INT NOT NULL DEFAULT 0 COMMENT '�½�ʱ��',
    'updated_at' INT NOT NULL DEFAULT 0 COMMENT '�޸�ʱ��',
    'deleted_at' INT NOT NULL DEFAULT 0 COMMENT '��ɾ��', /* ɾ��ʱ�� */
    FOREIGN KEY(uni_id) REFERENCES university(id), /* ��� */
    FOREIGN KEY(semester_id) REFERENCES semester(id) /* ��� */
    )ENGINE=InnoDB DEFAULT CHARSET=UTF8 COMMENT='У����';


/* ��Ϣ�� */

CREATE TABLE IF NOT EXISTS time_table (
    'id' INT AUTO_INCREMENT PRIMARY KEY ,
    'uni_id' INT NOT NULL DEFAULT 0 COMMENT 'ѧУid',
    'name' VARCHAR(127) NOT NULL DEFAULT '' COMMENT '����', /* ��һ�ڿΣ����ݣ���ʮ�ڿ� */
    'period' VARCHAR(127) NOT NULL DEFAULT '' COMMENT 'ʱ������', /* 0800-0845 ��1930-2015 */
    'created_at' INT NOT NULL DEFAULT 0 COMMENT '�½�ʱ��',
    'updated_at' INT NOT NULL DEFAULT 0 COMMENT '�޸�ʱ��',
    'deleted_at' INT NOT NULL DEFAULT 0 COMMENT '��ɾ��', /* ɾ��ʱ�� */
    FOREIGN KEY(uni_id) REFERENCES university(id)  /* ��� */
    )ENGINE=InnoDB DEFAULT CHARSET=UTF8 COMMENT='��Ϣ��';


/* �ϿεĿγ̱� */

CREATE TABLE IF NOT EXISTS schedule (
    'id' INT AUTO_INCREMENT PRIMARY KEY ,
    'uni_id' INT NOT NULL DEFAULT 0 COMMENT 'ѧУid',
    'xiaoli_id' INT NOT NULL DEFAULT 0 COMMENT 'У����id',
    'time_table_id' INT NOT NULL DEFAULT 0 COMMENT '��Ϣ��id',
    'classroom_id' INT NOT NULL DEFAULT 0 COMMENT '����id',
    'teacher_id' INT NOT NULL DEFAULT 0 COMMENT 'ְԱid', /* �Ͽ���ʦ */
    'class_id' INT NOT NULL DEFAULT 0 COMMENT '�༶id',
    'course_id' INT NOT NULL DEFAULT 0 COMMENT '�γ�id',

    'created_at' INT NOT NULL DEFAULT 0 COMMENT '�½�ʱ��',
    'updated_at' INT NOT NULL DEFAULT 0 COMMENT '�޸�ʱ��',
    'deleted_at' INT NOT NULL DEFAULT 0 COMMENT '��ɾ��', /* ɾ��ʱ�� */

    FOREIGN KEY(uni_id) REFERENCES university(id), /* ��� */
    FOREIGN KEY(xiaoli_id) REFERENCES xiaoli(id), /* ��� */
    FOREIGN KEY(time_table_id) REFERENCES time_table(id), /* ��� */
    FOREIGN KEY(classroom_id) REFERENCES field(id), /* ������ٸ���field.id�鵽�������� */
    FOREIGN KEY(teacher_id) REFERENCES employee(id), /* ��� */
    FOREIGN KEY(class_id) REFERENCES class(id), /* ��� */
    FOREIGN KEY(course_id) REFERENCES course(id) /* ��� */
    )ENGINE=InnoDB DEFAULT CHARSET=UTF8 COMMENT='�γ̱�';



