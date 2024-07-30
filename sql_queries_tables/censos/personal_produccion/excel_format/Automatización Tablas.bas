Attribute VB_Name = "Módulo1"
Sub FormatearTodasLasTablas()
Attribute FormatearTodasLasTablas.VB_ProcData.VB_Invoke_Func = "a\n14"
    Dim ws As Worksheet
    For Each ws In ThisWorkbook.Sheets
        FormatearTablaSinTabla ws
    Next ws
End Sub

Sub FormatearTablaSinTabla(ws As Worksheet)
    Dim rng As Range
    Dim lastRow As Long
    Dim i As Long
    
    ' Establecer el rango de la tabla (asumiendo que comienza en A1 y tiene 6 columnas)
    Set rng = ws.Range("A1").CurrentRegion
    
    ' Aplicar formato a la primera fila (nombres) con color naranja
    With rng.Rows(1)
        .Interior.Color = RGB(59, 56, 56) ' Naranja
        .Font.Color = RGB(255, 255, 255) ' Blanco
        .Font.Bold = True
        .HorizontalAlignment = xlCenter
        .VerticalAlignment = xlCenter ' Alinear al centro verticalmente
        .Font.Name = "Arial"
        .Font.Size = 10
        .EntireRow.RowHeight = 27 ' Alto de la primera fila
        .EntireRow.AutoFit ' Ajustar el alto de la fila automáticamente
        .Cells.WrapText = True ' Ajustar texto a la celda
    End With
    
    ' Ajustar el texto de la fila 1 a la celda
    ws.Rows(1).HorizontalAlignment = xlCenter
    
    ' Aplicar formato a las filas de datos alternas con color blanco y gris
    lastRow = rng.Rows.Count
    For i = 2 To lastRow
        If i Mod 2 = 0 Then
            rng.Rows(i).Interior.Color = RGB(255, 255, 255) ' Gris
        Else
            rng.Rows(i).Interior.Color = RGB(217, 217, 217) ' Blanco
        End If
        rng.Rows(i).Font.Name = "Arial"
        rng.Rows(i).Font.Size = 10
        rng.Rows(i).HorizontalAlignment = xlLeft ' Alinear a la izquierda
        rng.Rows(i).VerticalAlignment = xlCenter ' Alinear al centro verticalmente
        rng.Rows(i).EntireRow.RowHeight = 15 ' Alto de las demás filas
        rng.Rows(i).EntireRow.AutoFit ' Ajustar el alto de la fila automáticamente
        
        ' Ajustar la alineación de la columna B para la primera y segunda fila
        If i <= 2 Then
            rng.Cells(i, 2).HorizontalAlignment = xlLeft ' Alinear a la izquierda
        Else
            rng.Cells(i, 2).HorizontalAlignment = xlLeft
        End If
    Next i
    
    ' Ajustar la alineación de las columnas A, C, D, E y F para que estén centradas
    ws.Columns("A:F").VerticalAlignment = xlCenter ' Alinear al centro verticalmente
    ws.Columns("A").HorizontalAlignment = xlCenter
    ws.Columns("C:F").HorizontalAlignment = xlCenter
    
    ' Aplicar un grosor de borde intermedio a toda la tabla
    rng.Borders.LineStyle = xlContinuous
    rng.Borders.Weight = xlMedium
    
    ' Ajustar el ancho de las columnas
    ws.Columns("A").ColumnWidth = 10.78
    ws.Columns("C:F").ColumnWidth = 10.78 ' Para las columnas C a F, establecemos un ancho fijo
    ws.Columns("B").AutoFit ' Ajustamos el ancho de la columna B automáticamente
    
    ' Calcular y agregar fila de totales
    Dim totalC As Double
    Dim totalD As Double
    Dim totalE As Double
    Dim totalF As Double
    
    For i = 2 To lastRow
        totalC = totalC + ws.Cells(i, 3).Value
        totalD = totalD + ws.Cells(i, 4).Value
        totalE = totalE + ws.Cells(i, 5).Value
    Next i
    
    ' Calcular el total de la columna F
    totalF = totalD / totalC - 1
    
    ' Establecer el rango para la fila de totales (considerando solo las primeras 6 columnas)
    Dim totalRange As Range
    Set totalRange = ws.Range(ws.Cells(lastRow + 1, 1), ws.Cells(lastRow + 1, 6))
    
    With totalRange
        .Cells(1).Value = "Total"
        ws.Range(.Cells(1, 1), .Cells(1, 2)).Merge ' Combinar la celda de "Total" en la columna A con la celda adyacente en la columna B
        .Interior.Color = RGB(250, 187, 39) ' Verde
        .Font.Bold = True ' Negrita
        .Font.Name = "Arial"
        .Font.Size = 10
        .HorizontalAlignment = xlCenter
        .VerticalAlignment = xlCenter ' Alinear al centro verticalmente
        .Cells(3).Value = totalC
        .Cells(4).Value = totalD
        .Cells(5).Value = totalE
        .Cells(6).Value = totalF
        .Borders.LineStyle = xlContinuous
        .Borders.Weight = xlMedium
        
        ' Aplicar formatos numéricos específicos a las columnas C, D, y E
        .Cells(3).NumberFormat = "#,##0"
        .Cells(4).NumberFormat = "#,##0"
        .Cells(5).NumberFormat = "#,##0"
        
        ' Aplicar formato de porcentaje y redondeo a dos decimales para la columna F
        .Cells(6).NumberFormat = "0.00%"
    End With
    
    ' Aplicar formatos numéricos específicos a las columnas C, D y E a partir de la fila 2
    ws.Range(ws.Cells(2, 3), ws.Cells(lastRow, 5)).NumberFormat = "#,##0"
    
    ws.Range(ws.Cells(2, 6), ws.Cells(lastRow + 1, 6)).NumberFormat = "0.00%"
    
    ' Aplicar formato de porcentaje y redondeo a dos decimales para la fila de totales en la columna F
    ws.Cells(lastRow + 1, 6).NumberFormat = "0.00%"
    
End Sub

