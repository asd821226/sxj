/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2014/11/17 14:15:40                          */
/*==============================================================*/


drop table if exists IDENTITIES;

drop table if exists M_CONTRACT;

drop table if exists M_CONTRACT_BATCH;

drop table if exists M_CONTRACT_ITEM;

drop table if exists M_CONTRACT_MODIFY;

drop table if exists M_CONTRACT_MODIFY_BATCH;

drop table if exists M_CONTRACT_MODIFY_ITEM;

drop table if exists M_CONTRACT_PAY;

drop table if exists M_CONTRACT_RECORD;

drop table if exists M_CONTRACT_REPLENISH;

drop table if exists M_CONTRACT_REPLENISH_BATCH;

drop table if exists M_MEMBER;

drop table if exists M_MEMBER_ACCOUNT;

drop table if exists M_MEMBER_FUNCTION;

drop table if exists M_MEMBER_LOG;

drop table if exists M_MEMBER_ROLE;

drop table if exists M_ROLE_ACCOUNT;

drop table if exists M_SYS_ACCOUNT;

drop table if exists M_SYS_AREA;

drop table if exists M_SYS_FUNCTION;

drop table if exists M_SYS_LOG;

drop table if exists M_SYS_ROLE;

drop table if exists R_FACTORY_REGISTER;

drop table if exists R_FACTORY_SCHAIN;

drop table if exists R_FUNCTION_ROLE;

drop table if exists R_GLOBAL_KEY;

drop table if exists R_LOGISTICE_REF;

drop table if exists R_LOGISTICS_RFID;

drop table if exists R_RFID_APPLICATION;

drop table if exists R_RFID_PRICE;

drop table if exists R_RFID_PURCHASE;

drop table if exists R_RFID_SALE;

drop table if exists R_RFID_SUPPLIER;

drop table if exists R_ROLE_USER;

drop table if exists R_WINDOW_REF;

drop table if exists R_WINDOW_RFID;

drop table if exists SHARD;

drop table if exists SHARD2;

drop table if exists TEST_FUNCTION;

drop table if exists TEST_RFID_NUMBER;

drop table if exists TEST_R_GLOBAL_KEY;

drop table if exists T_ADMIN;

drop table if exists T_ADMIN_ROLE;

drop table if exists T_CONTRACT;

drop table if exists T_CONTRACT_REGISTER;

drop table if exists T_FACTORY;

drop table if exists T_FUNCTION;

drop table if exists T_SN;

drop table if exists T_SUBSYSTEM;

drop table if exists T_SUPPLYCHAIN_DESCRIPTION;

drop table if exists T_SYSTEM_PARAM;

/*==============================================================*/
/* User: "sxj-supervisor"                                       */
/*==============================================================*/
create user "sxj-supervisor";

/*==============================================================*/
/* Table: IDENTITIES                                            */
/*==============================================================*/
create table IDENTITIES
(
   IDENTITIES_ID        bigint(20),
   IDENTITIES_DELIMITER  varchar(45) not null,
   primary key (IDENTITIES_DELIMITER)
);

/*==============================================================*/
/* Table: M_CONTRACT                                            */
/*==============================================================*/
create table M_CONTRACT
(
   ID                    varchar(32) not null comment '����ID',
   CONTRACT_NO           varchar(50) comment '��ͬ��',
   ADDRESS               varchar(255) comment 'ǩ����ַ',
   MEMBER_ID_A           varchar(32) comment '�׷�',
   MEMBER_ID_B           varchar(32) comment '�ҷ�',
   ENG_NAME              varchar(50) comment '��������',
   ENG_ADDRESS           varchar(255) comment '���̵�ַ',
   RECORD_NO             varchar(50) comment '��ͬ������',
   SIGNED_DATE          datetime comment 'ǩ������',
   VALIDITY_DATE        datetime comment '��ͬ����',
   START_DATE           datetime comment '��Ч����',
   CREATE_DATE          datetime comment '����ʱ��',
   RECORD_DATE          datetime comment '����ʱ��',
   DEPOSIT              double(20,3) comment '��ͬ����',
   REMARKS               varchar(255) comment '��ע',
   DELIVERY_ADDRESS      varchar(255) comment '������ַ',
   STATE                int(10) comment '״̬',
   TYPE                 int(10) comment '��ͬ����',
   REF_CONTRACT_NO       varchar(50) comment '������ͬ��',
   MEMBER_NAME_A         varchar(50) comment '�׷�����',
   MEMBER_NAME_B         varchar(50) comment '�ҷ�����',
   STATE_LOG             varchar(255) comment '��ͬ״̬�����¼(JOSN)',
   BATCH_COUNT           varchar(255) comment '������',
   NOW_RECORD_NO        int(11) comment '��ǰ���±�����',
   IMG_PATH              longtext comment 'ɨ���·��',
   ITEM_QUANTITY        double(20,0),
   USE_QUANTITY         double(20,0),
   CONFIRM_STATE        int(11) comment 'ȷ��״̬״̬',
   DELETE_STATE         int(255) comment 'ɾ��״̬',
   primary key (ID)
);

