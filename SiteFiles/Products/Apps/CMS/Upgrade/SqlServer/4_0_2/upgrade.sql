ALTER TABLE siteserver_Comment ADD
    NodeID                 int             DEFAULT ((0)) NOT NULL,
    ContentID              int             DEFAULT ((0)) NOT NULL,
    Good                   int             DEFAULT ((0)) NOT NULL,
    UserName               nvarchar(50)    DEFAULT ('') NOT NULL,
    IPAddress              varchar(50)     DEFAULT ('') NOT NULL,
    AddDate                datetime        DEFAULT getdate() NOT NULL,
    IsChecked              varchar(18)     DEFAULT ('') NOT NULL,
    IsRecommend            varchar(18)     DEFAULT ('') NOT NULL,
    Content                ntext           DEFAULT ('') NOT NULL
go

CREATE TABLE siteserver_ThirdLogin(
    ID                     int              IDENTITY(1,1),
    PublishmentSystemID    int              DEFAULT 0 NOT NULL,
    ThirdLoginType         varchar(50)      DEFAULT 0 NOT NULL,
    ThirdLoginName         nvarchar(50)     DEFAULT '' NOT NULL,
    IsEnabled              varchar(18)      DEFAULT '' NOT NULL,
    Taxis                  int              DEFAULT 0 NOT NULL,
    Description            nvarchar(255)    DEFAULT '' NOT NULL,
    SettingsXML            ntext            DEFAULT '' NOT NULL,
    CONSTRAINT PK_siteserver_ThirdLogin PRIMARY KEY NONCLUSTERED (ID)
)
go

