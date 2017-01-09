/* ���Ÿ�Ҫ��Ϣ�� */

CREATE TABLE IF NOT EXISTS department (
    'id' INT AUTO_INCREMENT PRIMARY KEY ,
    'uni_id' INT NOT NULL DEFAULT 0 COMMENT 'ѧУid',
    'name' VARCHAR(255) NOT NULL DEFAULT '' COMMENT '��������',
    'english_name' VARCHAR(255) NOT NULL DEFAULT '' COMMENT '����Ӣ������',
    'created_at' INT NOT NULL DEFAULT 0 COMMENT '�½�ʱ��',
    'updated_at' INT NOT NULL DEFAULT 0 COMMENT '�޸�ʱ��',
    'deleted_at' INT NOT NULL DEFAULT 0 COMMENT '��ɾ��', /* ɾ��ʱ�� */
    FOREIGN KEY(uni_id) REFERENCES university(id) /* ��� */
    )ENGINE=InnoDB DEFAULT CHARSET=UTF8 COMMENT='ѧУ���Ÿ�Ҫ��Ϣ��';


/* ���Ҹ�Ҫ��Ϣ�� */

CREATE TABLE IF NOT EXISTS subdepartment (
    'id' INT AUTO_INCREMENT PRIMARY KEY ,
    'uni_id' INT NOT NULL DEFAULT 0 COMMENT 'ѧУid',
    'dep_id' INT NOT NULL DEFAULT 0 COMMENT '����id',
    'name' VARCHAR(127) NOT NULL DEFAULT '' COMMENT '��������',
    'english_name' VARCHAR(255) NOT NULL DEFAULT '' COMMENT '����Ӣ������',
    'created_at' INT NOT NULL DEFAULT 0 COMMENT '�½�ʱ��',
    'updated_at' INT NOT NULL DEFAULT 0 COMMENT '�޸�ʱ��',
    'deleted_at' INT NOT NULL DEFAULT 0 COMMENT '��ɾ��', /* ɾ��ʱ�� */
    FOREIGN KEY(uni_id) REFERENCES university(id), /* ��� */
    FOREIGN KEY(dep_id) REFERENCES department(id) /* ��� */
    )ENGINE=InnoDB DEFAULT CHARSET=UTF8 COMMENT='���Ҹ�Ҫ��Ϣ��';


/* רҵ��Ҫ��Ϣ�� ����һ�������רҵ����ѡ��רҵ */

CREATE TABLE IF NOT EXISTS specialty (
    'id' INT AUTO_INCREMENT PRIMARY KEY ,
    'uni_id' INT NOT NULL DEFAULT 0 COMMENT 'ѧУid',
    'dep_id' INT NOT NULL DEFAULT 0 COMMENT '����id',

    'name' VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'רҵ��������',
    'english_name' VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'רҵӢ������',

    'schooling_length' TINYINT NOT NULL DEFAULT 0 COMMENT '����ѧ��',
    'credit' TINYINT NOT NULL DEFAULT 0 COMMENT '��ѧ��', /* ���޹����ܱ�ҵ */
    'must_credit' TINYINT NOT NULL DEFAULT 0 COMMENT '����ѧ��',
    'specialty_credit' TINYINT NOT NULL DEFAULT 0 COMMENT 'רҵ����ѧ��',
    'specialty_select_credit' TINYINT NOT NULL DEFAULT 0 COMMENT 'רҵѡ��ѧ��',
    'specialty_free_credit' TINYINT NOT NULL DEFAULT 0 COMMENT 'רҵ��ѡѧ��',
    'free_credit' TINYINT NOT NULL DEFAULT 0 COMMENT '��ѡѧ��',

    'created_at' INT NOT NULL DEFAULT 0 COMMENT '�½�ʱ��',
    'updated_at' INT NOT NULL DEFAULT 0 COMMENT '�޸�ʱ��',
    'deleted_at' INT NOT NULL DEFAULT 0 COMMENT '��ɾ��', /* ɾ��ʱ�� */

    FOREIGN KEY(uni_id) REFERENCES university(id), /* ��� */
    FOREIGN KEY(dep_id) REFERENCES department(id) /* ��� */
    )ENGINE=InnoDB DEFAULT CHARSET=UTF8 COMMENT='רҵ��';




/* �༶��Ҫ��Ϣ��  ����ǹ�ѡ�εİ༶�� ����id ��Ϊ ���� �� רҵid ��Ϊ ��ѡ��רҵ */

