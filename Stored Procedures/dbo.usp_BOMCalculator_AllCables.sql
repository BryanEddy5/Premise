SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
---- =============================================
---- Author:		<Bryan Eddy>
---- ALTER date: <10/03/2016>
---- Description:	<The purpose of this procedure is to calulate the weightof all Premise Cables.
----				 This was originally developed as part of the Premise Pricing program in Sales Force>
---- =============================================
CREATE PROCEDURE [dbo].[usp_BOMCalculator_AllCables]

AS
BEGIN
		-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

--This query will extract the most recent item build for each Base/Construction
IF OBJECT_ID(N'tempdb..#BaseOracleBOM', N'U') IS NOT NULL
DROP TABLE #BaseOracleBOM;

SELECT Base,  AssemblyItemNumber, SetupID
INTO #BaseOracleBOM
FROM [dbo].[vOracleBaseItems]


--Runs recursive loop to pull to explode all cable BOM's and capture the materials and subcomponents
--IF OBJECT_ID(N'dbo.tblBOM_Base_Weight', N'U') IS NOT NULL
--DROP TABLE dbo.tblBOM_Base_Weight

--CREATE TABLE dbo.tblBOM_Base_Weight(
--Base  nvarchar(50) ,
--Weight  float null,
--SetupID  int,
--constraint pk_tblBOM_Base_Weight Primary Key (Base)
--)

DELETE FROM dbo.tblBOM_Base_Weight
INSERT INTO dbo.tblBOM_Base_Weight
SELECT    K.BASE, e.Weight,SetupID
--INTO dbo.tblBOM_Base_Weight
FROM  #BaseOracleBOM K CROSS APPLY [dbo].[usf_BOM_Weight_kg_m](K.AssemblyItemNumber) AS e 
GROUP BY k.base, e.weight,SetupID

--SELECT * FROM dbo.tblBOM_Base_Weight



END


GO
