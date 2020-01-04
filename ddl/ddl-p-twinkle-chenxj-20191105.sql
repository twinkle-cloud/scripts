
\c t_twinkle;

-- Create the trigger for update the UPDATE_DATE when updating some rows.
CREATE OR REPLACE FUNCTION T_UPDATE_DATE()
RETURNS TRIGGER AS $$
BEGIN
  NEW.UPDATE_DATE = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- ==================================================================
-- * Going to build the System Management domain related entries.   *
-- ==================================================================
-- Going to create Table: public."S_SYSDICTIONARY"
DROP TABLE IF EXISTS public.S_SYSDICTIONARY CASCADE;
CREATE TABLE public.S_SYSDICTIONARY
(
    ID serial primary key,
    OWNER character varying(255),
    FIELD character varying(255),
    VALUE character varying(64),
    CODE character varying(255),
    TEXT character varying(255),
    STATUS smallint,
    TYPE smallint DEFAULT 1,
    COMMENTS character varying(255),
    CREATOR_ID bigint,
    TENANT_ID character(36),
    CREATE_DATE timestamp(0) with time zone DEFAULT now(),
    UPDATE_DATE timestamp(0) with time zone DEFAULT now(),
    UNIQUE(OWNER, FIELD, VALUE, STATUS)
);

ALTER TABLE public.S_SYSDICTIONARY OWNER to admin;
COMMENT ON COLUMN public.S_SYSDICTIONARY.ID IS 'ID';
COMMENT ON COLUMN public.S_SYSDICTIONARY.OWNER IS '字典属主，亦即类型';
COMMENT ON COLUMN public.S_SYSDICTIONARY.FIELD IS '属主属性';
COMMENT ON COLUMN public.S_SYSDICTIONARY.VALUE IS '字典的实际的值，一般为序号';
COMMENT ON COLUMN public.S_SYSDICTIONARY.CODE IS '字典的含义值，一般用作下拉框的Code';
COMMENT ON COLUMN public.S_SYSDICTIONARY.TEXT IS '字典的UI显示值，一般为下拉框中文描述';
COMMENT ON COLUMN public.S_SYSDICTIONARY.STATUS IS '字典的状态，参考字典的GLOBAL.STATUS';
COMMENT ON COLUMN public.S_SYSDICTIONARY.TYPE IS '字典的类型:系统类型，自定义类型，参考字典的SYSDICTIONARY.TYPE';
COMMENT ON COLUMN public.S_SYSDICTIONARY.COMMENTS IS '字典的附加描述';

-- Enable the trigger to update the UPDATE_DATE automatically.
CREATE TRIGGER T_UD_S_SYSDICTIONARY BEFORE UPDATE ON public.S_SYSDICTIONARY
FOR EACH ROW
EXECUTE PROCEDURE public.T_UPDATE_DATE();


-- Going to create Table: public."S_RESULT_CODE"
DROP TABLE IF EXISTS public.S_RESULT_CODE CASCADE;
CREATE TABLE public.S_RESULT_CODE
(
    ID serial primary key,
    CATEGORY smallint,
    MODULE smallint,
    CODE character varying(16),
    DESCRIPTION character varying(255),
    TYPE smallint DEFAULT 1,
    CREATOR_ID bigint,
    TENANT_ID character(36),
    CREATE_DATE timestamp(0) with time zone DEFAULT now(),
    UPDATE_DATE timestamp(0) with time zone DEFAULT now(),
    UNIQUE(CODE)
);

ALTER TABLE public.S_RESULT_CODE OWNER to admin;
COMMENT ON COLUMN public.S_RESULT_CODE.ID IS 'ID';
COMMENT ON COLUMN public.S_RESULT_CODE.CATEGORY IS '结果码所属类别';
COMMENT ON COLUMN public.S_RESULT_CODE.MODULE IS '结果码所属模块';
COMMENT ON COLUMN public.S_RESULT_CODE.CODE IS '实际的16进制结果码';
COMMENT ON COLUMN public.S_RESULT_CODE.TYPE IS '结果码的类型：参考数据字典';
COMMENT ON COLUMN public.S_RESULT_CODE.DESCRIPTION IS '结果码的描述';

-- Enable the trigger to update the UPDATE_DATE automatically.
CREATE TRIGGER T_UD_S_RESULT_CODE BEFORE UPDATE ON public.S_RESULT_CODE
FOR EACH ROW
EXECUTE PROCEDURE T_UPDATE_DATE();

-- Going to create Table: public.S_VERSION
DROP TABLE IF EXISTS public.S_VERSION CASCADE;
CREATE TABLE public.S_VERSION
(
    ID serial primary key,
    CODE character varying(255),
    NAME character varying(255),
    MAIN_NO smallint DEFAULT 0,
    SUB_NO SMALLINT DEFAULT 1,
    MINOR_NO smallint DEFAULT 0,
    OWNER_TYPE smallint,
    OWNER_ID integer,
    DESCRIPTION character varying(255),
    CREATOR_ID bigint,
    TENANT_ID character(36),
    CREATE_DATE timestamp(0) with time zone DEFAULT now(),
    UPDATE_DATE timestamp(0) with time zone DEFAULT now()
);

ALTER TABLE public.S_VERSION OWNER to admin;
COMMENT ON COLUMN public.S_VERSION.ID IS 'ID';
COMMENT ON COLUMN public.S_VERSION.CODE IS '版本的编码';
COMMENT ON COLUMN public.S_VERSION.NAME IS '版本的名字';
COMMENT ON COLUMN public.S_VERSION.MAIN_NO IS '版本的大版本号';
COMMENT ON COLUMN public.S_VERSION.SUB_NO IS '版本的子版本号';
COMMENT ON COLUMN public.S_VERSION.MINOR_NO IS '版本的修正版本号';
COMMENT ON COLUMN public.S_VERSION.OWNER_TYPE IS '版本的拥有者的类型：STANDARD SERVICE, PROJECT, SERVICE, ENTRY; 参考数据字典：VERSION.OWNER_TYPE';
COMMENT ON COLUMN public.S_VERSION.OWNER_ID IS '版本的拥有者的ID';
COMMENT ON COLUMN public.S_VERSION.DESCRIPTION IS '版本的描述';

-- Enable the trigger to update the UPDATE_DATE automatically.
CREATE TRIGGER T_UD_S_VERSION BEFORE UPDATE ON public.S_VERSION
FOR EACH ROW
EXECUTE PROCEDURE T_UPDATE_DATE();

-- Going to create Table: public.S_MENU
DROP TABLE IF EXISTS public.S_MENU CASCADE;
CREATE TABLE public.S_MENU
(
    ID character(36) primary key,
    CODE character varying(255),
    NAME character varying(255),
    PARENT_ID character(36),
    SEQ_NO smallint DEFAULT 1,
    STATUS smallint DEFAULT 1,
    ROUTING character varying(255),
    I_PATH character varying(255),
    TYPE smallint DEFAULT 1,
    CREATOR_ID bigint,
    CREATE_DATE timestamp(0) with time zone DEFAULT now(),
    UPDATE_DATE timestamp(0) with time zone DEFAULT now()
);

ALTER TABLE public.S_MENU OWNER to admin;
COMMENT ON COLUMN public.S_MENU.ID IS 'ID';
COMMENT ON COLUMN public.S_MENU.CODE IS '菜单的编码';
COMMENT ON COLUMN public.S_MENU.NAME IS '菜单的名字';
COMMENT ON COLUMN public.S_MENU.PARENT_ID IS '菜单的父菜单';
COMMENT ON COLUMN public.S_MENU.SEQ_NO IS '菜单的显示序列号';
COMMENT ON COLUMN public.S_MENU.STATUS IS '菜单的状态，参考GLOBAL.STATUS';
COMMENT ON COLUMN public.S_MENU.ROUTING IS '菜单的路由键值';
COMMENT ON COLUMN public.S_MENU.I_PATH IS '菜单的图标路径';
COMMENT ON COLUMN public.S_MENU.TYPE IS '菜单的类型，UI端显示菜单，控制台菜单，UI控制台共用菜单，保留菜单';

-- Enable the trigger to update the UPDATE_DATE automatically.
CREATE TRIGGER T_UD_S_MENU BEFORE UPDATE ON public.S_MENU
FOR EACH ROW
EXECUTE PROCEDURE T_UPDATE_DATE();

-- ==================================================================
-- *      Going to build the Meta data domain related entries.      *
-- ==================================================================

-- Going to create Table: public.T_META_DATA_ITEM
DROP TABLE IF EXISTS public.T_META_DATA_ITEM CASCADE;
CREATE TABLE public.T_META_DATA_ITEM
(
    ID character (36) primary key,
    CODE character varying(255) NOT NULL,
    NAME character varying(255) NOT NULL,
    LABEL character varying(255) NOT NULL,
    TYPE smallint,
    STATUS smallint,
    DEFAULT_VALUE character varying(255),
    VALUE_TYPE smallint,
    PLACEHOLDER_TIP character varying(255),
    TIP character varying(255),
    REGEX character varying(255),
    REGEX_MSG character varying(255),
    CREATOR_ID bigint,
    TENANT_ID character(36),
    CREATE_DATE timestamp(0) with time zone DEFAULT now(),
    UPDATE_DATE timestamp(0) with time zone DEFAULT now()
);

ALTER TABLE public.T_META_DATA_ITEM OWNER to admin;
COMMENT ON COLUMN public.T_META_DATA_ITEM.ID IS 'ID';
COMMENT ON COLUMN public.T_META_DATA_ITEM.CODE IS '元数据元素的编码';
COMMENT ON COLUMN public.T_META_DATA_ITEM.NAME IS '元数据元素的名称';
COMMENT ON COLUMN public.T_META_DATA_ITEM.LABEL IS '元数据元素UI端显示名字';
COMMENT ON COLUMN public.T_META_DATA_ITEM.TYPE IS '元素的类型，参考META_DATA_ITEM.TYPE';
COMMENT ON COLUMN public.T_META_DATA_ITEM.STATUS IS '元素的状态，参考GLOBAL.STATUS';
COMMENT ON COLUMN public.T_META_DATA_ITEM.DEFAULT_VALUE IS '元素的默认的值';
COMMENT ON COLUMN public.T_META_DATA_ITEM.VALUE_TYPE IS '元素的值类型，参考META_DATA_ITEM.VALUE_TYPE';
COMMENT ON COLUMN public.T_META_DATA_ITEM.PLACEHOLDER_TIP IS 'UI中组件的PlaceHolder显示文本';
COMMENT ON COLUMN public.T_META_DATA_ITEM.TIP IS 'UI中组件的选中状态时的TIP';
COMMENT ON COLUMN public.T_META_DATA_ITEM.REGEX IS 'UI中组件的值的正则表达式';
COMMENT ON COLUMN public.T_META_DATA_ITEM.REGEX_MSG IS 'UI中组件的正则校验失败的提示';

-- Enable the trigger to update the UPDATE_DATE automatically.
CREATE TRIGGER T_UD_T_META_DATA_ITEM BEFORE UPDATE ON public.T_META_DATA_ITEM
FOR EACH ROW
EXECUTE PROCEDURE T_UPDATE_DATE();

-- Going to create Table: public.T_META_DATA_ITEM_REF_VALUE
DROP TABLE IF EXISTS public.T_META_DATA_ITEM_REF_VALUE CASCADE;
CREATE TABLE public.T_META_DATA_ITEM_REF_VALUE
(
    ID character (36) primary key,
    ADDRESS character varying(255),
    META_DATA_ITEM_ID character (36) REFERENCES T_META_DATA_ITEM(ID),
    CREATE_DATE timestamp(0) with time zone DEFAULT now(),
    UPDATE_DATE timestamp(0) with time zone DEFAULT now()
);

ALTER TABLE public.T_META_DATA_ITEM_REF_VALUE OWNER to admin;
COMMENT ON COLUMN public.T_META_DATA_ITEM_REF_VALUE.ID IS 'ID';
COMMENT ON COLUMN public.T_META_DATA_ITEM_REF_VALUE.ADDRESS IS '获取引用数据的API地址';
COMMENT ON COLUMN public.T_META_DATA_ITEM_REF_VALUE.META_DATA_ITEM_ID IS '外键元数据元素的ID';

-- Enable the trigger to update the UPDATE_DATE automatically.
CREATE TRIGGER T_UD_T_META_DATA_ITEM_REF_VALUE BEFORE UPDATE ON public.T_META_DATA_ITEM_REF_VALUE
FOR EACH ROW
EXECUTE PROCEDURE T_UPDATE_DATE();

-- Going to create Table: public.T_META_DATA_ITEM_ENTRY_REF_VALUE
DROP TABLE IF EXISTS public.T_META_DATA_ITEM_ENTRY_REF_VALUE CASCADE;
CREATE TABLE public.T_META_DATA_ITEM_ENTRY_REF_VALUE
(
    ID character (36) primary key,
    QUERY_URL character varying(255),
    VALUE_URL character varying(255),
    ENTRY_TEMPLATE_TYPE smallint,
    META_DATA_ITEM_ID character (36) REFERENCES T_META_DATA_ITEM(ID),
    CREATE_DATE timestamp(0) with time zone DEFAULT now(),
    UPDATE_DATE timestamp(0) with time zone DEFAULT now()
);

ALTER TABLE public.T_META_DATA_ITEM_ENTRY_REF_VALUE OWNER to admin;
COMMENT ON COLUMN public.T_META_DATA_ITEM_ENTRY_REF_VALUE.ID IS 'ID';
COMMENT ON COLUMN public.T_META_DATA_ITEM_ENTRY_REF_VALUE.QUERY_URL IS '组件引用新增查询模板地址';
COMMENT ON COLUMN public.T_META_DATA_ITEM_ENTRY_REF_VALUE.VALUE_URL IS '组件引用编辑/查看时查询模板实例地址';
COMMENT ON COLUMN public.T_META_DATA_ITEM_ENTRY_REF_VALUE.ENTRY_TEMPLATE_TYPE IS '组件模板类型，参考数据字典：ENTRY_TEMPLATE.TYPE';
COMMENT ON COLUMN public.T_META_DATA_ITEM_ENTRY_REF_VALUE.META_DATA_ITEM_ID IS '外键元数据元素的ID';

-- Enable the trigger to update the UPDATE_DATE automatically.
CREATE TRIGGER T_UD_T_META_DATA_ITEM_REF_VALUE BEFORE UPDATE ON public.T_META_DATA_ITEM_REF_VALUE
FOR EACH ROW
EXECUTE PROCEDURE T_UPDATE_DATE();

-- Going to create Table: public.T_META_DATA_ITEM_DIC_VALUE
DROP TABLE IF EXISTS public.T_META_DATA_ITEM_DIC_VALUE CASCADE;
CREATE TABLE public.T_META_DATA_ITEM_DIC_VALUE
(
    ID character (36) primary key,
    OWNER character varying(255) NOT NULL,
    FILED character varying(255),
    META_DATA_ITEM_ID character (36) REFERENCES T_META_DATA_ITEM(ID),
    CREATE_DATE timestamp(0) with time zone DEFAULT now(),
    UPDATE_DATE timestamp(0) with time zone DEFAULT now()
);