/*==============================================================*/
/* Table: M_CONTRACT_BATCH                                      */
/*==============================================================*/
create table M_CONTRACT_BATCH
(
   ID                    varchar(32) not null comment '����',
   CONTRACT_ID           varchar(32) comment '��ͬ���',
   RFID_NO               varchar(50) comment 'RFID��',
   AMOUNT               double(255,3) comment '���',
   BATCH_ITEMS           varchar(255) comment '������ĿJSON',
   BATCH_NO             int(11) comment '���κ�',
   UPDATE_STATE         int(11) default 0 comment '��ʶ״̬',
   REPLENISH_STATE      int(11) default 0
);

/*==============================================================*/
/* Table: M_CONTRACT_ITEM                                       */
/*==============================================================*/
create table M_CONTRACT_ITEM
(
   ID                    varchar(32) not null comment '����',
   CONTRACT_ID           varchar(32) comment '��ͬID',
   PRODUCT_NAME          varchar(100) comment '��Ʒ����',
   PRODUCT_MODEL         varchar(50) comment '����ͺ�',
   QUANTITY             float(255,0) comment '����',
   PRICE                double(255,3) comment '����',
   AMOUNT               double(255,3) comment '���',
   REMARKS               varchar(255) comment '��ע',
   UPDATE_STATE         int(11) default 0 comment '���״̬',
   WINDOW_TYPE          int(11) comment '�Ŵ�����'
);

/*==============================================================*/
/* Table: M_CONTRACT_MODIFY                                     */
/*==============================================================*/
create table M_CONTRACT_MODIFY
(
   ID                    varchar(32) not null comment '����',
   CONTRACT_ID           varchar(32) comment '��ͬID',
   RECORD_NO             varchar(32) comment '������',
   IMG_PATH              longtext comment 'ɨ���',
   primary key (ID)
);

/*==============================================================*/
/* Table: M_CONTRACT_MODIFY_BATCH                               */
/*==============================================================*/
create table M_CONTRACT_MODIFY_BATCH
(
   ID                    varchar(32) not null comment '����',
   MODIFY_ID             varchar(32) comment '���ID',
   RFID_NO               varchar(50) comment 'RFID��',
   AMOUNT               double(255,3) comment '���',
   BATCH_ITEMS           varchar(255) comment '������ĿJSON',
   RECORD_NO             varchar(50),
   BATCH_NO             int(11) comment '���κ�',
   UPDATE_STATE         int(11) default 0 comment '��ʶ״̬',
   REPLENISH_STATE      int(11) default 0
);

/*==============================================================*/
/* Table: M_CONTRACT_MODIFY_ITEM                                */
/*==============================================================*/
create table M_CONTRACT_MODIFY_ITEM
(
   ID                    varchar(32) not null comment '����',
   MODIFY_ID             varchar(32) comment '�����¼ID',
   PRODUCT_NAME          varchar(100) comment '��Ʒ����',
   PRODUCT_MODEL         varchar(50) comment '����ͺ�',
   QUANTITY             float(255,0) comment '����',
   PRICE                double(255,3) comment '����',
   AMOUNT               double(255,3) comment '���',
   REMARKS               varchar(255) comment '��ע',
   UPDATE_STATE         int(11) default 0 comment '��ʶ״̬',
   primary key (ID)
);

/*==============================================================*/
/* Table: M_CONTRACT_PAY                                        */
/*==============================================================*/
create table M_CONTRACT_PAY
(
   ID                    varchar(32) not null comment '����',
   MEMBER_NO_A           varchar(32) comment '�׷���ԱID',
   MEMBER_NO_B           varchar(32) comment '�ҷ���ԱID',
   PAY_NO                varchar(32) comment '֧������',
   CONTRACT_No           varchar(32) comment '��ͬ��',
   BATCH_NO              varchar(32) comment '���κ�',
   RFID_NO               varchar(32) comment 'RFID���',
   PAY_AMOUNT           bigint(255) comment '֧�����',
   PAY_REAL             bigint(255) comment 'ʵ��֧�����',
   PAY_DATE             date comment '֧������',
   CONTENT               varchar(50) comment '֧������',
   STATE                int(11) comment '״̬',
   primary key (ID)
);

