/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2014/10/9 16:54:38                           */
/*==============================================================*/


drop table if exists "sxj-supervisor".IDENTITIES;

drop table if exists "sxj-supervisor".M_CONTRACT;

drop table if exists "sxj-supervisor".M_CONTRACT_BATCH;

drop table if exists "sxj-supervisor".M_CONTRACT_ITEM;

drop table if exists "sxj-supervisor".M_CONTRACT_MODIFY;

drop table if exists "sxj-supervisor".M_CONTRACT_MODIFY_BATCH;

drop table if exists "sxj-supervisor".M_CONTRACT_MODIFY_ITEM;

drop table if exists "sxj-supervisor".M_CONTRACT_RECORD;

drop table if exists "sxj-supervisor".M_CONTRACT_REPLENISH;

drop table if exists "sxj-supervisor".M_CONTRACT_REPLENISH_BATCH;

drop table if exists "sxj-supervisor".M_MEMBER;

drop table if exists "sxj-supervisor".M_MEMBER_ACCOUNT;

drop table if exists "sxj-supervisor".M_MEMBER_FUNCTION;

drop table if exists "sxj-supervisor".M_MEMBER_ROLE;

drop table if exists "sxj-supervisor".M_ROLE_ACCOUNT;

drop table if exists "sxj-supervisor".M_SYS_ACCOUNT;

drop table if exists "sxj-supervisor".M_SYS_AREA;

drop table if exists "sxj-supervisor".M_SYS_FUNCTION;

drop table if exists "sxj-supervisor".M_SYS_LOG;

drop table if exists "sxj-supervisor".M_SYS_ROLE;

drop table if exists "sxj-supervisor".R_FACTORY_REGISTER;

drop table if exists "sxj-supervisor".R_FACTORY_SCHAIN;

drop table if exists "sxj-supervisor".R_FUNCTION_ROLE;

drop table if exists "sxj-supervisor".R_LOGISTICE_REF;

drop table if exists "sxj-supervisor".R_LOGISTICS_RFID;

drop table if exists "sxj-supervisor".R_RFID_APPLICATION;

drop table if exists "sxj-supervisor".R_RFID_PRICE;

drop table if exists "sxj-supervisor".R_RFID_PURCHASE;

drop table if exists "sxj-supervisor".R_RFID_SALE;

drop table if exists "sxj-supervisor".R_RFID_SUPPLIER;

drop table if exists "sxj-supervisor".R_ROLE_USER;

drop table if exists "sxj-supervisor".R_WINDOW_REF;

drop table if exists "sxj-supervisor".R_WINDOW_RFID;

drop table if exists "sxj-supervisor".SHARD;

drop table if exists "sxj-supervisor".SHARD2;

drop table if exists "sxj-supervisor".TEST_FUNCTION;

drop table if exists "sxj-supervisor".TEST_RFID_NUMBER;

drop table if exists "sxj-supervisor".T_ADMIN;

drop table if exists "sxj-supervisor".T_ADMIN_ROLE;

drop table if exists "sxj-supervisor".T_CONTRACT;

drop table if exists "sxj-supervisor".T_CONTRACT_REGISTER;

drop table if exists "sxj-supervisor".T_FACTORY;

drop table if exists "sxj-supervisor".T_FUNCTION;

drop table if exists "sxj-supervisor".T_SN;

drop table if exists "sxj-supervisor".T_SUBSYSTEM;

drop table if exists "sxj-supervisor".T_SUPPLYCHAIN_DESCRIPTION;

drop table if exists "sxj-supervisor".T_SYSTEM_PARAM;

/*==============================================================*/
/* User: "sxj-supervisor"                                       */
/*==============================================================*/
create user "sxj-supervisor";

/*==============================================================*/
/* Table: IDENTITIES                                            */
/*==============================================================*/
create table "sxj-supervisor".IDENTITIES
(
   IDENTITIES_ID        bigint(20),
   IDENTITIES_DELIMITER national varchar(45) not null,
   primary key (IDENTITIES_DELIMITER)
);

