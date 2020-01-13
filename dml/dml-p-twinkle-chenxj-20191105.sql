\c t_twinkle;
-- ==================================================================
-- *        Going to initialize the SysDictionary Records.          *
-- ==================================================================
TRUNCATE TABLE public.s_sysdictionary RESTART IDENTITY CASCADE;
-- Add GLOBAL.STATUS DIC.
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('GLOBAL', 'STATUS', '0', 'INITIAL', '初始化','1', '0');
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('GLOBAL', 'STATUS', '1', 'ENABLE', '已启用','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('GLOBAL', 'STATUS', '2', 'SUSPENDED', '已挂起','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('GLOBAL', 'STATUS', '3', 'CANCELLED', '已撤销','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('GLOBAL', 'STATUS', '4', 'DELETED', '已删除','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('GLOBAL', 'STATUS', '5', 'ARCHIVED', '已归档','1', '0'); 

-- Add GLOBAL.GENDER DIC.
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('GLOBAL', 'GENDER', '0', 'FEMALE', '女','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('GLOBAL', 'GENDER', '1', 'MALE', '男','1', '0'); 

-- Add GLOBAL.BIT_FLAG DIC.
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('GLOBAL', 'BIT_FLAG', '0', 'FALSE', '否','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('GLOBAL', 'BIT_FLAG', '1', 'TRUE', '是','1', '0'); 

-- Add GLOBAL.ENV_TYPE DIC.
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('GLOBAL', 'ENV_TYPE', '0', 'TEST', '测试环境','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('GLOBAL', 'ENV_TYPE', '1', 'UAT', 'UAT环境','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('GLOBAL', 'ENV_TYPE', '2', 'PREPRO', '灰度环境','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('GLOBAL', 'ENV_TYPE', '3', 'PRO', '生产环境','1', '0'); 

-- Add GLOBAL.LAUNCH_TYPE DIC.
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('GLOBAL', 'LAUNCH_TYPE', '0', 'LINUX SHELL', 'Linux Shell','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('GLOBAL', 'LAUNCH_TYPE', '1', 'WINDOWS BAT', 'Windows Bat','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('GLOBAL', 'LAUNCH_TYPE', '2', 'K8S RC YAML', 'K8s RC Yaml','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('GLOBAL', 'LAUNCH_TYPE', '3', 'K8S SERVICE YAML', 'K8s Service Yaml','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('GLOBAL', 'LAUNCH_TYPE', '4', 'DOCKR COMPOSE YAML', 'Docker Compose Yaml','1', '0'); 

-- Add GLOBAL.SQL_TYPE DIC.
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('GLOBAL', 'SQL_TYPE', '-7', 'BIT', 'BIT','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('GLOBAL', 'SQL_TYPE', '-6', 'TINYINT', 'TINYINT','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('GLOBAL', 'SQL_TYPE', '5', 'SMALLINT', 'SMALLINT','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('GLOBAL', 'SQL_TYPE', '4', 'INTEGER', 'INTEGER','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('GLOBAL', 'SQL_TYPE', '-5', 'BIGINT', 'BIGINT','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('GLOBAL', 'SQL_TYPE', '6', 'FLOAT', 'FLOAT','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('GLOBAL', 'SQL_TYPE', '7', 'REAL', 'REAL','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('GLOBAL', 'SQL_TYPE', '8', 'DOUBLE', 'DOUBLE','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('GLOBAL', 'SQL_TYPE', '2', 'NUMERIC', 'NUMERIC','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('GLOBAL', 'SQL_TYPE', '3', 'DECIMAL', 'DECIMAL','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('GLOBAL', 'SQL_TYPE', '1', 'CHAR', 'CHAR','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('GLOBAL', 'SQL_TYPE', '12', 'VARCHAR', 'VARCHAR','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('GLOBAL', 'SQL_TYPE', '-1', 'LONGVARCHAR', 'LONGVARCHAR','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('GLOBAL', 'SQL_TYPE', '91', 'DATE', 'DATE','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('GLOBAL', 'SQL_TYPE', '92', 'TIME', 'TIME','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('GLOBAL', 'SQL_TYPE', '93', 'TIMESTAMP', 'TIMESTAMP','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('GLOBAL', 'SQL_TYPE', '-2', 'BINARY', 'BINARY','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('GLOBAL', 'SQL_TYPE', '-3', 'VARBINARY', 'VARBINARY','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('GLOBAL', 'SQL_TYPE', '-4', 'LONGVARBINARY', 'LONGVARBINARY','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('GLOBAL', 'SQL_TYPE', '0', 'NULL', 'NULL','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('GLOBAL', 'SQL_TYPE', '1111', 'OTHER', 'OTHER','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('GLOBAL', 'SQL_TYPE', '2000', 'JAVA_OBJECT', 'JAVA_OBJECT','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('GLOBAL', 'SQL_TYPE', '2001', 'DISTINCT', 'DISTINCT','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('GLOBAL', 'SQL_TYPE', '2002', 'STRUCT', 'STRUCT','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('GLOBAL', 'SQL_TYPE', '2003', 'ARRAY', 'ARRAY','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('GLOBAL', 'SQL_TYPE', '2004', 'BLOB', 'BLOB','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('GLOBAL', 'SQL_TYPE', '2005', 'CLOB', 'CLOB','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('GLOBAL', 'SQL_TYPE', '2006', 'REF', 'REF','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('GLOBAL', 'SQL_TYPE', '70', 'DATALINK', 'DATALINK','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('GLOBAL', 'SQL_TYPE', '16', 'BOOLEAN', 'BOOLEAN','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('GLOBAL', 'SQL_TYPE', '-8', 'ROWID', 'ROWID','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('GLOBAL', 'SQL_TYPE', '-15', 'NCHAR', 'NCHAR','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('GLOBAL', 'SQL_TYPE', '-9', 'NVARCHAR', 'NVARCHAR','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('GLOBAL', 'SQL_TYPE', '-16', 'LONGNVARCHAR', 'LONGNVARCHAR','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('GLOBAL', 'SQL_TYPE', '2011', 'NCLOB', 'NCLOB','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('GLOBAL', 'SQL_TYPE', '2009', 'SQLXML', 'SQLXML','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('GLOBAL', 'SQL_TYPE', '2012', 'REF_CURSOR', 'REF_CURSOR','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('GLOBAL', 'SQL_TYPE', '2013', 'TIME_WITH_TIMEZONE', 'TIME_WITH_TIMEZONE','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('GLOBAL', 'SQL_TYPE', '2014', 'TIMESTAMP_WITH_TIMEZONE', 'TIMESTAMP_WITH_TIMEZONE','1', '0'); 

-- Add GLOBAL.PRIMITIVE_TYPE DIC.
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('GLOBAL', 'PRIMITIVE_TYPE', 'byte', 'BYTE', 'byte','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('GLOBAL', 'PRIMITIVE_TYPE', 'short', 'SHORT', 'short','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('GLOBAL', 'PRIMITIVE_TYPE', 'int', 'INTEGER', 'int','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('GLOBAL', 'PRIMITIVE_TYPE', 'long', 'LONG', 'long','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('GLOBAL', 'PRIMITIVE_TYPE', 'char', 'CHAR', 'char','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('GLOBAL', 'PRIMITIVE_TYPE', 'boolean', 'BOOLEAN', 'boolean','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('GLOBAL', 'PRIMITIVE_TYPE', 'float', 'FLOAT', 'float','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('GLOBAL', 'PRIMITIVE_TYPE', 'double', 'DOUBLE', 'double','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('GLOBAL', 'PRIMITIVE_TYPE', 'string', 'STRING', 'string','1', '0'); 

-- Add GLOBAL.LAUNCH_TYPE DIC.
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('VERSION', 'OWNER_TYPE', '0', 'STANDARD SERVICE', '标准化服务','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('VERSION', 'OWNER_TYPE', '1', 'CUSTOMIZED SERVICE', '自定义服务','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('VERSION', 'OWNER_TYPE', '2', 'PROJECT', '项目','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('VERSION', 'OWNER_TYPE', '3', 'SERVICE', '服务','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('VERSION', 'OWNER_TYPE', '4', 'ENTRY', '组件','1', '0'); 

-- Add META_DATA_ITEM.TYPE DIC.
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('META_DATA_ITEM', 'TYPE', '0', 'TEXT FIELD', '文本框','1', '0');
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('META_DATA_ITEM', 'TYPE', '1', 'COMBOX', '下拉框','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('META_DATA_ITEM', 'TYPE', '2', 'MULTI VALUE COMBOX', '多值下拉框','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('META_DATA_ITEM', 'TYPE', '3', 'DATE', '日期框','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('META_DATA_ITEM', 'TYPE', '4', 'TIME', '时间狂','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('META_DATA_ITEM', 'TYPE', '5', 'DATE_TIME', '日期时间框','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('META_DATA_ITEM', 'TYPE', '6', 'DIGITAL FIELD', '数字框','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('META_DATA_ITEM', 'TYPE', '7', 'PASSWORD FIELD', '密码框','1', '0');
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('META_DATA_ITEM', 'TYPE', '8', 'CHECKBOX', '复选框','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('META_DATA_ITEM', 'TYPE', '9', 'RADIOBOX', '单选框','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('META_DATA_ITEM', 'TYPE', '10', 'IMAGE FILE', '图片框','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('META_DATA_ITEM', 'TYPE', '11', 'PERCENTAGE FIELD', '百分比框','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('META_DATA_ITEM', 'TYPE', '12', 'FRACTION FIELD', '分数框','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('META_DATA_ITEM', 'TYPE', '13', 'TEXT DESCRIPTION', '文本框','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('META_DATA_ITEM', 'TYPE', '14', 'FILE SELECTOR', '文件选择框','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('META_DATA_ITEM', 'TYPE', '15', 'MULTI TEXT FIELD', '多行文本框','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('META_DATA_ITEM', 'TYPE', '16', 'MULTI MEDIA TEXT FIELD', '多行富文本框','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('META_DATA_ITEM', 'TYPE', '17', 'MARKDOWN TEXT FIELD', 'Markdown文本框','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type, comments) VALUES ('META_DATA_ITEM', 'TYPE', '18', 'DECIMAL NUMBER', '小数框','1', '0', '默认保留2位小数'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('META_DATA_ITEM', 'TYPE', '19', 'ATTRIBUTE COMBOX', '属性下拉框','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type, comments) VALUES ('META_DATA_ITEM', 'TYPE', '20', 'ATTRIBUTE COMBOX AND TEXT FIELD', '属性文本下来复合框','1', '0', '可以输入文本也可以从下拉框选择，如果输入的文本不在下拉框值列表，则将输入的值作为回传值'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('META_DATA_ITEM', 'TYPE', '21', 'REFCOMBOX', '引用下拉框','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('META_DATA_ITEM', 'TYPE', '22', 'REFTREECOMBOX', '引用下拉树型框','1', '0'); 

-- Add META_DATA_ITEM.VALUE_TYPE DIC.
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('META_DATA_ITEM', 'VALUE_TYPE', '0', 'NORMAL', '','1', '0');
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('META_DATA_ITEM', 'VALUE_TYPE', '1', 'DIC', '','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('META_DATA_ITEM', 'VALUE_TYPE', '2', 'REFERENCE', 'API','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('META_DATA_ITEM', 'VALUE_TYPE', '3', 'REGION', '','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('META_DATA_ITEM', 'VALUE_TYPE', '4', 'SET', '','1', '0'); 

-- Add META_DATA_TEMPLATE.TYPE DIC.
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('META_DATA_TEMPLATE', 'TYPE', '0', 'ENTRY GENERAL', '普通元数据模板','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('META_DATA_TEMPLATE', 'TYPE', '1', 'ENTRY ADN', 'Adnormal元数据模板','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('META_DATA_TEMPLATE', 'TYPE', '2', 'ENTRY CONDITION', 'Condition元数据模板','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('META_DATA_TEMPLATE', 'TYPE', '51', 'UI FRAME', 'UI表单模板','1', '0');
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('META_DATA_TEMPLATE', 'TYPE', '52', 'UI TABLE', 'UI表格模板','1', '0'); 

-- Add META_DATA_TEMPLATE.VALUE_TYPE DIC.
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('META_DATA_TEMPLATE', 'VALUE_TYPE', '0', 'STRING', '字符串','1', '0');
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('META_DATA_TEMPLATE', 'VALUE_TYPE', '1', 'JSON', 'Json','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('META_DATA_TEMPLATE', 'VALUE_TYPE', '2', 'ARRAY', 'Object数组','1', '0'); 

-- Add ENTRY_TEMPLATE.TYPE DIC.
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('ENTRY_TEMPLATE', 'TYPE', '0', 'CONNECTOR', 'Connector组件模板','1', '0');
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('ENTRY_TEMPLATE', 'TYPE', '1', 'DATACENTER', '数据中心组件模板','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('ENTRY_TEMPLATE', 'TYPE', '2', 'DATASTORE', '数据存储中心组件模板','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('ENTRY_TEMPLATE', 'TYPE', '3', 'RULECHAIN', 'RuleChain组件模板','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('ENTRY_TEMPLATE', 'TYPE', '4', 'RULE', 'Rule组件模板','1', '0'); 

-- Add GLOBAL.VALUE_TYPE DIC.
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('ENTRY_TEMPLATE_MAP', 'VALUE_TYPE', '0', 'SINGLE', '单值','1', '0');
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('ENTRY_TEMPLATE_MAP', 'VALUE_TYPE', '1', 'ARRAY', '多值','1', '0'); 

-- Add CONFIGUE_TEMPLATE.TYPE DIC.
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('CONFIGUE_TEMPLATE', 'TYPE', '0', 'LEVEL1 GROUP', '根类型','1', '0');
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('CONFIGUE_TEMPLATE', 'TYPE', '1', 'ENTITY GROUP', '实体类型','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('CONFIGUE_TEMPLATE', 'TYPE', '2', 'PARA GROUP', '属性类型','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('CONFIGUE_TEMPLATE', 'TYPE', '3', 'PARA TYPE', '子属性类型','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('CONFIGUE_TEMPLATE', 'TYPE', '51', 'OTHER', '其它','1', '0'); 

-- Add CONFIGUE_TEMPLATE.CATEGORY DIC.
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('CONFIGUE_TEMPLATE', 'CATEGORY', '0', 'BASE SETTINGS', '基本配置','1', '0');
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('CONFIGUE_TEMPLATE', 'CATEGORY', '1', 'ADVANCED SETTINGS', '高级配置','1', '0'); 

-- Add PROJECT.TYPE DIC.
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('PROJECT', 'TYPE', '0', 'GENERAL PROJECT', '普通项目','1', '0');
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type, comments) VALUES ('PROJECT', 'TYPE', '1', 'VIRTRUAL PROJECT', '虚拟项目','1', '0', '非Twinkle体系内的项目'); 

-- Add PROJECT.STATUS DIC.
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('PROJECT', 'STATUS', '0', 'INITIAL', '初始化','1', '0');
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('PROJECT', 'STATUS', '1', 'CONFIGURED', '设置中','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('PROJECT', 'STATUS', '2', 'DEVELOPING', '研发中','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('PROJECT', 'STATUS', '3', 'PUBLISHED', '已发布','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('PROJECT', 'STATUS', '4', 'ITERATIVE', '迭代中','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('PROJECT', 'STATUS', '5', 'COMPLETED', '已完成','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('PROJECT', 'STATUS', '6', 'PATCHING', '补丁中','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('PROJECT', 'STATUS', '7', 'ARCHIVED', '已归档','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('PROJECT', 'STATUS', '8', 'DELETED', '已删除','1', '0'); 

-- Add PROJECT.PROJECT_SETTINGS.
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('PROJECT_SETTINGS', 'FRAMEWORK_TYPE', '0', 'SPRING CLOUD', 'Spring Cloud','1', '0');
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('PROJECT_SETTINGS', 'FRAMEWORK_TYPE', '1', 'DUBBO', 'Dubbo','1', '0'); 

-- Add PROJECT.GOVER_TYPE.
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('PROJECT_SETTINGS', 'GOVER_TYPE', '0', 'EUREKA', 'Eureka','1', '0');
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('PROJECT_SETTINGS', 'GOVER_TYPE', '1', 'ZOOKEEPER', 'Zookeeper','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('PROJECT_SETTINGS', 'GOVER_TYPE', '2', 'CONSUL', 'Consul','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('PROJECT_SETTINGS', 'GOVER_TYPE', '3', 'NACOS', 'NacOS','1', '0'); 

-- Add PROJECT.CONFIG_TYPE.
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('PROJECT_SETTINGS', 'CONFIG_TYPE', '0', 'SPRING CLOUD CONFIG', 'Spring Cloud Config','1', '0');
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('PROJECT_SETTINGS', 'CONFIG_TYPE', '1', 'APOLLO', 'Apollo','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('PROJECT_SETTINGS', 'CONFIG_TYPE', '2', 'NACOS', 'NacOS','1', '0'); 

-- Add PROJECT.GATEWAY_TYPE.
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('PROJECT_SETTINGS', 'GATEWAY_TYPE', '0', 'SPRING CLOUD GATEWAY', 'Spring Cloud Gateway','1', '0');
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('PROJECT_SETTINGS', 'GATEWAY_TYPE', '1', 'SPRING CLOUD ZUUL', 'Spring Cloud Zuul1','1', '0');
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('PROJECT_SETTINGS', 'GATEWAY_TYPE', '2', 'SPRING CLOUD ZUUL2', 'Spring Cloud Zuul2','1', '0');
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('PROJECT_SETTINGS', 'GATEWAY_TYPE', '51', 'CUSTOMIZE', '自定义','1', '0');

-- Add PROJECT.AUTH_TYPE.
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('PROJECT_SETTINGS', 'AUTH_TYPE', '0', 'TWINKLE AUTH CENTER', 'Twinkle Auth Center','1', '0');
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('PROJECT_SETTINGS', 'AUTH_TYPE', '51', 'CUSTOMIZE', '自定义','1', '0');

-- Add PROJECT_ENV.TYPE.
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('PROJECT_ENV', 'TYPE', '0', 'HOST', '主机环境','1', '0');
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('PROJECT_ENV', 'TYPE', '1', 'KUBERNETES', 'Kubernetes环境','1', '0');
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('PROJECT_ENV', 'TYPE', '2', 'DATACENTER', 'DataSource','1', '0');
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('PROJECT_ENV', 'TYPE', '3', 'DATASTORE', 'DataStore','1', '0');
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('PROJECT_ENV', 'TYPE', '4', 'DATACACHE', 'Cache','1', '0');
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('PROJECT_ENV', 'TYPE', '5', 'MQ', 'MQ','1', '0');

-- Add PROJECT_TRACE.TYPE.
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('PROJECT_TRACE', 'TYPE', '0', 'INITIALIZE', '项目初始化','1', '0');
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('PROJECT_TRACE', 'TYPE', '1', 'CONFIGURE PROJECT', '项目配置','1', '0');
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('PROJECT_TRACE', 'TYPE', '2', 'ADD SERVICE', '添加服务','1', '0');
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('PROJECT_TRACE', 'TYPE', '3', 'DELETE SERVICE', '删除服务','1', '0');
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('PROJECT_TRACE', 'TYPE', '4', 'PUBLISH PROJECT', '发布服务','1', '0');
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('PROJECT_TRACE', 'TYPE', '5', 'CHANGE ARCHITECTURE', '变更架构','1', '0');
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('PROJECT_TRACE', 'TYPE', '6', 'CHANGE OWNER', '变换责任人','1', '0');

-- Add SERVICE.CATEGORY.
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('SERVICE', 'CATEGORY', '0', 'BUSINESS SERVICE', '业务服务','1', '0');
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('SERVICE', 'CATEGORY', '1', 'DISCOVERY SERVICE', '服务治理中心','1', '0');
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('SERVICE', 'CATEGORY', '2', 'CONFIG SERVICE', '配置中心','1', '0');
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('SERVICE', 'CATEGORY', '3', 'GATEWAY SERVICE', '网关','1', '0');
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('SERVICE', 'CATEGORY', '4', 'OAUTH SERVICE', '鉴权中心','1', '0');

-- Add SERVICE.TYPE.
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('SERVICE', 'TYPE', '0', 'NEW SERVICE', '业务服务','1', '0');
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('SERVICE', 'TYPE', '1', 'CUSTOMIZED SERVICE', '自定义Service','1', '0');
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('SERVICE', 'TYPE', '2', 'NO-PROJECT SERVICE', '非项目Service','1', '0');
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('SERVICE', 'TYPE', '3', 'THIRD-PART SERVICE', '第三方Service','1', '0');

-- Add SERVICE.STATUS DIC.
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('SERVICE', 'STATUS', '0', 'INITIAL', '初始化','1', '0');
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('SERVICE', 'STATUS', '1', 'CONFIGURED', '已配置','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('SERVICE', 'STATUS', '2', 'DEVELOPING', '研发中','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('SERVICE', 'STATUS', '3', 'PUBLISHED', '已发布','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('SERVICE', 'STATUS', '4', 'ITERATIVE', '迭代中','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('SERVICE', 'STATUS', '5', 'COMPLETED', '已完成','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('SERVICE', 'STATUS', '6', 'PATCHING', '修复中','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('SERVICE', 'STATUS', '7', 'ARCHIVED', '已归档','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('SERVICE', 'STATUS', '8', 'DELETED', '已删除','1', '0'); 

-- Add SERVICE_RELY.TYPE.
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('SERVICE_RELY', 'TYPE', '0', 'RESTFUL HTTP', 'Restful Http','1', '0');
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('SERVICE_RELY', 'TYPE', '1', 'DUBBO RPC', 'Dubbo RPC','1', '0');
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('SERVICE_RELY', 'TYPE', '2', 'WEBSOCKET', 'WebSocket','1', '0');
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('SERVICE_RELY', 'TYPE', '3', 'MQTT', 'MQTT','1', '0');
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('SERVICE_RELY', 'TYPE', '4', 'MQ', 'MQ','1', '0');

-- Add SERVICE_ENV.TYPE.
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('SERVICE_ENV', 'TYPE', '0', 'HOST', 'Host环境','1', '0');
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('SERVICE_ENV', 'TYPE', '1', 'KUBERNETES', 'Kubernetes环境','1', '0');
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('SERVICE_ENV', 'TYPE', '2', 'DATACENTER', 'DataSource','1', '0');
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('SERVICE_ENV', 'TYPE', '3', 'DATASTORE', 'DataStore','1', '0');
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('SERVICE_ENV', 'TYPE', '4', 'DATACACHE', 'Cache','1', '0');
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('SERVICE_ENV', 'TYPE', '5', 'MQ', 'MQ','1', '0');

-- Add SERVICE_ATTRIBUTE.TYPE.
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('SERVICE_ATTRIBUTE', 'TYPE', '0', 'PRIMITIVE PARAMETER', '基础参数','1', '0');
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('SERVICE_ATTRIBUTE', 'TYPE', '1', 'STRUCT PARAMETER', '结构参数','1', '0');

-- Add SERVICE_TRACE.TYPE.
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('SERVICE_TRACE', 'TYPE', '0', 'INITIALIZE', '服务初始化','1', '0');
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('SERVICE_TRACE', 'TYPE', '1', 'CONFIGURE SERVICE', '配置服务','1', '0');
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('SERVICE_TRACE', 'TYPE', '2', 'DEVELOPING', '服务研发','1', '0');
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('SERVICE_TRACE', 'TYPE', '3', 'PUBLISHED', '服务发布','1', '0');
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('SERVICE_TRACE', 'TYPE', '4', 'ITERATORING', '服务迭代','1', '0');
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('SERVICE_TRACE', 'TYPE', '5', 'CHANGE OWNER', '变更责任人','1', '0');

-- Add ENTRY.TYPE.
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('ENTRY', 'TYPE', '0', 'CONNECTOR MANAGER', 'Connector','1', '0');
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('ENTRY', 'TYPE', '1', 'CONNECTOR', 'Connector','1', '0');
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('ENTRY', 'TYPE', '2', 'ENDPOINT', 'EndPoint','1', '0');
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('ENTRY', 'TYPE', '3', 'RULECHAIN MANAGER', 'RuleChain','1', '0');
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('ENTRY', 'TYPE', '4', 'RULE', 'Rule','1', '0');
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('ENTRY', 'TYPE', '5', 'RULECHAIN', 'RuleChain','1', '0');
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('ENTRY', 'TYPE', '6', 'DATACENTER MANAGER', 'DataCenter','1', '0');
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('ENTRY', 'TYPE', '7', 'STATEMENT', 'Statement','1', '0');
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('ENTRY', 'TYPE', '8', 'EXECUTOR', 'Statement Executor','1', '0');
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('ENTRY', 'TYPE', '9', 'DATACENTER MANAGER', 'DataCenter','1', '0');
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('ENTRY', 'TYPE', '10', 'ATTRIBUTE MANAGER', 'Attribute','1', '0');
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('ENTRY', 'TYPE', '11', 'STRUCT ATTRIBUTE MANAGER', 'Struct Attribute','1', '0');
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('ENTRY', 'TYPE', '12', 'STRUCT ATTRIBUTE NAMESPACE', 'Struct Attribute Namespace','1', '0');
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('ENTRY', 'TYPE', '13', 'STRUCT ATTRIBUTE TYPE', 'Struct Attribute Type','1', '0');

-- Add DATA_CACHE.TYPE DIC.
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('DATA_CACHE', 'TYPE', '0', 'REDIS MASTER-SLAVE', 'Redis','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('DATA_CACHE', 'TYPE', '1', 'REDIS SENTINEL', 'Redis','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('DATA_CACHE', 'TYPE', '2', 'REDIS CLUSTER', 'Redis Cluster','1', '0'); 

-- Add MESSAGE_QUEUE.TYPE DIC.
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('MESSAGE_QUEUE', 'TYPE', '0', 'RABBIT MQ', 'RabbitMQ','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('MESSAGE_QUEUE', 'TYPE', '1', 'ROCKET MQ', 'RocketMQ','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('MESSAGE_QUEUE', 'TYPE', '2', 'ACTIVE MQ', 'AcitveMQ','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('MESSAGE_QUEUE', 'TYPE', '3', 'KAFKA', 'Kafka','1', '0'); 

-- Add USER.TITLE DIC.
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('USER', 'TITLE', '0', 'ADMINISTRATOR', '超级管理员','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('USER', 'TITLE', '1', 'SYSTEM MANAGER', '系统管理员','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('USER', 'TITLE', '2', 'PROJECT MANAGER', '项目经理','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('USER', 'TITLE', '3', 'ARCHITECT', '架构师','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('USER', 'TITLE', '4', 'SENIOR DEVELOPER', '高级研发','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('USER', 'TITLE', '5', 'INTERMEDIATE DEVELOPER', '中级研发','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('USER', 'TITLE', '6', 'JUNIOR DEVELOPER', '初级研发','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('USER', 'TITLE', '7', 'TESTER', '测试','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('USER', 'TITLE', '8', 'INFRASTRUCTURE ARCHITECT', '运维架构师','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('USER', 'TITLE', '9', 'OPERATER', '运维人员','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('USER', 'TITLE', '10', 'LEEDER', '领导','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('USER', 'TITLE', '99', 'OTHER', '其它','1', '0'); 

-- Add TENANT.TYPE DIC.
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('TENANT', 'TYPE', '0', 'SYSTEM PROVIDER', '系统提供者','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('TENANT', 'TYPE', '1', 'SYSTEM USER', '系统使用者','1', '0'); 

-- Add MENU.TYPE DIC.
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('MENU', 'TYPE', '0', 'SYSTEM RESERVED MENU', '系统预用菜单','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('MENU', 'TYPE', '1', 'CONSOLE MENU', '控制台彩带','1', '0');  
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('MENU', 'TYPE', '2', 'UI MENU', 'Portal菜单','1', '0');  
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('MENU', 'TYPE', '3', 'MULTI-PURPOSE MENU', 'UI控制台共用菜单','1', '0'); 

-- Add RESULT_CODE.CATEGORY DIC.
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('RESULT_CODE', 'CATEGORY', '0', 'HTTP SERVER CONNECTOR', 'Http Server Connector','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('RESULT_CODE', 'CATEGORY', '1', 'HTTP CLIENT CONNECTOR', 'Http Client Connector','1', '0');  
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('RESULT_CODE', 'CATEGORY', '2', 'DUBBO SERVER CONNECTOR', 'Dubbo Server Connector','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('RESULT_CODE', 'CATEGORY', '3', 'DUBBO CLIENT CONNECTOR', 'Dubbo Client Connector','1', '0');  
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('RESULT_CODE', 'CATEGORY', '4', 'HTTP REST SERVER CONNECTOR', 'Http Rest Server Connector','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('RESULT_CODE', 'CATEGORY', '5', 'HTTP REST CLIENT CONNECTOR', 'Http Rest Client Connector','1', '0');  
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('RESULT_CODE', 'CATEGORY', '6', 'RULE CHAIN', 'RuleChain','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('RESULT_CODE', 'CATEGORY', '7', 'RULE', 'Rule','1', '0');  
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('RESULT_CODE', 'CATEGORY', '8', 'DATA CENTER', 'Data Center','1', '0');  
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('RESULT_CODE', 'CATEGORY', '9', 'DATA STORE', 'Data Store','1', '0');  

-- Add RESULT_CODE.TYPE DIC.
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('RESULT_CODE', 'TYPE', '0', 'SYSTEM RESERVED RESULT CODE', '系统结果码','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('RESULT_CODE', 'TYPE', '1', 'CUSTOMIZED RESULT CODE', '自定义结果码','1', '0');  

-- Add SYSDICTIONARY.TYPE DIC.
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('SYSDICTIONARY', 'TYPE', '0', 'SYSTEM RESERVED DIC', '系统字典','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('SYSDICTIONARY', 'TYPE', '1', 'CUSTOMIZED DIC', '自定义字典','1', '0');  

-- Add ROLE.TYPE DIC.
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('ROLE', 'TYPE', '0', 'SYSTEM RESERVED ROLE', '系统角色','1', '0'); 
INSERT INTO public.s_sysdictionary(owner, field, value, code, text, status, type) VALUES ('ROLE', 'TYPE', '1', 'CUSTOMIZED ROLE', '自定义角色','1', '0');  

-- ==================================================================
-- *        Going to initialize the ATTRIBUTE TYPE Records.         *
-- ==================================================================

TRUNCATE TABLE public.A_ATTRIBUTE_TYPE RESTART IDENTITY CASCADE;

INSERT INTO public.A_ATTRIBUTE_TYPE(ID, NAME, CLASS_NAME, STATUS) VALUES ('c769ef9436bc48399d2fb29b825c5839', 'BinaryAttribute', 'com.twinkle.framework.core.lang.BinaryAttribute' ,'1');
INSERT INTO public.A_ATTRIBUTE_TYPE(ID, NAME, CLASS_NAME, STATUS) VALUES ('0f2e571257c24dfe99bb7d08a610feff', 'IntegerAttribute', 'com.twinkle.framework.core.lang.IntegerAttribute' ,'1');
INSERT INTO public.A_ATTRIBUTE_TYPE(ID, NAME, CLASS_NAME, STATUS) VALUES ('a9e8cd6b805b45ad811164b60384dda3', 'LongAttribute', 'com.twinkle.framework.core.lang.LongAttribute' ,'1');
INSERT INTO public.A_ATTRIBUTE_TYPE(ID, NAME, CLASS_NAME, STATUS) VALUES ('dac1967fe84242949cf1dd7629c15798', 'FloatAttribute', 'com.twinkle.framework.core.lang.FloatAttribute' ,'1');
INSERT INTO public.A_ATTRIBUTE_TYPE(ID, NAME, CLASS_NAME, STATUS) VALUES ('7974a119c1e6491ea40ae0c43c6f1e8a', 'DoubleAttribute', 'com.twinkle.framework.core.lang.DoubleAttribute' ,'1');
INSERT INTO public.A_ATTRIBUTE_TYPE(ID, NAME, CLASS_NAME, STATUS) VALUES ('c0f608501c54434fa5511ffa0bdf53c0', 'UUIDAttribute', 'com.twinkle.framework.core.lang.UUIDAttribute' ,'1');
INSERT INTO public.A_ATTRIBUTE_TYPE(ID, NAME, CLASS_NAME, STATUS) VALUES ('68c440984339453fbbe7b6599caeb517', 'TimeAttribute', 'com.twinkle.framework.core.lang.TimeAttribute' ,'1');
INSERT INTO public.A_ATTRIBUTE_TYPE(ID, NAME, CLASS_NAME, STATUS) VALUES ('e0ce871e0f634608b55b9456e173932b', 'RangeAttribute', 'com.twinkle.framework.core.lang.RangeAttribute' ,'1');
INSERT INTO public.A_ATTRIBUTE_TYPE(ID, NAME, CLASS_NAME, STATUS) VALUES ('9a98a9b5051045d6b48033a3145e3411', 'StringAttribute', 'com.twinkle.framework.core.lang.StringAttribute' ,'1');
INSERT INTO public.A_ATTRIBUTE_TYPE(ID, NAME, CLASS_NAME, STATUS) VALUES ('4ca0ede2fec74264b042739ba10a292d', 'UnicodeStringAttribute', 'com.twinkle.framework.core.lang.UnicodeStringAttribute' ,'1');
INSERT INTO public.A_ATTRIBUTE_TYPE(ID, NAME, CLASS_NAME, STATUS) VALUES ('5c90afa3cbec47bdbcaffd5815f7ad33', 'MutableStringAttribute', 'com.twinkle.framework.core.lang.MutableStringAttribute' ,'1');
INSERT INTO public.A_ATTRIBUTE_TYPE(ID, NAME, CLASS_NAME, STATUS) VALUES ('ffaf9560b408425eac859bba48363e63', 'IPAddrAttribute', 'com.twinkle.framework.core.lang.IPAddrAttribute' ,'1');
INSERT INTO public.A_ATTRIBUTE_TYPE(ID, NAME, CLASS_NAME, STATUS) VALUES ('dd5b8f93ca444bfd8783518abea5de5d', 'IPv6AddrAttribute', 'com.twinkle.framework.core.lang.IPv6AddrAttribute' ,'1');
INSERT INTO public.A_ATTRIBUTE_TYPE(ID, NAME, CLASS_NAME, STATUS) VALUES ('9d064875d3cc47069c3a82a57ae2df8f', 'ListAttribute', 'com.twinkle.framework.core.lang.ListAttribute' ,'1');
INSERT INTO public.A_ATTRIBUTE_TYPE(ID, NAME, CLASS_NAME, STATUS) VALUES ('6205777ae711464284b3e998e5647ead', 'ObjectAttribute', 'com.twinkle.framework.core.lang.ObjectAttribute' ,'1');
INSERT INTO public.A_ATTRIBUTE_TYPE(ID, NAME, CLASS_NAME, STATUS) VALUES ('a9abad1cc15e42e78a9e7174222bdaeb', 'StructAttrAttribute', 'com.twinkle.framework.struct.lang.StructAttrAttribute' ,'1');
INSERT INTO public.A_ATTRIBUTE_TYPE(ID, NAME, CLASS_NAME, STATUS) VALUES ('122517ce0cc94254bd8c8c6b98615bf7', 'StructAttributeList', 'com.twinkle.framework.core.lang.StructAttributeList' ,'1');


-- Add attribute type - sql type map.  uuid_generate_v4()
TRUNCATE TABLE public.A_ATTRIBUTE_TYPE_SQL_TYPE_MAP RESTART IDENTITY CASCADE;

INSERT INTO public.A_ATTRIBUTE_TYPE_SQL_TYPE_MAP(ID, ATTRIBUTE_TYPE_ID, SQL_TYPE, STATUS) VALUES ('744ed5fb6a3f4712940d569735290c32', '0f2e571257c24dfe99bb7d08a610feff', '-7','1');
INSERT INTO public.A_ATTRIBUTE_TYPE_SQL_TYPE_MAP(ID, ATTRIBUTE_TYPE_ID, SQL_TYPE, STATUS) VALUES ('3758bb2996c74cf8844edf4cc4058df7', '0f2e571257c24dfe99bb7d08a610feff', '16','1');
INSERT INTO public.A_ATTRIBUTE_TYPE_SQL_TYPE_MAP(ID, ATTRIBUTE_TYPE_ID, SQL_TYPE, STATUS) VALUES ('06570cd9db8a41ffa403f554f4df59f2', '0f2e571257c24dfe99bb7d08a610feff', '5','1');
INSERT INTO public.A_ATTRIBUTE_TYPE_SQL_TYPE_MAP(ID, ATTRIBUTE_TYPE_ID, SQL_TYPE, STATUS) VALUES ('97a711d7e2a942049b9a6772433c7b97', '0f2e571257c24dfe99bb7d08a610feff', '-6','1');
INSERT INTO public.A_ATTRIBUTE_TYPE_SQL_TYPE_MAP(ID, ATTRIBUTE_TYPE_ID, SQL_TYPE, STATUS) VALUES ('527ae45e28a546bbb31517b6d60e95b1', '0f2e571257c24dfe99bb7d08a610feff', '4','1');
INSERT INTO public.A_ATTRIBUTE_TYPE_SQL_TYPE_MAP(ID, ATTRIBUTE_TYPE_ID, SQL_TYPE, STATUS) VALUES ('6fc5b83ec0164fc98ffc35558e8adece', '68c440984339453fbbe7b6599caeb517', '4','1');
INSERT INTO public.A_ATTRIBUTE_TYPE_SQL_TYPE_MAP(ID, ATTRIBUTE_TYPE_ID, SQL_TYPE, STATUS) VALUES ('2a44fd0e4632414586bf008748606189', '68c440984339453fbbe7b6599caeb517', '91','1');
INSERT INTO public.A_ATTRIBUTE_TYPE_SQL_TYPE_MAP(ID, ATTRIBUTE_TYPE_ID, SQL_TYPE, STATUS) VALUES ('8064b3720f7d452b8369deaaa2bdf5fa', '68c440984339453fbbe7b6599caeb517', '92','1');
INSERT INTO public.A_ATTRIBUTE_TYPE_SQL_TYPE_MAP(ID, ATTRIBUTE_TYPE_ID, SQL_TYPE, STATUS) VALUES ('4cae65f52c0b4d98ad3e996f46b9ac50', '68c440984339453fbbe7b6599caeb517', '93','1');
INSERT INTO public.A_ATTRIBUTE_TYPE_SQL_TYPE_MAP(ID, ATTRIBUTE_TYPE_ID, SQL_TYPE, STATUS) VALUES ('691a0d12be3a4c3ca29db583c2f776ae', '68c440984339453fbbe7b6599caeb517', '2013','1');
INSERT INTO public.A_ATTRIBUTE_TYPE_SQL_TYPE_MAP(ID, ATTRIBUTE_TYPE_ID, SQL_TYPE, STATUS) VALUES ('75f00f4b417d471f9808adb3bf687337', '68c440984339453fbbe7b6599caeb517', '2014','1');
INSERT INTO public.A_ATTRIBUTE_TYPE_SQL_TYPE_MAP(ID, ATTRIBUTE_TYPE_ID, SQL_TYPE, STATUS) VALUES ('da09d55393bf4277abd18e0e7144be56', 'a9e8cd6b805b45ad811164b60384dda3', '-5','1');
INSERT INTO public.A_ATTRIBUTE_TYPE_SQL_TYPE_MAP(ID, ATTRIBUTE_TYPE_ID, SQL_TYPE, STATUS) VALUES ('8517f895181c4fa08275ff4ba86fcb37', 'c769ef9436bc48399d2fb29b825c5839', '-4','1');
INSERT INTO public.A_ATTRIBUTE_TYPE_SQL_TYPE_MAP(ID, ATTRIBUTE_TYPE_ID, SQL_TYPE, STATUS) VALUES ('6f6ad9608f4549eb86e2b37d115af43a', 'c769ef9436bc48399d2fb29b825c5839', '-2','1');
INSERT INTO public.A_ATTRIBUTE_TYPE_SQL_TYPE_MAP(ID, ATTRIBUTE_TYPE_ID, SQL_TYPE, STATUS) VALUES ('e163c87e5b514d95918a2cf057f5672f', 'c769ef9436bc48399d2fb29b825c5839', '-3','1');
INSERT INTO public.A_ATTRIBUTE_TYPE_SQL_TYPE_MAP(ID, ATTRIBUTE_TYPE_ID, SQL_TYPE, STATUS) VALUES ('3ab5001ecc054c47a9a1ef065049ab5f', '9a98a9b5051045d6b48033a3145e3411', '12','1');
INSERT INTO public.A_ATTRIBUTE_TYPE_SQL_TYPE_MAP(ID, ATTRIBUTE_TYPE_ID, SQL_TYPE, STATUS) VALUES ('e9425fa85e5a46c0af1e4c9e61309d92', '9a98a9b5051045d6b48033a3145e3411', '-1','1');
INSERT INTO public.A_ATTRIBUTE_TYPE_SQL_TYPE_MAP(ID, ATTRIBUTE_TYPE_ID, SQL_TYPE, STATUS) VALUES ('8825f093a81f498a8bb227c17ce80815', 'ffaf9560b408425eac859bba48363e63', '12','1');
INSERT INTO public.A_ATTRIBUTE_TYPE_SQL_TYPE_MAP(ID, ATTRIBUTE_TYPE_ID, SQL_TYPE, STATUS) VALUES ('1f301d137d3e4869a4230be1cd3f7361', 'ffaf9560b408425eac859bba48363e63', '-1','1');
INSERT INTO public.A_ATTRIBUTE_TYPE_SQL_TYPE_MAP(ID, ATTRIBUTE_TYPE_ID, SQL_TYPE, STATUS) VALUES ('6b3f2043614f484da81801d51cb2f424', 'dac1967fe84242949cf1dd7629c15798', '6','1');
INSERT INTO public.A_ATTRIBUTE_TYPE_SQL_TYPE_MAP(ID, ATTRIBUTE_TYPE_ID, SQL_TYPE, STATUS) VALUES ('fef784db471a40ceb03ddf5ce6d949cc', '7974a119c1e6491ea40ae0c43c6f1e8a', '8','1');

-- ==================================================================
-- *        Going to initialize the System Menu Records.            *
-- ==================================================================

-- Add System Menu.  uuid_generate_v4()
TRUNCATE TABLE public.S_MENU RESTART IDENTITY CASCADE;

INSERT INTO public.S_MENU(ID, CODE, NAME, PARENT_ID, SEQ_NO, ROUTING, I_PATH, STATUS, TYPE) VALUES ('9420d480d3e84c478cb2a0e619c68bbc', 'DASHBOARD', '首页', null, '1', '/twinkle/console/dashboard', 'icon-dashboard', '1', '3');
-- 
-- 
INSERT INTO public.S_MENU(ID, CODE, NAME, PARENT_ID, SEQ_NO, ROUTING, I_PATH, STATUS, TYPE) VALUES ('7f5d90aeccba4a4087af48347b3991a1', 'MY_PROJECT', '我的项目', null, '10', '', 'icon-project', '1', '3');
INSERT INTO public.S_MENU(ID, CODE, NAME, PARENT_ID, SEQ_NO, ROUTING, I_PATH, STATUS, TYPE) VALUES ('481535c11e7e4913a32a48d45fd741eb', 'PROJECT_LIST', '项目列表', '7f5d90aeccba4a4087af48347b3991a1', '11', '/twinkle/console/project/projectlist', 'icon-projectlist', '1', '3');
INSERT INTO public.S_MENU(ID, CODE, NAME, PARENT_ID, SEQ_NO, ROUTING, I_PATH, STATUS, TYPE) VALUES ('3887c84c9e924050a7185725cdd2a882', 'PROJECT_ENV', '项目环境', '7f5d90aeccba4a4087af48347b3991a1', '12', '/twinkle/console/project/env', 'icon-projectenv', '1', '3');
INSERT INTO public.S_MENU(ID, CODE, NAME, PARENT_ID, SEQ_NO, ROUTING, I_PATH, STATUS, TYPE) VALUES ('bff16749df4b44fe94526f3952371cb7', 'PROJECT_SERVICE', '项目服务列表', '7f5d90aeccba4a4087af48347b3991a1', '13', '/twinkle/console/project/architecture', 'icon-projectarch', '1', '3');

-- 
INSERT INTO public.S_MENU(ID, CODE, NAME, PARENT_ID, SEQ_NO, ROUTING, I_PATH, STATUS, TYPE) VALUES ('52d5de5b11f140aebbe382fb720b9c99', 'MY_SERVICE', '我的服务', null, '30', '', 'icon-service', '1', '3');
INSERT INTO public.S_MENU(ID, CODE, NAME, PARENT_ID, SEQ_NO, ROUTING, I_PATH, STATUS, TYPE) VALUES ('b04c87cad65440ce8491942f5f10d82e', 'SERVICE_LIST', '服务列表', '52d5de5b11f140aebbe382fb720b9c99', '31', '/twinkle/console/service/servicelist', 'icon-servicelist', '1', '3');
INSERT INTO public.S_MENU(ID, CODE, NAME, PARENT_ID, SEQ_NO, ROUTING, I_PATH, STATUS, TYPE) VALUES ('62748fd13d9049149a6987d9ddd2ce08', 'SERVICE_ENV', '服务环境', '52d5de5b11f140aebbe382fb720b9c99', '32', '/twinkle/console/service/env', 'icon-serviceenv', '1', '3');
INSERT INTO public.S_MENU(ID, CODE, NAME, PARENT_ID, SEQ_NO, ROUTING, I_PATH, STATUS, TYPE) VALUES ('fcd6af44935b450aa3e611774932a10b', 'SERVICE_SETTING', '服务设置', '52d5de5b11f140aebbe382fb720b9c99', '33', '/twinkle/console/service/settings', 'icon-servicesetting', '1', '3');
INSERT INTO public.S_MENU(ID, CODE, NAME, PARENT_ID, SEQ_NO, ROUTING, I_PATH, STATUS, TYPE) VALUES ('a41fd9e2d3d64f8389cf6da508f29464', 'SERVICE_BUILD', '服务构建', '52d5de5b11f140aebbe382fb720b9c99', '34', '/twinkle/console/service/build', 'icon-servicebuild', '1', '3');
INSERT INTO public.S_MENU(ID, CODE, NAME, PARENT_ID, SEQ_NO, ROUTING, I_PATH, STATUS, TYPE) VALUES ('8821f9b28f3e405483f48cb2918233a4', 'SERVICE_TEST', '服务测试', '52d5de5b11f140aebbe382fb720b9c99', '35', '/twinkle/console/service/test', 'icon-servicetest', '1', '3');
INSERT INTO public.S_MENU(ID, CODE, NAME, PARENT_ID, SEQ_NO, ROUTING, I_PATH, STATUS, TYPE) VALUES ('43348007ed9f493498fe490ee75f2947', 'SERVICE_PUBLISH', '服务发布', '52d5de5b11f140aebbe382fb720b9c99', '36', '/twinkle/console/service/publish', 'icon-servicepublish', '1', '3');

-- 
INSERT INTO public.S_MENU(ID, CODE, NAME, PARENT_ID, SEQ_NO, ROUTING, I_PATH, STATUS, TYPE) VALUES ('4720566ad7c144b69858186d0764e5b3', 'MY_ENV', '我的环境', null, '50', '', 'icon-env', '1', '1');
INSERT INTO public.S_MENU(ID, CODE, NAME, PARENT_ID, SEQ_NO, ROUTING, I_PATH, STATUS, TYPE) VALUES ('1bfef86ab35b409d8ddadbbe70dd73e9', 'ENV_HOST', '主机环境', '4720566ad7c144b69858186d0764e5b3', '51', '/twinkle/console/env/hostlist', 'icon-envhost', '1', '1');
INSERT INTO public.S_MENU(ID, CODE, NAME, PARENT_ID, SEQ_NO, ROUTING, I_PATH, STATUS, TYPE) VALUES ('c2783e3af3bd4330bdabeb809eec7d6d', 'ENV_KUBERNETES', 'Kubernetes环境', '4720566ad7c144b69858186d0764e5b3', '52', '/twinkle/console/env/kubernetes', 'icon-envk8s', '1', '1');
INSERT INTO public.S_MENU(ID, CODE, NAME, PARENT_ID, SEQ_NO, ROUTING, I_PATH, STATUS, TYPE) VALUES ('3b7e766dd1d74d2eba5a2d4a144a16f5', 'ENV_DATASOURCE', '数据源中心', '4720566ad7c144b69858186d0764e5b3', '53', '/twinkle/console/env/datasource', 'icon-envdatasource', '1', '1');
INSERT INTO public.S_MENU(ID, CODE, NAME, PARENT_ID, SEQ_NO, ROUTING, I_PATH, STATUS, TYPE) VALUES ('02f3c50fef07470eb2face8abac6f404', 'ENV_CACHE', '缓存中心', '4720566ad7c144b69858186d0764e5b3', '54', '/twinkle/console/env/cache', 'icon-envcache', '1', '1');
INSERT INTO public.S_MENU(ID, CODE, NAME, PARENT_ID, SEQ_NO, ROUTING, I_PATH, STATUS, TYPE) VALUES ('4ae7af009696497295d5056241659dcb', 'ENV_MQ', 'MQ中心', '4720566ad7c144b69858186d0764e5b3', '55', '/twinkle/console/env/mq', 'icon-envmq', '1', '1');
INSERT INTO public.S_MENU(ID, CODE, NAME, PARENT_ID, SEQ_NO, ROUTING, I_PATH, STATUS, TYPE) VALUES ('9d9ebb718e77468da6c01627639a8156', 'ENV_GIT', 'Git中心', '4720566ad7c144b69858186d0764e5b3', '56', '/twinkle/console/env/git', 'icon-envgit', '1', '1');
INSERT INTO public.S_MENU(ID, CODE, NAME, PARENT_ID, SEQ_NO, ROUTING, I_PATH, STATUS, TYPE) VALUES ('03b7d04c66c84686a113144aaa43a642', 'ENV_MAVEN', 'Maven中心', '4720566ad7c144b69858186d0764e5b3', '57', '/twinkle/console/env/maven', 'icon-envmaven', '1', '1');

-- 
INSERT INTO public.S_MENU(ID, CODE, NAME, PARENT_ID, SEQ_NO, ROUTING, I_PATH, STATUS, TYPE) VALUES ('3cda0396eaf8437c932be90ae2d2f168', 'MY_ATTRIBUTE', '我的参数', null, '90', '', 'icon-attr', '1', '3');
INSERT INTO public.S_MENU(ID, CODE, NAME, PARENT_ID, SEQ_NO, ROUTING, I_PATH, STATUS, TYPE) VALUES ('583732341fe649bc86328e63e2c34a64', 'ATTR_PRIMITIVE', '基础参数', '3cda0396eaf8437c932be90ae2d2f168', '91', '/twinkle/console/attr/primitive', 'icon-attrprimitive', '1', '3');
INSERT INTO public.S_MENU(ID, CODE, NAME, PARENT_ID, SEQ_NO, ROUTING, I_PATH, STATUS, TYPE) VALUES ('d81116bd2f2042b0b67b78f853a333ed', 'ATTR_STRUCT', '结构参数', '3cda0396eaf8437c932be90ae2d2f168', '92', '/twinkle/console/attr/struct', 'icon-attrstruct', '1', '3');
INSERT INTO public.S_MENU(ID, CODE, NAME, PARENT_ID, SEQ_NO, ROUTING, I_PATH, STATUS, TYPE) VALUES ('f8810b181bcf479db7f5c39961e66866', 'ATTR_PRIMITIVE_TYPE', '基础参数类型', '3cda0396eaf8437c932be90ae2d2f168', '93', '/twinkle/console/attr/primitivetype', 'icon-attrprimitivetype', '1', '3');
INSERT INTO public.S_MENU(ID, CODE, NAME, PARENT_ID, SEQ_NO, ROUTING, I_PATH, STATUS, TYPE) VALUES ('3f4b286f582e481493f082ebf5e7c52a', 'ATTR_PRIMITIVE_TYPE_MGMT', '基础参数类型管理', '3cda0396eaf8437c932be90ae2d2f168', '94', '/twinkle/console/attr/primitivetypemgmt', 'icon-attrprimitivetypemgmt', '1', '0');
INSERT INTO public.S_MENU(ID, CODE, NAME, PARENT_ID, SEQ_NO, ROUTING, I_PATH, STATUS, TYPE) VALUES ('401c18ce955f42f8999fe070dbff50de', 'ATTR_ATTR_TYPE_SQL_TYPE', 'SQL类型', '3cda0396eaf8437c932be90ae2d2f168', '95', '/twinkle/console/attr/primitivesql', 'icon-primitivesql', '1', '0');

-- 
-- Maven
INSERT INTO public.S_MENU(ID, CODE, NAME, PARENT_ID, SEQ_NO, ROUTING, I_PATH, STATUS, TYPE) VALUES ('09b40dd619884267bcb7142782b55bb1', 'MY_COMPONENT', '我的组件', null, '110', '', 'icon-composite', '1', '3');
INSERT INTO public.S_MENU(ID, CODE, NAME, PARENT_ID, SEQ_NO, ROUTING, I_PATH, STATUS, TYPE) VALUES ('2b8cc166c11744ba86bea7835f0395a8', 'COM_COMPONENT_LIST', '组件列表', '09b40dd619884267bcb7142782b55bb1', '111', '/twinkle/console/component/componentlist', 'icon-componentlist', '1', '3');
INSERT INTO public.S_MENU(ID, CODE, NAME, PARENT_ID, SEQ_NO, ROUTING, I_PATH, STATUS, TYPE) VALUES ('6a8bb9317aea4b0e99f186e52871d372', 'COM_MANAGEMENT', '组件管理', '09b40dd619884267bcb7142782b55bb1', '112', '/twinkle/console/component/componentlist', 'icon-componentmgmt', '1', '0');
INSERT INTO public.S_MENU(ID, CODE, NAME, PARENT_ID, SEQ_NO, ROUTING, I_PATH, STATUS, TYPE) VALUES ('190ae3005b7844699c8047061278d2ce', 'COM_CUSTOMIZE', '自定义组件', '09b40dd619884267bcb7142782b55bb1', '113', '/twinkle/console/component/customize', 'icon-comcustomize', '1', '3');

-- UI
INSERT INTO public.S_MENU(ID, CODE, NAME, PARENT_ID, SEQ_NO, ROUTING, I_PATH, STATUS, TYPE) VALUES ('72f51e072e094617bed209dcba6898e8', 'MY_METADATA', '元数据中心', null, '130', '', 'icon-metadata', '1', '1');
--INSERT INTO public.S_MENU(ID, CODE, NAME, PARENT_ID, SEQ_NO, ROUTING, I_PATH, STATUS, TYPE) VALUES ('97affd0-d44-484-809-22911d267b1c', 'MD_LIST', '元数据列表', '72f51e072e094617bed209dcba6898e8', '131', '/twinkle/console/metadata/list', 'icon-mdlist', '1', '1');
INSERT INTO public.S_MENU(ID, CODE, NAME, PARENT_ID, SEQ_NO, ROUTING, I_PATH, STATUS, TYPE) VALUES ('42fbbee04c6b4cabbc17c75bb344f167', 'MD_MANAGEMENT', '元数据管理', '72f51e072e094617bed209dcba6898e8', '132', '/twinkle/console/metadata/management', 'icon-mdmanagement', '0', '1');
INSERT INTO public.S_MENU(ID, CODE, NAME, PARENT_ID, SEQ_NO, ROUTING, I_PATH, STATUS, TYPE) VALUES ('e96d2552f73d49639242bedea10c9662', 'MG_TEMPLATE', '元数据模板', '72f51e072e094617bed209dcba6898e8', '133', '/twinkle/console/metadata/template', 'icon-mdtemplate', '1', '1');

-- 
INSERT INTO public.S_MENU(ID, CODE, NAME, PARENT_ID, SEQ_NO, ROUTING, I_PATH, STATUS, TYPE) VALUES ('04d07a027a4344b19cc0e001d8fc6d6c', 'MY_SYSTEMMANAGEMET', '系统管理', null, '150', '', 'icon-systemmgmt', '1', '3');
INSERT INTO public.S_MENU(ID, CODE, NAME, PARENT_ID, SEQ_NO, ROUTING, I_PATH, STATUS, TYPE) VALUES ('e380dd07b2c04ac19ecf7ebba60c2d02', 'SM_USER_MANAGEMENT', '用户管理', '04d07a027a4344b19cc0e001d8fc6d6c', '151', '/twinkle/console/systemmgmt/usermgmt', 'icon-smusermgmt', '1', '3');
INSERT INTO public.S_MENU(ID, CODE, NAME, PARENT_ID, SEQ_NO, ROUTING, I_PATH, STATUS, TYPE) VALUES ('a360e4b3ba3e48b09d3304f559efa240', 'SM_DEPT_MANAGEMENT', '部门管理', '04d07a027a4344b19cc0e001d8fc6d6c', '152', '/twinkle/console/systemmgmt/deptmgmt', 'icon-smdeptmgmt', '1', '3');
INSERT INTO public.S_MENU(ID, CODE, NAME, PARENT_ID, SEQ_NO, ROUTING, I_PATH, STATUS, TYPE) VALUES ('d76418e481f1421694de7f379fcdaa9c', 'SM_ROLE_MANAGEMENT', '角色管理', '04d07a027a4344b19cc0e001d8fc6d6c', '153', '/twinkle/console/systemmgmt/rolemgmt', 'icon-smrolemgmt', '1', '3');
INSERT INTO public.S_MENU(ID, CODE, NAME, PARENT_ID, SEQ_NO, ROUTING, I_PATH, STATUS, TYPE) VALUES ('7b3a2f94ad674b96a4cd2ae9f2e042b3', 'SM_MENU_MANAGEMENT', '菜单管理', '04d07a027a4344b19cc0e001d8fc6d6c', '154', '/twinkle/console/systemmgmt/privilegemgmt', 'icon-smprivilegemgmt', '1', '3');
INSERT INTO public.S_MENU(ID, CODE, NAME, PARENT_ID, SEQ_NO, ROUTING, I_PATH, STATUS, TYPE) VALUES ('b4a8959f4b66403b94f6decc105bd285', 'SM_DICTIONARY', '数据字典', '04d07a027a4344b19cc0e001d8fc6d6c', '155', '/twinkle/console/systemmgmt/dictionarymgmt', 'icon-smdictionarymgmt', '1', '3');
INSERT INTO public.S_MENU(ID, CODE, NAME, PARENT_ID, SEQ_NO, ROUTING, I_PATH, STATUS, TYPE) VALUES ('a9113c191d614f7b8e56df5f6eb47024', 'SM_RESULTCODE', '结果码', '04d07a027a4344b19cc0e001d8fc6d6c', '156', '/twinkle/console/systemmgmt/resultcodemgmt', 'icon-smresultcodemgmt', '1', '3');
INSERT INTO public.S_MENU(ID, CODE, NAME, PARENT_ID, SEQ_NO, ROUTING, I_PATH, STATUS, TYPE) VALUES ('facf6d15fcbf4ba5a8906f0ada217309', 'SM_TENANT_MANAGEMENT', '租户管理', '04d07a027a4344b19cc0e001d8fc6d6c', '157', '/twinkle/console/systemmgmt/tenantmgmt', 'icon-tenantemgmt', '1', '1');

-- ==================================================================
-- *        Going to initialize the User Related Records.           *
-- ==================================================================

-- Add Initial System Provider Tenant.  uuid_generate_v4()
TRUNCATE TABLE public.U_TENANT RESTART IDENTITY CASCADE;
INSERT INTO PUBLIC.U_TENANT(ID, CODE, NAME, LOGO, TYPE, STATUS) VALUES ('77844cadb6e543b18ed31218bd5b5091', 'TWINKLE TECH', 'TWINKLE TECH', 'icon-twinkle', '0', '1');

-- Add Initial System Administor Role.  uuid_generate_v4()
TRUNCATE TABLE public.U_ROLE RESTART IDENTITY CASCADE;
INSERT INTO PUBLIC.U_ROLE(ID, CODE, NAME, TYPE, STATUS) VALUES ('bf6a4882aa7f4181837eacda967aae69', 'R_ROOT', '超级管理员', '0', '1');
INSERT INTO PUBLIC.U_ROLE(ID, CODE, NAME, TYPE, STATUS) VALUES ('6be21a762a7f45ac886dcd14e3a6e577', 'R_ADMINISTRATOR', '系统管理员', '0', '1');
INSERT INTO PUBLIC.U_ROLE(ID, CODE, NAME, TYPE, STATUS) VALUES ('3b0b8bef17a2410dbce120baadaa099a', 'R_ARCHITECT', '系统架构师', '0', '1');
INSERT INTO PUBLIC.U_ROLE(ID, CODE, NAME, TYPE, STATUS) VALUES ('2c8ad48fba6d4c3b89477a2dd7229271', 'R_PROJECT_MANAGER', '项目经理', '0', '1');
INSERT INTO PUBLIC.U_ROLE(ID, CODE, NAME, TYPE, STATUS) VALUES ('fb07604ac2f941e3904499a4e394bc1a', 'R_DEVELPTER', '研发', '0', '1');
INSERT INTO PUBLIC.U_ROLE(ID, CODE, NAME, TYPE, STATUS) VALUES ('818bae8b087d46b9aa128e58ba004bd7', 'R_TESTER', '测试', '0', '1');
INSERT INTO PUBLIC.U_ROLE(ID, CODE, NAME, TYPE, STATUS) VALUES ('a321fa0454f04940a5a3745c06855563', 'R_OPERATOR', '运维', '0', '1');
INSERT INTO PUBLIC.U_ROLE(ID, CODE, NAME, TYPE, STATUS) VALUES ('2a15389f32264756bb16d7566dcb30c4', 'R_DEFAULT', '默认', '0', '1');

-- Grant the menu privileges to the Adminitor role.  uuid_generate_v4()
TRUNCATE TABLE public.U_ROLE_MENU_MAP RESTART IDENTITY CASCADE;
-- Initialize ROOT Role's menu list.
INSERT INTO PUBLIC.U_ROLE_MENU_MAP(MENU_ID, ROLE_ID, STATUS) VALUES ('9420d480d3e84c478cb2a0e619c68bbc', 'bf6a4882aa7f4181837eacda967aae69', '1');
INSERT INTO PUBLIC.U_ROLE_MENU_MAP(MENU_ID, ROLE_ID, STATUS) VALUES ('7f5d90aeccba4a4087af48347b3991a1', 'bf6a4882aa7f4181837eacda967aae69', '1');
INSERT INTO PUBLIC.U_ROLE_MENU_MAP(MENU_ID, ROLE_ID, STATUS) VALUES ('481535c11e7e4913a32a48d45fd741eb', 'bf6a4882aa7f4181837eacda967aae69', '1');
INSERT INTO PUBLIC.U_ROLE_MENU_MAP(MENU_ID, ROLE_ID, STATUS) VALUES ('3887c84c9e924050a7185725cdd2a882', 'bf6a4882aa7f4181837eacda967aae69', '1');
INSERT INTO PUBLIC.U_ROLE_MENU_MAP(MENU_ID, ROLE_ID, STATUS) VALUES ('bff16749df4b44fe94526f3952371cb7', 'bf6a4882aa7f4181837eacda967aae69', '1');
INSERT INTO PUBLIC.U_ROLE_MENU_MAP(MENU_ID, ROLE_ID, STATUS) VALUES ('52d5de5b11f140aebbe382fb720b9c99', 'bf6a4882aa7f4181837eacda967aae69', '1');
INSERT INTO PUBLIC.U_ROLE_MENU_MAP(MENU_ID, ROLE_ID, STATUS) VALUES ('b04c87cad65440ce8491942f5f10d82e', 'bf6a4882aa7f4181837eacda967aae69', '1');
INSERT INTO PUBLIC.U_ROLE_MENU_MAP(MENU_ID, ROLE_ID, STATUS) VALUES ('62748fd13d9049149a6987d9ddd2ce08', 'bf6a4882aa7f4181837eacda967aae69', '1');
INSERT INTO PUBLIC.U_ROLE_MENU_MAP(MENU_ID, ROLE_ID, STATUS) VALUES ('fcd6af44935b450aa3e611774932a10b', 'bf6a4882aa7f4181837eacda967aae69', '1');
INSERT INTO PUBLIC.U_ROLE_MENU_MAP(MENU_ID, ROLE_ID, STATUS) VALUES ('a41fd9e2d3d64f8389cf6da508f29464', 'bf6a4882aa7f4181837eacda967aae69', '1');
INSERT INTO PUBLIC.U_ROLE_MENU_MAP(MENU_ID, ROLE_ID, STATUS) VALUES ('8821f9b28f3e405483f48cb2918233a4', 'bf6a4882aa7f4181837eacda967aae69', '1');
INSERT INTO PUBLIC.U_ROLE_MENU_MAP(MENU_ID, ROLE_ID, STATUS) VALUES ('43348007ed9f493498fe490ee75f2947', 'bf6a4882aa7f4181837eacda967aae69', '1');
INSERT INTO PUBLIC.U_ROLE_MENU_MAP(MENU_ID, ROLE_ID, STATUS) VALUES ('4720566ad7c144b69858186d0764e5b3', 'bf6a4882aa7f4181837eacda967aae69', '1');
INSERT INTO PUBLIC.U_ROLE_MENU_MAP(MENU_ID, ROLE_ID, STATUS) VALUES ('1bfef86ab35b409d8ddadbbe70dd73e9', 'bf6a4882aa7f4181837eacda967aae69', '1');
INSERT INTO PUBLIC.U_ROLE_MENU_MAP(MENU_ID, ROLE_ID, STATUS) VALUES ('c2783e3af3bd4330bdabeb809eec7d6d', 'bf6a4882aa7f4181837eacda967aae69', '1');
INSERT INTO PUBLIC.U_ROLE_MENU_MAP(MENU_ID, ROLE_ID, STATUS) VALUES ('3b7e766dd1d74d2eba5a2d4a144a16f5', 'bf6a4882aa7f4181837eacda967aae69', '1');
INSERT INTO PUBLIC.U_ROLE_MENU_MAP(MENU_ID, ROLE_ID, STATUS) VALUES ('02f3c50fef07470eb2face8abac6f404', 'bf6a4882aa7f4181837eacda967aae69', '1');
INSERT INTO PUBLIC.U_ROLE_MENU_MAP(MENU_ID, ROLE_ID, STATUS) VALUES ('4ae7af009696497295d5056241659dcb', 'bf6a4882aa7f4181837eacda967aae69', '1');
INSERT INTO PUBLIC.U_ROLE_MENU_MAP(MENU_ID, ROLE_ID, STATUS) VALUES ('9d9ebb718e77468da6c01627639a8156', 'bf6a4882aa7f4181837eacda967aae69', '1');
INSERT INTO PUBLIC.U_ROLE_MENU_MAP(MENU_ID, ROLE_ID, STATUS) VALUES ('03b7d04c66c84686a113144aaa43a642', 'bf6a4882aa7f4181837eacda967aae69', '1');
INSERT INTO PUBLIC.U_ROLE_MENU_MAP(MENU_ID, ROLE_ID, STATUS) VALUES ('3cda0396eaf8437c932be90ae2d2f168', 'bf6a4882aa7f4181837eacda967aae69', '1');
INSERT INTO PUBLIC.U_ROLE_MENU_MAP(MENU_ID, ROLE_ID, STATUS) VALUES ('583732341fe649bc86328e63e2c34a64', 'bf6a4882aa7f4181837eacda967aae69', '1');
INSERT INTO PUBLIC.U_ROLE_MENU_MAP(MENU_ID, ROLE_ID, STATUS) VALUES ('d81116bd2f2042b0b67b78f853a333ed', 'bf6a4882aa7f4181837eacda967aae69', '1');
INSERT INTO PUBLIC.U_ROLE_MENU_MAP(MENU_ID, ROLE_ID, STATUS) VALUES ('f8810b181bcf479db7f5c39961e66866', 'bf6a4882aa7f4181837eacda967aae69', '1');
INSERT INTO PUBLIC.U_ROLE_MENU_MAP(MENU_ID, ROLE_ID, STATUS) VALUES ('3f4b286f582e481493f082ebf5e7c52a', 'bf6a4882aa7f4181837eacda967aae69', '1');
INSERT INTO PUBLIC.U_ROLE_MENU_MAP(MENU_ID, ROLE_ID, STATUS) VALUES ('401c18ce955f42f8999fe070dbff50de', 'bf6a4882aa7f4181837eacda967aae69', '1');
INSERT INTO PUBLIC.U_ROLE_MENU_MAP(MENU_ID, ROLE_ID, STATUS) VALUES ('09b40dd619884267bcb7142782b55bb1', 'bf6a4882aa7f4181837eacda967aae69', '1');
INSERT INTO PUBLIC.U_ROLE_MENU_MAP(MENU_ID, ROLE_ID, STATUS) VALUES ('2b8cc166c11744ba86bea7835f0395a8', 'bf6a4882aa7f4181837eacda967aae69', '1');
INSERT INTO PUBLIC.U_ROLE_MENU_MAP(MENU_ID, ROLE_ID, STATUS) VALUES ('6a8bb9317aea4b0e99f186e52871d372', 'bf6a4882aa7f4181837eacda967aae69', '1');
INSERT INTO PUBLIC.U_ROLE_MENU_MAP(MENU_ID, ROLE_ID, STATUS) VALUES ('190ae3005b7844699c8047061278d2ce', 'bf6a4882aa7f4181837eacda967aae69', '1');
INSERT INTO PUBLIC.U_ROLE_MENU_MAP(MENU_ID, ROLE_ID, STATUS) VALUES ('72f51e072e094617bed209dcba6898e8', 'bf6a4882aa7f4181837eacda967aae69', '1');
INSERT INTO PUBLIC.U_ROLE_MENU_MAP(MENU_ID, ROLE_ID, STATUS) VALUES ('97affd10d4f44854804922911d267b1c', 'bf6a4882aa7f4181837eacda967aae69', '1');
INSERT INTO PUBLIC.U_ROLE_MENU_MAP(MENU_ID, ROLE_ID, STATUS) VALUES ('42fbbee04c6b4cabbc17c75bb344f167', 'bf6a4882aa7f4181837eacda967aae69', '1');
INSERT INTO PUBLIC.U_ROLE_MENU_MAP(MENU_ID, ROLE_ID, STATUS) VALUES ('e96d2552f73d49639242bedea10c9662', 'bf6a4882aa7f4181837eacda967aae69', '1');
INSERT INTO PUBLIC.U_ROLE_MENU_MAP(MENU_ID, ROLE_ID, STATUS) VALUES ('04d07a027a4344b19cc0e001d8fc6d6c', 'bf6a4882aa7f4181837eacda967aae69', '1');
INSERT INTO PUBLIC.U_ROLE_MENU_MAP(MENU_ID, ROLE_ID, STATUS) VALUES ('e380dd07b2c04ac19ecf7ebba60c2d02', 'bf6a4882aa7f4181837eacda967aae69', '1');
INSERT INTO PUBLIC.U_ROLE_MENU_MAP(MENU_ID, ROLE_ID, STATUS) VALUES ('a360e4b3ba3e48b09d3304f559efa240', 'bf6a4882aa7f4181837eacda967aae69', '1');
INSERT INTO PUBLIC.U_ROLE_MENU_MAP(MENU_ID, ROLE_ID, STATUS) VALUES ('d76418e481f1421694de7f379fcdaa9c', 'bf6a4882aa7f4181837eacda967aae69', '1');
INSERT INTO PUBLIC.U_ROLE_MENU_MAP(MENU_ID, ROLE_ID, STATUS) VALUES ('7b3a2f94ad674b96a4cd2ae9f2e042b3', 'bf6a4882aa7f4181837eacda967aae69', '1');
INSERT INTO PUBLIC.U_ROLE_MENU_MAP(MENU_ID, ROLE_ID, STATUS) VALUES ('b4a8959f4b66403b94f6decc105bd285', 'bf6a4882aa7f4181837eacda967aae69', '1');
INSERT INTO PUBLIC.U_ROLE_MENU_MAP(MENU_ID, ROLE_ID, STATUS) VALUES ('a9113c191d614f7b8e56df5f6eb47024', 'bf6a4882aa7f4181837eacda967aae69', '1');
INSERT INTO PUBLIC.U_ROLE_MENU_MAP(MENU_ID, ROLE_ID, STATUS) VALUES ('facf6d15fcbf4ba5a8906f0ada217309', 'bf6a4882aa7f4181837eacda967aae69', '1');
-- Initialize DEFAULT Role's menu list.
INSERT INTO PUBLIC.U_ROLE_MENU_MAP(MENU_ID, ROLE_ID, STATUS) VALUES ('9420d480d3e84c478cb2a0e619c68bbc', '2a15389f32264756bb16d7566dcb30c4', '1');