/*==============================================================*/
/* Table: M_CONTRACT_RECORD                                     */
/*==============================================================*/
create table M_CONTRACT_RECORD
(
   ID                    varchar(32) not null comment '����ID',
   RECORD_NO             varchar(32) comment '������',
   APPLY_ID              varchar(32) comment '�����ԱID',
   APPLY_NAME            varchar(255) comment '�����Ա����',
   MEMBER_ID_A           varchar(32) comment '�׷���ԱID',
   MEMBER_NAME_A         varchar(255) comment '�׷���Ա����',
   MEMBER_ID_B           varchar(32) comment '�ҷ���ԱID',
   MEMBER_NAME_B         varchar(255) comment '�ҷ���Ա����',
   TYPE                 int(10) comment '��������',
   IMG_PATH              longtext comment '����ɨ���',
   STATE                int(10) comment '����״̬',
   CONTRACT_TYPE        int(10) comment '��ͬ����',
   CONTRACT_NO           varchar(32) comment '�󶨺�ͬ��',
   REF_CONTRACT_NO       varchar(32) comment '�����б��ͬ',
   APPLY_DATE           datetime comment '����ʱ��',
   ACCEPT_DATE          datetime comment '����ʱ��',
   RECORD_FLAG          int(255) comment '���',
   DEL_STATE            tinyint(1) default 0 comment 'ɾ�����',
   CONFIRM_STATE        int(255) comment 'ǰ̨ʹ��ȷ��״̬',
   RFID_NO               varchar(255) comment '����RFID',
   RECORD_DATE          datetime,
   ACCEPT_STATE         int(11),
   RECORD_STATE         int(11) comment '���״̬(0:����������� 1:�����ɱ��� 2:��ɱ���)',
   primary key (ID)
);

/*==============================================================*/
/* Table: M_CONTRACT_REPLENISH                                  */
/*==============================================================*/
create table M_CONTRACT_REPLENISH
(
   ID                    varchar(32) not null comment '����',
   CONTRACT_ID           varchar(32) comment '��ͬID',
   RECORD_NO             varchar(50) comment '������',
   BATCH_RFID_NO         varchar(50) comment '��������RFID',
   RFID_ORDER_NO         varchar(50) comment 'RFID������',
   IMG_PATH              varchar(255) comment 'ɨ���·��',
   primary key (ID)
);

/*==============================================================*/
/* Table: M_CONTRACT_REPLENISH_BATCH                            */
/*==============================================================*/
create table M_CONTRACT_REPLENISH_BATCH
(
   ID                    varchar(32) not null comment '����',
   BATCH_NO              varchar(32) comment '���κ�',
   REPLENISH_ID          varchar(32) comment '���ID',
   RFID_NO               varchar(32) comment 'RFID��',
   AMOUNT               double(20,3) comment '���',
   BATCH_ITEMS           varchar(255) comment '������ĿJSON',
   NEW_RFID_NO           varchar(32) comment '��RFID��',
   REPLENISH_STATE      int(11) default 0,
   primary key (ID)
);

/*==============================================================*/
/* Table: M_MEMBER                                              */
/*==============================================================*/
create table M_MEMBER
(
   ID                    varchar(32) not null comment '��ʶ,����',
   MEMBER_NO             varchar(32) not null comment '��Ա��',
   NAME                  varchar(255) comment '��Ա����',
   B_LICENSE_NO          varchar(15) comment 'Ӫҵִ�պ�',
   TYPE                 int(11) comment '��Ա����',
   AREA                  varchar(100) comment '��������',
   CONTACTS              varchar(255) comment '��ϵ������',
   ENERGY_NO             varchar(15) comment '���ܱ�ʶ��',
   PHONE_NO              varchar(15) comment '��ϵ���ֻ�',
   ADDRESS               varchar(255) comment '��˾��ַ',
   TEL_NUM               varchar(15) comment '��ϵ�绰',
   REG_DATE             datetime comment 'ע������',
   AUTHOR_DATE          datetime comment '��֤����',
   STATE                int(11) comment '�˻�״̬',
   CHECK_STATE          int(11) comment '���״̬',
   TOTAL_AMOUNT         bigint(20) comment '�ܽ��׶�',
   ACCOUNT_NUM          int(11) comment '���˻���Ŀ',
   PASSWORD              varchar(255) comment '��Ա����',
   B_LICENSE_PATH        varchar(255) comment 'Ӫҵִ��ͼƬpath',
   ENERGY_PATH           varchar(255) comment '���ܱ�ʶͼƬpath',
   CODE                  varchar(32) comment '��������',
   FLAG                 tinyint(1) default 0 comment '�Ƿ����ƻ�Ա���ϱ��',
   DEVICE_NUMBER         varchar(255) comment 'ɨ���豸��',
   VERSION_LOCK         int(11) default 0,
   primary key (ID)
);