/*==============================================================*/
/* Table: M_CONTRACT                                            */
/*==============================================================*/
create table "sxj-supervisor".M_CONTRACT
(
   ID                   national varchar(32) not null comment '����ID',
   CONTRACT_NO          national varchar(50) comment '��ͬ��',
   ADDRESS              national varchar(255) comment 'ǩ����ַ',
   MEMBER_ID_A          national varchar(32) comment '�׷�',
   MEMBER_ID_B          national varchar(32) comment '�ҷ�',
   ENG_NAME             national varchar(50) comment '��������',
   ENG_ADDRESS          national varchar(255) comment '���̵�ַ',
   RECORD_NO            national varchar(50) comment '��ͬ������',
   SIGNED_DATE          datetime comment 'ǩ������',
   VALIDITY_DATE        datetime comment '��ͬ����',
   START_DATE           datetime comment '��Ч����',
   CREATE_DATE          datetime comment '����ʱ��',
   RECORD_DATE          datetime comment '����ʱ��',
   DEPOSIT              bigint(20) comment '��ͬ����',
   REMARKS              national varchar(255) comment '��ע',
   DELIVERY_ADDRESS     national varchar(255) comment '������ַ',
   STATE                int(10) comment '״̬',
   TYPE                 int(10) comment '��ͬ����',
   REF_CONTRACT_NO      national varchar(50) comment '������ͬ��',
   MEMBER_NAME_A        national varchar(50) comment '�׷�����',
   MEMBER_NAME_B        national varchar(50) comment '�ҷ�����',
   STATE_LOG            national varchar(255) comment '��ͬ״̬�����¼(JOSN)',
   BATCH_COUNT          national varchar(255) comment '������',
   NOW_RECORD_NO        int(11) comment '��ǰ���±�����',
   IMG_PATH             national longtext comment 'ɨ���·��',
   CONFIRM_STATE        int(11) comment 'ȷ��״̬״̬',
   DELETE_STATE         int(255) comment 'ɾ��״̬'
);

/*==============================================================*/
/* Table: M_CONTRACT_BATCH                                      */
/*==============================================================*/
create table "sxj-supervisor".M_CONTRACT_BATCH
(
   ID                   national varchar(32) not null comment '����',
   CONTRACT_ID          national varchar(32) comment '��ͬ���',
   RFID_NO              national varchar(50) comment 'RFID��',
   AMOUNT               bigint(255) comment '���',
   BATCH_ITEMS          national varchar(255) comment '������ĿJSON',
   BATCH_NO             int(11) comment '���κ�',
   UPDATE_STATE         int(11) comment '��ʶ״̬'
);

/*==============================================================*/
/* Table: M_CONTRACT_ITEM                                       */
/*==============================================================*/
create table "sxj-supervisor".M_CONTRACT_ITEM
(
   ID                   national varchar(32) not null comment '����',
   CONTRACT_ID          national varchar(32) comment '��ͬID',
   PRODUCT_NAME         national varchar(100) comment '��Ʒ����',
   PRODUCT_MODEL        national varchar(50) comment '����ͺ�',
   QUANTITY             float(255,0) comment '����',
   PRICE                bigint(255) comment '����',
   AMOUNT               bigint(255) comment '���',
   REMARKS              national varchar(255) comment '��ע',
   UPDATE_STATE         int(11) comment '���״̬',
   WINDOW_TYPE          int(11) comment '�Ŵ�����'
);

/*==============================================================*/
/* Table: M_CONTRACT_MODIFY                                     */
/*==============================================================*/
create table "sxj-supervisor".M_CONTRACT_MODIFY
(
   ID                   national varchar(32) not null comment '����',
   CONTRACT_ID          national varchar(32) comment '��ͬID',
   RECORD_NO            national varchar(32) comment '������',
   IMG_PATH             national varchar(255) comment 'ɨ���',
   primary key (ID)
);

/*==============================================================*/
/* Table: M_CONTRACT_MODIFY_BATCH                               */
/*==============================================================*/
create table "sxj-supervisor".M_CONTRACT_MODIFY_BATCH
(
   ID                   national varchar(32) not null comment '����',
   MODIFY_ID            national varchar(32) comment '���ID',
   RFID_NO              national varchar(50) comment 'RFID��',
   AMOUNT               bigint(255) comment '���',
   BATCH_ITEMS          national varchar(255) comment '������ĿJSON',
   RECORD_NO            national varchar(50),
   BATCH_NO             int(11) comment '���κ�',
   UPDATE_STATE         int(11) comment '��ʶ״̬'
);

/*==============================================================*/
/* Table: M_CONTRACT_MODIFY_ITEM                                */
/*==============================================================*/
create table "sxj-supervisor".M_CONTRACT_MODIFY_ITEM
(
   ID                   national varchar(32) not null comment '����',
   MODIFY_ID            national varchar(32) comment '�����¼ID',
   PRODUCT_NAME         national varchar(100) comment '��Ʒ����',
   PRODUCT_MODEL        national varchar(50) comment '����ͺ�',
   QUANTITY             float(255,0) comment '����',
   PRICE                bigint(255) comment '����',
   AMOUNT               bigint(255) comment '���',
   REMARKS              national varchar(255) comment '��ע',
   UPDATE_STATE         int(11) comment '��ʶ״̬',
   primary key (ID)
);