ALTER TABLE public.T_META_DATA_ITEM_DIC_VALUE OWNER to admin;
COMMENT ON COLUMN public.T_META_DATA_ITEM_DIC_VALUE.ID IS 'ID';
COMMENT ON COLUMN public.T_META_DATA_ITEM_DIC_VALUE.OWNER IS '数据字典属主';
COMMENT ON COLUMN public.T_META_DATA_ITEM_DIC_VALUE.FILED IS '数据字典属主属性，如果为空，则将属主记录均查询出来';
COMMENT ON COLUMN public.T_META_DATA_ITEM_DIC_VALUE.META_DATA_ITEM_ID IS '外键元数据元素的ID';

-- Enable the trigger to update the UPDATE_DATE automatically.
CREATE TRIGGER T_UD_T_META_DATA_ITEM_DIC_VALUE BEFORE UPDATE ON public.T_META_DATA_ITEM_DIC_VALUE
FOR EACH ROW
EXECUTE PROCEDURE T_UPDATE_DATE();

-- Going to create Table: public.T_META_DATA_EXPRESSION
-- Contains Expression Template and UI Template, and Setting Template.
DROP TABLE IF EXISTS public.T_META_DATA_TEMPLATE CASCADE;
CREATE TABLE public.T_META_DATA_TEMPLATE
(
    ID character (36) primary key,
    CODE character varying(255) NOT NULL,
    NAME character varying(255) NOT NULL,
    LABEL character varying(255) NOT NULL,
    DESCRIPTION text,
    TYPE smallint DEFAULT 0,
    STATUS smallint DEFAULT 1, 
    VALUE_TYPE smallint DEFAULT 0,
    VALUE_DELIMETER character varying(4) default ',',
    CREATOR_ID bigint,
    TENANT_ID character(36),
    CREATE_DATE timestamp(0) with time zone DEFAULT now(),
    UPDATE_DATE timestamp(0) with time zone DEFAULT now()
);

ALTER TABLE public.T_META_DATA_TEMPLATE OWNER to admin;
COMMENT ON COLUMN public.T_META_DATA_TEMPLATE.ID IS 'ID';
COMMENT ON COLUMN public.T_META_DATA_TEMPLATE.CODE IS '模板的编码';
COMMENT ON COLUMN public.T_META_DATA_TEMPLATE.NAME IS '模板的名字';
COMMENT ON COLUMN public.T_META_DATA_TEMPLATE.LABEL IS '模板UI端显示的名字';
COMMENT ON COLUMN public.T_META_DATA_TEMPLATE.DESCRIPTION IS 'Template的描述，一般用来描述该表达式的样式及使用方式';
COMMENT ON COLUMN public.T_META_DATA_TEMPLATE.TYPE IS 'Template的类型：UI表单模板，UI表格模板，普通类型，基础操作，条件类型等，参考数据字典';
COMMENT ON COLUMN public.T_META_DATA_TEMPLATE.STATUS IS 'Template的状态，参考数据字典GLOBAL.STATUS';
COMMENT ON COLUMN public.T_META_DATA_TEMPLATE.VALUE_TYPE IS 'Template的输出值类型：String，数组，JSON等，参考数据字典GLOBAL.VALUE_TYPE, 默认为字符串';
COMMENT ON COLUMN public.T_META_DATA_TEMPLATE.VALUE_DELIMETER IS 'Template的输出值类型默认为字符串时才有用，用来拼接字符串';

-- Enable the trigger to update the UPDATE_DATE automatically.
CREATE TRIGGER T_UD_T_META_DATA_TEMPLATE BEFORE UPDATE ON public.T_META_DATA_TEMPLATE
FOR EACH ROW
EXECUTE PROCEDURE T_UPDATE_DATE();

-- Going to create Table: public.T_META_DATA_ITEM_TEMPLATE_MAP
DROP TABLE IF EXISTS public.T_META_DATA_ITEM_TEMPLATE_MAP CASCADE;
CREATE TABLE public.T_META_DATA_ITEM_TEMPLATE_MAP
(
    ID character (36) primary key,
    META_DATA_ITEM_ID character (36) REFERENCES T_META_DATA_ITEM(ID),
    META_DATA_TEMPLATE_ID character (36) REFERENCES T_META_DATA_TEMPLATE(ID),
    VISIBLE bool DEFAULT true,
    EIDITABLE bool DEFAULT true,
    MANDATORY bool DEFAULT true,
    SEQ_NO smallint DEFAULT 1, 
    STATUS smallint DEFAULT 1, 
    VALUE_FROM character varying(255),
    VALUE_MIN character varying(255),
    VALUE_MAX character varying(255),
    VALUE_MSG character varying(255),
    CREATE_DATE timestamp(0) with time zone DEFAULT now(),
    UPDATE_DATE timestamp(0) with time zone DEFAULT now()
);

ALTER TABLE public.T_META_DATA_ITEM_TEMPLATE_MAP OWNER to admin;
COMMENT ON COLUMN public.T_META_DATA_ITEM_TEMPLATE_MAP.ID IS 'ID';
COMMENT ON COLUMN public.T_META_DATA_ITEM_TEMPLATE_MAP.META_DATA_ITEM_ID IS '表达式和元素映射关系中元素的ID';
COMMENT ON COLUMN public.T_META_DATA_ITEM_TEMPLATE_MAP.META_DATA_TEMPLATE_ID IS '表达式和元素映射关系中表达式的ID';
COMMENT ON COLUMN public.T_META_DATA_ITEM_TEMPLATE_MAP.VISIBLE IS '表达式和元素映射在UI端是否可见';
COMMENT ON COLUMN public.T_META_DATA_ITEM_TEMPLATE_MAP.EIDITABLE IS '表达式和元素映射在UI端是否可编辑';
COMMENT ON COLUMN public.T_META_DATA_ITEM_TEMPLATE_MAP.MANDATORY IS '表达式和元素映射在UI端是否必填';
COMMENT ON COLUMN public.T_META_DATA_ITEM_TEMPLATE_MAP.SEQ_NO IS '表达式和元素映射在UI端的显示顺序';
COMMENT ON COLUMN public.T_META_DATA_ITEM_TEMPLATE_MAP.STATUS IS '表达式和元素映射的状态，参考数据字典GLOBAL.STATUS';
COMMENT ON COLUMN public.T_META_DATA_ITEM_TEMPLATE_MAP.VALUE_FROM IS '表达式和元素映射的值来源：可以以{}来引用UI中其它组件的值';
COMMENT ON COLUMN public.T_META_DATA_ITEM_TEMPLATE_MAP.VALUE_MIN IS '表达式和元素映射的最小值：可以以{}来引用UI中其它组件的值';
COMMENT ON COLUMN public.T_META_DATA_ITEM_TEMPLATE_MAP.VALUE_MAX IS '表达式和元素映射的最大值：可以以{}来引用UI中其它组件的值';
COMMENT ON COLUMN public.T_META_DATA_ITEM_TEMPLATE_MAP.VALUE_MSG IS '表达式和元素映射的值校验失败时的提示消息';

-- Enable the trigger to update the UPDATE_DATE automatically.
CREATE TRIGGER T_UD_T_META_DATA_ITEM_TEMPLATE_MAP BEFORE UPDATE ON public.T_META_DATA_ITEM_TEMPLATE_MAP
FOR EACH ROW
EXECUTE PROCEDURE T_UPDATE_DATE();

-- Going to create Table: public.T_ENTRY_TEMPLATE
DROP TABLE IF EXISTS public.T_ENTRY_TEMPLATE CASCADE;
CREATE TABLE public.T_ENTRY_TEMPLATE
(
    ID character (36) primary key,
    CODE character varying(255) NOT NULL,
    NAME character varying(255) NOT NULL,
    LABEL character varying(255) NOT NULL,
    DESCRIPTION text,
    TYPE smallint,
    STATUS smallint,
    VERSION_ID integer NOT NULL,
    CREATOR_ID bigint,
    TENANT_ID character(36),
    CREATE_DATE timestamp(0) with time zone DEFAULT now(),
    UPDATE_DATE timestamp(0) with time zone DEFAULT now()
);

ALTER TABLE public.T_ENTRY_TEMPLATE OWNER to admin;
COMMENT ON COLUMN public.T_ENTRY_TEMPLATE.ID IS 'ID';
COMMENT ON COLUMN public.T_ENTRY_TEMPLATE.CODE IS 'Entry模板的编码';
COMMENT ON COLUMN public.T_ENTRY_TEMPLATE.NAME IS 'Entry模板的名字';
COMMENT ON COLUMN public.T_ENTRY_TEMPLATE.LABEL IS 'Entry模板在UI端显示的名字';
COMMENT ON COLUMN public.T_ENTRY_TEMPLATE.DESCRIPTION IS 'Entry模板的描述，一般用来描述该Entry的功能及使用方式，为MarkDown文本';
COMMENT ON COLUMN public.T_ENTRY_TEMPLATE.TYPE IS 'Entry模板的类型：CONNECTOR, DATACENTER, RULE, RULECHAIN';
COMMENT ON COLUMN public.T_ENTRY_TEMPLATE.STATUS IS 'Entry模板的状态，参考数据字典GLOBAL.STATUS';

-- Enable the trigger to update the UPDATE_DATE automatically.
CREATE TRIGGER T_UD_T_ENTRY_TEMPLATE BEFORE UPDATE ON public.T_ENTRY_TEMPLATE
FOR EACH ROW
EXECUTE PROCEDURE T_UPDATE_DATE();

-- Going to create Table: public.T_ENTRY_TEMPLATE_MAP
-- ENTRY_TEMPLATE & META_DATA_TEMPLATE MAP
DROP TABLE IF EXISTS public.T_ENTRY_TEMPLATE_MAP CASCADE;
CREATE TABLE public.T_ENTRY_TEMPLATE_MAP
(
    ID character (36) primary key,
    ENTRY_TEMPLATE_ID character (36) REFERENCES T_ENTRY_TEMPLATE(ID),
    META_DATA_TEMPLATE_ID character (36) REFERENCES T_META_DATA_TEMPLATE(ID),
    VISIBLE bool DEFAULT true,
    EIDITABLE bool DEFAULT true,
    MANDATORY bool DEFAULT false,
    SEQ_NO smallint DEFAULT 1, 
    STATUS smallint DEFAULT 1,
    VALUE_TYPE smallint DEFAULT 0,
    CREATE_DATE timestamp(0) with time zone DEFAULT now(),
    UPDATE_DATE timestamp(0) with time zone DEFAULT now()
);

ALTER TABLE public.T_ENTRY_TEMPLATE_MAP OWNER to admin;
COMMENT ON COLUMN public.T_ENTRY_TEMPLATE_MAP.ID IS 'ID';
COMMENT ON COLUMN public.T_ENTRY_TEMPLATE_MAP.ENTRY_TEMPLATE_ID IS 'Entry模板的ID';
COMMENT ON COLUMN public.T_ENTRY_TEMPLATE_MAP.META_DATA_TEMPLATE_ID IS 'Entry模板元素的ID';
COMMENT ON COLUMN public.T_ENTRY_TEMPLATE_MAP.VISIBLE IS 'Entry模板元素在UI端是否可显示';
COMMENT ON COLUMN public.T_ENTRY_TEMPLATE_MAP.EIDITABLE IS 'Entry模板元素在UI端是否可编辑';
COMMENT ON COLUMN public.T_ENTRY_TEMPLATE_MAP.MANDATORY IS 'Entry模板元素在UI端是否为必填';
COMMENT ON COLUMN public.T_ENTRY_TEMPLATE_MAP.SEQ_NO IS 'Entry模板元素在UI端显示顺序';
COMMENT ON COLUMN public.T_ENTRY_TEMPLATE_MAP.STATUS IS 'Entry模板的状态，参考数据字典GLOBAL.STATUS';
COMMENT ON COLUMN public.T_ENTRY_TEMPLATE_MAP.VALUE_TYPE IS 'Entry模板的输出值类型：单值，多值，参考数据字典GLOBAL.VALUE_TYPE';

-- Enable the trigger to update the UPDATE_DATE automatically.
CREATE TRIGGER T_UD_T_ENTRY_TEMPLATE_MAP BEFORE UPDATE ON public.T_ENTRY_TEMPLATE_MAP
FOR EACH ROW
EXECUTE PROCEDURE T_UPDATE_DATE();

-- Going to create Table: public.T_ENTRY_TEMPLATE_VALUE
-- Entry模板下具体的某个Expression下的值. 于Entry来说，该表存放的是默认值.
DROP TABLE IF EXISTS public.T_ENTRY_TEMPLATE_VALUE CASCADE;
CREATE TABLE public.T_ENTRY_TEMPLATE_VALUE
(
    ID character (36) primary key,
    ENTRY_TEMPLATE_ID character (36) REFERENCES T_ENTRY_TEMPLATE(ID),
    ENTRY_TEMPLATE_MAP_ID character (36) REFERENCES T_ENTRY_TEMPLATE_MAP(ID),
    SEQ_NO smallint DEFAULT 1, 
    STATUS smallint DEFAULT 1,
    CREATE_DATE timestamp(0) with time zone DEFAULT now(),
    UPDATE_DATE timestamp(0) with time zone DEFAULT now()
);

ALTER TABLE public.T_ENTRY_TEMPLATE_VALUE OWNER to admin;
COMMENT ON COLUMN public.T_ENTRY_TEMPLATE_VALUE.ID IS 'ID';
COMMENT ON COLUMN public.T_ENTRY_TEMPLATE_VALUE.ENTRY_TEMPLATE_ID IS 'Entry模板的编码';
COMMENT ON COLUMN public.T_ENTRY_TEMPLATE_VALUE.ENTRY_TEMPLATE_MAP_ID IS 'Entry模板的名字';
COMMENT ON COLUMN public.T_ENTRY_TEMPLATE_VALUE.SEQ_NO IS 'Entry下某个表达式的值在UI端显示的顺序';
COMMENT ON COLUMN public.T_ENTRY_TEMPLATE_VALUE.STATUS IS 'Entry下某个表达式的值的状态，参考数据字典GLOBAL.STATUS';

-- Enable the trigger to update the UPDATE_DATE automatically.
CREATE TRIGGER T_UD_T_ENTRY_TEMPLATE_VALUE BEFORE UPDATE ON public.T_ENTRY_TEMPLATE_VALUE
FOR EACH ROW
EXECUTE PROCEDURE T_UPDATE_DATE();

-- Going to create Table: public.T_ENTRY_TEMPLATE_VALUE
-- Entry模板下具体的某个Expression下的某个参数的值. 于Entry来说，该表存放的是默认值.
DROP TABLE IF EXISTS public.T_ENTRY_TEMPLATE_ITEM_VALUE CASCADE;
CREATE TABLE public.T_ENTRY_TEMPLATE_ITEM_VALUE
(
    ID character (36) primary key,
    ENTRY_TEMPLATE_ID character (36) REFERENCES T_ENTRY_TEMPLATE(ID),
    ENTRY_TEMPLATE_MAP_ID character (36) REFERENCES T_ENTRY_TEMPLATE_MAP(ID),
    META_DATA_ITEM_TEMPLATE_MAP_ID character (36) REFERENCES T_META_DATA_ITEM_TEMPLATE_MAP(ID),
    VALUE character varying(255),
    STATUS smallint DEFAULT 1,
    CREATE_DATE timestamp(0) with time zone DEFAULT now(),
    UPDATE_DATE timestamp(0) with time zone DEFAULT now()
);

