﻿Operation =1
Option =2
Where ="(((dbo_CableUnion.Active)<>0))"
Begin InputTables
    Name ="dbo_CableUnion"
End
Begin OutputColumns
    Expression ="dbo_CableUnion.ItemNo"
    Expression ="dbo_CableUnion.Active"
End
Begin OrderBy
    Expression ="dbo_CableUnion.ItemNo"
    Flag =0
End
dbBoolean "ReturnsRecords" ="-1"
dbInteger "ODBCTimeout" ="60"
dbByte "RecordsetType" ="0"
dbBoolean "OrderByOn" ="0"
dbByte "Orientation" ="0"
dbByte "DefaultView" ="2"
dbBinary "GUID" = Begin
    0x4195e63008ea2b46a13f6771a0db4961
End
dbBoolean "FilterOnLoad" ="0"
dbBoolean "OrderByOnLoad" ="-1"
dbBoolean "TotalsRow" ="0"
Begin
    Begin
        dbText "Name" ="dbo_CableUnion.ItemNo"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="dbo_CableUnion.Active"
        dbLong "AggregateType" ="-1"
    End
End
Begin
    State =0
    Left =-119
    Top =1
    Right =1501
    Bottom =376
    Left =-1
    Top =-1
    Right =1588
    Bottom =110
    Left =0
    Top =0
    ColumnsShown =539
    Begin
        Left =48
        Top =12
        Right =270
        Bottom =156
        Top =0
        Name ="dbo_CableUnion"
        Name =""
    End
End