/*==============================================================*/
/* Table: M_CONTRACT_RECORD                                     */
/*==============================================================*/
create table "sxj-supervisor".M_CONTRACT_RECORD
(
   ID                   national varchar(32) not null comment '����ID',
   RECORD_NO            national varchar(32) comment '������',
   APPLY_ID             national varchar(32) comment '�����ԱID',
   APPLY_NAME           national varchar(255) comment '�����Ա����',
   MEMBER_ID_A          national varchar(32) comment '�׷���ԱID',
   MEMBER_NAME_A        national varchar(255) comment '�׷���Ա����',
   MEMBER_ID_B          national varchar(32) comment '�ҷ���ԱID',
   MEMBER_NAME_B        national varchar(255) comment '�ҷ���Ա����',
   TYPE                 int(10) comment '��������',
   IMG_PATH             national longtext comment '����ɨ���',
   STATE                int(10) comment '����״̬',
   CONTRACT_TYPE        int(10) comment '��ͬ����',
   CONTRACT_NO          national varchar(32) comment '�󶨺�ͬ��',
   REF_CONTRACT_NO      national varchar(32) comment '�����б��ͬ',
   APPLY_DATE           datetime comment '����ʱ��',
   ACCEPT_DATE          datetime comment '����ʱ��',
   RECORD_FLAG          int(255) comment '���',
   DEL_STATE            tinyint(1) default 0 comment 'ɾ�����',
   CONFIRM_STATE        int(255) comment 'ǰ̨ʹ��ȷ��״̬',
   RFID_NO              national varchar(255) comment '����RFID',
   primary key (ID)
);

/*==============================================================*/
/* Table: M_CONTRACT_REPLENISH                                  */
/*==============================================================*/
create table "sxj-supervisor".M_CONTRACT_REPLENISH
(
   ID                   national varchar(32) not null comment '����',
   CONTRACT_ID          national varchar(32) comment '��ͬID',
   RECORD_NO            national varchar(50) comment '������',
   BATCH_RFID_NO        national varchar(50) comment '��������RFID',
   RFID_ORDER_NO        national varchar(50) comment 'RFID������',
   IMG_PATH             national varchar(255) comment 'ɨ���·��',
   primary key (ID)
);

/*==============================================================*/
/* Table: M_CONTRACT_REPLENISH_BATCH                            */
/*==============================================================*/
create table "sxj-supervisor".M_CONTRACT_REPLENISH_BATCH
(
   ID                   national varchar(32) not null comment '����',
   BATCH_NO             national varchar(32) comment '���κ�',
   REPLENISH_ID         national varchar(32) comment '���ID',
   RFID_NO              national varchar(32) comment 'RFID��',
   AMOUNT               bigint(20) comment '���',
   BATCH_ITEMS          national varchar(255) comment '������ĿJSON',
   NEW_RFID_NO          national varchar(32) comment '��RFID��',
   primary key (ID)
);

/*==============================================================*/
/* Table: M_MEMBER                                              */
/*==============================================================*/
create table "sxj-supervisor".M_MEMBER
(
   ID                   national varchar(32) not null comment '��ʶ,����',
   MEMBER_NO            national varchar(32) not null comment '��Ա��',
   NAME                 national varchar(255) comment '��Ա����',
   B_LICENSE_NO         national varchar(15) comment 'Ӫҵִ�պ�',
   TYPE                 int(11) comment '��Ա����',
   AREA                 national varchar(100) comment '��������',
   CONTACTS             national varchar(255) comment '��ϵ������',
   ENERGY_NO            national varchar(15) comment '���ܱ�ʶ��',
   PHONE_NO             national varchar(15) comment '��ϵ���ֻ�',
   ADDRESS              national varchar(255) comment '��˾��ַ',
   TEL_NUM              national varchar(15) comment '��ϵ�绰',
   REG_DATE             datetime comment 'ע������',
   AUTHOR_DATE          datetime comment '��֤����',
   STATE                int(11) comment '�˻�״̬',
   CHECK_STATE          int(11) comment '���״̬',
   TOTAL_AMOUNT         bigint(20) comment '�ܽ��׶�',
   ACCOUNT_NUM          int(11) comment '���˻���Ŀ',
   PASSWORD             national varchar(255) comment '��Ա����',
   B_LICENSE_PATH       national varchar(255) comment 'Ӫҵִ��ͼƬpath',
   ENERGY_PATH          national varchar(255) comment '���ܱ�ʶͼƬpath',
   CODE                 national varchar(32) comment '��������',
   FLAG                 tinyint(1) default 0 comment '�Ƿ����ƻ�Ա���ϱ��',
   primary key (ID)
);