ALTER TABLE public.T_ENTRY_TEMPLATE_ITEM_VALUE OWNER to admin;
COMMENT ON COLUMN public.T_ENTRY_TEMPLATE_ITEM_VALUE.ID IS 'ID';
COMMENT ON COLUMN public.T_ENTRY_TEMPLATE_ITEM_VALUE.ENTRY_TEMPLATE_ID IS 'Entry模板的编码';
COMMENT ON COLUMN public.T_ENTRY_TEMPLATE_ITEM_VALUE.ENTRY_TEMPLATE_MAP_ID IS 'Entry模板的名字';
COMMENT ON COLUMN public.T_ENTRY_TEMPLATE_ITEM_VALUE.META_DATA_ITEM_TEMPLATE_MAP_ID IS 'Entry下某个表达式与元素的映射ID';
COMMENT ON COLUMN public.T_ENTRY_TEMPLATE_ITEM_VALUE.VALUE IS 'Entry下某个表达式的元素值';
COMMENT ON COLUMN public.T_ENTRY_TEMPLATE_ITEM_VALUE.STATUS IS 'Entry下某个表达式的元素值的状态，参考数据字典GLOBAL.STATUS';

-- Enable the trigger to update the UPDATE_DATE automatically.
CREATE TRIGGER T_UD_T_ENTRY_TEMPLATE_ITEM_VALUE BEFORE UPDATE ON public.T_ENTRY_TEMPLATE_ITEM_VALUE
FOR EACH ROW
EXECUTE PROCEDURE T_UPDATE_DATE();

-- Going to create Table: public.T_CONFIGUE_TEMPLATE
DROP TABLE IF EXISTS public.T_CONFIGUE_TEMPLATE CASCADE;
CREATE TABLE public.T_CONFIGUE_TEMPLATE
(
    ID character (36) primary key,
    CODE character varying(255) NOT NULL,
    NAME character varying(255) NOT NULL,
    TYPE smallint,
    CATEGORY smallint,
    MUTABLE bool DEFAULT false,
    META_DATA_ITEM_ID character (36) REFERENCES T_META_DATA_ITEM(ID),
    STATUS smallint,
    PARENT_ID integer,
    VERSION smallint NOT NULL,
    COMMENTS character varying(255),
    CREATOR_ID bigint,
    TENANT_ID character(36),
    CREATE_DATE timestamp(0) with time zone DEFAULT now(),
    UPDATE_DATE timestamp(0) with time zone DEFAULT now()
);

ALTER TABLE public.T_CONFIGUE_TEMPLATE OWNER to admin;
COMMENT ON COLUMN public.T_CONFIGUE_TEMPLATE.ID IS 'ID';
COMMENT ON COLUMN public.T_CONFIGUE_TEMPLATE.CODE IS '配置参数编码';
COMMENT ON COLUMN public.T_CONFIGUE_TEMPLATE.NAME IS '配置参数名称';
COMMENT ON COLUMN public.T_CONFIGUE_TEMPLATE.TYPE IS '配置参数的类型:一级分组，实体分组，参数分组，参数类型';
COMMENT ON COLUMN public.T_CONFIGUE_TEMPLATE.CATEGORY IS '配置参数的所属分组:基本配置，高级配置';
COMMENT ON COLUMN public.T_CONFIGUE_TEMPLATE.MUTABLE IS '配置参数的名字是否可变更';
COMMENT ON COLUMN public.T_CONFIGUE_TEMPLATE.META_DATA_ITEM_ID IS '配置参数所引用的元数据的Item的ID';
COMMENT ON COLUMN public.T_CONFIGUE_TEMPLATE.STATUS IS '配置参数的状态，参考字典的GLOBAL.STATUS';
COMMENT ON COLUMN public.T_CONFIGUE_TEMPLATE.PARENT_ID IS '配置参数的父节点ID';
COMMENT ON COLUMN public.T_CONFIGUE_TEMPLATE.VERSION IS '配置参数的版本';
COMMENT ON COLUMN public.T_CONFIGUE_TEMPLATE.COMMENTS IS '配置参数的附加描述';

-- Enable the trigger to update the UPDATE_DATE automatically.
CREATE TRIGGER T_UD_T_CONFIGUE_TEMPLATE BEFORE UPDATE ON public.T_CONFIGUE_TEMPLATE
FOR EACH ROW
EXECUTE PROCEDURE T_UPDATE_DATE();

-- Going to create Table: public.T_CONFIGUE_TEMPLATE
DROP TABLE IF EXISTS public.T_LAUNCH_TEMPLATE CASCADE;
CREATE TABLE public.T_LAUNCH_TEMPLATE
(
    ID character (36) primary key,
    CODE character varying(255) NOT NULL,
    NAME character varying(255) NOT NULL,
    LAUNCH_TYPE smallint,
    STATUS smallint,
    SCRIPTS text,
    VERSION smallint NOT NULL,
    COMMENTS character varying(255),
    CREATOR_ID bigint,
    TENANT_ID character(36),
    CREATE_DATE timestamp(0) with time zone DEFAULT now(),
    UPDATE_DATE timestamp(0) with time zone DEFAULT now()
);

ALTER TABLE public.T_LAUNCH_TEMPLATE OWNER to admin;
COMMENT ON COLUMN public.T_LAUNCH_TEMPLATE.ID IS 'ID';
COMMENT ON COLUMN public.T_LAUNCH_TEMPLATE.CODE IS '启动命令的编码';
COMMENT ON COLUMN public.T_LAUNCH_TEMPLATE.NAME IS '启动命令的名称';
COMMENT ON COLUMN public.T_LAUNCH_TEMPLATE.LAUNCH_TYPE IS '启动命令的类型:Shell, bat, Yaml for kubernetes, Yaml for Docker Compose,参考数据字典GLOBAL.LAUNCH_TYPE';
COMMENT ON COLUMN public.T_LAUNCH_TEMPLATE.STATUS IS '启动命令的状态，参考字典的GLOBAL.STATUS';
COMMENT ON COLUMN public.T_LAUNCH_TEMPLATE.SCRIPTS IS '启动命令';
COMMENT ON COLUMN public.T_LAUNCH_TEMPLATE.VERSION IS '启动命令所适应的版本';
COMMENT ON COLUMN public.T_LAUNCH_TEMPLATE.COMMENTS IS '启动命令的附加描述';

-- Enable the trigger to update the UPDATE_DATE automatically.
CREATE TRIGGER T_UD_T_LAUNCH_TEMPLATE BEFORE UPDATE ON public.T_LAUNCH_TEMPLATE
FOR EACH ROW
EXECUTE PROCEDURE T_UPDATE_DATE();

-- ==================================================================
-- * Going to build the Project & Service domain related entries.   *
-- ==================================================================

-- Going to create Table: public.P_PROJECT
DROP TABLE IF EXISTS public.P_PROJECT CASCADE;
CREATE TABLE public.P_PROJECT
(
    ID serial primary key,
    CODE character varying(255) NOT NULL,
    NAME character varying(255) NOT NULL,
    LABEL character varying(255) NOT NULL,
    DESCRIPTION text,
    TYPE smallint DEFAULT 0,
    STATUS smallint,
    EXPECTED_DATE timestamp(0) with time zone,
    ARCHITECT_ID character (36),
    OWNER_ID character (36),
    CREATOR_ID bigint,
    TENANT_ID character(36),
    CREATE_DATE timestamp(0) with time zone DEFAULT now(),
    UPDATE_DATE timestamp(0) with time zone DEFAULT now(),
    UNIQUE(CODE, STATUS)
);

ALTER TABLE public.P_PROJECT OWNER to admin;
COMMENT ON COLUMN public.P_PROJECT.ID IS 'ID';
COMMENT ON COLUMN public.P_PROJECT.CODE IS 'PROJECT的编码';
COMMENT ON COLUMN public.P_PROJECT.NAME IS 'Project的名字';
COMMENT ON COLUMN public.P_PROJECT.LABEL IS 'Project在UI端显示的名字';
COMMENT ON COLUMN public.P_PROJECT.DESCRIPTION IS 'Project的描述';
COMMENT ON COLUMN public.P_PROJECT.TYPE IS 'Project的类型，参考数据字典Project.TYPE';
COMMENT ON COLUMN public.P_PROJECT.STATUS IS 'Project的状态，参考数据字典Project.STATUS';
COMMENT ON COLUMN public.P_PROJECT.EXPECTED_DATE IS 'Project的预期完成时间，供研发参考用';
COMMENT ON COLUMN public.P_PROJECT.ARCHITECT_ID IS 'Project的架构师';
COMMENT ON COLUMN public.P_PROJECT.OWNER_ID IS 'Project的项目经理';

-- Enable the trigger to update the UPDATE_DATE automatically.
CREATE TRIGGER T_UD_P_PROJECT BEFORE UPDATE ON public.P_PROJECT
FOR EACH ROW
EXECUTE PROCEDURE T_UPDATE_DATE();

-- Going to create Table: public.P_PROJECT_SETTINGS
DROP TABLE IF EXISTS public.P_PROJECT_SETTINGS CASCADE;
CREATE TABLE public.P_PROJECT_SETTINGS
(
    ID serial primary key,
    SINGLE_SERVICE bool DEFAULT false,
    STANDALONE bool DEFAULT true,
    FRAMEWORK_TYPE smallint,
    GOVER_TYPE smallint,
    CONFIG_TYPE smallint,
    GATEWAY_TYPE smallint,
    AUTH_TYPE smallint,
    STATUS smallint,
    PROJECT_ID integer REFERENCES P_PROJECT(ID),
    CREATE_DATE timestamp(0) with time zone DEFAULT now(),
    UPDATE_DATE timestamp(0) with time zone DEFAULT now()
);

ALTER TABLE public.P_PROJECT_SETTINGS OWNER to admin;
COMMENT ON COLUMN public.P_PROJECT_SETTINGS.ID IS 'ID';
COMMENT ON COLUMN public.P_PROJECT_SETTINGS.SINGLE_SERVICE IS '是否为单服务项目';
COMMENT ON COLUMN public.P_PROJECT_SETTINGS.STANDALONE IS '是否为独立项目';
COMMENT ON COLUMN public.P_PROJECT_SETTINGS.FRAMEWORK_TYPE IS '项目框架类型：Spring Cloud, Dubbo';
COMMENT ON COLUMN public.P_PROJECT_SETTINGS.GOVER_TYPE IS '项目服务治理类型：Eureka, Zookeeper, Consul, Nacos';
COMMENT ON COLUMN public.P_PROJECT_SETTINGS.CONFIG_TYPE IS '项目配置中心类型：Spring Cloud Conf, Apollo, Nacos';
COMMENT ON COLUMN public.P_PROJECT_SETTINGS.GATEWAY_TYPE IS '项目网关类型：Spring Cloud Gateway, Zuul1, Zuul2, 自定义';
COMMENT ON COLUMN public.P_PROJECT_SETTINGS.AUTH_TYPE IS '项目鉴权中心类型：Twinkle AuthCenter, 自定义';
COMMENT ON COLUMN public.P_PROJECT_SETTINGS.STATUS IS 'Settings的状态，参考数据字典GLOBAL.STATUS';
COMMENT ON COLUMN public.P_PROJECT_SETTINGS.PROJECT_ID IS '所属Project的ID';

-- Enable the trigger to update the UPDATE_DATE automatically.
CREATE TRIGGER T_UD_P_PROJECT_SETTINGS BEFORE UPDATE ON public.P_PROJECT_SETTINGS
FOR EACH ROW
EXECUTE PROCEDURE T_UPDATE_DATE();

-- Going to create Table: public.P_PROJECT_ENV
DROP TABLE IF EXISTS public.P_PROJECT_ENV CASCADE;
CREATE TABLE public.P_PROJECT_ENV
(
    ID serial primary key,
    ENV_TYPE smallint,
    TYPE smallint,
    STATUS smallint,
    COMPONENT_ID integer NOT NULL,
    PROJECT_ID integer REFERENCES P_PROJECT(ID),
    CREATE_DATE timestamp(0) with time zone DEFAULT now(),
    UPDATE_DATE timestamp(0) with time zone DEFAULT now()
);

ALTER TABLE public.P_PROJECT_ENV OWNER to admin;
COMMENT ON COLUMN public.P_PROJECT_ENV.ID IS 'ID';
COMMENT ON COLUMN public.P_PROJECT_ENV.ENV_TYPE IS 'Project环境的环境类型，参考数据字典GLOBAL.ENV_TYPE';
COMMENT ON COLUMN public.P_PROJECT_ENV.TYPE IS '环境参数的类型:HOST, KUBERNETES, DATACENTER...，参考数据字典：PROJECT_ENV.TYPE';
COMMENT ON COLUMN public.P_PROJECT_ENV.STATUS IS '环境参数的类型的状态，参考数据字典GLOBAL.STATUS';
COMMENT ON COLUMN public.P_PROJECT_ENV.COMPONENT_ID IS 'HOST, Kubernetes, datacenter等的ID';
COMMENT ON COLUMN public.P_PROJECT_ENV.PROJECT_ID IS '所属Project的ID';

-- Enable the trigger to update the UPDATE_DATE automatically.
CREATE TRIGGER T_UD_P_PROJECT_ENV BEFORE UPDATE ON public.P_PROJECT_ENV
FOR EACH ROW
EXECUTE PROCEDURE T_UPDATE_DATE();

-- Going to create Table: public.P_PROJECT_LAUNCH
DROP TABLE IF EXISTS public.P_PROJECT_LAUNCH CASCADE;
CREATE TABLE public.P_PROJECT_LAUNCH
(
    ID serial primary key,
    LAUNCH_TYPE smallint,
    STATUS smallint,
    SCRIPTS text not null,
    PROJECT_ID integer REFERENCES P_PROJECT(ID),
    CREATE_DATE timestamp(0) with time zone DEFAULT now(),
    UPDATE_DATE timestamp(0) with time zone DEFAULT now()
);

ALTER TABLE public.P_PROJECT_LAUNCH OWNER to admin;
COMMENT ON COLUMN public.P_PROJECT_LAUNCH.ID IS 'ID';
COMMENT ON COLUMN public.P_PROJECT_LAUNCH.LAUNCH_TYPE IS 'Project下Service统一的启动类型: Shell, Yaml，参考数据字典GLOBAL.LAUNCH_TYPE';
COMMENT ON COLUMN public.P_PROJECT_LAUNCH.STATUS IS 'Project下Service统一的启动类型的状态，参考数据字典GLOBAL.STATUS';
COMMENT ON COLUMN public.P_PROJECT_LAUNCH.SCRIPTS IS 'Project下的服务的启动脚本';
COMMENT ON COLUMN public.P_PROJECT_LAUNCH.PROJECT_ID IS '所属Project的ID';

