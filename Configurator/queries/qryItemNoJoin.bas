﻿dbMemo "SQL" ="SELECT [Basic Product Construction].[New Oracle Part #] AS Oracle, [Basic Produc"
    "t Construction].[Item No], [Basic Product Construction].Base, [LISTING COMPANY] "
    "AS Label, \"BasicConstruction\" AS Source, 1 AS Location, Active\015\012FROM [Ba"
    "sic Product Construction];\015\012"
dbMemo "Connect" =""
dbBoolean "ReturnsRecords" ="-1"
dbInteger "ODBCTimeout" ="60"
dbBoolean "OrderByOn" ="-1"
dbByte "Orientation" ="0"
dbByte "DefaultView" ="2"
dbMemo "Filter" ="(([Item No] Like \"gq*\"))"
dbMemo "OrderBy" ="[Item No]"
dbBinary "GUID" = Begin
    0xa1aaa245bd82ad49a9a66e9a8f76226a
End
dbBoolean "FilterOnLoad" ="0"
dbBoolean "OrderByOnLoad" ="-1"
Begin
    Begin
        dbText "Name" ="Oracle"
        dbLong "AggregateType" ="-1"
        dbBinary "GUID" = Begin
            0x998dd9c893095a4fa22e84fd5dbb600c
        End
    End
    Begin
        dbText "Name" ="[Basic Product Construction].[Item No]"
        dbInteger "ColumnWidth" ="3900"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
    End
    Begin
        dbText "Name" ="Label"
        dbLong "AggregateType" ="-1"
        dbBinary "GUID" = Begin
            0x678520e8c85b80429a3d9a23a4425f49
        End
    End
    Begin
        dbText "Name" ="Source"
        dbInteger "ColumnWidth" ="2565"
        dbBoolean "ColumnHidden" ="0"
        dbLong "AggregateType" ="-1"
        dbBinary "GUID" = Begin
            0xd4b3d6e503433b4987e806214eebccf9
        End
    End
    Begin
        dbText "Name" ="Location"
        dbLong "AggregateType" ="-1"
        dbBinary "GUID" = Begin
            0x26c68b21d124df46b7ba8efba1c3f855
        End
    End
    Begin
        dbText "Name" ="Active"
        dbLong "AggregateType" ="-1"
        dbBinary "GUID" = Begin
            0x6865ba8d5cd75d43963bf48fd603f377
        End
    End
End