/*==============================================================*/
/* Table: M_MEMBER_ACCOUNT                                      */
/*==============================================================*/
create table "sxj-supervisor".M_MEMBER_ACCOUNT
(
   ID                   national varchar(32) not null comment '������ʶ',
   ACCOUNT_NO           national varchar(50) not null comment '���˻�ID',
   PASSWORD             national varchar(255) comment '���˻�����',
   PARENT_ID            national varchar(32) not null comment '������ԱID',
   ACCOUNT_NAME         national varchar(50) not null comment '���˻�����',
   NAME                 national varchar(50) not null comment '����',
   STATE                int(10) not null comment '���˻�״̬',
   REG_DATE             datetime not null comment 'ע������',
   DEL_STATE            tinyint(1) not null default 0 comment '�߼�ɾ�����',
   primary key (ID),
   key UN_ACCOUNT_NAME (ACCOUNT_NAME)
);

/*==============================================================*/
/* Table: M_MEMBER_FUNCTION                                     */
/*==============================================================*/
create table "sxj-supervisor".M_MEMBER_FUNCTION
(
   ID                   national varchar(32) not null comment '������ʶ',
   TITLE                national varchar(50) not null comment '��������',
   URL                  national varchar(512) comment '��������URL',
   PARENT_ID            national varchar(32) comment '��ϵͳ����ID',
   LEVEL                int(10) comment '����',
   "DESC"               int(11),
   STYLE                national varchar(50) comment '��ʽ',
   primary key (ID)
);

/*==============================================================*/
/* Table: M_MEMBER_ROLE                                         */
/*==============================================================*/
create table "sxj-supervisor".M_MEMBER_ROLE
(
   ID                   national varchar(32) not null comment '������ʶ',
   FUNCTION_ID          national varchar(32) not null comment 'ϵͳ����ID',
   ACCOUNT_ID           national varchar(32) not null comment '�˻�ID',
   MEMBER_ID            national varchar(32) comment '��ԱID',
   primary key (ID)
);

/*==============================================================*/
/* Table: M_ROLE_ACCOUNT                                        */
/*==============================================================*/
create table "sxj-supervisor".M_ROLE_ACCOUNT
(
   ID                   national varchar(32) not null,
   FUNCTION_ID          national varchar(32) not null,
   ACCOUNT_ID           national varchar(32) not null,
   primary key (ID)
);

/*==============================================================*/
/* Table: M_SYS_ACCOUNT                                         */
/*==============================================================*/
create table "sxj-supervisor".M_SYS_ACCOUNT
(
   ID                   national varchar(32) not null comment '����',
   NAME                 national varchar(50) not null comment '����Ա����',
   ACCOUNT              national varchar(50) not null comment '����Ա�˺�',
   PASSWORD             national varchar(50) comment '����',
   ACCOUNT_NO           national varchar(32),
   DEL_STATE            tinyint(1) comment 'ɾ�����',
   LAST_LOGIN           datetime comment '��¼ʱ��',
   primary key (ID)
);

/*==============================================================*/
/* Table: M_SYS_AREA                                            */
/*==============================================================*/
create table "sxj-supervisor".M_SYS_AREA
(
   ID                   national varchar(32) not null comment '������ʶ',
   NAME                 national varchar(50) comment '��������',
   PARENT_ID            national varchar(32) comment '��ID',
   LEVEL                int(1) comment '����',
   primary key (ID)
);

/*==============================================================*/
/* Table: M_SYS_FUNCTION                                        */
/*==============================================================*/
create table "sxj-supervisor".M_SYS_FUNCTION
(
   ID                   national varchar(32) not null comment '������ʶ',
   TITLE                national varchar(50) not null comment '��������',
   URL                  national varchar(512) comment '��������URL',
   PARENT_ID            national varchar(32) comment '��ϵͳ����ID',
   LEVEL                int(10) comment '����',
   "DESC"               int(11),
   primary key (ID)
);

/*==============================================================*/
/* Table: M_SYS_LOG                                             */
/*==============================================================*/
create table "sxj-supervisor".M_SYS_LOG
(
   ID                   national varchar(32) not null comment '����',
   ACCOUNT_NO           national varchar(32) comment '����T�~̖',
   OPER_TIME            datetime comment '�����r�g',
   LOGS                 national varchar(500) comment '��������',
   primary key (ID)
);