-- Enable the trigger to update the UPDATE_DATE automatically.
CREATE TRIGGER T_UD_P_PROJECT_LAUNCH BEFORE UPDATE ON public.P_PROJECT_LAUNCH
FOR EACH ROW
EXECUTE PROCEDURE T_UPDATE_DATE();


-- Going to create Table: public.P_PROJECT_LAUNCH
DROP TABLE IF EXISTS public.P_PROJECT_TRACE CASCADE;
CREATE TABLE public.P_PROJECT_TRACE
(
    ID serial primary key,
    PROJECT_ID integer REFERENCES P_PROJECT(ID),
    TYPE smallint,
    STATUS smallint,
    CREATOR_ID character (36),
    ORG_SOURCE character varying(255),
    DEST_SOURCE character varying(255),
    CREATE_DATE timestamp(0) with time zone DEFAULT now(),
    UPDATE_DATE timestamp(0) with time zone DEFAULT now()
);

ALTER TABLE public.P_PROJECT_TRACE OWNER to admin;
COMMENT ON COLUMN public.P_PROJECT_TRACE.ID IS 'ID';
COMMENT ON COLUMN public.P_PROJECT_TRACE.PROJECT_ID IS 'Trace所属的Project';
COMMENT ON COLUMN public.P_PROJECT_TRACE.TYPE IS 'Project的操作类型，参考数据字典：';
COMMENT ON COLUMN public.P_PROJECT_TRACE.STATUS IS 'Trace的状态，参考数据字典SERVICE.STATUS';
COMMENT ON COLUMN public.P_PROJECT_TRACE.CREATOR_ID IS '操作人的ID';
COMMENT ON COLUMN public.P_PROJECT_TRACE.ORG_SOURCE IS 'Action所影响到的原有值';
COMMENT ON COLUMN public.P_PROJECT_TRACE.DEST_SOURCE IS 'Action改变后的值';

-- Enable the trigger to update the UPDATE_DATE automatically.
CREATE TRIGGER T_UD_P_PROJECT_TRACE BEFORE UPDATE ON public.P_PROJECT_TRACE
FOR EACH ROW
EXECUTE PROCEDURE T_UPDATE_DATE();

-- Going to create Table: public.P_SERVICE
DROP TABLE IF EXISTS public.P_SERVICE CASCADE;
CREATE TABLE public.P_SERVICE
(
    ID serial primary key,
    CODE character varying(255) NOT NULL,
    NAME character varying(255) NOT NULL,
    LABEL character varying(255) NOT NULL,
    DESCRIPTION text,
    STATUS smallint,
    TYPE smallint,
    EXPECTED_DATE timestamp(0) with time zone,
    ARCHITECT_ID character (36),
    OWNER_ID character (36),
    PROJECT_ID integer REFERENCES P_PROJECT(ID),
    PROCESSOR_ID character (36),
    CREATOR_ID bigint,
    TENANT_ID character(36),
    CREATE_DATE timestamp(0) with time zone DEFAULT now(),
    UPDATE_DATE timestamp(0) with time zone DEFAULT now(),
    UNIQUE(CODE, STATUS)
);

ALTER TABLE public.P_SERVICE OWNER to admin;
COMMENT ON COLUMN public.P_SERVICE.ID IS 'ID';
COMMENT ON COLUMN public.P_SERVICE.CODE IS 'SERVICE的编码,将作为服务的名字注册到注册中心，不能有空格下拉框等特殊字符';
COMMENT ON COLUMN public.P_SERVICE.NAME IS 'Service的名字';
COMMENT ON COLUMN public.P_SERVICE.LABEL IS 'Service在UI端显示的名字';
COMMENT ON COLUMN public.P_SERVICE.DESCRIPTION IS 'Service的描述';
COMMENT ON COLUMN public.P_SERVICE.CATEGORY IS 'Service的分类: 业务服务，服务治理中心，配置中心，网关，鉴权认证中心';
COMMENT ON COLUMN public.P_SERVICE.TYPE IS 'Service的类型: 构建服务，自定义服务，非项目自有服务，第三方服务；参考数据字典SERVICE.TYPE';
COMMENT ON COLUMN public.P_SERVICE.STATUS IS 'Service的状态，参考数据字典SERVICE.STATUS';
COMMENT ON COLUMN public.P_SERVICE.EXPECTED_DATE IS 'Service的预期完成时间，供研发参考用';
COMMENT ON COLUMN public.P_SERVICE.ARCHITECT_ID IS 'Service的架构师';
COMMENT ON COLUMN public.P_SERVICE.OWNER_ID IS 'Service的负责人';
COMMENT ON COLUMN public.P_SERVICE.PROCESSOR_ID IS 'Service的具体研发人员';

-- Enable the trigger to update the UPDATE_DATE automatically.
CREATE TRIGGER T_UD_P_SERVICE BEFORE UPDATE ON public.P_SERVICE
FOR EACH ROW
EXECUTE PROCEDURE T_UPDATE_DATE();

-- Going to create Table: public.P_SERVICE_TEMPLATE
DROP TABLE IF EXISTS public.P_SERVICE_TEMPLATE CASCADE;
CREATE TABLE public.P_SERVICE_TEMPLATE
(
    ID serial primary key,
    CODE character varying(255) NOT NULL,
    NAME character varying(255) NOT NULL,
    LABEL character varying(255) NOT NULL,
    DESCRIPTION text,
    CATEGORY smallint,
    STATUS smallint,
    TYPE smallint,
    CREATOR_ID bigint,
    TENANT_ID character(36),
    CREATE_DATE timestamp(0) with time zone DEFAULT now(),
    UPDATE_DATE timestamp(0) with time zone DEFAULT now(),
    UNIQUE(CODE, STATUS)
);

ALTER TABLE public.P_SERVICE_TEMPLATE OWNER to admin;
COMMENT ON COLUMN public.P_SERVICE_TEMPLATE.ID IS 'ID';
COMMENT ON COLUMN public.P_SERVICE_TEMPLATE.CODE IS 'SERVICE的编码,将作为服务的名字注册到注册中心，不能有空格下拉框等特殊字符';
COMMENT ON COLUMN public.P_SERVICE_TEMPLATE.NAME IS 'Service的名字';
COMMENT ON COLUMN public.P_SERVICE_TEMPLATE.LABEL IS 'Service在UI端显示的名字';
COMMENT ON COLUMN public.P_SERVICE_TEMPLATE.DESCRIPTION IS 'Service的描述';
COMMENT ON COLUMN public.P_SERVICE_TEMPLATE.CATEGORY IS 'Service模板的分类: 业务服务，服务治理中心，配置中心，网关，鉴权认证中心';
COMMENT ON COLUMN public.P_SERVICE_TEMPLATE.TYPE IS 'Service的类型: 构建服务，自定义服务，非项目自有服务，第三方服务；参考数据字典SERVICE.TYPE';


-- Enable the trigger to update the UPDATE_DATE automatically.
CREATE TRIGGER T_UD_P_SERVICE_TEMPLATE BEFORE UPDATE ON public.P_SERVICE_TEMPLATE
FOR EACH ROW
EXECUTE PROCEDURE T_UPDATE_DATE();


-- Going to create Table: public.P_SERVICE_RELY
DROP TABLE IF EXISTS public.P_SERVICE_RELY CASCADE;
CREATE TABLE public.P_SERVICE_RELY
(
    ID serial primary key,
    SRC_SERVICE_ID integer REFERENCES P_SERVICE(ID),
    DEST_SERVICE_ID integer REFERENCES P_SERVICE(ID),
    SRC_ENTRY_ID integer NOT NULL,
    DEST_ENTRY_ID integer NOT NULL,
    DESCRIPTION text,
    STATUS smallint,
    TYPE smallint,
    CREATOR_ID character (36),
    CREATE_DATE timestamp(0) with time zone DEFAULT now(),
    UPDATE_DATE timestamp(0) with time zone DEFAULT now(),
    UNIQUE(SRC_SERVICE_ID, DEST_SERVICE_ID, STATUS)
);

ALTER TABLE public.P_SERVICE_RELY OWNER to admin;
COMMENT ON COLUMN public.P_SERVICE_RELY.ID IS 'ID';
COMMENT ON COLUMN public.P_SERVICE_RELY.SRC_SERVICE_ID IS 'Service依赖的源ServiceID';
COMMENT ON COLUMN public.P_SERVICE_RELY.DEST_SERVICE_ID IS 'Service依赖的目标ServiceID';
COMMENT ON COLUMN public.P_SERVICE_RELY.SRC_ENTRY_ID IS 'Service依赖的源实体ID';
COMMENT ON COLUMN public.P_SERVICE_RELY.DEST_ENTRY_ID IS 'Service依赖的目标实体ID';
COMMENT ON COLUMN public.P_SERVICE_RELY.DESCRIPTION IS 'Service的描述';
COMMENT ON COLUMN public.P_SERVICE_RELY.STATUS IS 'Service依赖的状态，参考数据字典SERVICE.STATUS';
COMMENT ON COLUMN public.P_SERVICE_RELY.TYPE IS '依赖的类型：Restful HTTP, Dubbo RPC';

-- Enable the trigger to update the UPDATE_DATE automatically.
CREATE TRIGGER T_UD_P_SERVICE_RELY BEFORE UPDATE ON public.P_SERVICE_RELY
FOR EACH ROW
EXECUTE PROCEDURE T_UPDATE_DATE();

-- Going to create Table: public.P_SERVICE_SETTINGS
DROP TABLE IF EXISTS public.P_SERVICE_SETTINGS CASCADE;
CREATE TABLE public.P_SERVICE_SETTINGS
(
    ID serial primary key,
    CODE character varying(255) NOT NULL,
    NAME character varying(255) NOT NULL,
    LABEL character varying(255) NOT NULL,
    STATUS smallint,
    SERVICE_ID integer REFERENCES P_SERVICE(ID),
    CREATE_DATE timestamp(0) with time zone DEFAULT now(),
    UPDATE_DATE timestamp(0) with time zone DEFAULT now()
);

ALTER TABLE public.P_SERVICE_SETTINGS OWNER to admin;
COMMENT ON COLUMN public.P_SERVICE_SETTINGS.ID IS 'ID';
COMMENT ON COLUMN public.P_SERVICE_SETTINGS.CODE IS 'Settings的编码';
COMMENT ON COLUMN public.P_SERVICE_SETTINGS.NAME IS 'Settings的名字';
COMMENT ON COLUMN public.P_SERVICE_SETTINGS.LABEL IS 'Settings在UI端显示的名字';
COMMENT ON COLUMN public.P_SERVICE_SETTINGS.STATUS IS 'Settings的状态，参考数据字典GLOBAL.STATUS';
COMMENT ON COLUMN public.P_SERVICE_SETTINGS.SERVICE_ID IS '所属Service的ID';

-- Enable the trigger to update the UPDATE_DATE automatically.
CREATE TRIGGER T_UD_P_SERVICE_SETTINGS BEFORE UPDATE ON public.P_SERVICE_SETTINGS
FOR EACH ROW
EXECUTE PROCEDURE T_UPDATE_DATE();

-- Going to create Table: public.P_SERVICE_ENV
DROP TABLE IF EXISTS public.P_SERVICE_ENV CASCADE;
CREATE TABLE public.P_SERVICE_ENV
(
    ID serial primary key,
    ENV_TYPE smallint,
    TYPE smallint,
    STATUS smallint,
    COMPONENT_ID integer NOT NULL,
    SERVICE_ID integer REFERENCES P_PROJECT(ID),
    CREATE_DATE timestamp(0) with time zone DEFAULT now(),
    UPDATE_DATE timestamp(0) with time zone DEFAULT now()
);

ALTER TABLE public.P_SERVICE_ENV OWNER to admin;
COMMENT ON COLUMN public.P_SERVICE_ENV.ID IS 'ID';
COMMENT ON COLUMN public.P_SERVICE_ENV.ENV_TYPE IS 'SERVICE环境的环境类型，参考数据字典GLOBAL.ENV_TYPE';
COMMENT ON COLUMN public.P_SERVICE_ENV.TYPE IS '环境参数的类型:HOST, KUBERNETES, DATACENTER...，参考数据字典：SERVICE_ENV.TYPE';
COMMENT ON COLUMN public.P_SERVICE_ENV.STATUS IS '环境参数的类型的状态，参考数据字典GLOBAL.STATUS';
COMMENT ON COLUMN public.P_SERVICE_ENV.COMPONENT_ID IS 'HOST, Kubernetes, datacenter等的ID';
COMMENT ON COLUMN public.P_SERVICE_ENV.SERVICE_ID IS '所属Project的ID';

-- Enable the trigger to update the UPDATE_DATE automatically.
CREATE TRIGGER T_UD_P_SERVICE_ENV BEFORE UPDATE ON public.P_SERVICE_ENV
FOR EACH ROW
EXECUTE PROCEDURE T_UPDATE_DATE();

-- Going to create Table: public.P_SERVICE_MAVEN_LIB
DROP TABLE IF EXISTS public.P_SERVICE_MAVEN_LIB CASCADE;
CREATE TABLE public.P_SERVICE_MAVEN_LIB
(
    ID serial primary key,
    SERVICE_ID integer REFERENCES P_PROJECT(ID),
    MAVEN_LIB_ID integer NOT NULL,
    STATUS smallint,
    VERSION_ID smallint NOT NULL,
    CREATE_DATE timestamp(0) with time zone DEFAULT now(),
    UPDATE_DATE timestamp(0) with time zone DEFAULT now()
);

ALTER TABLE public.P_SERVICE_MAVEN_LIB OWNER to admin;
COMMENT ON COLUMN public.P_SERVICE_MAVEN_LIB.ID IS 'ID';
COMMENT ON COLUMN public.P_SERVICE_MAVEN_LIB.SERVICE_ID IS '引用Lib包的ServiceID';
COMMENT ON COLUMN public.P_SERVICE_MAVEN_LIB.MAVEN_LIB_ID IS '引用Lib包的ID';
COMMENT ON COLUMN public.P_SERVICE_MAVEN_LIB.STATUS IS 'Service引用Lib的状态，参考数据字典GLOBAL.STATUS';
COMMENT ON COLUMN public.P_SERVICE_MAVEN_LIB.VERSION_ID IS 'Service Lib引用的版本ID，参考S_VERSION.ID';

-- Enable the trigger to update the UPDATE_DATE automatically.
CREATE TRIGGER T_UD_P_SERVICE_MAVEN_LIB BEFORE UPDATE ON public.P_SERVICE_MAVEN_LIB
FOR EACH ROW
EXECUTE PROCEDURE T_UPDATE_DATE();

-- Going to create Table: public.P_SERVICE_LAUNCH
DROP TABLE IF EXISTS public.P_SERVICE_LAUNCH CASCADE;
CREATE TABLE public.P_SERVICE_LAUNCH
(
    ID serial primary key,
    LAUNCH_TYPE smallint,
    STATUS smallint,
    SCRIPTS text not null,
    SERVICE_ID integer REFERENCES P_SERVICE(ID),
    PROJECT_ID integer REFERENCES P_PROJECT(ID),
    CREATE_DATE timestamp(0) with time zone DEFAULT now(),
    UPDATE_DATE timestamp(0) with time zone DEFAULT now()
);

