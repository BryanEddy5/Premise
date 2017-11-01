CREATE TABLE [dbo].[FiberReportData]
(
[ItemNumber] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FiberReportData] ADD CONSTRAINT [PK_FiberReportData] PRIMARY KEY CLUSTERED  ([ItemNumber]) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[FiberReportData] TO [SPB spb_PREMISE]
GO
GRANT INSERT ON  [dbo].[FiberReportData] TO [SPB spb_PREMISE]
GO
GRANT DELETE ON  [dbo].[FiberReportData] TO [SPB spb_PREMISE]
GO