/*==============================================================*/
/* Table: M_SYS_ROLE                                            */
/*==============================================================*/
create table "sxj-supervisor".M_SYS_ROLE
(
   ID                   national varchar(32) not null comment '������ʶ',
   FUNCTION_ID          national varchar(32) not null comment 'ϵͳ����ID',
   ACCOUNT_ID           national varchar(32) not null comment '�˻�ID',
   primary key (ID)
);

/*==============================================================*/
/* Table: R_FACTORY_REGISTER                                    */
/*==============================================================*/
create table "sxj-supervisor".R_FACTORY_REGISTER
(
   F_FACTORY_ID         national varchar(32) not null,
   F_REGISTER_ID        national varchar(32) not null,
   primary key (F_FACTORY_ID, F_REGISTER_ID)
);

/*==============================================================*/
/* Table: R_FACTORY_SCHAIN                                      */
/*==============================================================*/
create table "sxj-supervisor".R_FACTORY_SCHAIN
(
   F_FACTORY_ID         national varchar(32) not null,
   F_SCHAIN_NODE        national varchar(32) not null,
   primary key (F_FACTORY_ID, F_SCHAIN_NODE)
);

/*==============================================================*/
/* Table: R_FUNCTION_ROLE                                       */
/*==============================================================*/
create table "sxj-supervisor".R_FUNCTION_ROLE
(
   F_ROLE_ID            national varchar(32) not null,
   F_FUNC_ID            national varchar(32) not null,
   primary key (F_ROLE_ID, F_FUNC_ID)
);

/*==============================================================*/
/* Table: R_LOGISTICE_REF                                       */
/*==============================================================*/
create table "sxj-supervisor".R_LOGISTICE_REF
(
   ID                   national varchar(32) not null comment '����',
   RFID_REF_NO          national varchar(15) not null comment 'RFID���������',
   RFID_NO              national varchar(15) comment 'RFID���',
   MEMBER_NO            national varchar(15) comment '������',
   MEMBER_NAME          national varchar(100) comment '����������',
   RFID_TYPE            int(1) comment 'RFID����',
   STATE                int(1) comment '���״̬',
   TYPE                 int(1) comment '��������',
   BATCH_NO             national varchar(15) comment '����',
   APPLY_DATE           datetime comment '��������ʱ��',
   REPLENISH_RFID       national varchar(15) comment '������RFID',
   CONTRACT_NO          national varchar(15) comment '�ɹ���ͬ��',
   DEL_STATE            tinyint(1) default 0 comment '�߼�ɾ�����',
   primary key (ID)
);

/*==============================================================*/
/* Table: R_LOGISTICS_RFID                                      */
/*==============================================================*/
create table "sxj-supervisor".R_LOGISTICS_RFID
(
   ID                   national varchar(32) not null comment '����',
   RFID_NO              national varchar(15) not null comment 'RFID���',
   PURCHASE_NO          national varchar(15) comment '�ɹ�����',
   TYPE                 int(1) comment 'RFID����',
   MEMBER_NO            national varchar(15) comment '�����Ա��',
   MEMBER_NAME          national varchar(100) comment '�����Ա����',
   CONTRACT_NO          national varchar(15) comment '�ɹ���ͬ��',
   BATCH_NO             national varchar(15) comment 'ִ�����κ�',
   IMPORT_DATE          datetime comment '��������',
   REPLENISH_NO         national varchar(15) comment '��������',
   RFID_STATE           int(1) comment 'RFID״̬',
   PROGRESS_STATE       int(1) comment '����״̬',
   LOG                  national varchar(255) comment 'ִ����־',
   primary key (ID)
);

/*==============================================================*/
/* Table: R_RFID_APPLICATION                                    */
/*==============================================================*/
create table "sxj-supervisor".R_RFID_APPLICATION
(
   ID                   national varchar(32) not null comment '����',
   APPLY_NO             national varchar(15) not null comment 'RFID���뵥���',
   MEMBER_NO            national varchar(15) comment '�����ԱID',
   MEMBER_NAME          national varchar(100) comment '�����Ա����',
   RFID_TYPE            int(1) comment 'RFID����',
   CONTRACT_NO          national varchar(15) comment '�б��ͬ��',
   COUNT                int(11) comment '��������',
   APPLY_DATE           datetime comment '��������',
   PAY_STATE            int(1) comment '֧��״̬',
   RECEIPT_STATE        int(1) comment '�ջ�״̬',
   DEL_STATE            tinyint(1) default 0 comment '�߼�ɾ�����',
   HAS_NUMBER           int(11) default 0 comment '����������',
   primary key (ID)
);