ALTER TABLE public.P_SERVICE_LAUNCH OWNER to admin;
COMMENT ON COLUMN public.P_SERVICE_LAUNCH.ID IS 'ID';
COMMENT ON COLUMN public.P_SERVICE_LAUNCH.LAUNCH_TYPE IS 'Project下某个Service的启动类型: Shell, Yaml，参考数据字典GLOBAL.LAUNCH_TYPE';
COMMENT ON COLUMN public.P_SERVICE_LAUNCH.STATUS IS 'Project下某个Service统一的启动类型的状态，参考数据字典GLOBAL.STATUS';
COMMENT ON COLUMN public.P_SERVICE_LAUNCH.SCRIPTS IS 'Project下的服务的启动脚本';
COMMENT ON COLUMN public.P_SERVICE_LAUNCH.PROJECT_ID IS '所属Project的ID';

-- Enable the trigger to update the UPDATE_DATE automatically.
CREATE TRIGGER T_UD_P_SERVICE_LAUNCH BEFORE UPDATE ON public.P_SERVICE_LAUNCH
FOR EACH ROW
EXECUTE PROCEDURE T_UPDATE_DATE();

-- Going to create Table: public.P_SERVICE_CONFIGURE
DROP TABLE IF EXISTS public.P_SERVICE_CONFIGURE CASCADE;
CREATE TABLE public.P_SERVICE_CONFIGURE
(
    ID serial primary key,
    CONFIGURE_ITEM_ID character(36),
    CONFIGURE_ITEM_CODE character varying(255),
    STATUS smallint,
    VALUE character varying(255),
    SERVICE_ID integer REFERENCES P_SERVICE(ID),
    PROJECT_ID integer REFERENCES P_PROJECT(ID),
    CREATE_DATE timestamp(0) with time zone DEFAULT now(),
    UPDATE_DATE timestamp(0) with time zone DEFAULT now()
);

ALTER TABLE public.P_SERVICE_CONFIGURE OWNER to admin;
COMMENT ON COLUMN public.P_SERVICE_CONFIGURE.ID IS 'ID';
COMMENT ON COLUMN public.P_SERVICE_CONFIGURE.CONFIGURE_ITEM_ID IS 'Service的某个配置参数的ID，引用于元数据域的T_CONFIGURE_TEMPLATE.ID';
COMMENT ON COLUMN public.P_SERVICE_CONFIGURE.CONFIGURE_ITEM_CODE IS 'Service的某个配置参数的ID，引用于元数据域的T_CONFIGURE_TEMPLATE.CODE';
COMMENT ON COLUMN public.P_SERVICE_CONFIGURE.STATUS IS 'Service的某个配置参数的的状态，参考数据字典GLOBAL.STATUS';
COMMENT ON COLUMN public.P_SERVICE_CONFIGURE.VALUE IS 'Service的某个配置参数的值';
COMMENT ON COLUMN public.P_SERVICE_CONFIGURE.SERVICE_ID IS '所属SERVICE的ID';
COMMENT ON COLUMN public.P_SERVICE_CONFIGURE.PROJECT_ID IS '所属Project的ID';

-- Enable the trigger to update the UPDATE_DATE automatically.
CREATE TRIGGER T_UD_P_SERVICE_CONFIGURE BEFORE UPDATE ON public.P_SERVICE_CONFIGURE
FOR EACH ROW
EXECUTE PROCEDURE T_UPDATE_DATE();


-- Going to create Table: public.P_SERVICE_ATTRIBUTE
DROP TABLE IF EXISTS public.P_SERVICE_ATTRIBUTE CASCADE;
CREATE TABLE public.P_SERVICE_ATTRIBUTE
(
    ID serial primary key,
    ATTRIBUTE_ID integer NOT NULL,
    TYPE smallint,
    STATUS smallint,
    SERVICE_ID integer REFERENCES P_SERVICE(ID),
    CREATE_DATE timestamp(0) with time zone DEFAULT now(),
    UPDATE_DATE timestamp(0) with time zone DEFAULT now()
);

ALTER TABLE public.P_SERVICE_ATTRIBUTE OWNER to admin;
COMMENT ON COLUMN public.P_SERVICE_ATTRIBUTE.ID IS 'ID';
COMMENT ON COLUMN public.P_SERVICE_ATTRIBUTE.ATTRIBUTE_ID IS 'Service所引用的AttributeID';
COMMENT ON COLUMN public.P_SERVICE_ATTRIBUTE.TYPE IS 'Service所引用参数的类型：基础参数，结构参数，参考数据字典';
COMMENT ON COLUMN public.P_SERVICE_ATTRIBUTE.STATUS IS 'Service的某个配置参数的的状态，参考数据字典GLOBAL.STATUS';

-- Enable the trigger to update the UPDATE_DATE automatically.
CREATE TRIGGER T_UD_P_SERVICE_ATTRIBUTE BEFORE UPDATE ON public.P_SERVICE_ATTRIBUTE
FOR EACH ROW
EXECUTE PROCEDURE T_UPDATE_DATE();

-- Going to create Table: public.P_SERVICE_VERSION
DROP TABLE IF EXISTS public.P_SERVICE_VERSION CASCADE;
CREATE TABLE public.P_SERVICE_VERSION
(
    ID serial primary key,
    SERVICE_ID integer REFERENCES P_SERVICE(ID),
    STANDARD_SERVICE_VERSION_ID integer NOT NULL,
    SERVICE_LIB_VERSION_ID integer,
    SERVICE_TEMPLATE_VERSION_ID integer NOT NULL,
    STATUS smallint,
    CREATOR_ID character (36),
    CREATE_DATE timestamp(0) with time zone DEFAULT now(),
    UPDATE_DATE timestamp(0) with time zone DEFAULT now()
);

ALTER TABLE public.P_SERVICE_VERSION OWNER to admin;
COMMENT ON COLUMN public.P_SERVICE_VERSION.ID IS 'ID';
COMMENT ON COLUMN public.P_SERVICE_VERSION.SERVICE_ID IS '所属Service的ID';
COMMENT ON COLUMN public.P_SERVICE_VERSION.STANDARD_SERVICE_VERSION_ID IS '标准服务的版本ID：';
COMMENT ON COLUMN public.P_SERVICE_VERSION.SERVICE_LIB_VERSION_ID IS '服务所需自定义lib包的版本ID';
COMMENT ON COLUMN public.P_SERVICE_VERSION.SERVICE_TEMPLATE_VERSION_ID IS '服务配置的版本ID';
COMMENT ON COLUMN public.P_SERVICE_VERSION.STATUS IS 'Service版本的状态，参考数据字典GLOBAL.STATUS';
COMMENT ON COLUMN public.P_SERVICE_VERSION.CREATOR_ID IS '操作人的ID';

-- Enable the trigger to update the UPDATE_DATE automatically.
CREATE TRIGGER T_UD_P_SERVICE_VERSION BEFORE UPDATE ON public.P_SERVICE_VERSION
FOR EACH ROW
EXECUTE PROCEDURE T_UPDATE_DATE();

-- Going to create Table: public.P_SERVICE_TRACE
DROP TABLE IF EXISTS public.P_SERVICE_TRACE CASCADE;
CREATE TABLE public.P_SERVICE_TRACE
(
    ID serial primary key,
    SERVICE_ID integer REFERENCES P_SERVICE(ID),
    TYPE smallint,
    STATUS smallint,
    CREATOR_ID character (36),
    ORG_SOURCE character varying(255),
    DEST_SOURCE character varying(255),
    CREATE_DATE timestamp(0) with time zone DEFAULT now(),
    UPDATE_DATE timestamp(0) with time zone DEFAULT now()
);

ALTER TABLE public.P_SERVICE_TRACE OWNER to admin;
COMMENT ON COLUMN public.P_SERVICE_TRACE.ID IS 'ID';
COMMENT ON COLUMN public.P_SERVICE_TRACE.SERVICE_ID IS '所属Service的ID';
COMMENT ON COLUMN public.P_SERVICE_TRACE.TYPE IS '所记录的Trace的动作类型，参考数据字典：';
COMMENT ON COLUMN public.P_SERVICE_TRACE.STATUS IS 'Trace的状态，参考数据字典SERVICE.STATUS';
COMMENT ON COLUMN public.P_SERVICE_TRACE.CREATOR_ID IS '操作人的ID';
COMMENT ON COLUMN public.P_SERVICE_TRACE.ORG_SOURCE IS 'Action所影响到的原有值';
COMMENT ON COLUMN public.P_SERVICE_TRACE.DEST_SOURCE IS 'Action改变后的值';

-- Enable the trigger to update the UPDATE_DATE automatically.
CREATE TRIGGER T_UD_P_SERVICE_TRACE BEFORE UPDATE ON public.P_SERVICE_TRACE
FOR EACH ROW
EXECUTE PROCEDURE T_UPDATE_DATE();

-- ==================================================================
-- *        Going to build the Entry domain related entries.        *
-- ==================================================================

-- Going to create Table: public.I_ENTRY
DROP TABLE IF EXISTS public.I_ENTRY CASCADE;
CREATE TABLE public.I_ENTRY
(
    ID serial primary key,
    CODE character varying(255) NOT NULL,
    NAME character varying(255) NOT NULL,
    LABEL character varying(255) NOT NULL,
    DESCRIPTION text,
    TYPE smallint,
    STATUS smallint,
    ENTRY_TEMPLATE_ID character (36),
    VERSION_ID integer REFERENCES S_VERSION(ID),
    MD5_SIG character (32),
    CREATOR_ID bigint,
    TENANT_ID character(36),
    CREATE_DATE timestamp(0) with time zone DEFAULT now(),
    UPDATE_DATE timestamp(0) with time zone DEFAULT now()
);

ALTER TABLE public.I_ENTRY OWNER to admin;
COMMENT ON COLUMN public.I_ENTRY.ID IS 'ID';
COMMENT ON COLUMN public.I_ENTRY.CODE IS 'Entry的编码';
COMMENT ON COLUMN public.I_ENTRY.NAME IS 'Entry的名字';
COMMENT ON COLUMN public.I_ENTRY.LABEL IS 'Entry在UI端显示的名字';
COMMENT ON COLUMN public.I_ENTRY.DESCRIPTION IS 'Entry的描述，一般用来描述该Entry的功能及使用方式，为MarkDown文本';
COMMENT ON COLUMN public.I_ENTRY.TYPE IS 'Entry的类型：CONNECTOR, DATACENTER, RULE, RULECHAIN,继承于ENTRY_TEMPLATE';
COMMENT ON COLUMN public.I_ENTRY.STATUS IS 'Entry的状态，参考数据字典GLOBAL.STATUS';
COMMENT ON COLUMN public.I_ENTRY.ENTRY_TEMPLATE_ID IS 'Entry所引用的模板的ID';
COMMENT ON COLUMN public.I_ENTRY.VERSION_ID IS 'Entry所以来的Twinkle版本ID';
COMMENT ON COLUMN public.I_ENTRY.MD5_SIG IS 'Entry的MD5签名，避免重复制造Entry';

-- Enable the trigger to update the UPDATE_DATE automatically.
CREATE TRIGGER T_UD_I_ENTRY BEFORE UPDATE ON public.I_ENTRY
FOR EACH ROW
EXECUTE PROCEDURE T_UPDATE_DATE();


-- Going to create Table: public.I_ENTRY_VALUE
-- Entry模板下具体的某个Expression下的值. 于Entry来说，该表存放的是默认值.
DROP TABLE IF EXISTS public.I_ENTRY_VALUE CASCADE;
CREATE TABLE public.I_ENTRY_VALUE
(
    ID serial primary key,
    ENTRY_ID integer REFERENCES I_ENTRY(ID),
    ENTRY_TEMPLATE_ID character (36),
    ENTRY_TEMPLATE_MAP_ID character (36),
    SEQ_NO smallint DEFAULT 1, 
    STATUS smallint DEFAULT 1,
    CREATOR_ID character (36),
    CREATE_DATE timestamp(0) with time zone DEFAULT now(),
    UPDATE_DATE timestamp(0) with time zone DEFAULT now()
);

ALTER TABLE public.I_ENTRY_VALUE OWNER to admin;
COMMENT ON COLUMN public.I_ENTRY_VALUE.ID IS 'ID';
COMMENT ON COLUMN public.I_ENTRY_VALUE.ENTRY_ID IS 'Value所属Entry的ID';
COMMENT ON COLUMN public.I_ENTRY_VALUE.ENTRY_TEMPLATE_ID IS 'Entry模板的编码';
COMMENT ON COLUMN public.I_ENTRY_VALUE.ENTRY_TEMPLATE_MAP_ID IS 'Entry模板的名字';
COMMENT ON COLUMN public.I_ENTRY_VALUE.SEQ_NO IS 'Entry下某个表达式的值在UI端显示的顺序';
COMMENT ON COLUMN public.I_ENTRY_VALUE.STATUS IS 'Entry下某个表达式的值的状态，参考数据字典GLOBAL.STATUS';

-- Enable the trigger to update the UPDATE_DATE automatically.
CREATE TRIGGER T_UD_I_ENTRY_VALUE BEFORE UPDATE ON public.I_ENTRY_VALUE
FOR EACH ROW
EXECUTE PROCEDURE T_UPDATE_DATE();

-- Going to create Table: public.I_ENTRY_ITEM_VALUE
-- Entry模板下具体的某个Expression下的某个参数的值. 于Entry来说，该表存放的是默认值.
DROP TABLE IF EXISTS public.I_ENTRY_ITEM_VALUE CASCADE;
CREATE TABLE public.I_ENTRY_ITEM_VALUE
(
    ID serial primary key,
    ENTRY_ID integer REFERENCES I_ENTRY(ID),
    ENTRY_VALUE_ID integer REFERENCES I_ENTRY_VALUE(ID),
    ENTRY_TEMPLATE_MAP_ID character (36),
    META_DATA_ITEM_TEMPLATE_MAP_ID character (36),
    VALUE character varying(255),
    STATUS smallint DEFAULT 1,
    CREATOR_ID character (36),
    CREATE_DATE timestamp(0) with time zone DEFAULT now(),
    UPDATE_DATE timestamp(0) with time zone DEFAULT now()
);

ALTER TABLE public.I_ENTRY_ITEM_VALUE OWNER to admin;
COMMENT ON COLUMN public.I_ENTRY_ITEM_VALUE.ID IS 'ID';
COMMENT ON COLUMN public.I_ENTRY_ITEM_VALUE.ENTRY_ID IS 'Value所属Entry的ID';
COMMENT ON COLUMN public.I_ENTRY_ITEM_VALUE.ENTRY_VALUE_ID IS 'Item所属Entry Value的ID';
COMMENT ON COLUMN public.I_ENTRY_ITEM_VALUE.ENTRY_TEMPLATE_MAP_ID IS 'Entry模板的映射的ID';
COMMENT ON COLUMN public.I_ENTRY_ITEM_VALUE.META_DATA_ITEM_TEMPLATE_MAP_ID IS 'Entry下某个表达式与元素的映射ID';
COMMENT ON COLUMN public.I_ENTRY_ITEM_VALUE.VALUE IS 'Entry下某个表达式的元素值';
COMMENT ON COLUMN public.I_ENTRY_ITEM_VALUE.STATUS IS 'Entry下某个表达式的元素值的状态，参考数据字典GLOBAL.STATUS';

