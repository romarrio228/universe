/* �߼�����߲�εı�ѧУ��
һ��ѧУ ��ֳ�����5���� ���б�ʾ��
���ԭ�򣺿��ܻᱻ�޸ĵģ��Ͷ�����ȥһ�ű� */

CREATE TABLE IF NOT EXISTS university (
    'id' INT AUTO_INCREMENT PRIMARY KEY ,
    'unit_number' VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'ѧУ��ҵ��λ���',
    /* ָ����ʲô���͵�ѧУ����ҵ�е�ר��ѧУ���ߵȴ�ѧ */
    'social_trust_code' VARCHAR(255) NOT NULL UNIQUE COMMENT 'ͳһ������ô���', /*  12440000456488032C */
    'certification_code' VARCHAR(255) NOT NULL UNIQUE COMMENT '֤��ʶ����', /* 12440000456488032C-01 */
    'enterprise_code' VARCHAR(255) NOT NULL UNIQUE COMMENT '��֤��', /* 144000000098 */
    'name' VARCHAR(255) NOT NULL UNIQUE COMMENT 'ѧУ��', /* ����ѧԺ */
    'english_name' VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'ѧУӢ������',
    'status' TINYINT NOT NULL DEFAULT 0 COMMENT '��λ״̬', /* 0-���� , ���������� */
    'funding_sources' TINYINT NOT NULL DEFAULT 0 COMMENT '������Դ', /* 0-�����˲� ������������ */
    'establish_date' INT NOT NULL DEFAULT 0 COMMENT '�����Ǽ�ʱ��', /* 2001-11-23 */
    'hosted_by' VARCHAR(255) NOT NULL DEFAULT '' COMMENT '�ٰ쵥λ', /* �㶫ʡ������ */
    'admini_by' VARCHAR(255) NOT NULL DEFAULT '' COMMENT '�Ǽǹ������', /* �㶫ʡ��ҵ��λ�ĸ����� */
    'initial_funding' BIGINT NOT NULL DEFAULT 0 COMMENT '�����ʽ�', /* ��67133.0��Ԫ �����á�Ԫ��Ϊ��λ */
    'certification_begin_date' INT NOT NULL DEFAULT 0 COMMENT '֤����Ч��', /* 2016-06-23 �� 2021-06-22 */
    'certification_end_date' INT NOT NULL DEFAULT 0 COMMENT '֤����Ч��', /* 2016-06-23 �� 2021-06-22 */
    'created_at' INT NOT NULL DEFAULT 0 COMMENT '�½�ʱ��',
    'updated_at' INT NOT NULL DEFAULT 0 COMMENT '�޸�ʱ��',
    'deleted_at' INT NOT NULL DEFAULT 0 COMMENT '��ɾ��' /* ɾ��ʱ�� */
    )ENGINE=InnoDB DEFAULT CHARSET=UTF8 COMMENT='ѧУ��';



/* �û���½�˺ű�  ��������users�������Դ���Auth������
���������б�Ҫ������������Ա�����ǰ���ڴ˴� */

CREATE TABLE IF NOT EXISTS users (
    'id' INT AUTO_INCREMENT PRIMARY KEY ,
    'uni_id' INT NOT NULL DEFAULT 0 COMMENT 'ѧУid',
    'name' VARCHAR(255) NOT NULL DEFAULT '' COMMENT '�û���',
    /* ������ѧ�š��̹��š��绰���� */
    'email' VARCHAR(255) NOT NULL DEFAULT '' COMMENT '����',
    'password' VARCHAR(255) NOT NULL DEFAULT '' COMMENT '�û���',
    'remember_token' VARCHAR(100) ,
    'created_at' INT NOT NULL DEFAULT 0 COMMENT '�½�ʱ��',
    'updated_at' INT NOT NULL DEFAULT 0 COMMENT '�޸�ʱ��',
    'deleted_at' INT NOT NULL DEFAULT 0 COMMENT '��ɾ��' /* ɾ��ʱ�� */
    )ENGINE=InnoDB DEFAULT CHARSET=UTF8 COMMENT='�û���';



