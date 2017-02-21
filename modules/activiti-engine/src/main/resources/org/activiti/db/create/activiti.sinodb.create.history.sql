create table ACT_HI_PROCINST (
    ID_ VARCHAR(64) not null,
    PROC_INST_ID_ VARCHAR(64) not null,
    BUSINESS_KEY_ VARCHAR(255),
    PROC_DEF_ID_ VARCHAR(64) not null,
    START_TIME_ datetime year to fraction(5) not null,
    END_TIME_ datetime year to fraction(5),
    DURATION_ DECIMAL(19,0),
    START_USER_ID_ VARCHAR(255),
    START_ACT_ID_ VARCHAR(255),
    END_ACT_ID_ VARCHAR(255),
    SUPER_PROCESS_INSTANCE_ID_ VARCHAR(64),
    DELETE_REASON_ LVARCHAR(2000),
    primary key (ID_),
    unique (PROC_INST_ID_)
) ;


create table ACT_HI_ACTINST (
    ID_ VARCHAR(64) not null,
    PROC_DEF_ID_ VARCHAR(64) not null,
    PROC_INST_ID_ VARCHAR(64) not null,
    EXECUTION_ID_ VARCHAR(64) not null,
    ACT_ID_ VARCHAR(255) not null,
    TASK_ID_ VARCHAR(64),
    CALL_PROC_INST_ID_ VARCHAR(64),
    ACT_NAME_ VARCHAR(255),
    ACT_TYPE_ VARCHAR(255) not null,
    ASSIGNEE_ VARCHAR(64),
    START_TIME_ datetime year to fraction(5) not null,
    END_TIME_ datetime year to fraction(5),
    DURATION_ DECIMAL(19,0),
    primary key (ID_)
) ;


create table ACT_HI_TASKINST (
    ID_ VARCHAR(64) not null,
    PROC_DEF_ID_ VARCHAR(64),
    TASK_DEF_KEY_ VARCHAR(255),
    PROC_INST_ID_ VARCHAR(64),
    EXECUTION_ID_ VARCHAR(64),
    PARENT_TASK_ID_ VARCHAR(64),
    NAME_ VARCHAR(255),
    DESCRIPTION_ LVARCHAR(2000),
    OWNER_ VARCHAR(255),
    ASSIGNEE_ VARCHAR(255),
    START_TIME_ datetime year to fraction(5) not null,
    CLAIM_TIME_ datetime year to fraction(5),
    END_TIME_ datetime year to fraction(5),
    DURATION_ DECIMAL(19,0),
    DELETE_REASON_ LVARCHAR(2000),
    PRIORITY_ INTEGER,
    DUE_DATE_ datetime year to fraction(5),
    FORM_KEY_ VARCHAR(255),
    primary key (ID_)
) ;


create table ACT_HI_VARINST (
    ID_ VARCHAR(64) not null,
    PROC_INST_ID_ VARCHAR(64),
    EXECUTION_ID_ VARCHAR(64),
    TASK_ID_ VARCHAR(64),
    NAME_ VARCHAR(255) not null,
    VAR_TYPE_ VARCHAR(100),
    REV_ INTEGER,
    BYTEARRAY_ID_ VARCHAR(64),
    DOUBLE_ DECIMAL(29,10),
    LONG_ DECIMAL(19,0),
    TEXT_ LVARCHAR(2000),
    TEXT2_ LVARCHAR(2000),
    primary key (ID_)
) ;


create table ACT_HI_DETAIL (
    ID_ VARCHAR(64) not null,
    TYPE_ VARCHAR(255) not null,
    PROC_INST_ID_ VARCHAR(64),
    EXECUTION_ID_ VARCHAR(64),
    TASK_ID_ VARCHAR(64),
    ACT_INST_ID_ VARCHAR(64),
    NAME_ VARCHAR(255) not null,
    VAR_TYPE_ VARCHAR(64),
    REV_ INTEGER,
    TIME_ datetime year to fraction(5) not null,
    BYTEARRAY_ID_ VARCHAR(64),
    DOUBLE_ DECIMAL(29,10),
    LONG_ DECIMAL(19,0),
    TEXT_ LVARCHAR(2000),
    TEXT2_ LVARCHAR(2000),
    primary key (ID_)
) ;


create table ACT_HI_COMMENT (
    ID_ VARCHAR(64) not null,
    TYPE_ VARCHAR(255),
    TIME_ datetime year to fraction(5) not null,
    USER_ID_ VARCHAR(255),
    TASK_ID_ VARCHAR(64),
    PROC_INST_ID_ VARCHAR(64),
    ACTION_ VARCHAR(255),
    MESSAGE_ LVARCHAR(2000),
    FULL_MSG_ BLOB,
    primary key (ID_)
) ;