-- Enable the trigger to update the UPDATE_DATE automatically.
CREATE TRIGGER T_UD_I_ENTRY_ITEM_VALUE BEFORE UPDATE ON public.I_ENTRY_ITEM_VALUE
FOR EACH ROW
EXECUTE PROCEDURE T_UPDATE_DATE();


-- ==================================================================
-- *      Going to build the Attribute domain related entries.      *
-- ==================================================================
-- Going to create Table: public.A_ATTRIBUTE_TYPE
DROP TABLE IF EXISTS public.A_ATTRIBUTE_TYPE CASCADE;
CREATE TABLE public.A_ATTRIBUTE_TYPE
(
    ID character (36) primary key,
    NAME character varying(255),
    CLASS_NAME character varying(255) NOT NULL,
    STATUS smallint DEFAULT 1,
    COMMENTS character varying(255),
    CREATE_DATE timestamp(0) with time zone DEFAULT now(),
    UPDATE_DATE timestamp(0) with time zone DEFAULT now()
);

ALTER TABLE public.A_ATTRIBUTE_TYPE OWNER to admin;
COMMENT ON COLUMN public.A_ATTRIBUTE_TYPE.ID IS 'ID';
COMMENT ON COLUMN public.A_ATTRIBUTE_TYPE.NAME IS '属性的名称';
COMMENT ON COLUMN public.A_ATTRIBUTE_TYPE.CLASS_NAME IS '属性的实现类';
COMMENT ON COLUMN public.A_ATTRIBUTE_TYPE.STATUS IS '属性的状态，参考字典的GLOBAL.STATUS';
COMMENT ON COLUMN public.A_ATTRIBUTE_TYPE.COMMENTS IS '属性的附加描述';

-- Enable the trigger to update the UPDATE_DATE automatically.
CREATE TRIGGER T_UD_A_ATTRIBUTE_TYPE BEFORE UPDATE ON public.A_ATTRIBUTE_TYPE
FOR EACH ROW
EXECUTE PROCEDURE T_UPDATE_DATE();

-- Going to create Table: public.A_ATTRIBUTE_TYPE_SQL_TYPE_MAP
DROP TABLE IF EXISTS public.A_ATTRIBUTE_TYPE_SQL_TYPE_MAP CASCADE;
CREATE TABLE public.A_ATTRIBUTE_TYPE_SQL_TYPE_MAP
(
    ID character (36) primary key,
    ATTRIBUTE_TYPE_ID character (36) REFERENCES A_ATTRIBUTE_TYPE(ID),
    SQL_TYPE smallint NOT NULL,
    STATUS smallint,
    COMMENTS character varying(255),
    CREATE_DATE timestamp(0) with time zone DEFAULT now(),
    UPDATE_DATE timestamp(0) with time zone DEFAULT now()
);

ALTER TABLE public.A_ATTRIBUTE_TYPE_SQL_TYPE_MAP OWNER to admin;
COMMENT ON COLUMN public.A_ATTRIBUTE_TYPE_SQL_TYPE_MAP.ID IS 'ID';
COMMENT ON COLUMN public.A_ATTRIBUTE_TYPE_SQL_TYPE_MAP.ATTRIBUTE_TYPE_ID IS '属性的ID';
COMMENT ON COLUMN public.A_ATTRIBUTE_TYPE_SQL_TYPE_MAP.SQL_TYPE IS '所映射的SQL的类型，参考数据字典GLOBAL.SQL_TYPE';
COMMENT ON COLUMN public.A_ATTRIBUTE_TYPE_SQL_TYPE_MAP.STATUS IS '属性的状态，参考字典的GLOBAL.STATUS';
COMMENT ON COLUMN public.A_ATTRIBUTE_TYPE_SQL_TYPE_MAP.COMMENTS IS '属性的附加描述';

-- Enable the trigger to update the UPDATE_DATE automatically.
CREATE TRIGGER T_UD_A_ATTRIBUTE_TYPE_SQL_TYPE_MAP BEFORE UPDATE ON public.A_ATTRIBUTE_TYPE_SQL_TYPE_MAP
FOR EACH ROW
EXECUTE PROCEDURE T_UPDATE_DATE();


-- Going to create Table: public.A_ATTRIBUTE
DROP TABLE IF EXISTS public.A_ATTRIBUTE CASCADE;
CREATE TABLE public.A_ATTRIBUTE
(
    ID serial primary key,
    CODE character varying(255) NOT NULL,
    NAME character varying(255) NOT NULL,
    ATTRIBUTE_TYPE_ID character (36) REFERENCES A_ATTRIBUTE_TYPE(ID),
    SUB_TYPE character varying(255),
    STATUS smallint,
    COMMENTS character varying(255),
    SERVICE_ID integer,
    PROJECT_ID integer,
    CREATOR_ID bigint,
    TENANT_ID character(36),
    CREATE_DATE timestamp(0) with time zone DEFAULT now(),
    UPDATE_DATE timestamp(0) with time zone DEFAULT now(),
    UNIQUE(CODE, STATUS)
);

ALTER TABLE public.A_ATTRIBUTE OWNER to admin;
COMMENT ON COLUMN public.A_ATTRIBUTE.ID IS 'ID';
COMMENT ON COLUMN public.A_ATTRIBUTE.CODE IS '将作为StructAttribute的TypeName';
COMMENT ON COLUMN public.A_ATTRIBUTE.NAME IS '属性的名称';
COMMENT ON COLUMN public.A_ATTRIBUTE.ATTRIBUTE_TYPE_ID IS '属性的名称';
COMMENT ON COLUMN public.A_ATTRIBUTE.SUB_TYPE IS '属性的附加子类信息';
COMMENT ON COLUMN public.A_ATTRIBUTE.STATUS IS '属性的状态，参考字典的GLOBAL.STATUS';
COMMENT ON COLUMN public.A_ATTRIBUTE.COMMENTS IS '属性的附加描述';
COMMENT ON COLUMN public.A_ATTRIBUTE.SERVICE_ID IS '所属服务的ID';
COMMENT ON COLUMN public.A_ATTRIBUTE.PROJECT_ID IS '该参数是由哪个项目创建而来';

-- Enable the trigger to update the UPDATE_DATE automatically.
CREATE TRIGGER T_UD_A_ATTRIBUTE BEFORE UPDATE ON public.A_ATTRIBUTE
FOR EACH ROW
EXECUTE PROCEDURE T_UPDATE_DATE();

-- Going to create Table: public.A_STRUCT_ATTRIBUTE_TYPE
DROP TABLE IF EXISTS public.A_STRUCT_ATTRIBUTE_TYPE CASCADE;
CREATE TABLE public.A_STRUCT_ATTRIBUTE_TYPE
(
    ID serial primary key,
    CODE character varying(255) NOT NULL,
    NAME character varying(255) NOT NULL,
    STATUS smallint,
    COMMENTS character varying(255),
    PROJECT_CODE character varying(255) NOT NULL DEFAULT 'GLOBAL',
    PROJECT_ID integer,
    CREATOR_ID bigint,
    TENANT_ID character(36),
    CREATE_DATE timestamp(0) with time zone DEFAULT now(),
    UPDATE_DATE timestamp(0) with time zone DEFAULT now()
);

ALTER TABLE public.A_STRUCT_ATTRIBUTE_TYPE OWNER to admin;
COMMENT ON COLUMN public.A_STRUCT_ATTRIBUTE_TYPE.ID IS 'ID';
COMMENT ON COLUMN public.A_STRUCT_ATTRIBUTE_TYPE.CODE IS '将作为StructAttribute的TypeName';
COMMENT ON COLUMN public.A_STRUCT_ATTRIBUTE_TYPE.NAME IS '属性的名称';
COMMENT ON COLUMN public.A_STRUCT_ATTRIBUTE_TYPE.STATUS IS '属性的状态，参考字典的GLOBAL.STATUS';
COMMENT ON COLUMN public.A_STRUCT_ATTRIBUTE_TYPE.COMMENTS IS '属性的附加描述';
COMMENT ON COLUMN public.A_STRUCT_ATTRIBUTE_TYPE.PROJECT_CODE IS '将作为StructAttribute的NAMESPACE';
COMMENT ON COLUMN public.A_STRUCT_ATTRIBUTE_TYPE.PROJECT_ID IS '该结构体参数是由哪个项目创建而来';

-- Enable the trigger to update the UPDATE_DATE automatically.
CREATE TRIGGER T_UD_A_STRUCT_ATTRIBUTE_TYPE BEFORE UPDATE ON public.A_STRUCT_ATTRIBUTE_TYPE
FOR EACH ROW
EXECUTE PROCEDURE T_UPDATE_DATE();

-- Going to create Table: public.A_STRUCT_ATTRIBUTE_ITEM
DROP TABLE IF EXISTS public.A_STRUCT_ATTRIBUTE_ITEM CASCADE;
CREATE TABLE public.A_STRUCT_ATTRIBUTE_ITEM
(
    ID serial primary key,
    CODE character varying(32) NOT NULL,
    NAME character varying(255),
    TYPE character varying(128) NOT NULL,
    STATUS smallint,
    IS_ARRAY bool,
    COMMENTS character varying(255),
    STRUCT_ATTRIBUTE_TYPE_ID integer REFERENCES A_STRUCT_ATTRIBUTE_TYPE(ID),
    CREATE_DATE timestamp(0) with time zone DEFAULT now(),
    UPDATE_DATE timestamp(0) with time zone DEFAULT now()
);

ALTER TABLE public.A_STRUCT_ATTRIBUTE_ITEM OWNER to admin;
COMMENT ON COLUMN public.A_STRUCT_ATTRIBUTE_ITEM.ID IS 'ID';
COMMENT ON COLUMN public.A_STRUCT_ATTRIBUTE_ITEM.CODE IS '将作为StructAttribute的name';
COMMENT ON COLUMN public.A_STRUCT_ATTRIBUTE_ITEM.NAME IS '属性的名称, 中文名称';
COMMENT ON COLUMN public.A_STRUCT_ATTRIBUTE_ITEM.TYPE IS '属性的类型，包括：基本类型和已创建的结构类型。参考字典的GLOBAL.PRIMITIVE_TYPE || Created StructAttributes';
COMMENT ON COLUMN public.A_STRUCT_ATTRIBUTE_ITEM.STATUS IS '属性的状态，参考字典的GLOBAL.STATUS';
COMMENT ON COLUMN public.A_STRUCT_ATTRIBUTE_ITEM.IS_ARRAY IS '该属性是否为菜单';
COMMENT ON COLUMN public.A_STRUCT_ATTRIBUTE_ITEM.COMMENTS IS '属性的附加描述';
COMMENT ON COLUMN public.A_STRUCT_ATTRIBUTE_ITEM.STRUCT_ATTRIBUTE_TYPE_ID IS '所属的结构体ID';

-- Enable the trigger to update the UPDATE_DATE automatically.
CREATE TRIGGER T_UD_A_STRUCT_ATTRIBUTE_ITEM BEFORE UPDATE ON public.A_STRUCT_ATTRIBUTE_ITEM
FOR EACH ROW
EXECUTE PROCEDURE T_UPDATE_DATE();


-- ==================================================================
-- *     Going to build the Environment domain related entries.     *
-- ==================================================================

-- Going to create Table: public.E_HOSTS
DROP TABLE IF EXISTS public.E_HOSTS CASCADE;
CREATE TABLE public.E_HOSTS
(
    ID serial primary key,
    CODE character varying(255) NOT NULL,
    NAME character varying(255) NOT NULL,
    IP inet,
    VIP inet,
    ENV_TYPE smallint,
    CPU smallint,
    MEM integer,
    DISK integer,
    SSH_USER character varying(255),
    SSH_PWD character varying(255),
    SSH_PUBLIC_KEY character varying(512),
    STATUS smallint,
    DEPLOY_PATH character varying(255),
    COMMENTS character varying(255),
    CREATOR_ID bigint,
    TENANT_ID character(36),
    CREATE_DATE timestamp(0) with time zone DEFAULT now(),
    UPDATE_DATE timestamp(0) with time zone DEFAULT now()
);

ALTER TABLE public.E_HOSTS OWNER to admin;
COMMENT ON COLUMN public.E_HOSTS.ID IS 'ID';
COMMENT ON COLUMN public.E_HOSTS.CODE IS '主机编码';
COMMENT ON COLUMN public.E_HOSTS.IP IS '主机的IP';
COMMENT ON COLUMN public.E_HOSTS.VIP IS '主机的VIP';
COMMENT ON COLUMN public.E_HOSTS.ENV_TYPE IS '主机所属的环境，参考字典的GLOBAL.ENV_TYPE';
COMMENT ON COLUMN public.E_HOSTS.CPU IS '主机的核数';
COMMENT ON COLUMN public.E_HOSTS.MEM IS '主机的MEM,单位GB';
COMMENT ON COLUMN public.E_HOSTS.DISK IS '主机的DISK,单位GB';
COMMENT ON COLUMN public.E_HOSTS.SSH_USER IS '主机的DISK,单位GB';
COMMENT ON COLUMN public.E_HOSTS.SSH_PWD IS '主机的DISK,单位GB';
COMMENT ON COLUMN public.E_HOSTS.SSH_PUBLIC_KEY IS '主机的DISK,单位GB';
COMMENT ON COLUMN public.E_HOSTS.DEPLOY_PATH IS '主机的DISK,单位GB';
COMMENT ON COLUMN public.E_HOSTS.STATUS IS '属性的状态，参考字典的GLOBAL.STATUS';
COMMENT ON COLUMN public.E_HOSTS.COMMENTS IS '主机的附加描述';

-- Enable the trigger to update the UPDATE_DATE automatically.
CREATE TRIGGER T_UD_E_HOSTS BEFORE UPDATE ON public.E_HOSTS
FOR EACH ROW
EXECUTE PROCEDURE T_UPDATE_DATE();

-- Going to create Table: public.E_KUBERNETES
DROP TABLE IF EXISTS public.E_KUBERNETES CASCADE;
CREATE TABLE public.E_KUBERNETES
(
    ID serial primary key,
    CODE character varying(255) NOT NULL,
    NAME character varying(255) NOT NULL,
    ADDRESS character varying(255) NOT NULL,
    ENV_TYPE smallint,
    USER_NAME character varying(64),
    PASSWORD character varying(255),
    TOKEN character varying(255),
    STATUS smallint,
    NAMESPACE character varying(255),
    COMMENTS character varying(255),
    CREATOR_ID bigint,
    TENANT_ID character(36),
    CREATE_DATE timestamp(0) with time zone DEFAULT now(),
    UPDATE_DATE timestamp(0) with time zone DEFAULT now()
);