CREATE TABLE IF NOT EXISTS class (
    'id' INT AUTO_INCREMENT PRIMARY KEY ,
    'uni_id' INT NOT NULL DEFAULT 0 COMMENT 'ѧУid',
    'dep_id' INT NOT NULL DEFAULT 0 COMMENT '����id',
    'specialty_id' INT NOT NULL DEFAULT 0 COMMENT 'רҵid',
    'name' VARCHAR(127) NOT NULL DEFAULT '' COMMENT '�༶����',

    'created_at' INT NOT NULL DEFAULT 0 COMMENT '�½�ʱ��',
    'updated_at' INT NOT NULL DEFAULT 0 COMMENT '�޸�ʱ��',
    'deleted_at' INT NOT NULL DEFAULT 0 COMMENT '��ɾ��', /* ɾ��ʱ�� */

    FOREIGN KEY(uni_id) REFERENCES university(id), /* ��� */
    FOREIGN KEY(dep_id) REFERENCES department(id), /* ��� */
    FOREIGN KEY(specialty_id) REFERENCES specialty(id) /* ��� */
    )ENGINE=InnoDB DEFAULT CHARSET=UTF8 COMMENT='�༶��';


/* �γ̴����
˼�����ν����γ� 1�����������γ� 2��ͨʶ�����γ� 3��
��ʦ�����γ� 4��רҵ�����γ� 5�����Է�չ�γ� 6
*/

CREATE TABLE IF NOT EXISTS course_type(
    'id' INT AUTO_INCREMENT PRIMARY KEY ,
    'uni_id' INT NOT NULL DEFAULT 0 COMMENT 'ѧУid',
    'name' VARCHAR(127) NOT NULL DEFAULT '' COMMENT '���������',

    'created_at' INT NOT NULL DEFAULT 0 COMMENT '�½�ʱ��',
    'updated_at' INT NOT NULL DEFAULT 0 COMMENT '�޸�ʱ��',
    'deleted_at' INT NOT NULL DEFAULT 0 COMMENT '��ɾ��', /* ɾ��ʱ�� */

    FOREIGN KEY(uni_id) REFERENCES university(id), /* ��� */
    )ENGINE=InnoDB DEFAULT CHARSET=UTF8 COMMENT='�γ̴�����';


/* �γ�����
�������� 1������ѡ�� 2��רҵ���� 3��רҵ���� 4��רҵѡ�� 5������ѡ�� 6 �ȵ�
*/

CREATE TABLE IF NOT EXISTS course_property(
    'id' INT AUTO_INCREMENT PRIMARY KEY ,
    'uni_id' INT NOT NULL DEFAULT 0 COMMENT 'ѧУid',
    'name' VARCHAR(127) NOT NULL DEFAULT '' COMMENT '�γ���������',

    'created_at' INT NOT NULL DEFAULT 0 COMMENT '�½�ʱ��',
    'updated_at' INT NOT NULL DEFAULT 0 COMMENT '�޸�ʱ��',
    'deleted_at' INT NOT NULL DEFAULT 0 COMMENT '��ɾ��', /* ɾ��ʱ�� */

    FOREIGN KEY(uni_id) REFERENCES university(id), /* ��� */
    )ENGINE=InnoDB DEFAULT CHARSET=UTF8 COMMENT='�γ����ʱ�';



/* ���˷�ʽ
���� 1������ 2
*/

CREATE TABLE IF NOT EXISTS exam_type(
    'id' INT AUTO_INCREMENT PRIMARY KEY ,
    'uni_id' INT NOT NULL DEFAULT 0 COMMENT 'ѧУid',
    'name' VARCHAR(127) NOT NULL DEFAULT '' COMMENT '���˷�ʽ����',

    'created_at' INT NOT NULL DEFAULT 0 COMMENT '�½�ʱ��',
    'updated_at' INT NOT NULL DEFAULT 0 COMMENT '�޸�ʱ��',
    'deleted_at' INT NOT NULL DEFAULT 0 COMMENT '��ɾ��', /* ɾ��ʱ�� */

    FOREIGN KEY(uni_id) REFERENCES university(id), /* ��� */
    )ENGINE=InnoDB DEFAULT CHARSET=UTF8 COMMENT='���˷�ʽ��';




/* ���˷���
���� 1������ 2����̸ 3������ 4����Ʒ 5������ 6
*/

