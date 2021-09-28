﻿USE [master]
GO
/****** Object:  Database [AlifBank]    Script Date: 9/28/21 7:15:52 AM ******/
CREATE DATABASE [AlifBank]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AlifBank', FILENAME = N'/var/opt/mssql/data/AlifBank.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AlifBank_log', FILENAME = N'/var/opt/mssql/data/AlifBank_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AlifBank].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AlifBank] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AlifBank] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AlifBank] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AlifBank] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AlifBank] SET ARITHABORT OFF 
GO
ALTER DATABASE [AlifBank] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AlifBank] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AlifBank] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AlifBank] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AlifBank] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AlifBank] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AlifBank] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AlifBank] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AlifBank] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AlifBank] SET  ENABLE_BROKER 
GO
ALTER DATABASE [AlifBank] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AlifBank] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AlifBank] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AlifBank] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AlifBank] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AlifBank] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AlifBank] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AlifBank] SET RECOVERY FULL 
GO
ALTER DATABASE [AlifBank] SET  MULTI_USER 
GO
ALTER DATABASE [AlifBank] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AlifBank] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AlifBank] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AlifBank] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AlifBank] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'AlifBank', N'ON'
GO
ALTER DATABASE [AlifBank] SET QUERY_STORE = OFF
GO
USE [AlifBank]
GO
ALTER DATABASE SCOPED CONFIGURATION SET ACCELERATED_PLAN_FORCING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET BATCH_MODE_ADAPTIVE_JOINS = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET BATCH_MODE_MEMORY_GRANT_FEEDBACK = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET BATCH_MODE_ON_ROWSTORE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET DEFERRED_COMPILATION_TV = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET ELEVATE_ONLINE = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET ELEVATE_RESUMABLE = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET GLOBAL_TEMPORARY_TABLE_AUTO_DROP = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET INTERLEAVED_EXECUTION_TVF = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET ISOLATE_SECURITY_POLICY_CARDINALITY = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LAST_QUERY_PLAN_STATS = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LIGHTWEIGHT_QUERY_PROFILING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET OPTIMIZE_FOR_AD_HOC_WORKLOADS = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET ROW_MODE_MEMORY_GRANT_FEEDBACK = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET TSQL_SCALAR_UDF_INLINING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET VERBOSE_TRUNCATION_WARNINGS = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET XTP_PROCEDURE_EXECUTION_STATISTICS = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET XTP_QUERY_EXECUTION_STATISTICS = OFF;
GO
USE [AlifBank]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 9/28/21 7:15:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nvarchar](200) NOT NULL,
	[Password] [nvarchar](200) NOT NULL,
	[LastName] [nvarchar](200) NOT NULL,
	[FirstName] [nvarchar](200) NOT NULL,
	[Age] [int] NOT NULL,
	[Gender] [int] NOT NULL,
	[Is_Admin] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 9/28/21 7:15:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Account_Id] [int] NOT NULL,
	[Amount] [decimal](20, 2) NOT NULL,
	[Type] [nvarchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD FOREIGN KEY([Account_Id])
REFERENCES [dbo].[Accounts] ([Id])
GO
USE [master]
GO
ALTER DATABASE [AlifBank] SET  READ_WRITE 
GO