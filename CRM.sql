USE [master]
GO
/****** Object:  Database [ASPPROJECT1]    Script Date: 2018/5/30 13:42:45 ******/
CREATE DATABASE [ASPPROJECT1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ASPPROJECT1', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL13.MSSQL2016\MSSQL\DATA\ASPPROJECT1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ASPPROJECT1_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL13.MSSQL2016\MSSQL\DATA\ASPPROJECT1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ASPPROJECT1] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ASPPROJECT1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ASPPROJECT1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ASPPROJECT1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ASPPROJECT1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ASPPROJECT1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ASPPROJECT1] SET ARITHABORT OFF 
GO
ALTER DATABASE [ASPPROJECT1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ASPPROJECT1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ASPPROJECT1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ASPPROJECT1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ASPPROJECT1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ASPPROJECT1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ASPPROJECT1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ASPPROJECT1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ASPPROJECT1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ASPPROJECT1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ASPPROJECT1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ASPPROJECT1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ASPPROJECT1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ASPPROJECT1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ASPPROJECT1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ASPPROJECT1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ASPPROJECT1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ASPPROJECT1] SET RECOVERY FULL 
GO
ALTER DATABASE [ASPPROJECT1] SET  MULTI_USER 
GO
ALTER DATABASE [ASPPROJECT1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ASPPROJECT1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ASPPROJECT1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ASPPROJECT1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ASPPROJECT1] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ASPPROJECT1', N'ON'
GO
ALTER DATABASE [ASPPROJECT1] SET QUERY_STORE = OFF
GO
USE [ASPPROJECT1]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [ASPPROJECT1]
GO
/****** Object:  Table [dbo].[sysFunction]    Script Date: 2018/5/30 13:42:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sysFunction](
	[fID] [int] IDENTITY(1,1) NOT NULL,
	[mID] [int] NOT NULL,
	[fName] [nvarchar](100) NOT NULL,
	[fFunction] [nvarchar](100) NOT NULL,
	[fPicName] [nvarchar](100) NULL,
	[fStatus] [int] NOT NULL,
	[fCreateID] [int] NOT NULL,
	[fCreateTime] [datetime] NOT NULL,
	[fUpdateID] [int] NULL,
	[fUpdateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_sysFucntion] PRIMARY KEY CLUSTERED 
(
	[fID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sysKeyValue]    Script Date: 2018/5/30 13:42:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sysKeyValue](
	[KID] [int] IDENTITY(1,1) NOT NULL,
	[ParentID] [int] NOT NULL,
	[KType] [int] NOT NULL,
	[KName] [nvarchar](100) NOT NULL,
	[KValue] [nvarchar](100) NOT NULL,
	[KRemark] [nvarchar](200) NULL,
 CONSTRAINT [PK_sysKeyValue] PRIMARY KEY CLUSTERED 
(
	[KID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sysMenus]    Script Date: 2018/5/30 13:42:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sysMenus](
	[mID] [int] IDENTITY(1,1) NOT NULL,
	[mParentID] [int] NOT NULL,
	[mName] [nvarchar](100) NOT NULL,
	[mUrl] [nvarchar](200) NOT NULL,
	[mController] [nvarchar](max) NULL,
	[mArea] [nvarchar](max) NULL,
	[mAction] [nvarchar](max) NULL,
	[mSortID] [int] NOT NULL,
	[mStatus] [int] NOT NULL,
	[mPicture] [varchar](30) NULL,
	[mLevel] [int] NOT NULL,
	[mExp1] [nvarchar](50) NULL,
	[mExp2] [int] NULL,
	[mCreateID] [int] NOT NULL,
	[mCreateTime] [datetime] NOT NULL,
	[mUpdateID] [int] NULL,
	[mUpdateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_sysMenus] PRIMARY KEY CLUSTERED 
(
	[mID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sysOrganStruct]    Script Date: 2018/5/30 13:42:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sysOrganStruct](
	[osID] [int] IDENTITY(1,1) NOT NULL,
	[osParentID] [int] NOT NULL,
	[osName] [nvarchar](100) NOT NULL,
	[osCode] [nvarchar](50) NOT NULL,
	[osCateID] [int] NOT NULL,
	[osLevel] [int] NULL,
	[osShortName] [nvarchar](100) NULL,
	[osRemark] [nvarchar](500) NULL,
	[osStatus] [int] NULL,
	[osCreateID] [int] NULL,
	[osCreateTime] [datetime] NOT NULL,
	[osUpdateID] [int] NULL,
	[osUpdateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_sysOrganStruct] PRIMARY KEY CLUSTERED 
(
	[osID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sysPermissList]    Script Date: 2018/5/30 13:42:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sysPermissList](
	[plID] [int] IDENTITY(1,1) NOT NULL,
	[rID] [int] NOT NULL,
	[mID] [int] NOT NULL,
	[fID] [int] NOT NULL,
	[plCreateID] [int] NOT NULL,
	[plCreateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_sysPermissList] PRIMARY KEY CLUSTERED 
(
	[plID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sysRole]    Script Date: 2018/5/30 13:42:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sysRole](
	[rID] [int] IDENTITY(1,1) NOT NULL,
	[eDepID] [int] NULL,
	[RoleType] [int] NOT NULL,
	[rName] [nvarchar](100) NOT NULL,
	[rRemark] [nvarchar](200) NULL,
	[rSort] [int] NOT NULL,
	[rStatus] [int] NOT NULL,
	[rCreateID] [int] NOT NULL,
	[rCreateTime] [datetime] NOT NULL,
	[rUpdateID] [int] NULL,
	[rUpdateTime] [datetime] NULL,
 CONSTRAINT [PK_sysRole] PRIMARY KEY CLUSTERED 
(
	[rID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sysUserInfo]    Script Date: 2018/5/30 13:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sysUserInfo](
	[uID] [int] IDENTITY(1,1) NOT NULL,
	[uLoginName] [nvarchar](100) NOT NULL,
	[uLoginPWD] [nvarchar](100) NOT NULL,
	[uRealName] [nvarchar](100) NOT NULL,
	[uTelphone] [nvarchar](50) NULL,
	[uMobile] [nvarchar](15) NULL,
	[uEmail] [nvarchar](30) NULL,
	[uQQ] [nvarchar](12) NULL,
	[uGender] [int] NOT NULL,
	[uStatus] [int] NOT NULL,
	[uCompanyID] [int] NOT NULL,
	[uDepID] [int] NULL,
	[uWorkGroupID] [int] NULL,
	[uRemark] [nvarchar](500) NULL,
	[uCreateID] [int] NOT NULL,
	[uCreateTime] [datetime] NOT NULL,
	[uUpdateID] [int] NULL,
	[uUpdateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_sysUserInfo] PRIMARY KEY CLUSTERED 
(
	[uID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sysUserInfo_Role]    Script Date: 2018/5/30 13:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sysUserInfo_Role](
	[urID] [int] IDENTITY(1,1) NOT NULL,
	[uID] [int] NOT NULL,
	[rID] [int] NOT NULL,
 CONSTRAINT [PK_sysUserInfo_Role] PRIMARY KEY CLUSTERED 
(
	[urID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wfProcess]    Script Date: 2018/5/30 13:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wfProcess](
	[wfPID] [int] IDENTITY(1,1) NOT NULL,
	[wfRFID] [int] NOT NULL,
	[wfProcessor] [int] NOT NULL,
	[wfRFStatus] [int] NOT NULL,
	[wfPDesription] [nvarchar](200) NULL,
	[wfnID] [int] NOT NULL,
	[wfPExt1] [nvarchar](100) NULL,
	[wfPExt2] [int] NULL,
	[fCreateID] [int] NOT NULL,
	[fCreateTime] [datetime] NOT NULL,
	[fUpdateID] [int] NULL,
	[fUpdateTime] [datetime] NULL,
 CONSTRAINT [PK_wfProcess] PRIMARY KEY CLUSTERED 
(
	[wfPID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wfRequestForm]    Script Date: 2018/5/30 13:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wfRequestForm](
	[wfRFID] [int] IDENTITY(1,1) NOT NULL,
	[wfID] [int] NOT NULL,
	[wfRFTitle] [nvarchar](100) NOT NULL,
	[wfRFRemark] [nvarchar](1000) NULL,
	[wfRFPriority] [int] NOT NULL,
	[wfRFStatus] [int] NOT NULL,
	[wfRFExt1] [nvarchar](100) NULL,
	[wfRFExt2] [int] NULL,
	[wfRFLogicSymbol] [varchar](2) NULL,
	[wfRFNum] [decimal](18, 0) NOT NULL,
	[fCreateID] [int] NOT NULL,
	[fCreateTime] [datetime] NOT NULL,
	[fUpdateID] [int] NULL,
	[fUpdateTime] [nchar](10) NULL,
 CONSTRAINT [PK_wfRequestForm] PRIMARY KEY CLUSTERED 
(
	[wfRFID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wfWork]    Script Date: 2018/5/30 13:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wfWork](
	[wfID] [int] IDENTITY(1,1) NOT NULL,
	[wfTitle] [nvarchar](50) NOT NULL,
	[wfStatus] [int] NOT NULL,
	[wfRemark] [nvarchar](1000) NULL,
	[fCreateID] [int] NOT NULL,
	[fCreateTime] [datetime] NOT NULL,
	[fUpdateID] [int] NULL,
	[fUpdateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_wfWork] PRIMARY KEY CLUSTERED 
(
	[wfID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wfWorkBranch]    Script Date: 2018/5/30 13:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wfWorkBranch](
	[wfbID] [int] IDENTITY(1,1) NOT NULL,
	[wfnID] [int] NOT NULL,
	[wfnToken] [nvarchar](20) NOT NULL,
	[wfNodeID] [int] NOT NULL,
	[fCreateID] [int] NOT NULL,
	[fCreateTime] [datetime] NOT NULL,
	[fUpdateID] [int] NULL,
	[fUpdateTime] [datetime] NULL,
 CONSTRAINT [PK_wfWorkBranch] PRIMARY KEY CLUSTERED 
(
	[wfbID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wfWorkNodes]    Script Date: 2018/5/30 13:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wfWorkNodes](
	[wfnID] [int] IDENTITY(1,1) NOT NULL,
	[wfID] [int] NOT NULL,
	[wfnOrderNo] [int] NOT NULL,
	[wfNodeType] [int] NOT NULL,
	[wfNodeTitle] [nvarchar](50) NOT NULL,
	[wfnBizMethod] [nvarchar](1000) NULL,
	[wfnMaxNum] [decimal](18, 0) NOT NULL,
	[wfnRoleType] [int] NOT NULL,
	[wfnExt1] [int] NULL,
	[wfnExt2] [nvarchar](100) NULL,
	[fCreateID] [int] NOT NULL,
	[fCreateTime] [datetime] NOT NULL,
	[fUpdateID] [int] NULL,
	[fUpdateTime] [datetime] NULL,
 CONSTRAINT [PK_wfWorkNodes] PRIMARY KEY CLUSTERED 
(
	[wfnID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[sysFunction] ON 

INSERT [dbo].[sysFunction] ([fID], [mID], [fName], [fFunction], [fPicName], [fStatus], [fCreateID], [fCreateTime], [fUpdateID], [fUpdateTime]) VALUES (1, 3, N'新增', N'add', N'add', 0, 8, CAST(N'2017-03-08T00:00:00.000' AS DateTime), NULL, CAST(N'2017-03-08T00:00:00.000' AS DateTime))
INSERT [dbo].[sysFunction] ([fID], [mID], [fName], [fFunction], [fPicName], [fStatus], [fCreateID], [fCreateTime], [fUpdateID], [fUpdateTime]) VALUES (2, 3, N'编辑', N'edit', N'modify', 0, 8, CAST(N'2017-03-01T00:00:00.000' AS DateTime), NULL, CAST(N'2017-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[sysFunction] ([fID], [mID], [fName], [fFunction], [fPicName], [fStatus], [fCreateID], [fCreateTime], [fUpdateID], [fUpdateTime]) VALUES (3, 3, N'删除', N'del', N'delete', 0, 8, CAST(N'2017-03-01T00:00:00.000' AS DateTime), NULL, CAST(N'2017-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[sysFunction] ([fID], [mID], [fName], [fFunction], [fPicName], [fStatus], [fCreateID], [fCreateTime], [fUpdateID], [fUpdateTime]) VALUES (4, 3, N'刷新', N'getlist', N'refresh', 0, 8, CAST(N'2017-03-01T00:00:00.000' AS DateTime), NULL, CAST(N'2017-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[sysFunction] ([fID], [mID], [fName], [fFunction], [fPicName], [fStatus], [fCreateID], [fCreateTime], [fUpdateID], [fUpdateTime]) VALUES (24, 7, N'新增', N'add', N'add', 0, 8, CAST(N'2017-03-08T00:00:00.000' AS DateTime), NULL, CAST(N'2017-03-08T00:00:00.000' AS DateTime))
INSERT [dbo].[sysFunction] ([fID], [mID], [fName], [fFunction], [fPicName], [fStatus], [fCreateID], [fCreateTime], [fUpdateID], [fUpdateTime]) VALUES (25, 7, N'编辑', N'edit', N'modify', 0, 8, CAST(N'2017-03-01T00:00:00.000' AS DateTime), NULL, CAST(N'2017-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[sysFunction] ([fID], [mID], [fName], [fFunction], [fPicName], [fStatus], [fCreateID], [fCreateTime], [fUpdateID], [fUpdateTime]) VALUES (26, 7, N'删除', N'del', N'delete', 0, 8, CAST(N'2017-03-01T00:00:00.000' AS DateTime), NULL, CAST(N'2017-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[sysFunction] ([fID], [mID], [fName], [fFunction], [fPicName], [fStatus], [fCreateID], [fCreateTime], [fUpdateID], [fUpdateTime]) VALUES (27, 7, N'刷新', N'getlist', N'refresh', 0, 8, CAST(N'2017-03-01T00:00:00.000' AS DateTime), NULL, CAST(N'2017-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[sysFunction] ([fID], [mID], [fName], [fFunction], [fPicName], [fStatus], [fCreateID], [fCreateTime], [fUpdateID], [fUpdateTime]) VALUES (28, 7, N'分配角色', N'setrole', N'ok', 0, 8, CAST(N'2013-04-01T00:00:00.000' AS DateTime), NULL, CAST(N'2033-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[sysFunction] ([fID], [mID], [fName], [fFunction], [fPicName], [fStatus], [fCreateID], [fCreateTime], [fUpdateID], [fUpdateTime]) VALUES (29, 1003, N'新增', N'add', N'add', 0, 8, CAST(N'2017-03-08T00:00:00.000' AS DateTime), NULL, CAST(N'2017-03-08T00:00:00.000' AS DateTime))
INSERT [dbo].[sysFunction] ([fID], [mID], [fName], [fFunction], [fPicName], [fStatus], [fCreateID], [fCreateTime], [fUpdateID], [fUpdateTime]) VALUES (30, 1003, N'编辑', N'edit', N'modify', 0, 8, CAST(N'2017-03-01T00:00:00.000' AS DateTime), NULL, CAST(N'2017-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[sysFunction] ([fID], [mID], [fName], [fFunction], [fPicName], [fStatus], [fCreateID], [fCreateTime], [fUpdateID], [fUpdateTime]) VALUES (31, 1003, N'删除', N'del', N'delete', 0, 8, CAST(N'2017-03-01T00:00:00.000' AS DateTime), NULL, CAST(N'2017-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[sysFunction] ([fID], [mID], [fName], [fFunction], [fPicName], [fStatus], [fCreateID], [fCreateTime], [fUpdateID], [fUpdateTime]) VALUES (32, 1003, N'刷新', N'getlist', N'refresh', 0, 8, CAST(N'2017-03-01T00:00:00.000' AS DateTime), NULL, CAST(N'2017-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[sysFunction] ([fID], [mID], [fName], [fFunction], [fPicName], [fStatus], [fCreateID], [fCreateTime], [fUpdateID], [fUpdateTime]) VALUES (33, 1003, N'分配角色', N'setrole', N'ok', 0, 8, CAST(N'2013-04-01T00:00:00.000' AS DateTime), NULL, CAST(N'2033-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[sysFunction] ([fID], [mID], [fName], [fFunction], [fPicName], [fStatus], [fCreateID], [fCreateTime], [fUpdateID], [fUpdateTime]) VALUES (34, 1004, N'新增', N'add', N'add', 0, 8, CAST(N'2017-03-08T00:00:00.000' AS DateTime), NULL, CAST(N'2017-03-08T00:00:00.000' AS DateTime))
INSERT [dbo].[sysFunction] ([fID], [mID], [fName], [fFunction], [fPicName], [fStatus], [fCreateID], [fCreateTime], [fUpdateID], [fUpdateTime]) VALUES (35, 1004, N'编辑', N'edit', N'modify', 0, 8, CAST(N'2017-03-01T00:00:00.000' AS DateTime), NULL, CAST(N'2017-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[sysFunction] ([fID], [mID], [fName], [fFunction], [fPicName], [fStatus], [fCreateID], [fCreateTime], [fUpdateID], [fUpdateTime]) VALUES (36, 1004, N'删除', N'del', N'delete', 0, 8, CAST(N'2017-03-01T00:00:00.000' AS DateTime), NULL, CAST(N'2017-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[sysFunction] ([fID], [mID], [fName], [fFunction], [fPicName], [fStatus], [fCreateID], [fCreateTime], [fUpdateID], [fUpdateTime]) VALUES (37, 1004, N'刷新', N'getlist', N'refresh', 0, 8, CAST(N'2017-03-01T00:00:00.000' AS DateTime), NULL, CAST(N'2017-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[sysFunction] ([fID], [mID], [fName], [fFunction], [fPicName], [fStatus], [fCreateID], [fCreateTime], [fUpdateID], [fUpdateTime]) VALUES (38, 1004, N'分配角色', N'setrole', N'ok', 0, 8, CAST(N'2013-04-01T00:00:00.000' AS DateTime), NULL, CAST(N'2033-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[sysFunction] ([fID], [mID], [fName], [fFunction], [fPicName], [fStatus], [fCreateID], [fCreateTime], [fUpdateID], [fUpdateTime]) VALUES (39, 1005, N'新增', N'add', N'add', 0, 8, CAST(N'2017-03-08T00:00:00.000' AS DateTime), NULL, CAST(N'2017-03-08T00:00:00.000' AS DateTime))
INSERT [dbo].[sysFunction] ([fID], [mID], [fName], [fFunction], [fPicName], [fStatus], [fCreateID], [fCreateTime], [fUpdateID], [fUpdateTime]) VALUES (40, 1005, N'编辑', N'edit', N'modify', 0, 8, CAST(N'2017-03-01T00:00:00.000' AS DateTime), NULL, CAST(N'2017-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[sysFunction] ([fID], [mID], [fName], [fFunction], [fPicName], [fStatus], [fCreateID], [fCreateTime], [fUpdateID], [fUpdateTime]) VALUES (41, 1005, N'删除', N'del', N'delete', 0, 8, CAST(N'2017-03-01T00:00:00.000' AS DateTime), NULL, CAST(N'2017-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[sysFunction] ([fID], [mID], [fName], [fFunction], [fPicName], [fStatus], [fCreateID], [fCreateTime], [fUpdateID], [fUpdateTime]) VALUES (42, 1005, N'刷新', N'getlist', N'refresh', 0, 8, CAST(N'2017-03-01T00:00:00.000' AS DateTime), NULL, CAST(N'2017-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[sysFunction] ([fID], [mID], [fName], [fFunction], [fPicName], [fStatus], [fCreateID], [fCreateTime], [fUpdateID], [fUpdateTime]) VALUES (43, 1005, N'分配角色', N'setrole', N'ok', 0, 8, CAST(N'2013-04-01T00:00:00.000' AS DateTime), NULL, CAST(N'2033-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[sysFunction] ([fID], [mID], [fName], [fFunction], [fPicName], [fStatus], [fCreateID], [fCreateTime], [fUpdateID], [fUpdateTime]) VALUES (49, 1, N'未分配', N'未分配', NULL, 0, 6, CAST(N'2014-12-02T00:00:00.000' AS DateTime), NULL, CAST(N'2222-02-02T00:00:00.000' AS DateTime))
INSERT [dbo].[sysFunction] ([fID], [mID], [fName], [fFunction], [fPicName], [fStatus], [fCreateID], [fCreateTime], [fUpdateID], [fUpdateTime]) VALUES (50, 1006, N'新增', N'add', N'add', 0, 8, CAST(N'2017-03-08T00:00:00.000' AS DateTime), NULL, CAST(N'2017-03-08T00:00:00.000' AS DateTime))
INSERT [dbo].[sysFunction] ([fID], [mID], [fName], [fFunction], [fPicName], [fStatus], [fCreateID], [fCreateTime], [fUpdateID], [fUpdateTime]) VALUES (52, 1006, N'编辑', N'edit', N'modify', 0, 8, CAST(N'2017-03-01T00:00:00.000' AS DateTime), NULL, CAST(N'2017-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[sysFunction] ([fID], [mID], [fName], [fFunction], [fPicName], [fStatus], [fCreateID], [fCreateTime], [fUpdateID], [fUpdateTime]) VALUES (53, 4, N'新增', N'add', N'add', 0, 8, CAST(N'2017-03-08T00:00:00.000' AS DateTime), NULL, CAST(N'2017-03-08T00:00:00.000' AS DateTime))
INSERT [dbo].[sysFunction] ([fID], [mID], [fName], [fFunction], [fPicName], [fStatus], [fCreateID], [fCreateTime], [fUpdateID], [fUpdateTime]) VALUES (54, 4, N'编辑', N'edit', N'modify', 0, 8, CAST(N'2017-03-01T00:00:00.000' AS DateTime), NULL, CAST(N'2017-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[sysFunction] ([fID], [mID], [fName], [fFunction], [fPicName], [fStatus], [fCreateID], [fCreateTime], [fUpdateID], [fUpdateTime]) VALUES (55, 4, N'删除', N'del', N'delete', 0, 8, CAST(N'2017-03-01T00:00:00.000' AS DateTime), NULL, CAST(N'2017-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[sysFunction] ([fID], [mID], [fName], [fFunction], [fPicName], [fStatus], [fCreateID], [fCreateTime], [fUpdateID], [fUpdateTime]) VALUES (56, 4, N'刷新', N'getlist', N'refresh', 0, 8, CAST(N'2017-03-01T00:00:00.000' AS DateTime), NULL, CAST(N'2017-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[sysFunction] ([fID], [mID], [fName], [fFunction], [fPicName], [fStatus], [fCreateID], [fCreateTime], [fUpdateID], [fUpdateTime]) VALUES (57, 4, N'分配权限', N'setrole', N'ok', 0, 8, CAST(N'2000-01-01T00:00:00.000' AS DateTime), NULL, CAST(N'2000-01-01T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[sysFunction] OFF
SET IDENTITY_INSERT [dbo].[sysKeyValue] ON 

INSERT [dbo].[sysKeyValue] ([KID], [ParentID], [KType], [KName], [KValue], [KRemark]) VALUES (1, -1, 11, N'财政部', N'财政部', NULL)
INSERT [dbo].[sysKeyValue] ([KID], [ParentID], [KType], [KName], [KValue], [KRemark]) VALUES (2, -1, 22, N'公安部', N'公安部', NULL)
INSERT [dbo].[sysKeyValue] ([KID], [ParentID], [KType], [KName], [KValue], [KRemark]) VALUES (3, -1, 33, N'国防部', N'国防部', NULL)
INSERT [dbo].[sysKeyValue] ([KID], [ParentID], [KType], [KName], [KValue], [KRemark]) VALUES (4, -1, 44, N'外交部', N'外交部', NULL)
INSERT [dbo].[sysKeyValue] ([KID], [ParentID], [KType], [KName], [KValue], [KRemark]) VALUES (5, 1, 11, N'财政厅', N'财政厅', NULL)
INSERT [dbo].[sysKeyValue] ([KID], [ParentID], [KType], [KName], [KValue], [KRemark]) VALUES (7, 2, 22, N'公安厅', N'公安厅', NULL)
INSERT [dbo].[sysKeyValue] ([KID], [ParentID], [KType], [KName], [KValue], [KRemark]) VALUES (8, 3, 33, N'国防厅', N'国防厅', NULL)
INSERT [dbo].[sysKeyValue] ([KID], [ParentID], [KType], [KName], [KValue], [KRemark]) VALUES (9, 4, 44, N'外交厅', N'外交厅', NULL)
INSERT [dbo].[sysKeyValue] ([KID], [ParentID], [KType], [KName], [KValue], [KRemark]) VALUES (10, 0, 55, N'铁道厅', N'铁道厅11', NULL)
INSERT [dbo].[sysKeyValue] ([KID], [ParentID], [KType], [KName], [KValue], [KRemark]) VALUES (12, 0, 55, N'铁道部1', N'铁道部', NULL)
INSERT [dbo].[sysKeyValue] ([KID], [ParentID], [KType], [KName], [KValue], [KRemark]) VALUES (13, 0, 250, N'张燕', N'张燕', NULL)
INSERT [dbo].[sysKeyValue] ([KID], [ParentID], [KType], [KName], [KValue], [KRemark]) VALUES (14, 0, 250, N'王八蛋', N'王八蛋', NULL)
SET IDENTITY_INSERT [dbo].[sysKeyValue] OFF
SET IDENTITY_INSERT [dbo].[sysMenus] ON 

INSERT [dbo].[sysMenus] ([mID], [mParentID], [mName], [mUrl], [mController], [mArea], [mAction], [mSortID], [mStatus], [mPicture], [mLevel], [mExp1], [mExp2], [mCreateID], [mCreateTime], [mUpdateID], [mUpdateTime]) VALUES (1, -1, N'系统管理', N'#', N'#', N'#', N'#', 1, 0, N'icon-folder-close', 1, NULL, NULL, 6, CAST(N'2017-01-19T00:00:00.000' AS DateTime), 6, CAST(N'2017-01-19T00:00:00.000' AS DateTime))
INSERT [dbo].[sysMenus] ([mID], [mParentID], [mName], [mUrl], [mController], [mArea], [mAction], [mSortID], [mStatus], [mPicture], [mLevel], [mExp1], [mExp2], [mCreateID], [mCreateTime], [mUpdateID], [mUpdateTime]) VALUES (3, 1, N'数字字典管理', N'/Admin/Keyval/Index', N'Keyval', N'Admin', N'Index', 1000, 0, N'icon', 2, NULL, NULL, 6, CAST(N'2017-01-19T00:00:00.000' AS DateTime), 6, CAST(N'2017-01-19T00:00:00.000' AS DateTime))
INSERT [dbo].[sysMenus] ([mID], [mParentID], [mName], [mUrl], [mController], [mArea], [mAction], [mSortID], [mStatus], [mPicture], [mLevel], [mExp1], [mExp2], [mCreateID], [mCreateTime], [mUpdateID], [mUpdateTime]) VALUES (4, -1, N'权限管理', N'#', N'#', N'#', N'#', 2, 0, N'icon', 1, NULL, NULL, 6, CAST(N'2017-01-19T00:00:00.000' AS DateTime), 6, CAST(N'2017-01-19T00:00:00.000' AS DateTime))
INSERT [dbo].[sysMenus] ([mID], [mParentID], [mName], [mUrl], [mController], [mArea], [mAction], [mSortID], [mStatus], [mPicture], [mLevel], [mExp1], [mExp2], [mCreateID], [mCreateTime], [mUpdateID], [mUpdateTime]) VALUES (6, -1, N'工作流管理', N'#', N'#', N'#', N'#', 3, 0, N'icon', 1, NULL, NULL, 6, CAST(N'2017-01-19T00:00:00.000' AS DateTime), 6, CAST(N'2017-01-19T00:00:00.000' AS DateTime))
INSERT [dbo].[sysMenus] ([mID], [mParentID], [mName], [mUrl], [mController], [mArea], [mAction], [mSortID], [mStatus], [mPicture], [mLevel], [mExp1], [mExp2], [mCreateID], [mCreateTime], [mUpdateID], [mUpdateTime]) VALUES (7, 1, N'用户管理', N'/Admin/UserInfo/Index', N'Menus', N'Admin', N'Index', 1002, 0, N'icon', 2, NULL, NULL, 6, CAST(N'2017-01-19T00:00:00.000' AS DateTime), 6, CAST(N'2017-01-19T00:00:00.000' AS DateTime))
INSERT [dbo].[sysMenus] ([mID], [mParentID], [mName], [mUrl], [mController], [mArea], [mAction], [mSortID], [mStatus], [mPicture], [mLevel], [mExp1], [mExp2], [mCreateID], [mCreateTime], [mUpdateID], [mUpdateTime]) VALUES (1003, 1, N'组织结构管理', N'/Admin/Organ/Index', N'Organ', N'Admin', N'Index', 1001, 0, N'icon', 2, NULL, NULL, 6, CAST(N'2017-03-01T00:00:00.000' AS DateTime), 6, CAST(N'2017-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[sysMenus] ([mID], [mParentID], [mName], [mUrl], [mController], [mArea], [mAction], [mSortID], [mStatus], [mPicture], [mLevel], [mExp1], [mExp2], [mCreateID], [mCreateTime], [mUpdateID], [mUpdateTime]) VALUES (1004, 1, N'菜单管理', N'/Admin/Menus/Index', N'Menus', N'Admin', N'Index', 1003, 0, N'icon', 2, NULL, NULL, 6, CAST(N'2017-03-01T00:00:00.000' AS DateTime), 6, CAST(N'2017-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[sysMenus] ([mID], [mParentID], [mName], [mUrl], [mController], [mArea], [mAction], [mSortID], [mStatus], [mPicture], [mLevel], [mExp1], [mExp2], [mCreateID], [mCreateTime], [mUpdateID], [mUpdateTime]) VALUES (1005, 1, N'菜单操作功能绑定', N'/Admin/Function/Index', N'Function', N'Admin', N'Index', 1004, 0, N'icon', 2, N'', NULL, 6, CAST(N'2017-02-01T00:00:00.000' AS DateTime), 6, CAST(N'2014-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[sysMenus] ([mID], [mParentID], [mName], [mUrl], [mController], [mArea], [mAction], [mSortID], [mStatus], [mPicture], [mLevel], [mExp1], [mExp2], [mCreateID], [mCreateTime], [mUpdateID], [mUpdateTime]) VALUES (1006, 4, N'角色管理', N'/Admin/Role/Index', N'Role', N'Admin', N'Index', 2001, 0, N'icon', 2, NULL, NULL, 6, CAST(N'2012-02-01T00:00:00.000' AS DateTime), 6, CAST(N'2013-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[sysMenus] ([mID], [mParentID], [mName], [mUrl], [mController], [mArea], [mAction], [mSortID], [mStatus], [mPicture], [mLevel], [mExp1], [mExp2], [mCreateID], [mCreateTime], [mUpdateID], [mUpdateTime]) VALUES (1007, 4, N'角色权限管理', N'/Admin/Permiss/Index', N'Permiss', N'Admin', N'Index', 2002, 0, N'icon', 2, NULL, NULL, 6, CAST(N'2012-02-01T00:00:00.000' AS DateTime), 6, CAST(N'2012-02-01T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[sysMenus] OFF
SET IDENTITY_INSERT [dbo].[sysOrganStruct] ON 

INSERT [dbo].[sysOrganStruct] ([osID], [osParentID], [osName], [osCode], [osCateID], [osLevel], [osShortName], [osRemark], [osStatus], [osCreateID], [osCreateTime], [osUpdateID], [osUpdateTime]) VALUES (1, -1, N'播客', N'1000', 2, 1, N'', NULL, 0, NULL, CAST(N'2013-01-01T00:00:00.000' AS DateTime), NULL, CAST(N'2013-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[sysOrganStruct] ([osID], [osParentID], [osName], [osCode], [osCateID], [osLevel], [osShortName], [osRemark], [osStatus], [osCreateID], [osCreateTime], [osUpdateID], [osUpdateTime]) VALUES (2, 1, N'广州', N'1000-01', 3, 2, NULL, NULL, 0, NULL, CAST(N'2013-01-01T00:00:00.000' AS DateTime), NULL, CAST(N'2331-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[sysOrganStruct] ([osID], [osParentID], [osName], [osCode], [osCateID], [osLevel], [osShortName], [osRemark], [osStatus], [osCreateID], [osCreateTime], [osUpdateID], [osUpdateTime]) VALUES (3, 1, N'上海', N'1000-02', 3, 2, NULL, NULL, 0, NULL, CAST(N'2013-01-01T00:00:00.000' AS DateTime), NULL, CAST(N'2031-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[sysOrganStruct] ([osID], [osParentID], [osName], [osCode], [osCateID], [osLevel], [osShortName], [osRemark], [osStatus], [osCreateID], [osCreateTime], [osUpdateID], [osUpdateTime]) VALUES (4, 1, N'成都', N'1000-03', 3, 2, NULL, NULL, 0, NULL, CAST(N'2013-04-01T00:00:00.000' AS DateTime), NULL, CAST(N'2301-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[sysOrganStruct] ([osID], [osParentID], [osName], [osCode], [osCateID], [osLevel], [osShortName], [osRemark], [osStatus], [osCreateID], [osCreateTime], [osUpdateID], [osUpdateTime]) VALUES (5, 1, N'武汉', N'1000-04', 3, 2, NULL, NULL, 0, NULL, CAST(N'2013-11-01T00:00:00.000' AS DateTime), NULL, CAST(N'2013-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[sysOrganStruct] ([osID], [osParentID], [osName], [osCode], [osCateID], [osLevel], [osShortName], [osRemark], [osStatus], [osCreateID], [osCreateTime], [osUpdateID], [osUpdateTime]) VALUES (6, 4, N'厅长', N'1000-01-01', 4, 3, NULL, NULL, 0, NULL, CAST(N'2031-03-01T00:00:00.000' AS DateTime), NULL, CAST(N'2333-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[sysOrganStruct] ([osID], [osParentID], [osName], [osCode], [osCateID], [osLevel], [osShortName], [osRemark], [osStatus], [osCreateID], [osCreateTime], [osUpdateID], [osUpdateTime]) VALUES (7, 5, N'。net', N'1000-01-01-01', 14, 4, NULL, NULL, 0, NULL, CAST(N'2023-04-01T00:00:00.000' AS DateTime), NULL, CAST(N'2333-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[sysOrganStruct] ([osID], [osParentID], [osName], [osCode], [osCateID], [osLevel], [osShortName], [osRemark], [osStatus], [osCreateID], [osCreateTime], [osUpdateID], [osUpdateTime]) VALUES (8, 5, N'Java', N'1000-01-01-02', 14, 4, NULL, NULL, 0, NULL, CAST(N'2222-01-01T00:00:00.000' AS DateTime), NULL, CAST(N'2222-02-01T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[sysOrganStruct] OFF
SET IDENTITY_INSERT [dbo].[sysPermissList] ON 

INSERT [dbo].[sysPermissList] ([plID], [rID], [mID], [fID], [plCreateID], [plCreateTime]) VALUES (1, 7, 1006, 50, 6, CAST(N'2023-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[sysPermissList] ([plID], [rID], [mID], [fID], [plCreateID], [plCreateTime]) VALUES (2, 7, 1006, 52, 6, CAST(N'2030-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[sysPermissList] ([plID], [rID], [mID], [fID], [plCreateID], [plCreateTime]) VALUES (3, 7, 4, 1, 6, CAST(N'2031-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[sysPermissList] ([plID], [rID], [mID], [fID], [plCreateID], [plCreateTime]) VALUES (4, 7, 4, 2, 6, CAST(N'2013-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[sysPermissList] ([plID], [rID], [mID], [fID], [plCreateID], [plCreateTime]) VALUES (5, 7, 4, 3, 6, CAST(N'2011-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[sysPermissList] ([plID], [rID], [mID], [fID], [plCreateID], [plCreateTime]) VALUES (6, 7, 4, 4, 6, CAST(N'2001-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[sysPermissList] ([plID], [rID], [mID], [fID], [plCreateID], [plCreateTime]) VALUES (8, 6, 3, 1, 6, CAST(N'2001-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[sysPermissList] ([plID], [rID], [mID], [fID], [plCreateID], [plCreateTime]) VALUES (11, 6, 7, 24, 6, CAST(N'3000-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[sysPermissList] ([plID], [rID], [mID], [fID], [plCreateID], [plCreateTime]) VALUES (12, 6, 1003, 29, 6, CAST(N'2000-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[sysPermissList] ([plID], [rID], [mID], [fID], [plCreateID], [plCreateTime]) VALUES (13, 6, 1004, 34, 6, CAST(N'2000-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[sysPermissList] ([plID], [rID], [mID], [fID], [plCreateID], [plCreateTime]) VALUES (14, 6, 1005, 39, 6, CAST(N'2000-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[sysPermissList] ([plID], [rID], [mID], [fID], [plCreateID], [plCreateTime]) VALUES (48, 6, 3, 2, 6, CAST(N'2001-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[sysPermissList] ([plID], [rID], [mID], [fID], [plCreateID], [plCreateTime]) VALUES (49, 6, 3, 3, 6, CAST(N'2001-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[sysPermissList] ([plID], [rID], [mID], [fID], [plCreateID], [plCreateTime]) VALUES (50, 6, 3, 4, 6, CAST(N'2001-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[sysPermissList] ([plID], [rID], [mID], [fID], [plCreateID], [plCreateTime]) VALUES (56, 6, 1, 49, 6, CAST(N'2001-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[sysPermissList] ([plID], [rID], [mID], [fID], [plCreateID], [plCreateTime]) VALUES (57, 6, 4, 49, 6, CAST(N'2001-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[sysPermissList] ([plID], [rID], [mID], [fID], [plCreateID], [plCreateTime]) VALUES (58, 6, 6, 49, 6, CAST(N'2001-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[sysPermissList] ([plID], [rID], [mID], [fID], [plCreateID], [plCreateTime]) VALUES (61, 6, 1006, 53, 6, CAST(N'2001-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[sysPermissList] ([plID], [rID], [mID], [fID], [plCreateID], [plCreateTime]) VALUES (62, 6, 1006, 54, 6, CAST(N'2001-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[sysPermissList] ([plID], [rID], [mID], [fID], [plCreateID], [plCreateTime]) VALUES (63, 6, 1006, 55, 6, CAST(N'2001-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[sysPermissList] ([plID], [rID], [mID], [fID], [plCreateID], [plCreateTime]) VALUES (64, 6, 1006, 56, 6, CAST(N'2001-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[sysPermissList] ([plID], [rID], [mID], [fID], [plCreateID], [plCreateTime]) VALUES (65, 6, 1006, 57, 6, CAST(N'2001-01-01T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[sysPermissList] OFF
SET IDENTITY_INSERT [dbo].[sysRole] ON 

INSERT [dbo].[sysRole] ([rID], [eDepID], [RoleType], [rName], [rRemark], [rSort], [rStatus], [rCreateID], [rCreateTime], [rUpdateID], [rUpdateTime]) VALUES (1, 10, 31, N'教学总监', N'教学总结', 1, 0, 8, CAST(N'2013-01-01T00:00:00.000' AS DateTime), NULL, CAST(N'2013-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[sysRole] ([rID], [eDepID], [RoleType], [rName], [rRemark], [rSort], [rStatus], [rCreateID], [rCreateTime], [rUpdateID], [rUpdateTime]) VALUES (3, 11, 31, N'教学总监', N'教学总监', 1, 0, 6, CAST(N'2013-04-01T00:00:00.000' AS DateTime), NULL, CAST(N'2013-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[sysRole] ([rID], [eDepID], [RoleType], [rName], [rRemark], [rSort], [rStatus], [rCreateID], [rCreateTime], [rUpdateID], [rUpdateTime]) VALUES (4, 10, 27, N'项目组长', N'项目组长', 2, 0, 6, CAST(N'2013-04-01T00:00:00.000' AS DateTime), NULL, CAST(N'2013-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[sysRole] ([rID], [eDepID], [RoleType], [rName], [rRemark], [rSort], [rStatus], [rCreateID], [rCreateTime], [rUpdateID], [rUpdateTime]) VALUES (5, 11, 27, N'项目组长', N'项目组长', 2, 0, 6, CAST(N'2014-04-01T00:00:00.000' AS DateTime), NULL, CAST(N'2014-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[sysRole] ([rID], [eDepID], [RoleType], [rName], [rRemark], [rSort], [rStatus], [rCreateID], [rCreateTime], [rUpdateID], [rUpdateTime]) VALUES (6, 1, 47, N'系统管理员', N'系统管理员', 1, 0, 6, CAST(N'2013-01-01T00:00:00.000' AS DateTime), NULL, CAST(N'2301-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[sysRole] ([rID], [eDepID], [RoleType], [rName], [rRemark], [rSort], [rStatus], [rCreateID], [rCreateTime], [rUpdateID], [rUpdateTime]) VALUES (7, 10, 28, N'技术总监', N'技术总监', 3, 0, 6, CAST(N'2013-04-01T00:00:00.000' AS DateTime), NULL, CAST(N'2013-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[sysRole] ([rID], [eDepID], [RoleType], [rName], [rRemark], [rSort], [rStatus], [rCreateID], [rCreateTime], [rUpdateID], [rUpdateTime]) VALUES (9, 10, 30, N'项目经理', N'项目经理', 4, 0, 6, CAST(N'2013-04-01T00:00:00.000' AS DateTime), NULL, CAST(N'2031-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[sysRole] ([rID], [eDepID], [RoleType], [rName], [rRemark], [rSort], [rStatus], [rCreateID], [rCreateTime], [rUpdateID], [rUpdateTime]) VALUES (10, 10, 49, N'普通职员', N'普通职员', 5, 0, 6, CAST(N'2013-04-01T00:00:00.000' AS DateTime), NULL, CAST(N'2014-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[sysRole] ([rID], [eDepID], [RoleType], [rName], [rRemark], [rSort], [rStatus], [rCreateID], [rCreateTime], [rUpdateID], [rUpdateTime]) VALUES (11, 10, 50, N'特殊权限', N'特殊权限', 6, 0, 6, CAST(N'3023-04-01T00:00:00.000' AS DateTime), NULL, CAST(N'3234-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[sysRole] ([rID], [eDepID], [RoleType], [rName], [rRemark], [rSort], [rStatus], [rCreateID], [rCreateTime], [rUpdateID], [rUpdateTime]) VALUES (12, 14, 55, N'主管', N'主管', 0, 0, 6, CAST(N'3024-05-01T00:00:00.000' AS DateTime), NULL, CAST(N'3244-04-01T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[sysRole] OFF
SET IDENTITY_INSERT [dbo].[sysUserInfo] ON 

INSERT [dbo].[sysUserInfo] ([uID], [uLoginName], [uLoginPWD], [uRealName], [uTelphone], [uMobile], [uEmail], [uQQ], [uGender], [uStatus], [uCompanyID], [uDepID], [uWorkGroupID], [uRemark], [uCreateID], [uCreateTime], [uUpdateID], [uUpdateTime]) VALUES (6, N'admin', N'21232F297A57A5A743894A0E4A801FC3', N'系统管理员', NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, 1, CAST(N'2017-01-18T00:00:00.000' AS DateTime), NULL, CAST(N'2017-01-18T00:00:00.000' AS DateTime))
INSERT [dbo].[sysUserInfo] ([uID], [uLoginName], [uLoginPWD], [uRealName], [uTelphone], [uMobile], [uEmail], [uQQ], [uGender], [uStatus], [uCompanyID], [uDepID], [uWorkGroupID], [uRemark], [uCreateID], [uCreateTime], [uUpdateID], [uUpdateTime]) VALUES (10, N'1', N'1', N'技术总监', NULL, NULL, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, 1, CAST(N'2017-01-19T00:00:00.000' AS DateTime), 1, CAST(N'2017-01-19T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[sysUserInfo] OFF
SET IDENTITY_INSERT [dbo].[sysUserInfo_Role] ON 

INSERT [dbo].[sysUserInfo_Role] ([urID], [uID], [rID]) VALUES (1, 10, 7)
INSERT [dbo].[sysUserInfo_Role] ([urID], [uID], [rID]) VALUES (5, 6, 6)
SET IDENTITY_INSERT [dbo].[sysUserInfo_Role] OFF
ALTER TABLE [dbo].[sysFunction]  WITH CHECK ADD  CONSTRAINT [FK_sysFucntion_sysMenus] FOREIGN KEY([mID])
REFERENCES [dbo].[sysMenus] ([mID])
GO
ALTER TABLE [dbo].[sysFunction] CHECK CONSTRAINT [FK_sysFucntion_sysMenus]
GO
ALTER TABLE [dbo].[sysPermissList]  WITH CHECK ADD  CONSTRAINT [FK_sysPermissList_sysMenus1] FOREIGN KEY([fID])
REFERENCES [dbo].[sysFunction] ([fID])
GO
ALTER TABLE [dbo].[sysPermissList] CHECK CONSTRAINT [FK_sysPermissList_sysMenus1]
GO
ALTER TABLE [dbo].[sysPermissList]  WITH CHECK ADD  CONSTRAINT [FK_sysPermissList_sysRole] FOREIGN KEY([rID])
REFERENCES [dbo].[sysRole] ([rID])
GO
ALTER TABLE [dbo].[sysPermissList] CHECK CONSTRAINT [FK_sysPermissList_sysRole]
GO
ALTER TABLE [dbo].[sysUserInfo_Role]  WITH CHECK ADD  CONSTRAINT [FK_sysUserInfo_Role_sysRole] FOREIGN KEY([rID])
REFERENCES [dbo].[sysRole] ([rID])
GO
ALTER TABLE [dbo].[sysUserInfo_Role] CHECK CONSTRAINT [FK_sysUserInfo_Role_sysRole]
GO
ALTER TABLE [dbo].[sysUserInfo_Role]  WITH CHECK ADD  CONSTRAINT [FK_sysUserInfo_Role_sysUserInfo] FOREIGN KEY([uID])
REFERENCES [dbo].[sysUserInfo] ([uID])
GO
ALTER TABLE [dbo].[sysUserInfo_Role] CHECK CONSTRAINT [FK_sysUserInfo_Role_sysUserInfo]
GO
ALTER TABLE [dbo].[wfProcess]  WITH CHECK ADD  CONSTRAINT [FK_wfProcess_wfRequestForm] FOREIGN KEY([wfRFID])
REFERENCES [dbo].[wfRequestForm] ([wfRFID])
GO
ALTER TABLE [dbo].[wfProcess] CHECK CONSTRAINT [FK_wfProcess_wfRequestForm]
GO
ALTER TABLE [dbo].[wfProcess]  WITH CHECK ADD  CONSTRAINT [FK_wfProcess_wfWorkNodes] FOREIGN KEY([wfnID])
REFERENCES [dbo].[wfWorkNodes] ([wfnID])
GO
ALTER TABLE [dbo].[wfProcess] CHECK CONSTRAINT [FK_wfProcess_wfWorkNodes]
GO
ALTER TABLE [dbo].[wfRequestForm]  WITH CHECK ADD  CONSTRAINT [FK_wfRequestForm_wfWork] FOREIGN KEY([wfID])
REFERENCES [dbo].[wfWork] ([wfID])
GO
ALTER TABLE [dbo].[wfRequestForm] CHECK CONSTRAINT [FK_wfRequestForm_wfWork]
GO
ALTER TABLE [dbo].[wfWorkBranch]  WITH CHECK ADD  CONSTRAINT [FK_wfWorkBranch_wfWorkNodes1] FOREIGN KEY([wfnID])
REFERENCES [dbo].[wfWorkNodes] ([wfnID])
GO
ALTER TABLE [dbo].[wfWorkBranch] CHECK CONSTRAINT [FK_wfWorkBranch_wfWorkNodes1]
GO
ALTER TABLE [dbo].[wfWorkNodes]  WITH CHECK ADD  CONSTRAINT [FK_wfWorkNodes_wfWork] FOREIGN KEY([wfID])
REFERENCES [dbo].[wfWork] ([wfID])
GO
ALTER TABLE [dbo].[wfWorkNodes] CHECK CONSTRAINT [FK_wfWorkNodes_wfWork]
GO
/****** Object:  StoredProcedure [dbo].[Usp_GetFunctionsForUserid]    Script Date: 2018/5/30 13:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<根据用户id获取此用户在系统中的所有权限按钮数据>
-- =============================================
CREATE PROCEDURE [dbo].[Usp_GetFunctionsForUserid] 
	-- Add the parameters for the stored procedure here
	@uid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
select f.fName,f.fFunction,f.fPicName,m.mUrl,m.mArea,m.mAction,
m.mController

  from sysFunction f 
join sysMenus m on (f.mID=m.mID)
join sysPermissList p on (f.fID=p.fID)
join sysUserInfo_Role ur on (p.rID=ur.rID and ur.uID=@uid)
END

GO
/****** Object:  StoredProcedure [dbo].[Usp_GetFunctionsForUsers]    Script Date: 2018/5/30 13:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<duo>
-- Create date: <Create Date,,>
-- Description:	<根据用户ID获取此用户在系统中的所有权限按钮数据>
-- =============================================
CREATE PROCEDURE [dbo].[Usp_GetFunctionsForUsers] 
	@uid int  --当前登录的用户id

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select f.fName,f.fFunction,f.fPicName,
m.mUrl,m.mArea,m.mController,m.mAction 
from sysFunction f
join sysMenus m on(f.mID=m.mID)
join sysPermissList p on(f.fID=p.fID)
join sysUserInfo_Role ur on(p.rID=ur.rID and ur.uID=@uid)
END

GO
/****** Object:  StoredProcedure [dbo].[Usp_GetPermissMenusForUser]    Script Date: 2018/5/30 13:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,duo>
-- Create date: <2017-3-14>
-- Description:	<根据用户id获取其权限菜单数据>
-- =============================================
CREATE PROCEDURE [dbo].[Usp_GetPermissMenusForUser] 
	-- Add the parameters for the stored procedure here
	@uid int --当前用户id
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select distinct m.*from sysMenus m
			inner join sysPermissList p on(m.mID=p.mID)
			inner join sysUserInfo_Role ur on(p.rID=ur.rID and ur.uID=@uid)

END

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作按钮的方式表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysFunction', @level2type=N'COLUMN',@level2name=N'fID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysFunction', @level2type=N'COLUMN',@level2name=N'mID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作方法描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysFunction', @level2type=N'COLUMN',@level2name=N'fName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作方法英文表示' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysFunction', @level2type=N'COLUMN',@level2name=N'fFunction'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作方法图标' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysFunction', @level2type=N'COLUMN',@level2name=N'fPicName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0：正常1：停用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysFunction', @level2type=N'COLUMN',@level2name=N'fStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysFunction', @level2type=N'COLUMN',@level2name=N'fCreateID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysFunction', @level2type=N'COLUMN',@level2name=N'fCreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysFunction', @level2type=N'COLUMN',@level2name=N'fUpdateID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysFunction', @level2type=N'COLUMN',@level2name=N'fUpdateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysMenus', @level2type=N'COLUMN',@level2name=N'mID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父级菜单编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysMenus', @level2type=N'COLUMN',@level2name=N'mParentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysMenus', @level2type=N'COLUMN',@level2name=N'mName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysMenus', @level2type=N'COLUMN',@level2name=N'mUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'控制器' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysMenus', @level2type=N'COLUMN',@level2name=N'mController'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'区域' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysMenus', @level2type=N'COLUMN',@level2name=N'mArea'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'方法' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysMenus', @level2type=N'COLUMN',@level2name=N'mAction'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysMenus', @level2type=N'COLUMN',@level2name=N'mSortID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0：正常，1：停用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysMenus', @level2type=N'COLUMN',@level2name=N'mStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单图标' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysMenus', @level2type=N'COLUMN',@level2name=N'mPicture'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单级别 0：跟菜单 1：一级菜单 2：二级菜单' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysMenus', @level2type=N'COLUMN',@level2name=N'mLevel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备用字段' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysMenus', @level2type=N'COLUMN',@level2name=N'mExp1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备用字段 0：表示在左菜单要显示' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysMenus', @level2type=N'COLUMN',@level2name=N'mExp2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysMenus', @level2type=N'COLUMN',@level2name=N'mCreateID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysMenus', @level2type=N'COLUMN',@level2name=N'mCreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysMenus', @level2type=N'COLUMN',@level2name=N'mUpdateID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysMenus', @level2type=N'COLUMN',@level2name=N'mUpdateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'组织结构PK' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysOrganStruct', @level2type=N'COLUMN',@level2name=N'osID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父级组织结构ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysOrganStruct', @level2type=N'COLUMN',@level2name=N'osParentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'组织结构名称（如，公司，部门）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysOrganStruct', @level2type=N'COLUMN',@level2name=N'osName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编码 1000,100-1,1000-1-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysOrganStruct', @level2type=N'COLUMN',@level2name=N'osCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类别ID，存放keyValue中typeID=1的数据ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysOrganStruct', @level2type=N'COLUMN',@level2name=N'osCateID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'暂时不用1：集团 2：集团下的公司 3：公司下的部门 4：部门下的' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysOrganStruct', @level2type=N'COLUMN',@level2name=N'osLevel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'组织别名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysOrganStruct', @level2type=N'COLUMN',@level2name=N'osShortName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysOrganStruct', @level2type=N'COLUMN',@level2name=N'osRemark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0：正常 1：停用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysOrganStruct', @level2type=N'COLUMN',@level2name=N'osStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysOrganStruct', @level2type=N'COLUMN',@level2name=N'osCreateID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysOrganStruct', @level2type=N'COLUMN',@level2name=N'osCreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysOrganStruct', @level2type=N'COLUMN',@level2name=N'osUpdateID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysOrganStruct', @level2type=N'COLUMN',@level2name=N'osUpdateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'权限列表主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysPermissList', @level2type=N'COLUMN',@level2name=N'plID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysPermissList', @level2type=N'COLUMN',@level2name=N'rID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysPermissList', @level2type=N'COLUMN',@level2name=N'mID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作按钮方式ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysPermissList', @level2type=N'COLUMN',@level2name=N'fID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysPermissList', @level2type=N'COLUMN',@level2name=N'plCreateID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysPermissList', @level2type=N'COLUMN',@level2name=N'plCreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysUserInfo', @level2type=N'COLUMN',@level2name=N'uID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登录用户名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysUserInfo', @level2type=N'COLUMN',@level2name=N'uLoginName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户密码MD5加密' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysUserInfo', @level2type=N'COLUMN',@level2name=N'uLoginPWD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'真实姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysUserInfo', @level2type=N'COLUMN',@level2name=N'uRealName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'电话' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysUserInfo', @level2type=N'COLUMN',@level2name=N'uTelphone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手机' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysUserInfo', @level2type=N'COLUMN',@level2name=N'uMobile'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'电邮' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysUserInfo', @level2type=N'COLUMN',@level2name=N'uEmail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'QQ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysUserInfo', @level2type=N'COLUMN',@level2name=N'uQQ'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'性别 0：女 1：男 2：保密' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysUserInfo', @level2type=N'COLUMN',@level2name=N'uGender'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0:正常 1：停用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysUserInfo', @level2type=N'COLUMN',@level2name=N'uStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'组织结构公司的FK' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysUserInfo', @level2type=N'COLUMN',@level2name=N'uCompanyID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'组织结构部门的FK' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysUserInfo', @level2type=N'COLUMN',@level2name=N'uDepID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'组织结构工作组的FK' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysUserInfo', @level2type=N'COLUMN',@level2name=N'uWorkGroupID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysUserInfo', @level2type=N'COLUMN',@level2name=N'uRemark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysUserInfo', @level2type=N'COLUMN',@level2name=N'uCreateID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysUserInfo', @level2type=N'COLUMN',@level2name=N'uCreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysUserInfo', @level2type=N'COLUMN',@level2name=N'uUpdateID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysUserInfo', @level2type=N'COLUMN',@level2name=N'uUpdateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户所属角色中间表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysUserInfo_Role', @level2type=N'COLUMN',@level2name=N'urID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysUserInfo_Role', @level2type=N'COLUMN',@level2name=N'uID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysUserInfo_Role', @level2type=N'COLUMN',@level2name=N'rID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'工作流定义表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wfWork', @level2type=N'COLUMN',@level2name=N'wfID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'工作流标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wfWork', @level2type=N'COLUMN',@level2name=N'wfTitle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'逻辑处理节点分支表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wfWorkBranch', @level2type=N'COLUMN',@level2name=N'wfbID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'工作流程节点外键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wfWorkBranch', @level2type=N'COLUMN',@level2name=N'wfnID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流转指示；true ，FALSE' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wfWorkBranch', @level2type=N'COLUMN',@level2name=N'wfnToken'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'工作流程节点' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wfWorkNodes', @level2type=N'COLUMN',@level2name=N'wfnID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'工作流定义表主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wfWorkNodes', @level2type=N'COLUMN',@level2name=N'wfID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'节点序号，' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wfWorkNodes', @level2type=N'COLUMN',@level2name=N'wfnOrderNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'节点类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wfWorkNodes', @level2type=N'COLUMN',@level2name=N'wfNodeType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'节点描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wfWorkNodes', @level2type=N'COLUMN',@level2name=N'wfNodeTitle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'执行节点逻辑判断方法' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wfWorkNodes', @level2type=N'COLUMN',@level2name=N'wfnBizMethod'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'审批角色类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'wfWorkNodes', @level2type=N'COLUMN',@level2name=N'wfnRoleType'
GO
USE [master]
GO
ALTER DATABASE [ASPPROJECT1] SET  READ_WRITE 
GO