ALTER TABLE public.E_KUBERNETES OWNER to admin;
COMMENT ON COLUMN public.E_KUBERNETES.ID IS 'ID';
COMMENT ON COLUMN public.E_KUBERNETES.CODE IS 'Kuibernetes编码';
COMMENT ON COLUMN public.E_KUBERNETES.NAME IS 'Kuibernetes的名称';
COMMENT ON COLUMN public.E_KUBERNETES.ADDRESS IS 'Kuibernetes的API地址';
COMMENT ON COLUMN public.E_KUBERNETES.ENV_TYPE IS 'Kuibernetes所属的环境，参考字典的GLOBAL.ENV_TYPE';
COMMENT ON COLUMN public.E_KUBERNETES.USER_NAME IS 'Kuibernetes访问的用户名';
COMMENT ON COLUMN public.E_KUBERNETES.PASSWORD IS 'Kuibernetes访问的密码';
COMMENT ON COLUMN public.E_KUBERNETES.TOKEN IS 'Kuibernetes访问的Token';
COMMENT ON COLUMN public.E_KUBERNETES.STATUS IS 'Kubernetes的状态，参考字典的GLOBAL.STATUS';
COMMENT ON COLUMN public.E_KUBERNETES.NAMESPACE IS 'Kubernetes的域名';
COMMENT ON COLUMN public.E_KUBERNETES.COMMENTS IS 'Kubernetes的附加描述';

-- Enable the trigger to update the UPDATE_DATE automatically.
CREATE TRIGGER T_UD_E_KUBERNETES BEFORE UPDATE ON public.E_KUBERNETES
FOR EACH ROW
EXECUTE PROCEDURE T_UPDATE_DATE();

-- Going to create Table: public.E_DATA_SOURCE
DROP TABLE IF EXISTS public.E_DATA_SOURCE CASCADE;
CREATE TABLE public.E_DATA_SOURCE
(
    ID serial primary key,
    CODE character varying(255) NOT NULL,
    NAME character varying(255) NOT NULL,
    TYPE smallint,
    ENV_TYPE smallint,
    IP inet NOT NULL,
    PORT integer,
    USER_NAME character varying(64),
    PASSWORD character varying(255),
    SCHEMA character varying(64),
    STATUS smallint,
    VERSION smallint NOT NULL,
    COMMENTS character varying(255),
    CREATOR_ID bigint,
    TENANT_ID character(36),
    CREATE_DATE timestamp(0) with time zone DEFAULT now(),
    UPDATE_DATE timestamp(0) with time zone DEFAULT now()
);

ALTER TABLE public.E_DATA_SOURCE OWNER to admin;
COMMENT ON COLUMN public.E_DATA_SOURCE.ID IS 'ID';
COMMENT ON COLUMN public.E_DATA_SOURCE.CODE IS '数据库编码';
COMMENT ON COLUMN public.E_DATA_SOURCE.NAME IS '数据库的名称';
COMMENT ON COLUMN public.E_DATA_SOURCE.TYPE IS '数据库的类型';
COMMENT ON COLUMN public.E_DATA_SOURCE.ENV_TYPE IS '数据库所属的环境，参考字典的GLOBAL.ENV_TYPE';
COMMENT ON COLUMN public.E_DATA_SOURCE.USER_NAME IS '数据库访问的用户名';
COMMENT ON COLUMN public.E_DATA_SOURCE.PASSWORD IS '数据库访问的密码';
COMMENT ON COLUMN public.E_DATA_SOURCE.IP IS '数据库访问的IP地址';
COMMENT ON COLUMN public.E_DATA_SOURCE.PORT IS '数据库访问的端口';
COMMENT ON COLUMN public.E_DATA_SOURCE.STATUS IS '数据库的状态，参考字典的GLOBAL.STATUS';
COMMENT ON COLUMN public.E_DATA_SOURCE.SCHEMA IS '数据库的库名';
COMMENT ON COLUMN public.E_DATA_SOURCE.VERSION IS '数据库的版本';
COMMENT ON COLUMN public.E_DATA_SOURCE.COMMENTS IS '数据库的附加描述';

-- Enable the trigger to update the UPDATE_DATE automatically.
CREATE TRIGGER T_UD_E_DATA_SOURCE BEFORE UPDATE ON public.E_DATA_SOURCE
FOR EACH ROW
EXECUTE PROCEDURE T_UPDATE_DATE();

-- Going to create Table: public.E_DATA_CACHE
DROP TABLE IF EXISTS public.E_DATA_CACHE CASCADE;
CREATE TABLE public.E_DATA_CACHE
(
    ID serial primary key,
    CODE character varying(255) NOT NULL,
    NAME character varying(255) NOT NULL,
    TYPE smallint,
    ENV_TYPE smallint,
    IS_CLUSTER bool DEFAULT false,
    IP character varying(255) NOT NULL,
    PORT integer,
    USER_NAME character varying(64),
    PASSWORD character varying(255),
    STATUS smallint,
    VERSION smallint NOT NULL,
    COMMENTS character varying(255),
    CREATOR_ID bigint,
    TENANT_ID character(36),
    CREATE_DATE timestamp(0) with time zone DEFAULT now(),
    UPDATE_DATE timestamp(0) with time zone DEFAULT now()
);

ALTER TABLE public.E_DATA_CACHE OWNER to admin;
COMMENT ON COLUMN public.E_DATA_CACHE.ID IS 'ID';
COMMENT ON COLUMN public.E_DATA_CACHE.CODE IS '缓存编码';
COMMENT ON COLUMN public.E_DATA_CACHE.NAME IS '缓存的名称';
COMMENT ON COLUMN public.E_DATA_CACHE.TYPE IS '缓存的类型';
COMMENT ON COLUMN public.E_DATA_CACHE.ENV_TYPE IS '缓存所属的环境，参考字典的GLOBAL.STATUS';
COMMENT ON COLUMN public.E_DATA_CACHE.IS_CLUSTER IS '缓存是否为集群模式部署';
COMMENT ON COLUMN public.E_DATA_CACHE.USER_NAME IS '缓存访问的用户名';
COMMENT ON COLUMN public.E_DATA_CACHE.PASSWORD IS '缓存访问的密码';
COMMENT ON COLUMN public.E_DATA_CACHE.IP IS '缓存访问的IP地址';
COMMENT ON COLUMN public.E_DATA_CACHE.PORT IS '缓存访问的端口';
COMMENT ON COLUMN public.E_DATA_CACHE.STATUS IS '缓存的状态，参考字典的GLOBAL.STATUS';
COMMENT ON COLUMN public.E_DATA_CACHE.VERSION IS '缓存的版本';
COMMENT ON COLUMN public.E_DATA_CACHE.COMMENTS IS '缓存的附加描述';

-- Enable the trigger to update the UPDATE_DATE automatically.
CREATE TRIGGER T_UD_E_DATA_CACHE BEFORE UPDATE ON public.E_DATA_CACHE
FOR EACH ROW
EXECUTE PROCEDURE T_UPDATE_DATE();

-- Going to create Table: public.E_MESSAGE_QUEUE
DROP TABLE IF EXISTS public.E_MESSAGE_QUEUE CASCADE;
CREATE TABLE public.E_MESSAGE_QUEUE
(
    ID serial primary key,
    CODE character varying(255) NOT NULL,
    NAME character varying(255) NOT NULL,
    TYPE smallint,
    ENV_TYPE smallint,
    IS_CLUSTER bool DEFAULT false,
    IP character varying(255) NOT NULL,
    PORT integer,
    USER_NAME character varying(64),
    PASSWORD character varying(255),
    STATUS smallint,
    VERSION smallint NOT NULL,
    COMMENTS character varying(255),
    CREATOR_ID bigint,
    TENANT_ID character(36),
    CREATE_DATE timestamp(0) with time zone DEFAULT now(),
    UPDATE_DATE timestamp(0) with time zone DEFAULT now()
);

ALTER TABLE public.E_MESSAGE_QUEUE OWNER to admin;
COMMENT ON COLUMN public.E_MESSAGE_QUEUE.ID IS 'ID';
COMMENT ON COLUMN public.E_MESSAGE_QUEUE.CODE IS '缓存编码';
COMMENT ON COLUMN public.E_MESSAGE_QUEUE.NAME IS '缓存的名称';
COMMENT ON COLUMN public.E_MESSAGE_QUEUE.TYPE IS '缓存的类型';
COMMENT ON COLUMN public.E_MESSAGE_QUEUE.ENV_TYPE IS '缓存所属的环境，参考字典的GLOBAL.ENV_TYPE';
COMMENT ON COLUMN public.E_MESSAGE_QUEUE.IS_CLUSTER IS '缓存是否为集群模式部署';
COMMENT ON COLUMN public.E_MESSAGE_QUEUE.IP IS '缓存访问的IP地址';
COMMENT ON COLUMN public.E_MESSAGE_QUEUE.PORT IS '缓存访问的端口';
COMMENT ON COLUMN public.E_MESSAGE_QUEUE.USER_NAME IS '缓存访问的用户名';
COMMENT ON COLUMN public.E_MESSAGE_QUEUE.PASSWORD IS '缓存访问的密码';
COMMENT ON COLUMN public.E_MESSAGE_QUEUE.STATUS IS '缓存的状态，参考字典的GLOBAL.STATUS';
COMMENT ON COLUMN public.E_MESSAGE_QUEUE.VERSION IS '缓存的版本';
COMMENT ON COLUMN public.E_MESSAGE_QUEUE.COMMENTS IS '缓存的附加描述';

-- Enable the trigger to update the UPDATE_DATE automatically.
CREATE TRIGGER T_UD_E_MESSAGE_QUEUE BEFORE UPDATE ON public.E_MESSAGE_QUEUE
FOR EACH ROW
EXECUTE PROCEDURE public.T_UPDATE_DATE();

-- Going to create Table: public.E_GIT
DROP TABLE IF EXISTS public.E_GIT CASCADE;
CREATE TABLE public.E_GIT
(
    ID serial primary key,
    CODE character varying(255) NOT NULL,
    NAME character varying(255) NOT NULL,
    LINK character varying(255),
    USER_NAME character varying(64),
    PASSWORD character varying(255),
    TOKEN character varying(255),
    STATUS smallint,
    COMMENTS character varying(255),
    CREATOR_ID bigint,
    TENANT_ID character(36),
    CREATE_DATE timestamp(0) with time zone DEFAULT now(),
    UPDATE_DATE timestamp(0) with time zone DEFAULT now()
);

ALTER TABLE public.E_GIT OWNER to admin;
COMMENT ON COLUMN public.E_GIT.ID IS 'ID';
COMMENT ON COLUMN public.E_GIT.CODE IS 'GIT编码';
COMMENT ON COLUMN public.E_GIT.NAME IS 'GIT的名称';
COMMENT ON COLUMN public.E_GIT.LINK IS 'Git地址';
COMMENT ON COLUMN public.E_GIT.USER_NAME IS '访问Git的用户名';
COMMENT ON COLUMN public.E_GIT.PASSWORD IS 'Git访问的密码';
COMMENT ON COLUMN public.E_GIT.TOKEN IS 'Git访问的Token';
COMMENT ON COLUMN public.E_GIT.STATUS IS 'Git的状态，参考字典的GLOBAL.STATUS';
COMMENT ON COLUMN public.E_GIT.COMMENTS IS 'Git的附加描述';

-- Enable the trigger to update the UPDATE_DATE automatically.
CREATE TRIGGER T_UD_E_GIT BEFORE UPDATE ON public.E_GIT
FOR EACH ROW
EXECUTE PROCEDURE T_UPDATE_DATE();

-- Going to create Table: public.E_MAVEN
DROP TABLE IF EXISTS public.E_MAVEN CASCADE;
CREATE TABLE public.E_MAVEN
(
    ID serial primary key,
    CODE character varying(255) NOT NULL,
    NAME character varying(255) NOT NULL,
    LINK character varying(255),
    USER_NAME character varying(64),
    PASSWORD character varying(255),
    TOKEN character varying(255),
    STATUS smallint,
    COMMENTS character varying(255),
    CREATOR_ID bigint,
    TENANT_ID character(36),
    CREATE_DATE timestamp(0) with time zone DEFAULT now(),
    UPDATE_DATE timestamp(0) with time zone DEFAULT now()
);

ALTER TABLE public.E_MAVEN OWNER to admin;
COMMENT ON COLUMN public.E_MAVEN.ID IS 'ID';
COMMENT ON COLUMN public.E_MAVEN.CODE IS 'Maven编码';
COMMENT ON COLUMN public.E_MAVEN.NAME IS 'Maven的名称';
COMMENT ON COLUMN public.E_MAVEN.LINK IS 'Maven地址';
COMMENT ON COLUMN public.E_MAVEN.USER_NAME IS '访问Maven的用户名';
COMMENT ON COLUMN public.E_MAVEN.PASSWORD IS 'Maven访问的密码';
COMMENT ON COLUMN public.E_MAVEN.STATUS IS 'Maven Repo的状态，参考字典的GLOBAL.STATUS';
COMMENT ON COLUMN public.E_MAVEN.COMMENTS IS 'Maven的附加描述';

-- Enable the trigger to update the UPDATE_DATE automatically.
CREATE TRIGGER T_UD_E_MAVEN BEFORE UPDATE ON public.E_MAVEN
FOR EACH ROW
EXECUTE PROCEDURE T_UPDATE_DATE();

-- Going to create Table: public.E_MAVEN_LIB
DROP TABLE IF EXISTS public.E_MAVEN_LIB CASCADE;
CREATE TABLE public.E_MAVEN_LIB
(
    ID serial primary key,
    MAVEN_ID integer REFERENCES E_MAVEN(ID),
    GROUP_ID character varying(255) NOT NULL,
    ARTIFACT_ID character varying(255),
    VERSION character varying(255),
    STATUS smallint,
    COMMENTS character varying(255),
    CREATOR_ID bigint,
    TENANT_ID character(36),
    CREATE_DATE timestamp(0) with time zone DEFAULT now(),
    UPDATE_DATE timestamp(0) with time zone DEFAULT now()
);

ALTER TABLE public.E_MAVEN_LIB OWNER to admin;
COMMENT ON COLUMN public.E_MAVEN_LIB.ID IS 'ID';
COMMENT ON COLUMN public.E_MAVEN_LIB.MAVEN_ID IS '所在Maven仓库ID';
COMMENT ON COLUMN public.E_MAVEN_LIB.GROUP_ID IS 'lib包的groupId';
COMMENT ON COLUMN public.E_MAVEN_LIB.ARTIFACT_ID IS 'lib包的artifactId';
COMMENT ON COLUMN public.E_MAVEN_LIB.VERSION IS 'lib包的version';
COMMENT ON COLUMN public.E_MAVEN_LIB.STATUS IS 'Maven lib的状态，参考字典的GLOBAL.STATUS';
COMMENT ON COLUMN public.E_MAVEN_LIB.COMMENTS IS 'Maven lib 的附加描述';

-- Enable the trigger to update the UPDATE_DATE automatically.
CREATE TRIGGER T_UD_E_MAVEN_LIB BEFORE UPDATE ON public.E_MAVEN_LIB
FOR EACH ROW
EXECUTE PROCEDURE T_UPDATE_DATE();



-- Going to create Table: public.E_DOCKER_HUB
DROP TABLE IF EXISTS public.E_DOCKER_HUB CASCADE;
CREATE TABLE public.E_DOCKER_HUB
(
    ID serial primary key,
    CODE character varying(255) NOT NULL,
    NAME character varying(255) NOT NULL,
    LINK character varying(255),
    USER_NAME character varying(64),
    PASSWORD character varying(255),
    TOKEN character varying(255),
    STATUS smallint,
    COMMENTS character varying(255),
    CREATOR_ID bigint,
    TENANT_ID character(36),
    CREATE_DATE timestamp(0) with time zone DEFAULT now(),
    UPDATE_DATE timestamp(0) with time zone DEFAULT now()
);