CREATE TABLE IF NOT EXISTS university_do_what (
    'id' INT AUTO_INCREMENT PRIMARY KEY ,
    'uni_id' INT NOT NULL DEFAULT 0 COMMENT 'ѧУid',
    'what_to_do' TEXT NOT NULL DEFAULT '' COMMENT '��ּ��ҵ��Χ',
    /* ��ʵʩ���ƽ���Ϊ����ͬʱ�ٰ�ר�Ƽ����ڡ��Կ������ֲ�εļ������� */
    'created_at' INT NOT NULL DEFAULT 0 COMMENT '�½�ʱ��',
    'updated_at' INT NOT NULL DEFAULT 0 COMMENT '�޸�ʱ��',
    'deleted_at' INT NOT NULL DEFAULT 0 COMMENT '��ɾ��', /* ɾ��ʱ�� */
    FOREIGN KEY(uni_id) REFERENCES university(id) /* ��� */
    )ENGINE=InnoDB DEFAULT CHARSET=UTF8 COMMENT='ѧУ��ּ��ҵ��Χ��';

CREATE TABLE IF NOT EXISTS university_incharge (
    'id' INT AUTO_INCREMENT PRIMARY KEY ,
    'uni_id' INT NOT NULL DEFAULT 0 COMMENT 'ѧУid',
    'legal_person' INT NOT NULL DEFAULT 0 COMMENT 'ѧУ��ǰ���˴���', /* У����������û��� */
    /* ��Ψһ��һ����Ȼ�˿��Ե�������ѧУ�ķ��˴������������ˣ� �ͷ� */
    'created_at' INT NOT NULL DEFAULT 0 COMMENT '�½�ʱ��',
    'updated_at' INT NOT NULL DEFAULT 0 COMMENT '�޸�ʱ��',
    'deleted_at' INT NOT NULL DEFAULT 0 COMMENT '��ɾ��', /* ɾ��ʱ�� */
    FOREIGN KEY(uni_id) REFERENCES university(id), /* ��� */
    FOREIGN KEY(legal_person) REFERENCES user(id) /* ��� */
    )ENGINE=InnoDB DEFAULT CHARSET=UTF8 COMMENT='ѧУ�����˱�';

CREATE TABLE IF NOT EXISTS university_communication (
    'id' INT AUTO_INCREMENT PRIMARY KEY ,
    'uni_id' INT NOT NULL DEFAULT 0 COMMENT 'ѧУid',
    'home_page' VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'ѧУ��վ��ҳ',
    'office_tel'  VARCHAR(127) NOT NULL DEFAULT '' COMMENT 'У��绰',
    'created_at' INT NOT NULL DEFAULT 0 COMMENT '�½�ʱ��',
    'updated_at' INT NOT NULL DEFAULT 0 COMMENT '�޸�ʱ��',
    'deleted_at' INT NOT NULL DEFAULT 0 COMMENT '��ɾ��', /* ɾ��ʱ�� */
    FOREIGN KEY(uni_id) REFERENCES university(id) /* ��� */
    )ENGINE=InnoDB DEFAULT CHARSET=UTF8 COMMENT='ѧУͨ�ŷ�ʽ��';

CREATE TABLE IF NOT EXISTS university_information_master (
    'id' INT AUTO_INCREMENT PRIMARY KEY ,
    'uni_id' INT NOT NULL DEFAULT 0 COMMENT 'ѧУid',
    'information_master' INT NOT NULL DEFAULT 0 COMMENT 'ѧУ��ǰ��Ϣ����', /* ������û��� */
    /* ��Ψһ��һ����Ȼ�˿��Ե�������ѧУ����Ϣ���� */
    'created_at' INT NOT NULL DEFAULT 0 COMMENT '�½�ʱ��',
    'updated_at' INT NOT NULL DEFAULT 0 COMMENT '�޸�ʱ��',
    'deleted_at' INT NOT NULL DEFAULT 0 COMMENT '��ɾ��', /* ɾ��ʱ�� */
    FOREIGN KEY(uni_id) REFERENCES university(id) /* ��� */
    FOREIGN KEY(information_master) REFERENCES user(id) /* ��� */
    )ENGINE=InnoDB DEFAULT CHARSET=UTF8 COMMENT='ѧУ��Ϣ�����˱�';


/* У���� */