/*==============================================================*/
/* Table: M_MEMBER_ACCOUNT                                      */
/*==============================================================*/
create table M_MEMBER_ACCOUNT
(
   ID                    varchar(32) not null comment '������ʶ',
   ACCOUNT_NO            varchar(50) not null comment '���˻�ID',
   PASSWORD              varchar(255) comment '���˻�����',
   PARENT_ID             varchar(32) not null comment '������ԱID',
   ACCOUNT_NAME          varchar(50) not null comment '���˻�����',
   NAME                  varchar(50) not null comment '����',
   STATE                int(10) not null comment '���˻�״̬',
   REG_DATE             datetime not null comment 'ע������',
   DEL_STATE            tinyint(1) not null default 0 comment '�߼�ɾ�����',
   LAST_LOGIN           datetime,
   VERSION_LOCK         int(11) default 0,
   primary key (ID),
   key UN_ACCOUNT_NAME (ACCOUNT_NAME, PARENT_ID)
);

/*==============================================================*/
/* Table: M_MEMBER_FUNCTION                                     */
/*==============================================================*/
create table M_MEMBER_FUNCTION
(
   ID                    varchar(32) not null comment '������ʶ',
   TITLE                 varchar(50) not null comment '��������',
   URL                   varchar(512) comment '��������URL',
   PARENT_ID             varchar(32) comment '��ϵͳ����ID',
   LEVEL                int(10) comment '����',
   "DESC"               int(11),
   STYLE                 varchar(50) comment '��ʽ',
   FLAG                 int(1),
   primary key (ID)
);

/*==============================================================*/
/* Table: M_MEMBER_LOG                                          */
/*==============================================================*/
create table M_MEMBER_LOG
(
   ID                    varchar(32) not null,
   MEMBER_NO             varchar(32),
   MEMBER_NAME           varchar(200),
   NOW_PAGE              varchar(255),
   PRE_PAGE              varchar(255),
   NEXT_PAGE             varchar(255),
   WAIT_TIME             varchar(20),
   CALL_TIME            datetime,
   IP                    varchar(15),
   primary key (ID)
);

/*==============================================================*/
/* Table: M_MEMBER_ROLE                                         */
/*==============================================================*/
create table M_MEMBER_ROLE
(
   ID                    varchar(32) not null comment '������ʶ',
   FUNCTION_ID           varchar(32) not null comment 'ϵͳ����ID',
   ACCOUNT_ID            varchar(32) not null comment '�˻�ID',
   MEMBER_ID             varchar(32) comment '��ԱID',
   primary key (ID)
);

/*==============================================================*/
/* Table: M_ROLE_ACCOUNT                                        */
/*==============================================================*/
create table M_ROLE_ACCOUNT
(
   ID                    varchar(32) not null,
   FUNCTION_ID           varchar(32) not null,
   ACCOUNT_ID            varchar(32) not null,
   primary key (ID)
);

/*==============================================================*/
/* Table: M_SYS_ACCOUNT                                         */
/*==============================================================*/
create table M_SYS_ACCOUNT
(
   ID                    varchar(32) not null,
   NAME                  varchar(50) not null,
   ACCOUNT               varchar(50) not null,
   PASSWORD              varchar(50),
   ACCOUNT_NO            varchar(32),
   DEL_STATE            tinyint(1),
   LAST_LOGIN           datetime,
   primary key (ID),
   key UN_ACCOUNT (ACCOUNT)
);

/*==============================================================*/
/* Table: M_SYS_AREA                                            */
/*==============================================================*/
create table M_SYS_AREA
(
   ID                    varchar(32) not null comment '������ʶ',
   NAME                  varchar(50) comment '��������',
   PARENT_ID             varchar(32) comment '��ID',
   LEVEL                int(1) comment '����',
   primary key (ID)
);