ALTER TABLE public.E_DOCKER_HUB OWNER to admin;
COMMENT ON COLUMN public.E_DOCKER_HUB.ID IS 'ID';
COMMENT ON COLUMN public.E_DOCKER_HUB.CODE IS 'Docker Hub编码';
COMMENT ON COLUMN public.E_DOCKER_HUB.NAME IS 'Docker Hub的名称';
COMMENT ON COLUMN public.E_DOCKER_HUB.LINK IS 'Docker Hub地址';
COMMENT ON COLUMN public.E_DOCKER_HUB.USER_NAME IS '访问Docker Hub的用户名';
COMMENT ON COLUMN public.E_DOCKER_HUB.PASSWORD IS 'Docker Hub访问的密码';
COMMENT ON COLUMN public.E_DOCKER_HUB.STATUS IS 'Docker Repo的状态，参考字典的GLOBAL.STATUS';
COMMENT ON COLUMN public.E_DOCKER_HUB.COMMENTS IS 'Docker Hub的附加描述';

-- Enable the trigger to update the UPDATE_DATE automatically.
CREATE TRIGGER T_UD_E_DOCKER_HUB BEFORE UPDATE ON public.E_DOCKER_HUB
FOR EACH ROW
EXECUTE PROCEDURE T_UPDATE_DATE();

-- ==================================================================
-- *       Going to build the User domain related entries.          *
-- ==================================================================

-- Going to create Table: public.U_ORGANIZATION
-- Controle the Data layer privileges.
DROP TABLE IF EXISTS public.U_ORGANIZATION CASCADE;
CREATE TABLE public.U_ORGANIZATION
(
    ID serial primary key,
    CODE character varying(255) NOT NULL,
    NAME character varying(255) NOT NULL,
    LEVEL smallint,
    PARENT_ID integer,
    STATUS smallint,
    COMMENTS character varying(255),
    CREATOR_ID bigint,
    TENANT_ID character(36),
    CREATE_DATE timestamp(0) with time zone DEFAULT now(),
    UPDATE_DATE timestamp(0) with time zone DEFAULT now()
);

ALTER TABLE public.U_ORGANIZATION OWNER to admin;
COMMENT ON COLUMN public.U_ORGANIZATION.ID IS 'ID';
COMMENT ON COLUMN public.U_ORGANIZATION.CODE IS '部门编码';
COMMENT ON COLUMN public.U_ORGANIZATION.NAME IS '部门名称';
COMMENT ON COLUMN public.U_ORGANIZATION.LEVEL IS '部门级别：参考数据字典';
COMMENT ON COLUMN public.U_ORGANIZATION.PARENT_ID IS '父级部门';
COMMENT ON COLUMN public.U_ORGANIZATION.STATUS IS '部门的状态，参考字典的GLOBAL.STATUS';
COMMENT ON COLUMN public.U_ORGANIZATION.COMMENTS IS '部门的附加描述';

-- Enable the trigger to update the UPDATE_DATE automatically.
CREATE TRIGGER T_UD_U_ORGANIZATION BEFORE UPDATE ON public.U_ORGANIZATION
FOR EACH ROW
EXECUTE PROCEDURE public.T_UPDATE_DATE();

-- Going to create Table: public.U_ROLE
-- Controle the Menu layer privileges.
DROP TABLE IF EXISTS public.U_ROLE CASCADE;
CREATE TABLE public.U_ROLE
(
    ID character(36) primary key,
    CODE character varying(255) NOT NULL,
    NAME character varying(255) NOT NULL,
    STATUS smallint DEFAULT 1,
    COMMENTS character varying(255),
    TYPE smallint DEFAULT 1,
    CREATOR_ID bigint,
    TENANT_ID character(36),
    CREATE_DATE timestamp(0) with time zone DEFAULT now(),
    UPDATE_DATE timestamp(0) with time zone DEFAULT now()
);

ALTER TABLE public.U_ROLE OWNER to admin;
COMMENT ON COLUMN public.U_ROLE.ID IS 'ID';
COMMENT ON COLUMN public.U_ROLE.CODE IS '角色编码';
COMMENT ON COLUMN public.U_ROLE.NAME IS '角色名称';
COMMENT ON COLUMN public.U_ROLE.STATUS IS '角色的状态，参考字典的GLOBAL.STATUS';
COMMENT ON COLUMN public.U_ROLE.TYPE IS '角色的类型，参考字典的ROLE.TYPE';
COMMENT ON COLUMN public.U_ROLE.COMMENTS IS '角色的附加描述';

-- Enable the trigger to update the UPDATE_DATE automatically.
CREATE TRIGGER T_UD_U_ROLE BEFORE UPDATE ON public.U_ROLE
FOR EACH ROW
EXECUTE PROCEDURE public.T_UPDATE_DATE();


-- Going to create Table: public.U_ROLE_MENU_MAP
DROP TABLE IF EXISTS public.U_ROLE_MENU_MAP CASCADE;
CREATE TABLE public.U_ROLE_MENU_MAP
(
    ID serial primary key,
    MENU_ID character(36) NOT NULL,
    ROLE_ID character(36) REFERENCES U_ROLE(ID),
    STATUS smallint,
    CREATOR_ID bigint,
    CREATE_DATE timestamp(0) with time zone DEFAULT now(),
    UPDATE_DATE timestamp(0) with time zone DEFAULT now()
);

ALTER TABLE public.U_ROLE_MENU_MAP OWNER to admin;
COMMENT ON COLUMN public.U_ROLE_MENU_MAP.ID IS 'ID';
COMMENT ON COLUMN public.U_ROLE_MENU_MAP.MENU_ID IS '菜单的ID，非本域的引用，非外键';
COMMENT ON COLUMN public.U_ROLE_MENU_MAP.ROLE_ID IS '角色ID';
COMMENT ON COLUMN public.U_ROLE_MENU_MAP.STATUS IS '角色所拥有菜单的状态，参考字典的GLOBAL.STATUS';

-- Enable the trigger to update the UPDATE_DATE automatically.
CREATE TRIGGER T_UD_U_ROLE_MENU_MAP BEFORE UPDATE ON public.U_ROLE_MENU_MAP
FOR EACH ROW
EXECUTE PROCEDURE public.T_UPDATE_DATE();

-- Going to create Table: public.U_USER
DROP TABLE IF EXISTS public.U_TENANT CASCADE;
CREATE TABLE public.U_TENANT
(
    ID character (36) primary key,
    CODE character varying(255) NOT NULL,
    NAME character varying(255) NOT NULL,
    LOGO character varying(255) NOT NULL,
    TYPE smallint,
    STATUS smallint,
    INDUSTRY smallint,
    CREATE_DATE timestamp(0) with time zone DEFAULT now(),
    UPDATE_DATE timestamp(0) with time zone DEFAULT now()
);

ALTER TABLE public.U_TENANT OWNER to admin;
COMMENT ON COLUMN public.U_TENANT.ID IS 'ID';
COMMENT ON COLUMN public.U_TENANT.CODE IS '租户的编码';
COMMENT ON COLUMN public.U_TENANT.NAME IS '租户的名称';
COMMENT ON COLUMN public.U_TENANT.LOGO IS '租户的Logo';
COMMENT ON COLUMN public.U_TENANT.TYPE IS '租户的类型：';
COMMENT ON COLUMN public.U_TENANT.STATUS IS '租户的状态，参考字典的GLOBAL.STATUS';
COMMENT ON COLUMN public.U_TENANT.STATUS IS '租户的行业，参考字典的GLOBAL.INDUSTRY';

-- Enable the trigger to update the UPDATE_DATE automatically.
CREATE TRIGGER T_UD_U_TENANT BEFORE UPDATE ON public.U_TENANT
FOR EACH ROW
EXECUTE PROCEDURE public.T_UPDATE_DATE();

-- Going to create Table: public.U_USER
DROP TABLE IF EXISTS public.U_USER CASCADE;
CREATE TABLE public.U_USER
(
    ID serial8 primary key,
    LOGIN_NAME character varying(64) NOT NULL,
    PASSWORD character varying(255) NOT NULL,
    WECHAT_ID character varying(255),
    QQ_ID character varying(255),
    WEIBO_ID character varying(255),
    PHONE character varying(32),
    STATUS smallint,
    LAST_SIGNIN_DATE timestamp(0) with time zone,
    NEXT_REFRESH_DATE timestamp(0) with time zone,
    EXPIRED_DATE timestamp(0) with time zone,
    CREATE_DATE timestamp(0) with time zone DEFAULT now(),
    UPDATE_DATE timestamp(0) with time zone DEFAULT now()
);

ALTER TABLE public.U_USER OWNER to admin;
COMMENT ON COLUMN public.U_USER.ID IS 'ID';
COMMENT ON COLUMN public.U_USER.LOGIN_NAME IS '登录用户名';
COMMENT ON COLUMN public.U_USER.PASSWORD IS '登录密码';
COMMENT ON COLUMN public.U_USER.WECHAT_ID IS '第三方微信登录的账号ID';
COMMENT ON COLUMN public.U_USER.QQ_ID IS '第三方QQ登录的账号ID';
COMMENT ON COLUMN public.U_USER.WEIBO_ID IS '第三方微博登录的账号ID';
COMMENT ON COLUMN public.U_USER.PHONE IS '用户的手机号';
COMMENT ON COLUMN public.U_USER.STATUS IS '用户账号的状态，参考字典的GLOBAL.STATUS';
COMMENT ON COLUMN public.U_USER.LAST_SIGNIN_DATE IS '该账号上次登录的时间';
COMMENT ON COLUMN public.U_USER.NEXT_REFRESH_DATE IS '该账号密码下次刷新的时间';
COMMENT ON COLUMN public.U_USER.EXPIRED_DATE IS '该账号过期时间';

-- Enable the trigger to update the UPDATE_DATE automatically.
CREATE TRIGGER T_UD_U_USER BEFORE UPDATE ON public.U_USER
FOR EACH ROW
EXECUTE PROCEDURE public.T_UPDATE_DATE();

-- Going to create Table: public.U_USER
DROP TABLE IF EXISTS public.U_USER_INFO CASCADE;
CREATE TABLE public.U_USER_INFO
(
    ID serial8 primary key,
    NAME character varying(255) NOT NULL,
    GENDER smallint,
    TITLE smallint,
    STATUS smallint,
    E_MAIL character varying(128),
    SEC_QUESTION smallint,
    SEC_ANSWER character varying(255),
    TENANT_ID character(36),
    USER_ID serial8,
    CREATE_DATE timestamp(0) with time zone DEFAULT now(),
    UPDATE_DATE timestamp(0) with time zone DEFAULT now()
);

ALTER TABLE public.U_USER_INFO OWNER to admin;
COMMENT ON COLUMN public.U_USER_INFO.ID IS 'ID';
COMMENT ON COLUMN public.U_USER_INFO.NAME IS '用户的名称';
COMMENT ON COLUMN public.U_USER_INFO.GENDER IS '用户的性别';
COMMENT ON COLUMN public.U_USER_INFO.TITLE IS '用户的职位，参考字典的USER.TITLE';
COMMENT ON COLUMN public.U_USER_INFO.STATUS IS '用户的状态，参考字典的GLOBAL.STATUS';
COMMENT ON COLUMN public.U_USER_INFO.E_MAIL IS 'Email地址';
COMMENT ON COLUMN public.U_USER_INFO.SEC_QUESTION IS '安全问题，参考数据字典';
COMMENT ON COLUMN public.U_USER_INFO.SEC_ANSWER IS '安全问题的答案';
COMMENT ON COLUMN public.U_USER_INFO.TENANT_ID IS '用户所属的租户ID';
COMMENT ON COLUMN public.U_USER_INFO.USER_ID IS '用户的的账号ID';

-- Enable the trigger to update the UPDATE_DATE automatically.
CREATE TRIGGER T_UD_U_USER_INFO BEFORE UPDATE ON public.U_USER_INFO
FOR EACH ROW
EXECUTE PROCEDURE public.T_UPDATE_DATE();

-- Going to create Table: public.U_USER_ORG_MAP
DROP TABLE IF EXISTS public.U_USER_ORG_MAP CASCADE;
CREATE TABLE public.U_USER_ORG_MAP
(
    ID serial primary key,
    USER_ID bigint REFERENCES U_USER_INFO(ID),
    ORG_ID integer REFERENCES U_ORGANIZATION(ID),
    STATUS smallint,
    CREATOR_ID bigint,
    CREATE_DATE timestamp(0) with time zone DEFAULT now(),
    UPDATE_DATE timestamp(0) with time zone DEFAULT now()
);

ALTER TABLE public.U_USER_ORG_MAP OWNER to admin;
COMMENT ON COLUMN public.U_USER_ORG_MAP.ID IS 'ID';
COMMENT ON COLUMN public.U_USER_ORG_MAP.USER_ID IS '用户的ID';
COMMENT ON COLUMN public.U_USER_ORG_MAP.ORG_ID IS '所负责部门的ID';
COMMENT ON COLUMN public.U_USER_ORG_MAP.STATUS IS '用户和所负责部门的映射关系状态，参考字典的GLOBAL.STATUS';

-- Enable the trigger to update the UPDATE_DATE automatically.
CREATE TRIGGER T_UD_U_USER_ORG_MAP BEFORE UPDATE ON public.U_USER_ORG_MAP
FOR EACH ROW
EXECUTE PROCEDURE public.T_UPDATE_DATE();

-- Going to create Table: public.U_USER_ROLE_MAP
DROP TABLE IF EXISTS public.U_USER_ROLE_MAP CASCADE;
CREATE TABLE public.U_USER_ROLE_MAP
(
    ID serial primary key,
    USER_ID bigint REFERENCES U_USER_INFO(ID),
    ROLE_ID character(36) REFERENCES U_ROLE(ID),
    STATUS smallint,
    CREATOR_ID bigint,
    CREATE_DATE timestamp(0) with time zone DEFAULT now(),
    UPDATE_DATE timestamp(0) with time zone DEFAULT now()
);

ALTER TABLE public.U_USER_ROLE_MAP OWNER to admin;
COMMENT ON COLUMN public.U_USER_ROLE_MAP.ID IS 'ID';
COMMENT ON COLUMN public.U_USER_ROLE_MAP.USER_ID IS '用户的ID';
COMMENT ON COLUMN public.U_USER_ROLE_MAP.ROLE_ID IS '所拥有角色的ID';
COMMENT ON COLUMN public.U_USER_ROLE_MAP.STATUS IS '用户和角色的映射关系状态，参考字典的GLOBAL.STATUS';

-- Enable the trigger to update the UPDATE_DATE automatically.
CREATE TRIGGER T_UD_U_USER_ROLE_MAP BEFORE UPDATE ON public.U_USER_ROLE_MAP
FOR EACH ROW
EXECUTE PROCEDURE public.T_UPDATE_DATE();