/*==============================================================*/
/* Table: R_RFID_PRICE                                          */
/*==============================================================*/
create table "sxj-supervisor".R_RFID_PRICE
(
   ID                   national varchar(32) not null comment '����',
   LOGISTICS_PRICE      int(11) comment '��������RFID�۸�',
   WINDOW_PRICE         int(11) comment '�Ŵ�RFID�۸�',
   primary key (ID)
);

/*==============================================================*/
/* Table: R_RFID_PURCHASE                                       */
/*==============================================================*/
create table "sxj-supervisor".R_RFID_PURCHASE
(
   ID                   national varchar(32) not null comment '����',
   PURCHASE_NO          national varchar(15) not null comment '�ɹ������',
   SUPPLIER_NO          national varchar(15) comment '��Ӧ�̱��',
   SUPPLIER_NAME        national varchar(100) comment '��Ӧ������',
   RFID_TYPE            int(1) comment 'RFID����',
   COUNT                int(11) comment '����',
   PRICE                int(11) comment '����',
   AMOUNT               int(11) comment '���',
   PURCHASE_DATE        datetime comment '�ɹ�����',
   CONTRACT_NO          national varchar(15) comment '�б��ͬ��',
   APPLY_NO             national varchar(15) comment '���뵥���',
   IMPORT_STATE         int(1) comment '����״̬',
   PAY_STATE            int(1) comment '֧��״̬',
   RECEIPT_STATE        int(1) comment '����״̬',
   DEL_STATE            int(11) comment 'ɾ��״̬',
   primary key (ID)
);

/*==============================================================*/
/* Table: R_RFID_SALE                                           */
/*==============================================================*/
create table "sxj-supervisor".R_RFID_SALE
(
   ID                   national varchar(32) not null comment '����',
   APPLY_NO             national varchar(15) comment '���뵥��',
   PURCHASE_NO          national varchar(15) comment '�ɹ�����',
   COUNT                int(11) comment '��������',
   RFID_TYPE            int(1) comment 'RFID����',
   PRICE                int(11) comment '���ۼ۸�',
   SALE_DATE            datetime comment '��������',
   primary key (ID)
);

/*==============================================================*/
/* Table: R_RFID_SUPPLIER                                       */
/*==============================================================*/
create table "sxj-supervisor".R_RFID_SUPPLIER
(
   ID                   national varchar(32) not null comment '����',
   SUPPLIER_NO          national varchar(15) comment '��Ӧ��NO',
   NAME                 national varchar(100) comment '��Ӧ������',
   ADDRESS              national varchar(255) comment '��ַ',
   CONTRACT_NAME        national varchar(255) comment '��ϵ������',
   CONTRACT_TEL         national varchar(15) comment '��ϵ�绰',
   TEL_NAME             national varchar(15) comment '�̶��绰',
   DOORS_PRICE          bigint(10) comment '�Ŵ���ǩ�ɹ���',
   BATCH_PRICE          bigint(10) comment '���α�ǩ�ɹ���',
   DEL_STATE            tinyint(1) default 0 comment '�߼�ɾ��',
   primary key (ID)
);

/*==============================================================*/
/* Table: R_ROLE_USER                                           */
/*==============================================================*/
create table "sxj-supervisor".R_ROLE_USER
(
   F_USER_ID            national varchar(32) not null,
   F_ROLE_ID            national varchar(32) not null,
   primary key (F_USER_ID, F_ROLE_ID)
);

/*==============================================================*/
/* Table: R_WINDOW_REF                                          */
/*==============================================================*/
create table "sxj-supervisor".R_WINDOW_REF
(
   ID                   national varchar(32) not null comment '����',
   RFID_REF_NO          national varchar(15) not null comment 'RFID���������',
   RFID_RANGE           national varchar(100) comment 'RFID�������',
   MEMBER_NO            national varchar(15) comment '������',
   MEMBER_NAME          national varchar(100) comment '����������',
   TYPE                 int(1) comment '��������',
   WINDOWS_NO           national varchar(15) comment '���ʹ���',
   GLASS_BATCH_NO       national varchar(15) comment '��������',
   PROFILE_BATCH_NO     national varchar(15) comment '�Ͳ�����',
   APPLY_DATE           datetime comment '��������ʱ��',
   REPLENISH_RFID       national varchar(15) comment '������RFID',
   CONTRACT_NO          national varchar(15) comment '��ͬ��',
   DEL_STATE            int(11) comment 'ɾ��״̬',
   STATE                int(11) comment '���״̬',
   primary key (ID)
);