CREATE TABLE IF NOT EXISTS exam_mode(
    'id' INT AUTO_INCREMENT PRIMARY KEY ,
    'uni_id' INT NOT NULL DEFAULT 0 COMMENT 'ѧУid',
    'name' VARCHAR(127) NOT NULL DEFAULT '' COMMENT '���˷�������',

    'created_at' INT NOT NULL DEFAULT 0 COMMENT '�½�ʱ��',
    'updated_at' INT NOT NULL DEFAULT 0 COMMENT '�޸�ʱ��',
    'deleted_at' INT NOT NULL DEFAULT 0 COMMENT '��ɾ��', /* ɾ��ʱ�� */

    FOREIGN KEY(uni_id) REFERENCES university(id), /* ��� */
    )ENGINE=InnoDB DEFAULT CHARSET=UTF8 COMMENT='���˷�����';




/* �γ̻�����Ϣ�� */

CREATE TABLE IF NOT EXISTS course (
    'id' INT AUTO_INCREMENT PRIMARY KEY ,
    'uni_id' INT NOT NULL DEFAULT 0 COMMENT 'ѧУid',
    'dep_id' INT NOT NULL DEFAULT 0 COMMENT '����id',
    'specialty_id' INT NOT NULL DEFAULT 0 COMMENT 'רҵid',
    'serial_number' VARCHAR(127) NOT NULL DEFAULT '' COMMENT '�γ̱��',
    'name' VARCHAR(127) NOT NULL DEFAULT '' COMMENT '�γ���������',
    'english_name' VARCHAR(127) NOT NULL DEFAULT '' COMMENT '�γ�Ӣ������',

    'type_id' INT NOT NULL DEFAULT 0 COMMENT '�γ̴����id',
    'property_id' INT NOT NULL DEFAULT 0 COMMENT '�γ�����id',
    'exam_type' INT NOT NULL DEFAULT 0 COMMENT '���˷�ʽid',
    'exam_mode' INT NOT NULL DEFAULT 0 COMMENT '���˷���id',

    'total_class_hours' TINYINT NOT NULL DEFAULT 0 COMMENT '��ѧʱ',
    'total_credits' TINYINT NOT NULL DEFAULT 0 COMMENT '��ѧ��',
    'theory_credits' TINYINT NOT NULL DEFAULT 0 COMMENT '���ۿ�ʱ',
    'experiential_hours' TINYINT NOT NULL DEFAULT 0 COMMENT 'ʵ��ѧʱ',
    'extra_experiential_hours' TINYINT NOT NULL DEFAULT 0 COMMENT '����ʵ��ѧʱ',
    'experiential_credits' TINYINT NOT NULL DEFAULT 0 COMMENT 'ʵ��ѧ��',
    'learning_term' TINYINT NOT NULL DEFAULT 0 COMMENT '�γ̿���ʱ�䣬��1ѧ�ڣ���7ѧ��',
    'teaching_department' INT NOT NULL DEFAULT 0 COMMENT '���ε�λid', /* ֻ��ѧԺ��һ��������ϵ����רҵ�� */

    'intro' TEXT NOT NULL DEFAULT '' COMMENT '�γ̼��',
    'teaching_object' TEXT NOT NULL DEFAULT '' COMMENT '��ѧĿ��',
    'teaching_task' TEXT NOT NULL DEFAULT '' COMMENT '��ѧ����',
    'teaching_requirement' TEXT NOT NULL DEFAULT '' COMMENT '��ѧҪ��',

    'created_at' INT NOT NULL DEFAULT 0 COMMENT '�½�ʱ��',
    'updated_at' INT NOT NULL DEFAULT 0 COMMENT '�޸�ʱ��',
    'deleted_at' INT NOT NULL DEFAULT 0 COMMENT '��ɾ��', /* ɾ��ʱ�� */

    FOREIGN KEY(uni_id) REFERENCES university(id), /* ��� */
    FOREIGN KEY(dep_id) REFERENCES department(id), /* ��� */
    FOREIGN KEY(specialty_id) REFERENCES specialty(id), /* ��� */
    FOREIGN KEY(type_id) REFERENCES course_type(id), /* ��� */
    FOREIGN KEY(property_id) REFERENCES course_property(id), /* ��� */
    FOREIGN KEY(exam_type) REFERENCES exam_type(id), /* ��� */
    FOREIGN KEY(exam_mode) REFERENCES exam_mode(id), /* ��� */
    FOREIGN KEY(teaching_department) REFERENCES department(id) /* ��� */
)ENGINE=InnoDB DEFAULT CHARSET=UTF8 COMMENT='�γ̻�����Ϣ��';