create table ACT_HI_ATTACHMENT (
    ID_ VARCHAR(64) not null,
    REV_ INTEGER,
    USER_ID_ VARCHAR(255),
    NAME_ VARCHAR(255),
    DESCRIPTION_ LVARCHAR(2000),
    TYPE_ VARCHAR(255),
    TASK_ID_ VARCHAR(64),
    PROC_INST_ID_ VARCHAR(64),
    URL_ LVARCHAR(2000),
    CONTENT_ID_ VARCHAR(64),
    primary key (ID_)
) ;


create table ACT_HI_IDENTITYLINK (
    ID_ VARCHAR(64),
    GROUP_ID_ VARCHAR(255),
    TYPE_ VARCHAR(255),
    USER_ID_ VARCHAR(255),
    TASK_ID_ VARCHAR(64),
    PROC_INST_ID_ VARCHAR(64),
    primary key (ID_)
) ;


create index ACT_IDX_HI_PRO_INST_END on ACT_HI_PROCINST(END_TIME_) ;

create index ACT_IDX_HI_PRO_I_BUSKEY on ACT_HI_PROCINST(BUSINESS_KEY_) ;

create index ACT_IDX_HI_ACT_INST_START on ACT_HI_ACTINST(START_TIME_) ;

create index ACT_IDX_HI_ACT_INST_END on ACT_HI_ACTINST(END_TIME_) ;

create index ACT_IDX_HI_DETAIL_PROC_INST on ACT_HI_DETAIL(PROC_INST_ID_) ;

create index ACT_IDX_HI_DETAIL_ACT_INST on ACT_HI_DETAIL(ACT_INST_ID_) ;

create index ACT_IDX_HI_DETAIL_TIME on ACT_HI_DETAIL(TIME_) ;

create index ACT_IDX_HI_DETAIL_NAME on ACT_HI_DETAIL(NAME_) ;

create index ACT_IDX_HI_DETAIL_TASK_ID on ACT_HI_DETAIL(TASK_ID_) ;

create index ACT_IDX_HI_PROCVAR_PROC_INST on ACT_HI_VARINST(PROC_INST_ID_) ;

create index ACT_IDX_HI_PROCVAR_NAME_TYPE on ACT_HI_VARINST(NAME_, VAR_TYPE_) ;

create index ACT_IDX_HI_IDENT_LNK_USER on ACT_HI_IDENTITYLINK(USER_ID_) ;

create index ACT_IDX_HI_IDENT_LNK_TASK on ACT_HI_IDENTITYLINK(TASK_ID_) ;

create index ACT_IDX_HI_IDENT_LNK_PROCINST on ACT_HI_IDENTITYLINK(PROC_INST_ID_) ;


-- see http://stackoverflow.com/questions/675398/how-can-i-constrain-multiple-columns-to-prevent-duplicates-but-ignore-null-value ;
 
-- create unique index ACT_UNIQ_HI_BUS_KEY on ACT_HI_PROCINST
--    (case when BUSINESS_KEY_ is null then null else PROC_DEF_ID_ end,
--     case when BUSINESS_KEY_ is null then null else BUSINESS_KEY_ end) ;

CREATE PROCEDURE IF NOT EXISTS PROC_DEF_ID_IDX(procDefId VARCHAR(64), id VARCHAR (64))
  returning VARCHAR (64) WITH (NOT VARIANT);
  define ret VARCHAR (64);
  if procDefId is NULL
  THEN
    let ret = id;
  ELSE
    let ret = procDefId;
  END IF
  return ret;
END PROCEDURE ;
CREATE PROCEDURE IF NOT EXISTS BUSINESS_KEY_IDX(businessKey VARCHAR(255), id VARCHAR(64))
  returning VARCHAR (255) WITH (NOT VARIANT);
  define ret VARCHAR (255);
  if businessKey is NULL
  THEN
    let ret = id;
  ELSE
    let ret = businessKey;
  END IF
  return ret;
END PROCEDURE ;
CREATE UNIQUE index ACT_UNIQ_HI_BUS_KEY ON ACT_HI_PROCINST
  (PROC_DEF_ID_IDX(PROC_DEF_ID_, ID_), BUSINESS_KEY_IDX(BUSINESS_KEY_, ID_));
-- alter table ACT_HI_PROCINST 
--    add constraint unique(PROC_DEF_ID_, BUSINESS_KEY_)  
      
--    constraint  ACT_UNIQ_HI_BUS_KEY ;



create index ACT_IDX_HI_ACT_INST_PROCINST on ACT_HI_ACTINST(PROC_INST_ID_, ACT_ID_) ;

create index ACT_IDX_HI_ACT_INST_EXEC on ACT_HI_ACTINST(EXECUTION_ID_, ACT_ID_) ;

 -- ;