/*==============================================================*/
/* Table: R_WINDOW_RFID                                         */
/*==============================================================*/
create table "sxj-supervisor".R_WINDOW_RFID
(
   ID                   national varchar(32) not null comment '����',
   RFID_NO              national varchar(15) comment 'RFID���',
   PURCHASE_NO          national varchar(15) comment '�ɹ�����',
   CONTRACT_NO          national varchar(15) comment '�ɹ���ͬ��',
   WINDOW_TYPE          int(1) comment '���ʹ���',
   GLASS_RFID           national varchar(15) comment '����RFID',
   PROFILE_RFID         national varchar(15) comment '�Ͳ�RFID',
   IMPORT_DATE          datetime comment '��������',
   REPLENISH_NO         national varchar(15) comment '��������',
   RFID_STATE           int(1) comment 'RFID״̬',
   PROGRESS_STATE       int(1) comment '����״̬',
   LOG                  national varchar(255) comment 'ִ����־',
   primary key (ID)
);

/*==============================================================*/
/* Table: SHARD                                                 */
/*==============================================================*/
create table "sxj-supervisor".SHARD
(
   SHARD_ID             int(11) not null,
   SHARD_NAME           national varchar(45),
   primary key (SHARD_ID)
);

/*==============================================================*/
/* Table: SHARD2                                                */
/*==============================================================*/
create table "sxj-supervisor".SHARD2
(
   SHARD2_ID            national varchar(128) not null,
   SHARD2_NAME          national varchar(45),
   primary key (SHARD2_ID)
);

/*==============================================================*/
/* Table: TEST_FUNCTION                                         */
/*==============================================================*/
create table "sxj-supervisor".TEST_FUNCTION
(
   ID                   national varchar(32) not null,
   TITLE                national varchar(45) not null,
   primary key (ID)
);

/*==============================================================*/
/* Table: TEST_RFID_NUMBER                                      */
/*==============================================================*/
create table "sxj-supervisor".TEST_RFID_NUMBER
(
   NUMBER_ID            int(11) not null auto_increment,
   NUMBER_START         bigint(20),
   NUMBER_END           bigint(20),
   FOREIGN_KEY          national varchar(45),
   primary key (NUMBER_ID)
);

/*==============================================================*/
/* Table: T_ADMIN                                               */
/*==============================================================*/
create table "sxj-supervisor".T_ADMIN
(
   F_USER_ID            national varchar(32) not null,
   primary key (F_USER_ID)
);

/*==============================================================*/
/* Table: T_ADMIN_ROLE                                          */
/*==============================================================*/
create table "sxj-supervisor".T_ADMIN_ROLE
(
   F_ROLE_ID            national varchar(32) not null,
   primary key (F_ROLE_ID)
);

/*==============================================================*/
/* Table: T_CONTRACT                                            */
/*==============================================================*/
create table "sxj-supervisor".T_CONTRACT
(
   F_CONTRACT_ID        national varchar(32) not null,
   F_RELATIVE_CONTRACT_ID national varchar(32),
   F_REGISTER_ID        national varchar(32),
   F_CONTRACT_NO        national varchar(32),
   primary key (F_CONTRACT_ID)
);

/*==============================================================*/
/* Table: T_CONTRACT_REGISTER                                   */
/*==============================================================*/
create table "sxj-supervisor".T_CONTRACT_REGISTER
(
   F_REGISTER_ID        national varchar(32) not null,
   F_REGISTER_NO        national varchar(32),
   primary key (F_REGISTER_ID)
);

/*==============================================================*/
/* Table: T_FACTORY                                             */
/*==============================================================*/
create table "sxj-supervisor".T_FACTORY
(
   F_FACTORY_ID         national varchar(32) not null,
   F_FACTORY_NAME       national varchar(512),
   primary key (F_FACTORY_ID)
);

/*==============================================================*/
/* Table: T_FUNCTION                                            */
/*==============================================================*/
create table "sxj-supervisor".T_FUNCTION
(
   F_FUNC_ID            national varchar(32) not null,
   F_SUBSYSTEM_ID       national varchar(32),
   F_FUNC_URL           national varchar(512),
   F_DISPLAY_ORDER      int,
   primary key (F_FUNC_ID)
);

/*==============================================================*/
/* Table: T_SN                                                  */
/*==============================================================*/
create table "sxj-supervisor".T_SN
(
   F_SN_NUMBER          int(11),
   F_SN_NAME            national varchar(128)
);

