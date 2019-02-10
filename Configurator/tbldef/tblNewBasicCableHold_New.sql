CREATE TABLE [tblNewBasicCableHold_New] (
  [New Oracle Part #] VARCHAR (255) CONSTRAINT [PrimaryKey] PRIMARY KEY  UNIQUE  NOT NULL ,
  [Item No] VARCHAR (255),
  [Customer] VARCHAR (255),
  [Customer Part#] VARCHAR (255),
  [Active] BIT ,
  [Reason] VARCHAR (255),
  [calculate bill?] BIT ,
  [Base] VARCHAR (50),
  [Cable Type] VARCHAR (255),
  [Revision Date] DATETIME ,
  [Revision Letter] VARCHAR (255),
  [Revision History] LONGTEXT ,
  [Standard Operation] VARCHAR (255),
  [Jacket Material] VARCHAR (255),
  [Jacket Color] VARCHAR (255),
  [Color Chip ID] VARCHAR (255),
  [Nominal OD] VARCHAR ,
  [OD Tol  (+)] VARCHAR (255),
  [OD Tol  (-)] VARCHAR (255),
  [Height] VARCHAR (255),
  [Height Tol (+)] VARCHAR (255),
  [Height Tol (-)] VARCHAR (255),
  [Nominal Wall] VARCHAR (255),
  [Max Ave Wall] VARCHAR (255),
  [Min Ave Wall] VARCHAR (255),
  [Min Spot Wall] VARCHAR (255),
  [Print Reel No] BIT ,
  [Print Item No] BIT ,
  [Std Subunit Print] BIT ,
  [Print Type (base)] VARCHAR (255),
  [Print Line 1] VARCHAR (70),
  [Print Line 2] VARCHAR (70),
  [Print Line 3] VARCHAR (70),
  [Print Line 4] VARCHAR (70),
  [NewPrintLine4] VARCHAR (70),
  [Print Spacing] VARCHAR (255),
  [PrintNotes] VARCHAR (255),
  [Listing Company] VARCHAR (255),
  [UL-ETL-Listing] VARCHAR (50),
  [UL-ETL-Const] VARCHAR (50),
  [UL-ETL-Section] VARCHAR (255),
  [ENumber] VARCHAR (255),
  [Label Type] VARCHAR (255),
  [Aramid Type] VARCHAR (255),
  [Number of ends] VARCHAR (255),
  [Aramid Type2] VARCHAR (255),
  [Number of ends2] VARCHAR (255),
  [Unit Chips Type] VARCHAR (255),
  [Unit Ripcord] VARCHAR (255),
  [Unit CM] VARCHAR (255),
  [Lay Length] VARCHAR (255),
  [Talc] BIT ,
  [EZ Strip] VARCHAR (255),
  [TB Material] VARCHAR (255),
  [TB Chips Type] VARCHAR (255),
  [TB Nominal OD] VARCHAR ,
  [TB OD Tol  (+)] VARCHAR (255),
  [TB OD Tol  (-)] VARCHAR (255),
  [TB Color Series] VARCHAR (255),
  [Fiber Type] VARCHAR (255),
  [Fiber Oracle item] VARCHAR (255),
  [FiberType2] VARCHAR (50),
  [FiberType3] VARCHAR (50),
  [1st Req Freq] VARCHAR (255),
  [1st Max Atten] DOUBLE ,
  [1st Min BandW] VARCHAR (255),
  [2nd Req Freq] VARCHAR (255),
  [2nd Max Atten] DOUBLE ,
  [2nd Min BandW] VARCHAR (255),
  [SM 1300 Max Atten] VARCHAR (255),
  [SM 1550 Max Atten] VARCHAR (255),
  [Special Instr Product1] VARCHAR (255),
  [zzSpecial Instr Product3] VARCHAR (255),
  [zzSpecial Instr Product4] VARCHAR (255),
  [zzOracle Part#] VARCHAR (255),
  [OracleStatus] VARCHAR (50),
  [PSS Document #] VARCHAR (255),
  [CustomerRev] VARCHAR (50),
  [RibbonHighCure] BIT ,
  [Unit Series] VARCHAR (255),
  [Print Height] VARCHAR (255),
  [1st Req Freq - B] VARCHAR (25),
  [1st Max Atten - B] SINGLE ,
  [1st Min BandW - B] VARCHAR (25),
  [2nd Req Freq - B] VARCHAR (25),
  [2nd Max Atten - B] SINGLE ,
  [2nd Min BandW - B] VARCHAR (4),
  [1st Req Freq - C] VARCHAR (5),
  [1st Max Atten - C] SINGLE ,
  [1st Min BandW - C] VARCHAR (4),
  [2nd Req Freq - C] VARCHAR (5),
  [2nd Max Atten - C] SINGLE ,
  [2nd Min BandW - C] VARCHAR (4),
  [Colored_Fiber] BIT ,
  [VendorSpecificFiber] BIT 
)
