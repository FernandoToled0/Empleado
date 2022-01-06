Imports System.Data.SqlClient

Public Class _Default
    Inherits Page

    Dim cn As New SqlConnection(ConfigurationManager.ConnectionStrings("strEmpresa").ToString())

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load

    End Sub
    Protected Sub actualizarEmpleado_click(sender As Object, e As EventArgs) Handles actualizarEmpleado.Click

        Dim cmdactualizaEmpleado As New SqlCommand("update_empleado", cn) 'invocamos el nombre del store procedure el cual utilizaremos
        cmdactualizaEmpleado.CommandType = CommandType.StoredProcedure 'definimos que sera un commando tipo de almacenamiento procesado
        cmdactualizaEmpleado.Parameters.AddWithValue("@dpi", dpi.Text) 'agregamos los valores a los parametros
        cmdactualizaEmpleado.Parameters.AddWithValue("@nombre", nombre.Text)
        cmdactualizaEmpleado.Parameters.AddWithValue("@apellidos", apellido.Text)
        cmdactualizaEmpleado.Parameters.AddWithValue("@cod_depto", departamento.Text)

        cn.Open() 'abrimos conexion
        cmdactualizaEmpleado.ExecuteNonQuery() 'ejecutamos la consulta
        cn.Close() 'cerramos la conexion

        grdEmpleado.DataBind() 'hacemos un bind para que el cambio se vea reflejado en el gridview
    End Sub
    Protected Sub crearEmpleado_click(sender As Object, e As EventArgs) Handles crearEmpleado.Click

        Dim cmdcrearEmpleado As New SqlCommand("insert_empleado", cn) 'invocamos el nombre del store procedure el cual utilizaremos
        cmdcrearEmpleado.CommandType = CommandType.StoredProcedure 'definimos que sera un commando tipo de almacenamiento procesado
        cmdcrearEmpleado.Parameters.AddWithValue("@dpi", dpi.Text) 'agregamos los valores a los parametros
        cmdcrearEmpleado.Parameters.AddWithValue("@nombre", nombre.Text)
        cmdcrearEmpleado.Parameters.AddWithValue("@apellidos", apellido.Text)
        cmdcrearEmpleado.Parameters.AddWithValue("@cod_depto", departamento.Text)

        cn.Open() 'abrimos conexion
        cmdcrearEmpleado.ExecuteNonQuery() 'ejecutamos la consulta
        cn.Close() 'cerramos la conexion

        grdEmpleado.DataBind() 'hacemos un bind para que el cambio se vea reflejado en el gridview
    End Sub
    Protected Sub nuevo_empleado_click(sender As Object, e As EventArgs) Handles nuevo_empleado.Click
        'limpiamos todos los campos al abrir el apartado de nuevo empleado
        nombre.Text = Nothing
        apellido.Text = Nothing
        dpi.Text = Nothing
        departamento.Text = Nothing
        'indicamos que botones se mostraran al usar esta opcion
        crearEmpleado.Visible = True
        actualizarEmpleado.Visible = False
    End Sub

    Protected Sub grdEmpleado_rowDatabound(ByVal sender As Object, ByVal e As GridViewRowEventArgs) Handles grdEmpleado.RowDataBound
        If buscarEmpleado.Text <> Nothing Then 'validamos que el buscador sea diferente a nada

            If e.Row.Cells(0).Text.ToString().Trim() = buscarEmpleado.Text Then 'recorremos el grid para ver si encontramos la celda 0 que corresponde al dpi para buscar coincidencias
                e.Row.Visible = True
            ElseIf e.Row.Cells(1).Text.ToString().Trim().Contains(buscarEmpleado.Text) Then 'recorremos el grid en la celda 1 que corresponde el nombre y buscamos contenidido similar a lo que estamos buscando
                e.Row.Visible = True
            Else
                e.Row.Visible = False 'ocultamos todas las demas filas que no coincidan con lo buscado
            End If
        End If
    End Sub
    Protected Sub grdEmpleado_rowCommand(ByVal sender As Object, ByVal e As GridViewCommandEventArgs) Handles grdEmpleado.RowCommand
        If e.CommandName = "editar" Then 'buscamos el nombre del commando segun el boton presionado
            Dim row As GridViewRow = ((CType(e.CommandSource, LinkButton)).NamingContainer) 'ubicamos el tipo de boton para obtener el index
            Dim grddpi As String = row.Cells(0).Text.ToString().Trim() 'recuperamos valores del gridview segun el index
            Dim grdnombre As String = row.Cells(1).Text.ToString().Trim()
            Dim grdapellido As String = row.Cells(2).Text.ToString().Trim()
            Dim grddepartamento As String = row.Cells(3).Text.ToString().Trim()

            nombre.Text = grdnombre 'hacemos un set al input con el valor del index
            apellido.Text = grdapellido
            dpi.Text = grddpi
            departamento.Text = grddepartamento

            'indicamos que botones se mostraran al usar esta opcion
            crearEmpleado.Visible = False
            actualizarEmpleado.Visible = True
        End If

        If e.CommandName = "eliminar" Then 'buscamos el nombre del commando segun el boton presionado
            Dim row As GridViewRow = ((CType(e.CommandSource, LinkButton)).NamingContainer) 'ubicamos el tipo de boton para obtener el index
            Dim grddpi As String = row.Cells(0).Text.ToString().Trim() 'recuperamos valores del gridview segun el index

            Dim cmdEliminaEmpleado As New SqlCommand("elimina_empleado", cn) 'invocamos el nombre del store procedure el cual utilizaremos
            cmdEliminaEmpleado.CommandType = CommandType.StoredProcedure 'definimos que sera un commando tipo de almacenamiento procesado
            cmdEliminaEmpleado.Parameters.AddWithValue("@dpi", grddpi) 'agregamos los valores a los parametros

            cn.Open() 'abrimos conexion
            cmdEliminaEmpleado.ExecuteNonQuery() 'ejecutamos la consulta
            cn.Close() 'cerramos la conexion

            grdEmpleado.DataBind() 'hacemos un bind para que el cambio se vea reflejado en el gridview
        End If
    End Sub
    Protected Sub buscarEmpleado_textChange(sender As Object, e As EventArgs) Handles buscarEmpleado.TextChanged
        grdEmpleado.DataBind() 'hacemos un bind para que se reconstruya el grid al momento de cambiar el texto
    End Sub
End Class