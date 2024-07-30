Attribute VB_Name = "Fund"
Sub Macro_inicio()
Attribute Macro_inicio.VB_ProcData.VB_Invoke_Func = "a\n14"
'Ctrl a
Call WorksheetLoop

End Sub

Sub WorksheetLoop()

        Dim WS_Count As Integer
        Dim I As Integer

         ' Define WS_Count como el número de hojas en el libro activo
        WS_Count = ActiveWorkbook.Worksheets.Count

         ' Empieza el loop
        For I = 1 To WS_Count
            
            Worksheets(I).Select
            nombre = Worksheets(I).Name
            
            If InStr(1, nombre, "fund_acti_pct_ef", vbBinaryCompare) = 1 Then
                Call Macro_acti_ef
            ElseIf InStr(1, nombre, "fund_acti_par_nac", vbBinaryCompare) = 1 Then
                Call Macro_acti_nac
            ElseIf InStr(1, nombre, "fund_pers_pct_ef", vbBinaryCompare) = 1 Then
                Call Macro_pers_ef
            ElseIf InStr(1, nombre, "fund_pers_par_nac", vbBinaryCompare) = 1 Then
                Call Macro_pers_nac
            ElseIf InStr(1, nombre, "fund_prod_pct_ef", vbBinaryCompare) = 1 Then
                Call Macro_prod_ef
            ElseIf InStr(1, nombre, "fund_prod_par_nac", vbBinaryCompare) = 1 Then
                Call Macro_prod_nac
            ElseIf InStr(1, nombre, "fund_unec_pct_ef", vbBinaryCompare) = 1 Then
                Call Macro_unec_ef
            ElseIf InStr(1, nombre, "fund_unec_par_nac", vbBinaryCompare) = 1 Then
                Call Macro_unec_nac
            End If

        Next I

End Sub

Sub Macro_acti_ef()

Dim Grafica As ChartObject

Rows("1:2").Insert Shift:=xlDown, CopyOrigin:=xlFormatFromLeftOrAbove
Cells(1, 1).Value = "Participación porcentual de acervo total de activos fijos (mdp) nacional del cluster de fundición por entidad federativa, 2018"
fila = 3

Do While Cells(fila, 1) = ""
    fila = fila + 1
Loop

ultimo = fila
Do While Cells(ultimo, 1) <> ""
    ultimo = ultimo + 1
Loop
'

'
Range("B" & (fila + 1) & ":B" & (ultimo - 1)).NumberFormat = "0.00%"
hoja = ActiveSheet.Name

'
Range("A" & fila & ":B" & (ultimo - 1)).AutoFilter
'

Range("A" & (fila + 1) & ":B" & (ultimo - 1)).Sort Key1:=Range("B" & (fila + 1)), Order1:=xlAscending

'
jalisco = fila
nacional = fila

Do While Cells(jalisco, 1) <> "Jalisco"
    jalisco = jalisco + 1
Loop
jalisco = jalisco - fila

Do While Cells(nacional, 1) <> "Nacional"
    nacional = nacional + 1
Loop
nacional = nacional - fila
'
Range("A" & (fila + 1) & ":B" & (ultimo - 1)).Select
'
Set Grafica_vertical_nacional = ActiveSheet.ChartObjects.Add(Left:=4 * 48, Width:=468.1, Top:=60, Height:=448.5)

With Grafica_vertical_nacional.Chart
    .ApplyChartTemplate ("C:\Users\marif\Desktop\SS\Gráficas Clusters\Barras Gris Arial 9.crtx") ' UBICACIÓN PERSONAL
    .SetSourceData Source:=Range("A" & (fila + 1) & ":B" & (ultimo - 1))
    .SeriesCollection(1).Points(jalisco).Format.Fill.ForeColor.RGB = RGB(251, 187, 39)
    .SeriesCollection(1).Points(nacional).Format.Fill.ForeColor.RGB = RGB(149, 104, 43)
        
End With
'
Range("A" & fila & ":B" & (ultimo - 1)).AutoFilter
'
End Sub

Sub Macro_acti_nac()

Dim Grafica As ChartObject

Rows("1:2").Insert Shift:=xlDown, CopyOrigin:=xlFormatFromLeftOrAbove
Cells(1, 1).Value = "Acervo total de activos fijos (mdp) del cluster de fundición de cada entidad federativa, como porcentaje del total estatal, 2018"
fila = 3

Do While Cells(fila, 1) = ""
    fila = fila + 1
Loop

ultimo = fila
Do While Cells(ultimo, 1) <> ""
    ultimo = ultimo + 1
