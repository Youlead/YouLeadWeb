ALTER TABLE siteserver_Comment ADD
    NodeID                 int             DEFAULT 0 NOT NULL,
    ContentID              int             DEFAULT 0 NOT NULL,
    Good                   int             DEFAULT 0 NOT NULL,
    UserName               nvarchar(50)    DEFAULT '' NOT NULL,
    IPAddress              varchar(50)     DEFAULT '' NOT NULL,
    AddDate                datetime        DEFAULT getdate() NOT NULL,
    IsChecked              varchar(18)     DEFAULT '' NOT NULL,
    IsRecommend            varchar(18)     DEFAULT '' NOT NULL,
    Content                ntext           DEFAULT '' NOT NULL
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[siteserver_ThirdLogin](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PublishmentSystemID] [int] NOT NULL,
	[ThirdLoginType] [varchar](50) NOT NULL,
	[ThirdLoginName] [nvarchar](50) NOT NULL,
	[IsEnabled] [varchar](18) NOT NULL,
	[Taxis] [int] NOT NULL,
	[Description] [nvarchar](255) NOT NULL,
	[SettingsXML] [ntext] NOT NULL,
 CONSTRAINT [PK_siteserver_ThirdLogin] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[siteserver_ThirdLogin] ADD  DEFAULT ((0)) FOR [PublishmentSystemID]
GO

ALTER TABLE [dbo].[siteserver_ThirdLogin] ADD  DEFAULT ((0)) FOR [ThirdLoginType]
GO

ALTER TABLE [dbo].[siteserver_ThirdLogin] ADD  DEFAULT ('') FOR [ThirdLoginName]
GO

ALTER TABLE [dbo].[siteserver_ThirdLogin] ADD  DEFAULT ('') FOR [IsEnabled]
GO

ALTER TABLE [dbo].[siteserver_ThirdLogin] ADD  DEFAULT ((0)) FOR [Taxis]
GO

ALTER TABLE [dbo].[siteserver_ThirdLogin] ADD  DEFAULT ('') FOR [Description]
GO

ALTER TABLE [dbo].[siteserver_ThirdLogin] ADD  DEFAULT ('') FOR [SettingsXML]
GO