/*==============================================================*/
/* Table: T_SUBSYSTEM                                           */
/*==============================================================*/
create table "sxj-supervisor".T_SUBSYSTEM
(
   F_SUBSYSTEM_ID       national varchar(32) not null,
   F_SUBSYSTEM_NAME     national varchar(128),
   F_SUBSYSTEM_STATUS   tinyint,
   F_FUNC_URL           national varchar(512),
   primary key (F_SUBSYSTEM_ID)
);

/*==============================================================*/
/* Table: T_SUPPLYCHAIN_DESCRIPTION                             */
/*==============================================================*/
create table "sxj-supervisor".T_SUPPLYCHAIN_DESCRIPTION
(
   F_SCHAIN_NODE        national varchar(32) not null,
   F_NEXT_SCHAIN_NODE   national varchar(32),
   F_SCHAIN_NAME        national varchar(128),
   primary key (F_SCHAIN_NODE)
);

/*==============================================================*/
/* Table: T_SYSTEM_PARAM                                        */
/*==============================================================*/
create table "sxj-supervisor".T_SYSTEM_PARAM
(
   F_PARAM_ID           national varchar(32) not null,
   F_SUBSYSTEM_ID       national varchar(32),
   F_PARAM_NAME         national varchar(256),
   F_PARAM_VALUE        national varchar(1024),
   F_PARAM_TYPE         tinyint comment '??JDBC  Types.java',
   primary key (F_PARAM_ID)
);

alter table "sxj-supervisor".R_FACTORY_REGISTER add constraint FK_R_FACTORY_REGISTER foreign key (F_FACTORY_ID)
      references "sxj-supervisor".T_FACTORY (F_FACTORY_ID);

alter table "sxj-supervisor".R_FACTORY_REGISTER add constraint FK_R_FACTORY_REGISTER2 foreign key (F_REGISTER_ID)
      references "sxj-supervisor".T_CONTRACT_REGISTER (F_REGISTER_ID);

alter table "sxj-supervisor".R_FACTORY_SCHAIN add constraint FK_R_FACTORY_SCHAIN foreign key (F_FACTORY_ID)
      references "sxj-supervisor".T_FACTORY (F_FACTORY_ID);

alter table "sxj-supervisor".R_FACTORY_SCHAIN add constraint FK_R_FACTORY_SCHAIN2 foreign key (F_SCHAIN_NODE)
      references "sxj-supervisor".T_SUPPLYCHAIN_DESCRIPTION (F_SCHAIN_NODE);

alter table "sxj-supervisor".R_FUNCTION_ROLE add constraint FK_R_FUNCTION_ROLE foreign key (F_ROLE_ID)
      references "sxj-supervisor".T_ADMIN_ROLE (F_ROLE_ID);

alter table "sxj-supervisor".R_FUNCTION_ROLE add constraint FK_R_FUNCTION_ROLE2 foreign key (F_FUNC_ID)
      references "sxj-supervisor".T_FUNCTION (F_FUNC_ID);

alter table "sxj-supervisor".R_ROLE_USER add constraint FK_R_ROLE_USER foreign key (F_USER_ID)
      references "sxj-supervisor".T_ADMIN (F_USER_ID);

alter table "sxj-supervisor".R_ROLE_USER add constraint FK_R_ROLE_USER2 foreign key (F_ROLE_ID)
      references "sxj-supervisor".T_ADMIN_ROLE (F_ROLE_ID);

alter table "sxj-supervisor".T_CONTRACT add constraint FK_R_CONTRACT_CONTRACT foreign key (F_RELATIVE_CONTRACT_ID)
      references "sxj-supervisor".T_CONTRACT (F_CONTRACT_ID);

alter table "sxj-supervisor".T_CONTRACT add constraint FK_R_REGISTER_CONTRACT foreign key (F_REGISTER_ID)
      references "sxj-supervisor".T_CONTRACT_REGISTER (F_REGISTER_ID);

alter table "sxj-supervisor".T_FUNCTION add constraint FK_R_SUBSYSTEM_FUNCTION foreign key (F_SUBSYSTEM_ID)
      references "sxj-supervisor".T_SUBSYSTEM (F_SUBSYSTEM_ID);

alter table "sxj-supervisor".T_SUPPLYCHAIN_DESCRIPTION add constraint FK_R_SCHAIN_SCHAIN foreign key (F_NEXT_SCHAIN_NODE)
      references "sxj-supervisor".T_SUPPLYCHAIN_DESCRIPTION (F_SCHAIN_NODE);

alter table "sxj-supervisor".T_SYSTEM_PARAM add constraint FK_R_PARAM_SUBSYSTEM foreign key (F_SUBSYSTEM_ID)
      references "sxj-supervisor".T_SUBSYSTEM (F_SUBSYSTEM_ID);

