-- IF EXISTS (SELECT name FROM sysindexes WHERE name = 'ACT_IDX_HI_PRO_INST_END') drop index ACT_HI_PROCINST.ACT_IDX_HI_PRO_INST_END;
-- IF EXISTS (SELECT name FROM sysindexes WHERE name = 'ACT_IDX_HI_PRO_I_BUSKEY') drop index ACT_HI_PROCINST.ACT_IDX_HI_PRO_I_BUSKEY;
-- IF EXISTS (SELECT name FROM sysindexes WHERE name = 'ACT_IDX_HI_ACT_INST_START') drop index ACT_HI_ACTINST.ACT_IDX_HI_ACT_INST_START;
-- IF EXISTS (SELECT name FROM sysindexes WHERE name = 'ACT_IDX_HI_ACT_INST_END') drop index ACT_HI_ACTINST.ACT_IDX_HI_ACT_INST_END;
-- IF EXISTS (SELECT name FROM sysindexes WHERE name = 'ACT_IDX_HI_DETAIL_PROC_INST') drop index ACT_HI_DETAIL.ACT_IDX_HI_DETAIL_PROC_INST;
-- IF EXISTS (SELECT name FROM sysindexes WHERE name = 'ACT_IDX_HI_DETAIL_ACT_INST') drop index ACT_HI_DETAIL.ACT_IDX_HI_DETAIL_ACT_INST;
-- IF EXISTS (SELECT name FROM sysindexes WHERE name = 'ACT_IDX_HI_DETAIL_TIME') drop index ACT_HI_DETAIL.ACT_IDX_HI_DETAIL_TIME;
-- IF EXISTS (SELECT name FROM sysindexes WHERE name = 'ACT_IDX_HI_DETAIL_NAME') drop index ACT_HI_DETAIL.ACT_IDX_HI_DETAIL_NAME;
-- IF EXISTS (SELECT name FROM sysindexes WHERE name = 'ACT_IDX_HI_DETAIL_TASK_ID') drop index ACT_HI_DETAIL.ACT_IDX_HI_DETAIL_TASK_ID;
-- IF EXISTS (SELECT name FROM sysindexes WHERE name = 'ACT_IDX_HI_PROCVAR_PROC_INST') drop index ACT_HI_VARINST.ACT_IDX_HI_PROCVAR_PROC_INST;
-- IF EXISTS (SELECT name FROM sysindexes WHERE name = 'ACT_IDX_HI_PROCVAR_NAME_TYPE') drop index ACT_HI_VARINST.ACT_IDX_HI_PROCVAR_NAME_TYPE;
-- IF EXISTS (SELECT name FROM sysindexes WHERE name = 'ACT_IDX_HI_ACT_INST_PROCINST') drop index ACT_HI_ACTINST.ACT_IDX_HI_ACT_INST_PROCINST;
-- IF EXISTS (SELECT name FROM sysindexes WHERE name = 'ACT_IDX_HI_IDENT_LNK_USER') drop index ACT_HI_IDENTITYLINK.ACT_IDX_HI_IDENT_LNK_USER;
-- IF EXISTS (SELECT name FROM sysindexes WHERE name = 'ACT_IDX_HI_IDENT_LNK_TASK') drop index ACT_HI_IDENTITYLINK.ACT_IDX_HI_IDENT_LNK_TASK;
-- IF EXISTS (SELECT name FROM sysindexes WHERE name = 'ACT_IDX_HI_IDENT_LNK_PROCINST') drop index ACT_HI_IDENTITYLINK.ACT_IDX_HI_IDENT_LNK_PROCINST;
--
-- if exists (select TABLE_NAME from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'ACT_HI_PROCINST') drop table ACT_HI_PROCINST;
-- if exists (select TABLE_NAME from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'ACT_HI_ACTINST') drop table ACT_HI_ACTINST;
-- if exists (select TABLE_NAME from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'ACT_HI_VARINST') drop table ACT_HI_VARINST;
-- if exists (select TABLE_NAME from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'ACT_HI_TASKINST') drop table ACT_HI_TASKINST;
-- if exists (select TABLE_NAME from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'ACT_HI_DETAIL') drop table ACT_HI_DETAIL;
-- if exists (select TABLE_NAME from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'ACT_HI_COMMENT') drop table ACT_HI_COMMENT;
-- if exists (select TABLE_NAME from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'ACT_HI_ATTACHMENT') drop table ACT_HI_ATTACHMENT;
-- if exists (select TABLE_NAME from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'ACT_HI_IDENTITYLINK') drop table ACT_HI_IDENTITYLINK;

select * from sysconstraints where tabid = (select tabid from systables where tabname = 'act_hi_procinst');
select * from sysconstraints where tabid = (select tabid from systables where tabname = 'act_hi_detail');
select * from sysconstraints where tabid = (select tabid from systables where tabname = 'act_hi_varinst');
select * from sysconstraints where tabid = (select tabid from systables where tabname = 'act_hi_actinst');
select * from sysconstraints where tabid = (select tabid from systables where tabname = 'act_hi_identitylink');

drop table if EXISTS  ACT_HI_PROCINST;
drop table if EXISTS  ACT_HI_ACTINST;
drop table if EXISTS  ACT_HI_VARINST;
drop table if EXISTS  ACT_HI_TASKINST;
drop table if EXISTS  ACT_HI_DETAIL;
drop table if EXISTS  ACT_HI_COMMENT;
drop table if EXISTS  ACT_HI_ATTACHMENT;
drop table if EXISTS  ACT_HI_IDENTITYLINK;