CREATE TABLE IF NOT EXISTS school (
    'id' INT AUTO_INCREMENT PRIMARY KEY ,
    'uni_id' INT NOT NULL DEFAULT 0 COMMENT 'ѧУid',
    'name' VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'У������',
    'address' TEXT NOT NULL DEFAULT '' COMMENT 'У����ַ', /* �㶫ʡ�����ж��������� */
    'zip' VARCHAR(127) NOT NULL DEFAULT '' COMMENT '��������',
    'duty_room_tel'  VARCHAR(127) NOT NULL DEFAULT '' COMMENT 'ֵ���ҵ绰',
    'created_at' INT NOT NULL DEFAULT 0 COMMENT '�½�ʱ��',
    'updated_at' INT NOT NULL DEFAULT 0 COMMENT '�޸�ʱ��',
    'deleted_at' INT NOT NULL DEFAULT 0 COMMENT '��ɾ��', /* ɾ��ʱ�� */
    FOREIGN KEY(uni_id) REFERENCES university(id) /* ��� */
    )ENGINE=InnoDB DEFAULT CHARSET=UTF8 COMMENT='ѧУУ����';


/* ѧУ�������� */

CREATE TABLE IF NOT EXISTS area (
    'id' INT AUTO_INCREMENT PRIMARY KEY ,
    'uni_id' INT NOT NULL DEFAULT 0 COMMENT 'ѧУid',
    'school_id' INT NOT NULL DEFAULT 0 COMMENT 'У��id',
    'name' VARCHAR(255) NOT NULL DEFAULT '' COMMENT '����������', /* �� ��һ��ѧ¥��ʵ���¥ */
    'discription' TEXT NOT NULL DEFAULT '' COMMENT '����',
    'created_at' INT NOT NULL DEFAULT 0 COMMENT '�½�ʱ��',
    'updated_at' INT NOT NULL DEFAULT 0 COMMENT '�޸�ʱ��',
    'deleted_at' INT NOT NULL DEFAULT 0 COMMENT '��ɾ��', /* ɾ��ʱ�� */
    FOREIGN KEY(uni_id) REFERENCES university(id), /* ��� */
    FOREIGN KEY(school_id) REFERENCES school(id) /* ��� */
    )ENGINE=InnoDB DEFAULT CHARSET=UTF8 COMMENT='ѧУ��������';



/* �������ͱ������ֵ��� */

CREATE TABLE IF NOT EXISTS field_type (
    'id' INT AUTO_INCREMENT PRIMARY KEY ,
    'uni_id' INT NOT NULL DEFAULT 0 COMMENT 'ѧУid',
    'name' VARCHAR(127) NOT NULL DEFAULT '' COMMENT '������������',
    /* 0����ͨ���ң�1����ý����ң�2�������ң�3�������ң�4���赸�ң�5����ë�򳡣�
    6�����򳡣�7�����򳡣�8��ƹ���򳡣�9�����ң�10��������11������ʵ���ң�
    12����ѧʵ���ң�13������ʵ���ң�14������ʵ���ң�15���칫�ң�16���㳡��
    17��У����18�����ᣬ19����������20������� */
    'created_at' INT NOT NULL DEFAULT 0 COMMENT '�½�ʱ��',
    'updated_at' INT NOT NULL DEFAULT 0 COMMENT '�޸�ʱ��',
    'deleted_at' INT NOT NULL DEFAULT 0 COMMENT '��ɾ��', /* ɾ��ʱ�� */
    FOREIGN KEY(uni_id) REFERENCES university(id), /* ��� */
    )ENGINE=InnoDB DEFAULT CHARSET=UTF8 COMMENT='�������ͱ�';

/* ѧУ���ر� */