Loop
'

'
Range("B" & (fila + 1) & ":B" & (ultimo - 1)).NumberFormat = "0.00%"
hoja = ActiveSheet.Name

'
Range("A" & fila & ":B" & (ultimo - 1)).AutoFilter
'

Range("A" & (fila + 1) & ":B" & (ultimo - 1)).Sort Key1:=Range("B" & (fila + 1)), Order1:=xlAscending

'
jalisco = fila

Do While Cells(jalisco, 1) <> "Jalisco"
    jalisco = jalisco + 1
Loop
jalisco = jalisco - fila
'
Range("A" & (fila + 1) & ":B" & (ultimo - 1)).Select
'
Set Grafica_vertical = ActiveSheet.ChartObjects.Add(Left:=4 * 48, Width:=468.1, Top:=60, Height:=448.5)

With Grafica_vertical.Chart
    .ApplyChartTemplate ("C:\Users\marif\Desktop\SS\Gráficas Clusters\Barras Gris Arial 9.crtx") ' UBICACIÓN PERSONAL
    .SetSourceData Source:=Range("A" & (fila + 1) & ":B" & (ultimo - 1))
    .SeriesCollection(1).Points(jalisco).Format.Fill.ForeColor.RGB = RGB(251, 187, 39)

End With
'
Range("A" & fila & ":B" & (ultimo - 1)).AutoFilter
'
End Sub

Sub Macro_pers_ef()

Dim Grafica As ChartObject

Rows("1:2").Insert Shift:=xlDown, CopyOrigin:=xlFormatFromLeftOrAbove
Cells(1, 1).Value = "Participación porcentual de personal ocupado total nacional del cluster de fundición por entidad federativa, 2018"
fila = 3

Do While Cells(fila, 1) = ""
    fila = fila + 1
Loop

ultimo = fila
Do While Cells(ultimo, 1) <> ""
    ultimo = ultimo + 1
Loop
'

'
Range("B" & (fila + 1) & ":B" & (ultimo - 1)).NumberFormat = "0.00%"
hoja = ActiveSheet.Name

'
Range("A" & fila & ":B" & (ultimo - 1)).AutoFilter
'

Range("A" & (fila + 1) & ":B" & (ultimo - 1)).Sort Key1:=Range("B" & (fila + 1)), Order1:=xlAscending

'
jalisco = fila
nacional = fila

Do While Cells(jalisco, 1) <> "Jalisco"
    jalisco = jalisco + 1
Loop
jalisco = jalisco - fila

Do While Cells(nacional, 1) <> "Nacional"
    nacional = nacional + 1
Loop
nacional = nacional - fila
'
Range("A" & (fila + 1) & ":B" & (ultimo - 1)).Select
'
Set Grafica_vertical_nacional = ActiveSheet.ChartObjects.Add(Left:=4 * 48, Width:=468.1, Top:=60, Height:=448.5)

With Grafica_vertical_nacional.Chart
    .ApplyChartTemplate ("C:\Users\marif\Desktop\SS\Gráficas Clusters\Barras Gris Arial 9.crtx") ' UBICACIÓN PERSONAL
    .SetSourceData Source:=Range("A" & (fila + 1) & ":B" & (ultimo - 1))
    .SeriesCollection(1).Points(jalisco).Format.Fill.ForeColor.RGB = RGB(251, 187, 39)
    .SeriesCollection(1).Points(nacional).Format.Fill.ForeColor.RGB = RGB(149, 104, 43)

End With
'
Range("A" & fila & ":B" & (ultimo - 1)).AutoFilter
'
End Sub

Sub Macro_pers_nac()

Dim Grafica As ChartObject

Rows("1:2").Insert Shift:=xlDown, CopyOrigin:=xlFormatFromLeftOrAbove
Cells(1, 1).Value = "Personal ocupado total del cluster de fundición de cada entidad federativa, como porcentaje del total estatal, 2018"
fila = 3

Do While Cells(fila, 1) = ""
    fila = fila + 1
Loop

ultimo = fila
Do While Cells(ultimo, 1) <> ""
    ultimo = ultimo + 1
Loop
'

'
Range("B" & (fila + 1) & ":B" & (ultimo - 1)).NumberFormat = "0.00%"
hoja = ActiveSheet.Name

'
Range("A" & fila & ":B" & (ultimo - 1)).AutoFilter
'

Range("A" & (fila + 1) & ":B" & (ultimo - 1)).Sort Key1:=Range("B" & (fila + 1)), Order1:=xlAscending

'
jalisco = fila