/*==============================================================*/
/* Table: M_SYS_FUNCTION                                        */
/*==============================================================*/
create table M_SYS_FUNCTION
(
   ID                    varchar(32) not null comment '������ʶ',
   TITLE                 varchar(50) not null comment '��������',
   URL                   varchar(512) comment '��������URL',
   PARENT_ID             varchar(32) comment '��ϵͳ����ID',
   LEVEL                int(10) comment '����',
   "DESC"               int(11),
   primary key (ID)
);

/*==============================================================*/
/* Table: M_SYS_LOG                                             */
/*==============================================================*/
create table M_SYS_LOG
(
   ID                    varchar(32) not null comment '����',
   ACCOUNT_NO            varchar(32) comment '����T�~̖',
   OPER_TIME            datetime comment '�����r�g',
   LOGS                  varchar(500) comment '��������',
   primary key (ID)
);

/*==============================================================*/
/* Table: M_SYS_ROLE                                            */
/*==============================================================*/
create table M_SYS_ROLE
(
   ID                    varchar(32) not null comment '������ʶ',
   FUNCTION_ID           varchar(32) not null comment 'ϵͳ����ID',
   ACCOUNT_ID            varchar(32) not null comment '�˻�ID',
   primary key (ID)
);

/*==============================================================*/
/* Table: R_FACTORY_REGISTER                                    */
/*==============================================================*/
create table R_FACTORY_REGISTER
(
   F_FACTORY_ID          varchar(32) not null,
   F_REGISTER_ID         varchar(32) not null,
   primary key (F_FACTORY_ID, F_REGISTER_ID)
);

/*==============================================================*/
/* Table: R_FACTORY_SCHAIN                                      */
/*==============================================================*/
create table R_FACTORY_SCHAIN
(
   F_FACTORY_ID          varchar(32) not null,
   F_SCHAIN_NODE         varchar(32) not null,
   primary key (F_FACTORY_ID, F_SCHAIN_NODE)
);

/*==============================================================*/
/* Table: R_FUNCTION_ROLE                                       */
/*==============================================================*/
create table R_FUNCTION_ROLE
(
   F_ROLE_ID             varchar(32) not null,
   F_FUNC_ID             varchar(32) not null,
   primary key (F_ROLE_ID, F_FUNC_ID)
);

/*==============================================================*/
/* Table: R_GLOBAL_KEY                                          */
/*==============================================================*/
create table R_GLOBAL_KEY
(
   ID                   bigint(20) not null auto_increment,
   NAME                  varchar(45),
   primary key (ID),
   key NAME_UNIQUE (NAME)
);

/*==============================================================*/
/* Table: R_LOGISTICE_REF                                       */
/*==============================================================*/
create table R_LOGISTICE_REF
(
   ID                    varchar(32) not null comment '����',
   RFID_REF_NO           varchar(15) not null comment 'RFID���������',
   RFID_NO               varchar(15) comment 'RFID���',
   MEMBER_NO             varchar(15) comment '������',
   MEMBER_NAME           varchar(100) comment '����������',
   RFID_TYPE            int(1) comment 'RFID����',
   STATE                int(1) comment '���״̬',
   TYPE                 int(1) comment '��������',
   BATCH_NO              varchar(15) comment '����',
   APPLY_DATE           datetime comment '��������ʱ��',
   REPLENISH_RFID        varchar(15) comment '������RFID',
   CONTRACT_NO           varchar(15) comment '�ɹ���ͬ��',
   DEL_STATE            tinyint(1) default 0 comment '�߼�ɾ�����',
   primary key (ID)
);

/*==============================================================*/
/* Table: R_LOGISTICS_RFID                                      */
/*==============================================================*/
create table R_LOGISTICS_RFID
(
   ID                    varchar(32) not null comment '����',
   RFID_NO               varchar(15) not null comment 'RFID���',
   APPLY_NO              varchar(15),
   PURCHASE_NO           varchar(15) comment '�ɹ�����',
   GENERATE_KEY         bigint(255),
   TYPE                 int(1) comment 'RFID����',
   MEMBER_NO             varchar(15) comment '�����Ա��',
   MEMBER_NAME           varchar(100) comment '�����Ա����',
   CONTRACT_NO           varchar(15) comment '�ɹ���ͬ��',
   BATCH_NO              varchar(15) comment 'ִ�����κ�',
   IMPORT_DATE          datetime comment '��������',
   REPLENISH_NO          varchar(15) comment '��������',
   RFID_STATE           int(1) comment 'RFID״̬',
   LOG                   varchar(255) comment 'ִ����־',
   PROGRESS_STATE       int(11),
   primary key (ID),
   key UN_RFID_NO (RFID_NO)
);