CREATE TABLE IF NOT EXISTS field (
    'id' INT AUTO_INCREMENT PRIMARY KEY ,
    'uni_id' INT NOT NULL DEFAULT 0 COMMENT 'ѧУid',
    'school_id' INT NOT NULL DEFAULT 0 COMMENT 'У��id',
    'area_id' INT NOT NULL DEFAULT 0 COMMENT '������id',
    'name' VARCHAR(255) NOT NULL DEFAULT '' COMMENT '��������',
    /* �� ��ý�����201�� �������ϵ�칫�� �� ����ʵ����228  �����רҵʵ���� */
    'discription' TEXT NOT NULL DEFAULT '' COMMENT '����',
    'length' INT NOT NULL DEFAULT 0 COMMENT '���س���',
    'width'  INT NOT NULL DEFAULT 0 COMMENT '���ؿ��',
    'height' INT NOT NULL DEFAULT 0 COMMENT '���ظ߶�',
    'max_volumn' INT NOT NULL DEFAULT 0 COMMENT '������������',
    'type_id' TINYINT NOT NULL DEFAULT 0 COMMENT '��������id',
    'in_out_door' TINYINT NOT NULL DEFAULT 0 COMMENT '����/����', /* 0�����ڣ�1������ */
    
    'level' TINYINT NOT NULL DEFAULT 0 COMMENT '¥��', /* 1:һ¥  2:��¥  -1:��һ��  8:��¥ */
    'room' VARCHAR(127) NOT NULL DEFAULT '' COMMENT '�����', /* 228 */

    'created_at' INT NOT NULL DEFAULT 0 COMMENT '�½�ʱ��',
    'updated_at' INT NOT NULL DEFAULT 0 COMMENT '�޸�ʱ��',
    'deleted_at' INT NOT NULL DEFAULT 0 COMMENT '��ɾ��', /* ɾ��ʱ�� */
    FOREIGN KEY(uni_id) REFERENCES university(id), /* ��� */
    FOREIGN KEY(school_id) REFERENCES school(id), /* ��� */
    FOREIGN KEY(area_id) REFERENCES area(id), /* ��� */
    FOREIGN KEY(type_id) REFERENCES field_type(id) /* ��� */
    )ENGINE=InnoDB DEFAULT CHARSET=UTF8 COMMENT='ѧУ���ر�';




/* �û��˺ű�Ⱥ �У�
�û���½�˺ű� ���ᵽǰ�棬
�������ñ���½��־��ע���û���Ҫ��Ϣ���û�����ͨѶ��ʽ���û�סַ���û���Ƭ��
��ɫ��Ȩ�ޱ���ɫ-�û���Ȩ�޷���� 4��entrust�ı�
*/

CREATE TABLE IF NOT EXISTS password_resets (
    'email' VARCHAR(255) NOT NULL DEFAULT '',
    'token' VARCHAR(255) NOT NULL DEFAULT '',
    'created_at' INT DEFAULT 0 COMMENT '�½�ʱ��',
    )ENGINE=InnoDB DEFAULT CHARSET=UTF8 COMMENT='�������ñ�';


CREATE TABLE IF NOT EXISTS login_log (
    'id' INT AUTO_INCREMENT PRIMARY KEY ,
    'user_id' INT NOT NULL DEFAULT 0 COMMENT '�û�id', /* ������û��� */
    'login_cnt' INT NOT NULL DEFAULT 0 COMMENT '�ܵ�½����',
    'last_time' INT DEFAULT 0 COMMENT '�����½ʱ��',
    'last_IP' VARCHAR(127) NOT NULL DEFAULT '' COMMENT '�����½��IP��ַ',
    'created_at' INT NOT NULL DEFAULT 0 COMMENT '�½�ʱ��',
    FOREIGN KEY(user_id) REFERENCES user(id) /* ��� */
    )ENGINE=InnoDB DEFAULT CHARSET=UTF8 COMMENT='��½��־��';


