USE DOTWARE
GO

SELECT * FROM sys.tables

IF EXISTS (SELECT object_id FROM sys.tables WHERE name = 'USER_GROUPS' AND [type] = 'U')
  DROP TABLE USER_GROUPS

IF EXISTS (SELECT object_id FROM sys.tables WHERE name = 'USER_ACCOUNTS' AND [type] = 'U')
  DROP TABLE USER_ACCOUNTS

IF EXISTS (SELECT object_id FROM sys.tables WHERE name = 'CODES' AND [type] = 'U')
  DROP TABLE CODES

IF EXISTS (SELECT object_id FROM sys.tables WHERE name = 'CODE_GROUPS' AND [type] = 'U')
  DROP TABLE CODE_GROUPS

IF EXISTS (SELECT object_id FROM sys.tables WHERE name = 'USERS' AND [type] = 'U')
  DROP TABLE USERS


CREATE TABLE CODE_GROUPS (
  group_id INT NOT NULL IDENTITY(0, 1),
  group_name NVARCHAR(255) NOT NULL,
  display_order TINYINT NOT NULL,
  usable TINYINT NOT NULL CONSTRAINT df_CodeGroups_usable DEFAULT (1),
  created_at DATETIME NOT NULL CONSTRAINT df_CodeGroups_createdAt DEFAULT (GETDATE()),
  created_by INT NOT NULL,
  modified_at DATETIME NOT NULL CONSTRAINT df_CodeGroups_modifiedAt DEFAULT (GETDATE()),
  modified_by INT NOT NULL,
  group_value NVARCHAR(50) NOT NULL,
  parent_id INT NULL,
  code_type TINYINT NOT NULL CONSTRAINT df_CodeGroups_codeType DEFAULT (1),
  code_order_field NVARCHAR(255) NULL,
  memo NTEXT NULL,
  CONSTRAINT pk_CodeGroups PRIMARY KEY (group_id) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE INDEX [ix_CodeGroups_value] ON CODE_GROUPS (group_value, usable) ON [PRIMARY]
GO

CREATE INDEX [ix_CodeGroups_parent] ON CODE_GROUPS (parent_id, usable) ON [PRIMARY]
GO

CREATE TABLE CODES (
  code_id INT NOT NULL IDENTITY,
  group_id INT NOT NULL,
  code_name NVARCHAR(255) NOT NULL,
  display_order TINYINT NOT NULL,
  usable TINYINT NOT NULL CONSTRAINT df_Codes_usable DEFAULT (1),
  active TINYINT NOT NULL CONSTRAINT df_Codes_active DEFAULT (1),
  is_default TINYINT NOT NULL CONSTRAINT df_Codes_isDefault DEFAULT (0),
  created_at DATETIME NOT NULL CONSTRAINT df_Codes_createdAt DEFAULT (GETDATE()),
  created_by INT NOT NULL,
  modified_at DATETIME NOT NULL CONSTRAINT df_Codes_modifiedAt DEFAULT (GETDATE()),
  modified_by INT NOT NULL,
  code_value NVARCHAR(50) NOT NULl,
  parent_id INT NULl,
  memo NTEXT NULL,
  CONSTRAINT pk_Codes PRIMARY KEY (code_id) ON [PRIMARY]
) ON [PRIMARY]

CREATE INDEX [ix_Codes_group] ON CODES (group_id, usable, code_value) ON [PRIMARY]
GO


CREATE INDEX [ix_Codes_parent] ON CODES (parent_id, group_id, usable) ON [PRIMARY]
GO

CREATE TABLE USERS (
  user_id INT NOT NULL IDENTITY,
  user_name NVARCHAR(50) NOT NULL,
  usable TINYINT NOT NULL CONSTRAINT df_Users_usable DEFAULT (1),
  active TINYINT NOT NULL CONSTRAINT df_Users_active DEFAULT (1),
  created_at DATETIME NOT NULL CONSTRAINT df_Users_createdAt DEFAULT (GETDATE()),
  modified_at DATETIME NOT NULL CONSTRAINT df_Users_modifiedAt DEFAULT (GETDATE()),
  CONSTRAINT pk_Users PRIMARY KEY (user_id) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE USER_GROUPS (
  group_id INT NOT NULL IDENTITY,
  user_id INT NOT NULL,
  group_code INT NOT NULL,
  usable TINYINT NOT NULL CONSTRAINT df_UserGroups_usable DEFAULT (1),
  CONSTRAINT pk_UserGroups PRIMARY KEY (group_id) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE USER_ACCOUNTS (
  account_id INT NOT NULL IDENTITY,
  user_id INT NOT NULL,
  platform_code INT NOT NULL,
  login_id NVARCHAR(255) NOT NULL,
  login_pwd NVARCHAR(255) NOT NULL,
  usable TINYINT NOT NULL CONSTRAINT df_UserAccounts_usable DEFAULT (1),
  is_default TINYINT NOT NULL CONSTRAINT df_UserAccounts_isDefault DEFAULT (1),
  CONSTRAINT pk_UserAccounts PRIMARY KEY (account_id) ON [PRIMARY]
) ON [PRIMARY]
GO

/**
 * 참조키 만들기
 **/
ALTER TABLE CODE_GROUPS ADD
  CONSTRAINT fk_CodeGroups_parentId_REF_CodeGroups FOREIGN KEY (parent_id) REFERENCES CODE_GROUPS (group_id),
  CONSTRAINT fk_CodeGroups_createdBy_REF_Users FOREIGN KEY (created_by) REFERENCES USERS (user_id),
  CONSTRAINT fk_CodeGroups_modifiedBy_REF_Users FOREIGN KEY (created_by) REFERENCES USERS (user_id)
GO

ALTER TABLE CODES ADD
  CONSTRAINT fk_Codes_groupId_REF_CodeGroups FOREIGN KEY (group_id) REFERENCES CODE_GROUPS (group_id),
  CONSTRAINT fk_Codes_parentId_REF_Codes FOREIGN KEY (parent_id) REFERENCES CODES (code_id),
  CONSTRAINT fk_Codes_createdBy_REF_Users FOREIGN KEY (created_by) REFERENCES USERS (user_id),
  CONSTRAINT fk_Codes_modifiedBy_REF_Users FOREIGN KEY (created_by) REFERENCES USERS (user_id)
GO

ALTER TABLE USER_ACCOUNTS ADD
  CONSTRAINT fk_UserAccounts_userId_REF_Users FOREIGN KEY (user_id) REFERENCES USERS (user_id),
  CONSTRAINT fk_UserAccounts_plaformCode_REF_Codes FOREIGN KEY (platform_code) REFERENCES CODES (code_id)
GO

ALTER TABLE USER_GROUPS ADD
  CONSTRAINT fk_UserGroups_userId_REF_Users FOREIGN KEY (user_id) REFERENCES USERS (user_id),
  CONSTRAINT fk_UserGroups_groupCode_REF_Codes FOREIGN KEY (group_code) REFERENCES CODES (code_id)
GO