/*==============================================================*/
/* Table: R_RFID_APPLICATION                                    */
/*==============================================================*/
create table R_RFID_APPLICATION
(
   ID                    varchar(32) not null comment '����',
   APPLY_NO              varchar(15) not null comment 'RFID���뵥���',
   MEMBER_NO             varchar(15) comment '�����ԱID',
   MEMBER_NAME           varchar(100) comment '�����Ա����',
   RFID_TYPE            int(1) comment 'RFID����',
   CONTRACT_NO           varchar(15) comment '�б��ͬ��',
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
create table R_RFID_PRICE
(
   ID                    varchar(32) not null comment '����',
   LOGISTICS_PRICE      double(11,2) comment '��������RFID�۸�',
   WINDOW_PRICE         double(11,2) comment '�Ŵ�RFID�۸�',
   primary key (ID)
);

/*==============================================================*/
/* Table: R_RFID_PURCHASE                                       */
/*==============================================================*/
create table R_RFID_PURCHASE
(
   ID                    varchar(32) not null comment '����',
   PURCHASE_NO           varchar(15) not null comment '�ɹ������',
   SUPPLIER_NO           varchar(15) comment '��Ӧ�̱��',
   SUPPLIER_NAME         varchar(100) comment '��Ӧ������',
   RFID_TYPE            int(1) comment 'RFID����',
   COUNT                int(11) comment '����',
   PRICE                double(11,2) comment '����',
   AMOUNT               double(11,2) comment '���',
   PURCHASE_DATE        datetime comment '�ɹ�����',
   CONTRACT_NO           varchar(15) comment '�б��ͬ��',
   APPLY_NO              varchar(15) comment '���뵥���',
   IMPORT_STATE         int(1) comment '����״̬',
   PAY_STATE            int(1) comment '֧��״̬',
   RECEIPT_STATE        int(1) comment '����״̬',
   DEL_STATE            int(11) comment 'ɾ��״̬',
   primary key (ID)
);

/*==============================================================*/
/* Table: R_RFID_SALE                                           */
/*==============================================================*/
create table R_RFID_SALE
(
   ID                    varchar(32) not null comment '����',
   APPLY_NO              varchar(15) comment '���뵥��',
   PURCHASE_NO           varchar(15) comment '�ɹ�����',
   COUNT                int(11) comment '��������',
   RFID_TYPE            int(1) comment 'RFID����',
   PRICE                double(11,2) comment '���ۼ۸�',
   SALE_DATE            datetime comment '��������',
   primary key (ID)
);

/*==============================================================*/
/* Table: R_RFID_SUPPLIER                                       */
/*==============================================================*/
create table R_RFID_SUPPLIER
(
   ID                    varchar(32) not null comment '����',
   SUPPLIER_NO           varchar(15) comment '��Ӧ��NO',
   NAME                  varchar(100) comment '��Ӧ������',
   ADDRESS               varchar(255) comment '��ַ',
   CONTRACT_NAME         varchar(255) comment '��ϵ������',
   CONTRACT_TEL          varchar(20) comment '��ϵ�绰',
   TEL_NUM               varchar(20) comment '�̶��绰',
   TEL_NAME              varchar(15) comment '�̶��绰',
   DOORS_PRICE          double(10,2) comment '�Ŵ���ǩ�ɹ���',
   BATCH_PRICE          double(10,2) comment '���α�ǩ�ɹ���',
   DEL_STATE            tinyint(1) default 0 comment '�߼�ɾ��',
   primary key (ID)
);

/*==============================================================*/
/* Table: R_ROLE_USER                                           */
/*==============================================================*/
create table R_ROLE_USER
(
   F_USER_ID             varchar(32) not null,
   F_ROLE_ID             varchar(32) not null,
   primary key (F_USER_ID, F_ROLE_ID)
);

/*==============================================================*/
/* Table: R_WINDOW_REF                                          */
/*==============================================================*/
create table R_WINDOW_REF
(
   ID                    varchar(32) not null comment '����',
   RFID_REF_NO           varchar(15) not null comment 'RFID���������',
   MIN_RFID_NO           varchar(20) comment 'RFID�������',
   MAX_RFID_NO           varchar(20),
   RFID_RANGE            varchar(100) comment 'RFID�������',
   MEMBER_NO             varchar(15) comment '������',
   MEMBER_NAME           varchar(100) comment '����������',
   TYPE                 int(1) comment '��������',
   WINDOWS_NO            varchar(15) comment '���ʹ���',
   GLASS_BATCH_NO        varchar(15) comment '��������',
   PROFILE_BATCH_NO      varchar(15) comment '�Ͳ�����',
   APPLY_DATE           datetime comment '��������ʱ��',
   REPLENISH_RFID        varchar(15) comment '������RFID',
   CONTRACT_NO           varchar(15) comment '��ͬ��',
   DEL_STATE            int(11) comment 'ɾ��״̬',
   STATE                int(11) comment '���״̬',
   primary key (ID)
);

/*==============================================================*/
/* Table: R_WINDOW_RFID                                         */
/*==============================================================*/
create table R_WINDOW_RFID
(
   ID                    varchar(32) not null comment '����',
   RFID_NO               varchar(15) comment 'RFID���',
   GENERATE_KEY         bigint(255),
   MEMBER_NAME           varchar(255),
   MEMBER_NO             varchar(50),
   APPLY_NO              varchar(15),
   PURCHASE_NO           varchar(15) comment '�ɹ�����',
   CONTRACT_NO           varchar(15) comment '�ɹ���ͬ��',
   WINDOW_TYPE          int(1) comment '���ʹ���',
   GLASS_RFID            varchar(15) comment '����RFID',
   PROFILE_RFID          varchar(15) comment '�Ͳ�RFID',
   IMPORT_DATE          datetime comment '��������',
   REPLENISH_NO          varchar(15) comment '��������',
   RFID_STATE           int(1) comment 'RFID״̬',
   LOG                   varchar(255) comment 'ִ����־',
   PROGRESS_STATE       int(1),
   primary key (ID),
   key UN_RFID_NO (RFID_NO)
);

/*==============================================================*/
/* Table: SHARD                                                 */
/*==============================================================*/
create table SHARD
(
   SHARD_ID             int(11) not null,
   SHARD_NAME            varchar(45),
   primary key (SHARD_ID)
);

/*==============================================================*/
/* Table: SHARD2                                                */
/*==============================================================*/
create table SHARD2
(
   SHARD2_ID             varchar(128) not null,
   SHARD2_NAME           varchar(45),
   primary key (SHARD2_ID)
);

/*==============================================================*/
/* Table: TEST_FUNCTION                                         */
/*==============================================================*/
create table TEST_FUNCTION
(
   ID                    varchar(32) not null,
   TITLE                 varchar(45) not null,
   primary key (ID)
);

/*==============================================================*/
/* Table: TEST_RFID_NUMBER                                      */
/*==============================================================*/
create table TEST_RFID_NUMBER
(
   NUMBER_ID            int(11) not null auto_increment,
   NUMBER_START         bigint(20),
   NUMBER_END           bigint(20),
   FOREIGN_KEY           varchar(45),
   primary key (NUMBER_ID)
);

/*==============================================================*/
/* Table: TEST_R_GLOBAL_KEY                                     */
/*==============================================================*/
create table TEST_R_GLOBAL_KEY
(
   ID                   int(11) not null,
   NAME                  varchar(45),
   primary key (ID),
   key NAME_UNIQUE (NAME)
);

/*==============================================================*/
/* Table: T_ADMIN                                               */
/*==============================================================*/
create table T_ADMIN
(
   F_USER_ID             varchar(32) not null,
   primary key (F_USER_ID)
);

/*==============================================================*/
/* Table: T_ADMIN_ROLE                                          */
/*==============================================================*/
create table T_ADMIN_ROLE
(
   F_ROLE_ID             varchar(32) not null,
   primary key (F_ROLE_ID)
);

/*==============================================================*/
/* Table: T_CONTRACT                                            */
/*==============================================================*/
create table T_CONTRACT
(
   F_CONTRACT_ID         varchar(32) not null,
   F_RELATIVE_CONTRACT_ID  varchar(32),
   F_REGISTER_ID         varchar(32),
   F_CONTRACT_NO         varchar(32),
   primary key (F_CONTRACT_ID)
);

/*==============================================================*/
/* Table: T_CONTRACT_REGISTER                                   */
/*==============================================================*/
create table T_CONTRACT_REGISTER
(
   F_REGISTER_ID         varchar(32) not null,
   F_REGISTER_NO         varchar(32),
   primary key (F_REGISTER_ID)
);

/*==============================================================*/
/* Table: T_FACTORY                                             */
/*==============================================================*/
create table T_FACTORY
(
   F_FACTORY_ID          varchar(32) not null,
   F_FACTORY_NAME        varchar(512),
   primary key (F_FACTORY_ID)
);

/*==============================================================*/
/* Table: T_FUNCTION                                            */
/*==============================================================*/
create table T_FUNCTION
(
   F_FUNC_ID             varchar(32) not null,
   F_SUBSYSTEM_ID        varchar(32),
   F_FUNC_URL            varchar(512),
   F_DISPLAY_ORDER      int,
   primary key (F_FUNC_ID)
);

/*==============================================================*/
/* Table: T_SN                                                  */
/*==============================================================*/
create table T_SN
(
   F_SN_NUMBER          int(11),
   F_SN_NAME             varchar(128)
);

/*==============================================================*/
/* Table: T_SUBSYSTEM                                           */
/*==============================================================*/
create table T_SUBSYSTEM
(
   F_SUBSYSTEM_ID        varchar(32) not null,
   F_SUBSYSTEM_NAME      varchar(128),
   F_SUBSYSTEM_STATUS   tinyint,
   F_FUNC_URL            varchar(512),
   primary key (F_SUBSYSTEM_ID)
);

/*==============================================================*/
/* Table: T_SUPPLYCHAIN_DESCRIPTION                             */
/*==============================================================*/
create table T_SUPPLYCHAIN_DESCRIPTION
(
   F_SCHAIN_NODE         varchar(32) not null,
   F_NEXT_SCHAIN_NODE    varchar(32),
   F_SCHAIN_NAME         varchar(128),
   primary key (F_SCHAIN_NODE)
);

/*==============================================================*/
/* Table: T_SYSTEM_PARAM                                        */
/*==============================================================*/
create table T_SYSTEM_PARAM
(
   F_PARAM_ID            varchar(32) not null,
   F_SUBSYSTEM_ID        varchar(32),
   F_PARAM_NAME          varchar(256),
   F_PARAM_VALUE         varchar(1024),
   F_PARAM_TYPE         tinyint comment '??JDBC  Types.java',
   primary key (F_PARAM_ID)
);

alter table R_FACTORY_REGISTER add constraint FK_R_FACTORY_REGISTER foreign key (F_FACTORY_ID)
      references T_FACTORY (F_FACTORY_ID);

alter table R_FACTORY_REGISTER add constraint FK_R_FACTORY_REGISTER2 foreign key (F_REGISTER_ID)
      references T_CONTRACT_REGISTER (F_REGISTER_ID);

alter table R_FACTORY_SCHAIN add constraint FK_R_FACTORY_SCHAIN foreign key (F_FACTORY_ID)
      references T_FACTORY (F_FACTORY_ID);

alter table R_FACTORY_SCHAIN add constraint FK_R_FACTORY_SCHAIN2 foreign key (F_SCHAIN_NODE)
      references T_SUPPLYCHAIN_DESCRIPTION (F_SCHAIN_NODE);

alter table R_FUNCTION_ROLE add constraint FK_R_FUNCTION_ROLE foreign key (F_ROLE_ID)
      references T_ADMIN_ROLE (F_ROLE_ID);

alter table R_FUNCTION_ROLE add constraint FK_R_FUNCTION_ROLE2 foreign key (F_FUNC_ID)
      references T_FUNCTION (F_FUNC_ID);

alter table R_ROLE_USER add constraint FK_R_ROLE_USER foreign key (F_USER_ID)
      references T_ADMIN (F_USER_ID);

alter table R_ROLE_USER add constraint FK_R_ROLE_USER2 foreign key (F_ROLE_ID)
      references T_ADMIN_ROLE (F_ROLE_ID);

alter table T_CONTRACT add constraint FK_R_CONTRACT_CONTRACT foreign key (F_RELATIVE_CONTRACT_ID)
      references T_CONTRACT (F_CONTRACT_ID);

alter table T_CONTRACT add constraint FK_R_REGISTER_CONTRACT foreign key (F_REGISTER_ID)
      references T_CONTRACT_REGISTER (F_REGISTER_ID);

alter table T_FUNCTION add constraint FK_R_SUBSYSTEM_FUNCTION foreign key (F_SUBSYSTEM_ID)
      references T_SUBSYSTEM (F_SUBSYSTEM_ID);

alter table T_SUPPLYCHAIN_DESCRIPTION add constraint FK_R_SCHAIN_SCHAIN foreign key (F_NEXT_SCHAIN_NODE)
      references T_SUPPLYCHAIN_DESCRIPTION (F_SCHAIN_NODE);

alter table T_SYSTEM_PARAM add constraint FK_R_PARAM_SUBSYSTEM foreign key (F_SUBSYSTEM_ID)
      references T_SUBSYSTEM (F_SUBSYSTEM_ID);