/* ע���û���Ҫ��Ϣ 
   ��ע��һ���˺�ʱ��users��ͱ���ͬʱ����һ����¼�����ű���ͬ������¼����Ҳ��һһ��Ӧ��
   ��ˣ�users���id�ֶκͱ����id�ֶΣ�����ͬ��������
*/
CREATE TABLE IF NOT EXISTS user_main_info(
    'id' INT AUTO_INCREMENT PRIMARY KEY ,
    'name' VARCHAR(255) NOT NULL DEFAULT '' COMMENT '�û�����ʵ��',
    'english_name' VARCHAR(255) NOT NULL DEFAULT '' COMMENT '�û�����ʵ��',
    'nick_name' VARCHAR(255) NOT NULL DEFAULT '' COMMENT '�ǳ�',
    'identification' VARCHAR(64) NOT NULL DEFAULT '' COMMENT '���֤����',  /* �������û�п��ܳ�һ�㣿���Ըɴ�64λ */
    'gender' TINYINT NOT NULL DEFAULT 0 COMMENT '�Ա�', /* 0 Ů  1 ��  2 δ֪ */
    'birthday' INT NOT NULL DEFAULT 0 COMMENT '��������',
    'dep_id' INT NOT NULL DEFAULT 0 COMMENT '��ǰѧԺ',  /* ��ǰ �Ͷ� ���� ѧԺ����Ϊ������תѧԺ�� */
    'created_at' INT NOT NULL DEFAULT 0 COMMENT '�½�ʱ��',
    'updated_at' INT NOT NULL DEFAULT 0 COMMENT '�޸�ʱ��',
    'deleted_at' INT NOT NULL DEFAULT 0 COMMENT '��ɾ��', /* ɾ��ʱ�� */
    FOREIGN KEY(dep_id) REFERENCES department(id) /* ��� */
)ENGINE=InnoDB DEFAULT CHARSET=UTF8 COMMENT='�û���Ҫ��Ϣ��';


/* �û�����ͨѶ��ʽ�� */
CREATE TABLE IF NOT EXISTS user_communication (
    'id' INT AUTO_INCREMENT PRIMARY KEY ,
    'user_id' INT NOT NULL DEFAULT 0 COMMENT '�û�id', /* ������û��� */
    'how' VARCHAR(127) NOT NULL DEFAULT '' COMMENT '����',
    'flag' TINYINT NOT NULL DEFAULT 0 COMMENT '��־', 
    /* 0 QQ����  1 ΢�ź�  2 ��������  3 �ֻ�  4 �ֻ��̺�  5 �칫������  6 �칫�������̺�  7 ��ͥ���� */
    'created_at' INT NOT NULL DEFAULT 0 COMMENT '�½�ʱ��',
    'updated_at' INT NOT NULL DEFAULT 0 COMMENT '�޸�ʱ��',
    'deleted_at' INT NOT NULL DEFAULT 0 COMMENT '��ɾ��', /* ɾ��ʱ�� */
    FOREIGN KEY(user_id) REFERENCES user(id) /* ��� */
)ENGINE=InnoDB DEFAULT CHARSET=UTF8 COMMENT='����ͨѶ��ʽ��';


/* �û�סַ�� */
CREATE TABLE IF NOT EXISTS user_communication (
    'id' INT AUTO_INCREMENT PRIMARY KEY ,
    'user_id' INT NOT NULL DEFAULT 0 COMMENT '�û�id', /* ������û��� */
    'address' TEXT NOT NULL DEFAULT '' COMMENT '��ַ��סַ',
    'zip' VARCHAR(127) NOT NULL DEFAULT '' COMMENT '��������',
    'flag' TINYINT NOT NULL DEFAULT 0 COMMENT '��־',
    /* 0 ����סַ  1 �໤��סַ  2 ���ŵ�ַ  3 ��ס��ַ */
    'created_at' INT NOT NULL DEFAULT 0 COMMENT '�½�ʱ��',
    'updated_at' INT NOT NULL DEFAULT 0 COMMENT '�޸�ʱ��',
    'deleted_at' INT NOT NULL DEFAULT 0 COMMENT '��ɾ��', /* ɾ��ʱ�� */
    FOREIGN KEY(user_id) REFERENCES user(id) /* ��� */
)ENGINE=InnoDB DEFAULT CHARSET=UTF8 COMMENT='�û�סַ��';


/* �û���Ƭ�� */
CREATE TABLE IF NOT EXISTS user_picture (
    'id' INT AUTO_INCREMENT PRIMARY KEY ,
    'user_id' INT NOT NULL DEFAULT 0 COMMENT '�û�id', /* ������û��� */
    'picture_file' VARCHAR(127) NOT NULL DEFAULT '' COMMENT '��Ƭ�ļ���',
    'picture_path' VARCHAR(255) NOT NULL DEFAULT '' COMMENT '��Ƭ�����ļ���·��',
    'flag' TINYINT NOT NULL DEFAULT 0 COMMENT '��־',
    /* 0 �ڰ�֤����  1 ��ɫ�׵�֤����  2 ��ɫ���֤����  3 �����հ���  4 ������ȫ�� */
    'created_at' INT NOT NULL DEFAULT 0 COMMENT '�½�ʱ��',
    'updated_at' INT NOT NULL DEFAULT 0 COMMENT '�޸�ʱ��',
    'deleted_at' INT NOT NULL DEFAULT 0 COMMENT '��ɾ��', /* ɾ��ʱ�� */
    FOREIGN KEY(user_id) REFERENCES user(id) /* ��� */
)ENGINE=InnoDB DEFAULT CHARSET=UTF8 COMMENT='����ͨѶ��ʽ��';