Do While Cells(jalisco, 1) <> "Jalisco"
    jalisco = jalisco + 1
Loop
jalisco = jalisco - fila
'
Range("A" & (fila + 1) & ":B" & (ultimo - 1)).Select
'
Set Grafica_vertical = ActiveSheet.ChartObjects.Add(Left:=4 * 48, Width:=468.1, Top:=60, Height:=448.5)

With Grafica_vertical.Chart
    .ApplyChartTemplate ("C:\Users\marif\Desktop\SS\Gráficas Clusters\Barras Gris Arial 9.crtx") ' UBICACIÓN PERSONAL
    .SetSourceData Source:=Range("A" & (fila + 1) & ":B" & (ultimo - 1))
    .SeriesCollection(1).Points(jalisco).Format.Fill.ForeColor.RGB = RGB(251, 187, 39)

End With
'
Range("A" & fila & ":B" & (ultimo - 1)).AutoFilter
'
End Sub

Sub Macro_prod_ef()

Dim Grafica As ChartObject

Rows("1:2").Insert Shift:=xlDown, CopyOrigin:=xlFormatFromLeftOrAbove
Cells(1, 1).Value = "Participación porcentual de producción bruta total (mdp) nacional del cluster de fundición por entidad federativa, 2018"
fila = 3

Do While Cells(fila, 1) = ""
    fila = fila + 1
Loop

ultimo = fila
Do While Cells(ultimo, 1) <> ""
    ultimo = ultimo + 1
Loop
'

'
Range("B" & (fila + 1) & ":B" & (ultimo - 1)).NumberFormat = "0.00%"
hoja = ActiveSheet.Name

'
Range("A" & fila & ":B" & (ultimo - 1)).AutoFilter
'

Range("A" & (fila + 1) & ":B" & (ultimo - 1)).Sort Key1:=Range("B" & (fila + 1)), Order1:=xlAscending

'
jalisco = fila
nacional = fila

Do While Cells(jalisco, 1) <> "Jalisco"
    jalisco = jalisco + 1
Loop
jalisco = jalisco - fila

Do While Cells(nacional, 1) <> "Nacional"
    nacional = nacional + 1
Loop
nacional = nacional - fila
'
Range("A" & (fila + 1) & ":B" & (ultimo - 1)).Select
'
Set Grafica_vertical_nacional = ActiveSheet.ChartObjects.Add(Left:=4 * 48, Width:=468.1, Top:=60, Height:=448.5)

With Grafica_vertical_nacional.Chart
    .ApplyChartTemplate ("C:\Users\marif\Desktop\SS\Gráficas Clusters\Barras Gris Arial 9.crtx") ' UBICACIÓN PERSONAL
    .SetSourceData Source:=Range("A" & (fila + 1) & ":B" & (ultimo - 1))
    .SeriesCollection(1).Points(jalisco).Format.Fill.ForeColor.RGB = RGB(251, 187, 39)
    .SeriesCollection(1).Points(nacional).Format.Fill.ForeColor.RGB = RGB(149, 104, 43)

End With
'
Range("A" & fila & ":B" & (ultimo - 1)).AutoFilter
'
End Sub

Sub Macro_prod_nac()

Dim Grafica As ChartObject

Rows("1:2").Insert Shift:=xlDown, CopyOrigin:=xlFormatFromLeftOrAbove
Cells(1, 1).Value = "Producción bruta total (mdp) del cluster de fundición de cada entidad federativa, como porcentaje del total estatal, 2018"
fila = 3

Do While Cells(fila, 1) = ""
    fila = fila + 1
Loop

ultimo = fila
Do While Cells(ultimo, 1) <> ""
    ultimo = ultimo + 1
Loop
'

'
Range("B" & (fila + 1) & ":B" & (ultimo - 1)).NumberFormat = "0.00%"
hoja = ActiveSheet.Name

'
Range("A" & fila & ":B" & (ultimo - 1)).AutoFilter
'

Range("A" & (fila + 1) & ":B" & (ultimo - 1)).Sort Key1:=Range("B" & (fila + 1)), Order1:=xlAscending

'
jalisco = fila

Do While Cells(jalisco, 1) <> "Jalisco"
    jalisco = jalisco + 1
Loop
jalisco = jalisco - fila
'
Range("A" & (fila + 1) & ":B" & (ultimo - 1)).Select
'
Set Grafica_vertical = ActiveSheet.ChartObjects.Add(Left:=4 * 48, Width:=468.1, Top:=60, Height:=448.5)

