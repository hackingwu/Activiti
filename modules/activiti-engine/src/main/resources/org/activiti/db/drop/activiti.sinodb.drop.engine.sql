drop index ACT_IDX_EXEC_BUSKEY on ACT_RU_EXECUTION;
drop index ACT_IDX_TASK_CREATE on ACT_RU_TASK;
drop index ACT_IDX_IDENT_LNK_USER on ACT_RU_IDENTITYLINK;
drop index ACT_IDX_IDENT_LNK_GROUP on ACT_RU_IDENTITYLINK;
drop index ACT_IDX_VARIABLE_TASK_ID on ACT_RU_VARIABLE;

select * from sysconstraints where tabid = (select tabid from systables where tabname = 'act_get_bytearray');
select * from sysconstraints where tabid = (select tabid from systables where tabname = 'act_ru_execution');
select * from sysconstraints where tabid = (select tabid from systables where tabname = 'act_ru_identitylink');
select * from sysconstraints where tabid = (select tabid from systables where tabname = 'act_ru_task');
select * from sysconstraints where tabid = (select tabid from systables where tabname = 'act_ru_variable');
select * from sysconstraints where tabid = (select tabid from systables where tabname = 'act_ru_job');
select * from sysconstraints where tabid = (select tabid from systables where tabname = 'act_ru_event_subscr');
select * from sysconstraints where tabid = (select tabid from systables where tabname = 'act_re_model');


drop index ACT_IDX_ATHRZ_PROCEDEF on ACT_RU_IDENTITYLINK;
drop index ACT_IDX_EVENT_SUBSCR_CONFIG_ on ACT_RU_EVENT_SUBSCR;
    
drop table if exists ACT_GE_PROPERTY;
drop table if exists ACT_RU_VARIABLE;
drop table if exists ACT_GE_BYTEARRAY;
drop table if exists ACT_RE_DEPLOYMENT;
drop table if exists ACT_RE_MODEL;
drop table if exists ACT_RU_IDENTITYLINK;
drop table if exists ACT_RU_TASK;
drop table if exists ACT_RE_PROCDEF;
drop table if exists ACT_RU_EXECUTION;
drop table if exists ACT_RU_JOB; 
drop table if exists ACT_RU_EVENT_SUBSCR;