/* ��ɫ��Ȩ�ޱ���ɫ-�û���Ȩ�޷���� 4��entrust�ı� */

CREATE TABLE IF NOT EXISTS roles (
    'id' INT AUTO_INCREMENT PRIMARY KEY ,
    'name'         VARCHAR(127) NOT NULL DEFAULT '' COMMENT '��ɫ����',
    'display_name' VARCHAR(127) NOT NULL DEFAULT '' COMMENT '��ʾ����',
    'description'  VARCHAR(127) NOT NULL DEFAULT '' COMMENT '��ɫ����',
    'created_at' INT NOT NULL DEFAULT 0 COMMENT '�½�ʱ��',
    'updated_at' INT NOT NULL DEFAULT 0 COMMENT '�޸�ʱ��',
    'deleted_at' INT NOT NULL DEFAULT 0 COMMENT '��ɾ��', /* ɾ��ʱ�� */
)ENGINE=InnoDB DEFAULT CHARSET=UTF8 COMMENT='��ɫ��';

CREATE TABLE IF NOT EXISTS permissions (
    'id' INT AUTO_INCREMENT PRIMARY KEY ,
    'name'         VARCHAR(127) NOT NULL DEFAULT '' COMMENT 'Ȩ������',
    'display_name' VARCHAR(127) NOT NULL DEFAULT '' COMMENT '��ʾ����',
    'description'  VARCHAR(127) NOT NULL DEFAULT '' COMMENT 'Ȩ������',  /* һ��д����display_name �����û��� description */
    'created_at' INT NOT NULL DEFAULT 0 COMMENT '�½�ʱ��',
    'updated_at' INT NOT NULL DEFAULT 0 COMMENT '�޸�ʱ��',
    'deleted_at' INT NOT NULL DEFAULT 0 COMMENT '��ɾ��', /* ɾ��ʱ�� */
)ENGINE=InnoDB DEFAULT CHARSET=UTF8 COMMENT='Ȩ�ޱ�';

CREATE TABLE IF NOT EXISTS role_user (
    'user_id' INT NOT NULL DEFAULT 0 COMMENT '�û�id',  /* ������û��� */   /* �ĸ��û�ӵ��ʲô��ɫ */
    'role_id' INT NOT NULL DEFAULT 0 COMMENT '��ɫid',  /* �������ɫ�� */
    'created_at' INT NOT NULL DEFAULT 0 COMMENT '�½�ʱ��',
    'updated_at' INT NOT NULL DEFAULT 0 COMMENT '�޸�ʱ��',
    'deleted_at' INT NOT NULL DEFAULT 0 COMMENT '��ɾ��', /* ɾ��ʱ�� */
)ENGINE=InnoDB DEFAULT CHARSET=UTF8 COMMENT='��ɫ-�û���';

CREATE TABLE IF NOT EXISTS permission_role (
    'permission_id' INT NOT NULL DEFAULT 0 COMMENT 'Ȩ��id',  /* ������û��� */   /* �ĸ���ɫӵ��ʲôȨ�� */
    'role_id'       INT NOT NULL DEFAULT 0 COMMENT '��ɫid',  /* �������ɫ�� */
    'created_at' INT NOT NULL DEFAULT 0 COMMENT '�½�ʱ��',
    'updated_at' INT NOT NULL DEFAULT 0 COMMENT '�޸�ʱ��',
    'deleted_at' INT NOT NULL DEFAULT 0 COMMENT '��ɾ��', /* ɾ��ʱ�� */
)ENGINE=InnoDB DEFAULT CHARSET=UTF8 COMMENT='Ȩ�޷����';