With Grafica_vertical.Chart
    .ApplyChartTemplate ("C:\Users\marif\Desktop\SS\Gráficas Clusters\Barras Gris Arial 9.crtx") ' UBICACIÓN PERSONAL
    .SetSourceData Source:=Range("A" & (fila + 1) & ":B" & (ultimo - 1))
    .SeriesCollection(1).Points(jalisco).Format.Fill.ForeColor.RGB = RGB(251, 187, 39)

End With
'
Range("A" & fila & ":B" & (ultimo - 1)).AutoFilter
'
End Sub

Sub Macro_unec_ef()

Dim Grafica As ChartObject

Rows("1:2").Insert Shift:=xlDown, CopyOrigin:=xlFormatFromLeftOrAbove
Cells(1, 1).Value = "Participación porcentual de unidades económicas nacionales del cluster de fundición por entidad federativa, 2018"
fila = 3

Do While Cells(fila, 1) = ""
    fila = fila + 1
Loop

ultimo = fila
Do While Cells(ultimo, 1) <> ""
    ultimo = ultimo + 1
Loop
'

'
Range("B" & (fila + 1) & ":B" & (ultimo - 1)).NumberFormat = "0.00%"
hoja = ActiveSheet.Name

'
Range("A" & fila & ":B" & (ultimo - 1)).AutoFilter
'

Range("A" & (fila + 1) & ":B" & (ultimo - 1)).Sort Key1:=Range("B" & (fila + 1)), Order1:=xlAscending

'
jalisco = fila
nacional = fila

Do While Cells(jalisco, 1) <> "Jalisco"
    jalisco = jalisco + 1
Loop
jalisco = jalisco - fila

Do While Cells(nacional, 1) <> "Nacional"
    nacional = nacional + 1
Loop
nacional = nacional - fila
'
Range("A" & (fila + 1) & ":B" & (ultimo - 1)).Select
'
Set Grafica_vertical_nacional = ActiveSheet.ChartObjects.Add(Left:=4 * 48, Width:=468.1, Top:=60, Height:=448.5)

With Grafica_vertical_nacional.Chart
    .ApplyChartTemplate ("C:\Users\marif\Desktop\SS\Gráficas Clusters\Barras Gris Arial 9.crtx") ' UBICACIÓN PERSONAL
    .SetSourceData Source:=Range("A" & (fila + 1) & ":B" & (ultimo - 1))
    .SeriesCollection(1).Points(jalisco).Format.Fill.ForeColor.RGB = RGB(251, 187, 39)
    .SeriesCollection(1).Points(nacional).Format.Fill.ForeColor.RGB = RGB(149, 104, 43)

End With
'
Range("A" & fila & ":B" & (ultimo - 1)).AutoFilter
'
End Sub

Sub Macro_unec_nac()

Dim Grafica As ChartObject

Rows("1:2").Insert Shift:=xlDown, CopyOrigin:=xlFormatFromLeftOrAbove
Cells(1, 1).Value = "Unidades económicas del cluster de fundición de cada entidad federativa, como porcentaje del total estatal, 2018"
fila = 3

Do While Cells(fila, 1) = ""
    fila = fila + 1
Loop

ultimo = fila
Do While Cells(ultimo, 1) <> ""
    ultimo = ultimo + 1
Loop
'

'
Range("B" & (fila + 1) & ":B" & (ultimo - 1)).NumberFormat = "0.00%"
hoja = ActiveSheet.Name

'
Range("A" & fila & ":B" & (ultimo - 1)).AutoFilter
'

Range("A" & (fila + 1) & ":B" & (ultimo - 1)).Sort Key1:=Range("B" & (fila + 1)), Order1:=xlAscending

'
jalisco = fila

Do While Cells(jalisco, 1) <> "Jalisco"
    jalisco = jalisco + 1
Loop
jalisco = jalisco - fila
'
Range("A" & (fila + 1) & ":B" & (ultimo - 1)).Select
'
Set Grafica_vertical = ActiveSheet.ChartObjects.Add(Left:=4 * 48, Width:=468.1, Top:=60, Height:=448.5)

With Grafica_vertical.Chart
    .ApplyChartTemplate ("C:\Users\marif\Desktop\SS\Gráficas Clusters\Barras Gris Arial 9.crtx") ' UBICACIÓN PERSONAL
    .SetSourceData Source:=Range("A" & (fila + 1) & ":B" & (ultimo - 1))
    .SeriesCollection(1).Points(jalisco).Format.Fill.ForeColor.RGB = RGB(251, 187, 39)

End With
'
Range("A" & fila & ":B" & (ultimo - 1)).AutoFilter
'
End Sub


