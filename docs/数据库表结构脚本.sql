USE [master]
GO
/****** Object:  Database [MangoDB]    Script Date: 2019/3/27 23:26:41 ******/
CREATE DATABASE [MangoDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MangoDB', FILENAME = N'E:\DataBase\MangoDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MangoDB_log', FILENAME = N'E:\DataBase\MangoDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MangoDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MangoDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MangoDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MangoDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MangoDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MangoDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [MangoDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MangoDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MangoDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MangoDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MangoDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MangoDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MangoDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MangoDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MangoDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MangoDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MangoDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MangoDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MangoDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MangoDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MangoDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MangoDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MangoDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MangoDB] SET RECOVERY FULL 
GO
ALTER DATABASE [MangoDB] SET  MULTI_USER 
GO
ALTER DATABASE [MangoDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MangoDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MangoDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MangoDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'MangoDB', N'ON'
GO
USE [MangoDB]
GO
/****** Object:  Table [dbo].[m_Docs]    Script Date: 2019/3/27 23:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_Docs](
	[DocsId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NULL,
	[ShortTitle] [nvarchar](50) NULL,
	[Contents] [nvarchar](max) NULL,
	[AppendTime] [datetime] NULL,
	[LastTime] [datetime] NULL,
	[ThemeId] [int] NULL,
	[UserId] [int] NULL,
	[ReadCount] [int] NULL,
	[PlusCount] [int] NULL,
	[Tags] [nvarchar](50) NULL,
	[VersionText] [text] NULL,
	[IsShow] [bit] NULL,
	[IsAudit] [bit] NULL,
 CONSTRAINT [PK_m_DocumentItems] PRIMARY KEY CLUSTERED 
(
	[DocsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_DocsTheme]    Script Date: 2019/3/27 23:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_DocsTheme](
	[ThemeId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NULL,
	[Contents] [nvarchar](max) NULL,
	[UserId] [int] NULL,
	[AppendTime] [datetime] NULL,
	[LastTime] [datetime] NULL,
	[ReadCount] [int] NULL,
	[PlusCount] [int] NULL,
	[Tags] [nvarchar](50) NULL,
	[VersionText] [varchar](500) NULL,
	[IsShow] [bit] NULL,
 CONSTRAINT [PK_m_Document] PRIMARY KEY CLUSTERED 
(
	[ThemeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_ManagerAccount]    Script Date: 2019/3/27 23:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_ManagerAccount](
	[AdminId] [int] IDENTITY(1,1) NOT NULL,
	[AdminName] [nvarchar](30) NULL,
	[Password] [varchar](50) NULL,
	[IsStatus] [bit] NULL,
	[RoleId] [int] NULL,
 CONSTRAINT [PK_m_ManagerAdmin] PRIMARY KEY CLUSTERED 
(
	[AdminId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_ManagerMenu]    Script Date: 2019/3/27 23:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_ManagerMenu](
	[MenuId] [int] IDENTITY(100,1) NOT NULL,
	[MenuName] [nvarchar](30) NOT NULL,
	[AreaName] [varchar](50) NULL,
	[ControllerName] [varchar](50) NULL,
	[ActionName] [varchar](50) NULL,
	[ParentId] [int] NULL,
	[IsPower] [bit] NULL,
 CONSTRAINT [PK_m_ManagerMenu] PRIMARY KEY CLUSTERED 
(
	[MenuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_ManagerPower]    Script Date: 2019/3/27 23:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_ManagerPower](
	[PowerId] [int] IDENTITY(1,1) NOT NULL,
	[MenuId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_m_ManagerPower] PRIMARY KEY CLUSTERED 
(
	[PowerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_ManagerRole]    Script Date: 2019/3/27 23:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_ManagerRole](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](30) NULL,
 CONSTRAINT [PK_m_ManagerRole] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_Message]    Script Date: 2019/3/27 23:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_Message](
	[MessageId] [int] IDENTITY(1,1) NOT NULL,
	[MessageType] [int] NULL,
	[Contents] [nvarchar](2000) NULL,
	[PostDate] [datetime] NULL,
	[UserId] [int] NULL,
	[AppendUserId] [int] NULL,
	[ObjId] [int] NULL,
	[IsRead] [bit] NULL,
 CONSTRAINT [PK_m_Message] PRIMARY KEY CLUSTERED 
(
	[MessageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_Navigation]    Script Date: 2019/3/27 23:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_Navigation](
	[NavigationId] [int] IDENTITY(100,1) NOT NULL,
	[NavigationName] [nvarchar](50) NULL,
	[IsShow] [bit] NULL,
	[Remark] [nvarchar](500) NULL,
	[CId] [int] NULL,
	[NavigationUrl] [varchar](200) NULL,
	[ClickCount] [int] NULL,
 CONSTRAINT [PK_m_Navigation] PRIMARY KEY CLUSTERED 
(
	[NavigationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_NavigationClassify]    Script Date: 2019/3/27 23:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_NavigationClassify](
	[CId] [int] IDENTITY(1,1) NOT NULL,
	[ClassifyName] [nvarchar](50) NULL,
	[IsShow] [bit] NULL,
	[SortCount] [int] NULL,
 CONSTRAINT [PK_m_NavigationClassify] PRIMARY KEY CLUSTERED 
(
	[CId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_Posts]    Script Date: 2019/3/27 23:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_Posts](
	[PostsId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NULL,
	[Contents] [nvarchar](max) NULL,
	[PostDate] [datetime] NULL,
	[LastDate] [datetime] NULL,
	[UserId] [int] NULL,
	[PlusCount] [int] NULL,
	[ReadCount] [int] NULL,
	[IsShow] [bit] NULL,
	[Tags] [nvarchar](100) NULL,
	[ImgUrl] [varchar](1000) NULL,
	[IsReply] [bit] NULL,
	[AnswerCount] [int] NULL,
	[ChannelId] [int] NULL,
 CONSTRAINT [PK_m_Posts] PRIMARY KEY CLUSTERED 
(
	[PostsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_PostsAnswer]    Script Date: 2019/3/27 23:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_PostsAnswer](
	[AnswerId] [int] IDENTITY(1,1) NOT NULL,
	[Contents] [nvarchar](max) NULL,
	[PostDate] [datetime] NULL,
	[UserId] [int] NULL,
	[PostsId] [int] NULL,
	[Plus] [int] NULL,
	[CommentsCount] [int] NULL,
	[IsShow] [bit] NULL,
 CONSTRAINT [PK_m_PostsAnswer] PRIMARY KEY CLUSTERED 
(
	[AnswerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_PostsAttention]    Script Date: 2019/3/27 23:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_PostsAttention](
	[AttentionId] [int] IDENTITY(1,1) NOT NULL,
	[PostsId] [int] NULL,
	[AttentionDate] [datetime] NULL,
	[UserId] [int] NULL,
 CONSTRAINT [PK_m_PostsAttention] PRIMARY KEY CLUSTERED 
(
	[AttentionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_PostsChannel]    Script Date: 2019/3/27 23:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_PostsChannel](
	[ChannelId] [int] IDENTITY(1,1) NOT NULL,
	[ChannelName] [nvarchar](30) NULL,
	[Remarks] [nvarchar](500) NULL,
	[IsShow] [bit] NULL,
	[AppendTime] [datetime] NULL,
	[IsManager] [bit] NULL,
	[SortCount] [int] NULL,
 CONSTRAINT [PK_m_PostsChannel] PRIMARY KEY CLUSTERED 
(
	[ChannelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_PostsComments]    Script Date: 2019/3/27 23:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_PostsComments](
	[CommentId] [int] IDENTITY(1,1) NOT NULL,
	[Contents] [varchar](1000) NULL,
	[PostDate] [datetime] NULL,
	[UserId] [int] NULL,
	[ToUserId] [int] NULL,
	[AnswerId] [int] NULL,
	[IsShow] [bit] NULL,
	[Plus] [int] NULL,
 CONSTRAINT [PK_m_PostsComments] PRIMARY KEY CLUSTERED 
(
	[CommentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_PostsTags]    Script Date: 2019/3/27 23:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_PostsTags](
	[TagsId] [int] IDENTITY(1,1) NOT NULL,
	[TagsName] [nvarchar](50) NULL,
 CONSTRAINT [PK_m_PostsProperty] PRIMARY KEY CLUSTERED 
(
	[TagsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_Sms]    Script Date: 2019/3/27 23:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_Sms](
	[SmsID] [int] IDENTITY(1,1) NOT NULL,
	[Phone] [varchar](100) NULL,
	[Contents] [nvarchar](2000) NULL,
	[SendTime] [datetime] NULL,
	[SendIP] [varchar](50) NULL,
	[IsOk] [bit] NULL,
 CONSTRAINT [PK_m_Sms] PRIMARY KEY CLUSTERED 
(
	[SmsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_User]    Script Date: 2019/3/27 23:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[NickName] [nvarchar](20) NULL,
	[RegisterDate] [datetime] NULL,
	[LastLoginDate] [datetime] NULL,
	[LastLoginIP] [varchar](50) NULL,
	[RegisterIP] [varchar](50) NULL,
	[IsStatus] [bit] NULL,
	[HeadUrl] [varchar](200) NULL,
	[GroupId] [int] NULL,
	[Phone] [varchar](20) NULL,
	[OpenId] [varchar](80) NULL,
	[Email] [varchar](100) NULL,
	[AddressInfo] [nvarchar](50) NULL,
	[Birthday] [varchar](30) NULL,
	[Tags] [nvarchar](300) NULL,
	[Sex] [nvarchar](10) NULL,
 CONSTRAINT [PK_m_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_UserGroup]    Script Date: 2019/3/27 23:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_UserGroup](
	[GroupId] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [nvarchar](50) NOT NULL,
	[IsDefault] [bit] NULL,
 CONSTRAINT [PK_m_UserGroup] PRIMARY KEY CLUSTERED 
(
	[GroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_UserGroupMenu]    Script Date: 2019/3/27 23:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_UserGroupMenu](
	[MId] [int] IDENTITY(100,1) NOT NULL,
	[MName] [nvarchar](50) NULL,
	[AreaName] [varchar](50) NULL,
	[ControllerName] [varchar](50) NULL,
	[ActionName] [varchar](50) NULL,
	[ParentId] [int] NULL,
	[IsPower] [bit] NULL,
 CONSTRAINT [PK_m_UserGroupMenu] PRIMARY KEY CLUSTERED 
(
	[MId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_UserGroupPower]    Script Date: 2019/3/27 23:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_UserGroupPower](
	[PId] [int] IDENTITY(1,1) NOT NULL,
	[MId] [int] NOT NULL,
	[GroupId] [int] NOT NULL,
 CONSTRAINT [PK_m_UserGroupPower] PRIMARY KEY CLUSTERED 
(
	[PId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_UserPlusRecords]    Script Date: 2019/3/27 23:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_UserPlusRecords](
	[RecordsId] [int] IDENTITY(1,1) NOT NULL,
	[ObjectId] [int] NULL,
	[UserId] [int] NULL,
	[AppendTime] [datetime] NULL,
	[RecordsType] [int] NULL,
 CONSTRAINT [PK_m_PlusRecords] PRIMARY KEY CLUSTERED 
(
	[RecordsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_WebSiteConfig]    Script Date: 2019/3/27 23:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_WebSiteConfig](
	[ConfigId] [int] NOT NULL,
	[WebSiteName] [nvarchar](50) NULL,
	[WebSiteUrl] [varchar](100) NULL,
	[WebSiteTitle] [nvarchar](100) NULL,
	[WebSiteKeyWord] [nvarchar](100) NULL,
	[WebSiteDescription] [nvarchar](200) NULL,
	[CopyrightText] [nvarchar](2000) NULL,
	[IsLogin] [bit] NULL,
	[IsRegister] [bit] NULL,
	[FilingNo] [nvarchar](50) NULL,
 CONSTRAINT [PK_m_WebSiteConfig] PRIMARY KEY CLUSTERED 
(
	[ConfigId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[m_WebSiteNavigation]    Script Date: 2019/3/27 23:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_WebSiteNavigation](
	[NavigationId] [int] IDENTITY(1,1) NOT NULL,
	[LinkUrl] [varchar](200) NULL,
	[NavigationName] [nvarchar](20) NULL,
	[IsTarget] [bit] NULL,
	[AppendTime] [datetime] NULL,
	[SortCount] [int] NULL,
	[IsShow] [bit] NULL,
 CONSTRAINT [PK_m_WebSiteNavigation] PRIMARY KEY CLUSTERED 
(
	[NavigationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[m_Navigation] ADD  CONSTRAINT [DF_m_Navigation_ClickCount]  DEFAULT ((0)) FOR [ClickCount]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文档项ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Docs', @level2type=N'COLUMN',@level2name=N'DocsId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Docs', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'短标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Docs', @level2type=N'COLUMN',@level2name=N'ShortTitle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Docs', @level2type=N'COLUMN',@level2name=N'Contents'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Docs', @level2type=N'COLUMN',@level2name=N'AppendTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后更新时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Docs', @level2type=N'COLUMN',@level2name=N'LastTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所属文档' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Docs', @level2type=N'COLUMN',@level2name=N'ThemeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发布人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Docs', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'浏览数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Docs', @level2type=N'COLUMN',@level2name=N'ReadCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'+1数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Docs', @level2type=N'COLUMN',@level2name=N'PlusCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标签' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Docs', @level2type=N'COLUMN',@level2name=N'Tags'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'支持的版本信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Docs', @level2type=N'COLUMN',@level2name=N'VersionText'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否显示' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Docs', @level2type=N'COLUMN',@level2name=N'IsShow'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否已经审核' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Docs', @level2type=N'COLUMN',@level2name=N'IsAudit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文档ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_DocsTheme', @level2type=N'COLUMN',@level2name=N'ThemeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_DocsTheme', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_DocsTheme', @level2type=N'COLUMN',@level2name=N'Contents'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发布用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_DocsTheme', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_DocsTheme', @level2type=N'COLUMN',@level2name=N'AppendTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后更新时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_DocsTheme', @level2type=N'COLUMN',@level2name=N'LastTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'浏览数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_DocsTheme', @level2type=N'COLUMN',@level2name=N'ReadCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'+1数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_DocsTheme', @level2type=N'COLUMN',@level2name=N'PlusCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标签' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_DocsTheme', @level2type=N'COLUMN',@level2name=N'Tags'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'版本号信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_DocsTheme', @level2type=N'COLUMN',@level2name=N'VersionText'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否显示' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_DocsTheme', @level2type=N'COLUMN',@level2name=N'IsShow'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理员Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_ManagerAccount', @level2type=N'COLUMN',@level2name=N'AdminId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理员这账号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_ManagerAccount', @level2type=N'COLUMN',@level2name=N'AdminName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_ManagerAccount', @level2type=N'COLUMN',@level2name=N'Password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_ManagerAccount', @level2type=N'COLUMN',@level2name=N'IsStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_ManagerAccount', @level2type=N'COLUMN',@level2name=N'RoleId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_ManagerMenu', @level2type=N'COLUMN',@level2name=N'MenuId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_ManagerMenu', @level2type=N'COLUMN',@level2name=N'MenuName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_ManagerMenu', @level2type=N'COLUMN',@level2name=N'AreaName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所属上级菜单' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_ManagerMenu', @level2type=N'COLUMN',@level2name=N'ParentId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单级别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_ManagerMenu', @level2type=N'COLUMN',@level2name=N'IsPower'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'权限Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_ManagerPower', @level2type=N'COLUMN',@level2name=N'PowerId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_ManagerPower', @level2type=N'COLUMN',@level2name=N'MenuId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_ManagerPower', @level2type=N'COLUMN',@level2name=N'RoleId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_ManagerRole', @level2type=N'COLUMN',@level2name=N'RoleId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_ManagerRole', @level2type=N'COLUMN',@level2name=N'RoleName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'消息Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Message', @level2type=N'COLUMN',@level2name=N'MessageId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'消息类型(0:系统消息,1:帖子消息,2:分享消息)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Message', @level2type=N'COLUMN',@level2name=N'MessageType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Message', @level2type=N'COLUMN',@level2name=N'Contents'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'提交时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Message', @level2type=N'COLUMN',@level2name=N'PostDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'消息接收用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Message', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'产生消息用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Message', @level2type=N'COLUMN',@level2name=N'AppendUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'存储对象Id(PostId ShareId)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Message', @level2type=N'COLUMN',@level2name=N'ObjId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否已经阅读' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Message', @level2type=N'COLUMN',@level2name=N'IsRead'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'导航Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Navigation', @level2type=N'COLUMN',@level2name=N'NavigationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'导航名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Navigation', @level2type=N'COLUMN',@level2name=N'NavigationName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否显示' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Navigation', @level2type=N'COLUMN',@level2name=N'IsShow'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'导航描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Navigation', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所属导航分类' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Navigation', @level2type=N'COLUMN',@level2name=N'CId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_NavigationClassify', @level2type=N'COLUMN',@level2name=N'CId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_NavigationClassify', @level2type=N'COLUMN',@level2name=N'ClassifyName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否显示' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_NavigationClassify', @level2type=N'COLUMN',@level2name=N'IsShow'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'帖子Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Posts', @level2type=N'COLUMN',@level2name=N'PostsId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'帖子标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Posts', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'帖子内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Posts', @level2type=N'COLUMN',@level2name=N'Contents'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发布时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Posts', @level2type=N'COLUMN',@level2name=N'PostDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后更新时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Posts', @level2type=N'COLUMN',@level2name=N'LastDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Posts', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'+1数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Posts', @level2type=N'COLUMN',@level2name=N'PlusCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'阅读次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Posts', @level2type=N'COLUMN',@level2name=N'ReadCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否显示' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Posts', @level2type=N'COLUMN',@level2name=N'IsShow'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'属性Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Posts', @level2type=N'COLUMN',@level2name=N'Tags'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图片地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Posts', @level2type=N'COLUMN',@level2name=N'ImgUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否允许回复' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Posts', @level2type=N'COLUMN',@level2name=N'IsReply'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'回复数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Posts', @level2type=N'COLUMN',@level2name=N'AnswerCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所属频道' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Posts', @level2type=N'COLUMN',@level2name=N'ChannelId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'回答Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_PostsAnswer', @level2type=N'COLUMN',@level2name=N'AnswerId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'回答内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_PostsAnswer', @level2type=N'COLUMN',@level2name=N'Contents'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'回答时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_PostsAnswer', @level2type=N'COLUMN',@level2name=N'PostDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'回答人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_PostsAnswer', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所属问题帖子Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_PostsAnswer', @level2type=N'COLUMN',@level2name=N'PostsId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'+1数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_PostsAnswer', @level2type=N'COLUMN',@level2name=N'Plus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'评论回复数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_PostsAnswer', @level2type=N'COLUMN',@level2name=N'CommentsCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关注Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_PostsAttention', @level2type=N'COLUMN',@level2name=N'AttentionId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'帖子Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_PostsAttention', @level2type=N'COLUMN',@level2name=N'PostsId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关注时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_PostsAttention', @level2type=N'COLUMN',@level2name=N'AttentionDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_PostsAttention', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'频道名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_PostsChannel', @level2type=N'COLUMN',@level2name=N'ChannelName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_PostsChannel', @level2type=N'COLUMN',@level2name=N'Remarks'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否显示' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_PostsChannel', @level2type=N'COLUMN',@level2name=N'IsShow'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'频道创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_PostsChannel', @level2type=N'COLUMN',@level2name=N'AppendTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否只允许管理员发帖' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_PostsChannel', @level2type=N'COLUMN',@level2name=N'IsManager'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'评论Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_PostsComments', @level2type=N'COLUMN',@level2name=N'CommentId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'评论内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_PostsComments', @level2type=N'COLUMN',@level2name=N'Contents'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'评论时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_PostsComments', @level2type=N'COLUMN',@level2name=N'PostDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_PostsComments', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'回应用户Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_PostsComments', @level2type=N'COLUMN',@level2name=N'ToUserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'回答Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_PostsComments', @level2type=N'COLUMN',@level2name=N'AnswerId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'评论是否显示' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_PostsComments', @level2type=N'COLUMN',@level2name=N'IsShow'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'属性Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_PostsTags', @level2type=N'COLUMN',@level2name=N'TagsId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'属性名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_PostsTags', @level2type=N'COLUMN',@level2name=N'TagsName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'短信ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Sms', @level2type=N'COLUMN',@level2name=N'SmsID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'短信手机号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Sms', @level2type=N'COLUMN',@level2name=N'Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'短信内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Sms', @level2type=N'COLUMN',@level2name=N'Contents'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发送时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Sms', @level2type=N'COLUMN',@level2name=N'SendTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发送IP地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Sms', @level2type=N'COLUMN',@level2name=N'SendIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否发送成功' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_Sms', @level2type=N'COLUMN',@level2name=N'IsOk'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_User', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_User', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登陆密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_User', @level2type=N'COLUMN',@level2name=N'Password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'昵称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_User', @level2type=N'COLUMN',@level2name=N'NickName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'注册时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_User', @level2type=N'COLUMN',@level2name=N'RegisterDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后登陆时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_User', @level2type=N'COLUMN',@level2name=N'LastLoginDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后登陆IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_User', @level2type=N'COLUMN',@level2name=N'LastLoginIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'注册IP地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_User', @level2type=N'COLUMN',@level2name=N'RegisterIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户状态(true:正常,false:禁止)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_User', @level2type=N'COLUMN',@level2name=N'IsStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户头像' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_User', @level2type=N'COLUMN',@level2name=N'HeadUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手机号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_User', @level2type=N'COLUMN',@level2name=N'Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开放平台Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_User', @level2type=N'COLUMN',@level2name=N'OpenId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'地区信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_User', @level2type=N'COLUMN',@level2name=N'AddressInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生日' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_User', @level2type=N'COLUMN',@level2name=N'Birthday'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'个人标签' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_User', @level2type=N'COLUMN',@level2name=N'Tags'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'性别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_User', @level2type=N'COLUMN',@level2name=N'Sex'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户组Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_UserGroup', @level2type=N'COLUMN',@level2name=N'GroupId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户组名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_UserGroup', @level2type=N'COLUMN',@level2name=N'GroupName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_UserPlusRecords', @level2type=N'COLUMN',@level2name=N'RecordsId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'点赞对象Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_UserPlusRecords', @level2type=N'COLUMN',@level2name=N'ObjectId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_UserPlusRecords', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_UserPlusRecords', @level2type=N'COLUMN',@level2name=N'AppendTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录类型 1 帖子点赞 2 帖子回答点赞 3 帖子评论点赞 4 文档点赞 5 文档项点赞' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_UserPlusRecords', @level2type=N'COLUMN',@level2name=N'RecordsType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'网站名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_WebSiteConfig', @level2type=N'COLUMN',@level2name=N'WebSiteName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'网站地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_WebSiteConfig', @level2type=N'COLUMN',@level2name=N'WebSiteUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'网站标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_WebSiteConfig', @level2type=N'COLUMN',@level2name=N'WebSiteTitle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'网站关键字' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_WebSiteConfig', @level2type=N'COLUMN',@level2name=N'WebSiteKeyWord'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'网站描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_WebSiteConfig', @level2type=N'COLUMN',@level2name=N'WebSiteDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'底部版权申明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_WebSiteConfig', @level2type=N'COLUMN',@level2name=N'CopyrightText'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否开放登录' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_WebSiteConfig', @level2type=N'COLUMN',@level2name=N'IsLogin'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否开放注册' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_WebSiteConfig', @level2type=N'COLUMN',@level2name=N'IsRegister'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'网站备案号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_WebSiteConfig', @level2type=N'COLUMN',@level2name=N'FilingNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'链接地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_WebSiteNavigation', @level2type=N'COLUMN',@level2name=N'LinkUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'导航名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_WebSiteNavigation', @level2type=N'COLUMN',@level2name=N'NavigationName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否为跳转到新窗口' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_WebSiteNavigation', @level2type=N'COLUMN',@level2name=N'IsTarget'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_WebSiteNavigation', @level2type=N'COLUMN',@level2name=N'AppendTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序(从小到大)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_WebSiteNavigation', @level2type=N'COLUMN',@level2name=N'SortCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否显示到前端' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'm_WebSiteNavigation', @level2type=N'COLUMN',@level2name=N'IsShow'
GO
USE [master]
GO
ALTER DATABASE [MangoDB] SET  READ_WRITE 
GO
