<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectManagement.aspx.cs" Inherits="WebApplication8.ProjectManagement" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />


    <title>Proje Oluştur</title>
    <style>
        /* Split the screen in half */
        .split {
            height: 650px;
            width: 50%;
            position: fixed;
            z-index: 1;
            top: 0;
            overflow-x: hidden;
            padding-top: 20px;
        }

        /* Control the left side */
        .left {
            background-image: url('background.jpg');
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;
            left: 0;
            background-color: white;
        }

        .outer {
            display: inline-block;
            margin: 0 auto;
            padding: 3px;
            background-color: white
        }

        /* Control the right side */
        .right {
            background-image: url('background.jpg');
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;
            right: 0;
            background-color: white;
        }

        /* If you want the content centered horizontally and vertically */
        .centered {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            text-align: center;
        }

            /* Style the image inside the centered container, if needed */
            .centered img {
                width: 150px;
                border-radius: 50%;
            }

        .auto-style2 {
            left: 0;
            top: -131px;
            height: 700px;
        }

        .auto-style4 {
            background-image: url('background.jpg');
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;
            height: 319px;
        }
    </style>
</head>
<body class="auto-style4" style="height: 708px">
    <form id="form1" runat="server">
        <div class="auto-style2"></div>
        <div class="split left" style="text-align: center">

            <div class="left outer">
                <asp:Label ID="Label1" runat="server" BorderColor="#2DB5B5" Font-Italic="False" Height="30px" Text="PROJE EKLEME BÖLÜMÜ" Width="311px" BackColor="#F5CE8D" Font-Bold="True" Font-Names="Times New Roman" Font-Size="Large" ForeColor="Black" BorderStyle="Dotted"></asp:Label>

                <br />
                <br />
                <br />
                <br />
                <asp:ListView ID="ListView1" runat="server" DataKeyNames="id" DataSourceID="SqlDataSource1" InsertItemPosition="LastItem" OnSelectedIndexChanged="ListView1_SelectedIndexChanged" HorizontalAlign="Center">
                    <AlternatingItemTemplate>
                        <tr style="background-color: #FCF1DE; color: #000000; font= times new roman">
                            <td>
                                <%--<asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Sil" BackColor="#F5CE8D" />--%>
                                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Düzenle" BackColor="#F5CE8D" />
                            </td>
                            <td>
                                <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                            </td>
                            <td>
                                <asp:Label ID="projeAdiLabel" runat="server" Text='<%# Eval("projeAdi") %>' />
                            </td>
                        </tr>
                    </AlternatingItemTemplate>
                    <EditItemTemplate>
                        <tr style="background-color: #FCF1DE; color: #333333;">
                            <td>
                                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Güncelleştir" />
                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="İptal" />
                            </td>
                            <td>
                                <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="projeAdiTextBox" runat="server" Text='<%# Bind("projeAdi") %>' />
                            </td>
                        </tr>
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        <table runat="server" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px;">
                            <tr>
                                <td>Hiçbir veri döndürülmedi.</td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <InsertItemTemplate>
                        <tr style="">
                            <td>
                                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Ekle" BackColor="#BEEFEF" />
                                <%--<asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Temizle" BackColor="#BEEFEF" />--%>
                            </td>
                            <td>&nbsp;</td>
                            <td>
                                <asp:TextBox ID="projeAdiTextBox" runat="server" Text='<%# Bind("projeAdi") %>' />
                            </td>
                        </tr>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <tr style="background-color: #FCF1DE; color: #333333;">
                            <td>
                                <%--<asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Sil" BackColor="#F5CE8D"/>--%>
                                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Düzenle" BackColor="#F5CE8D" />
                            </td>
                            <td>
                                <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                            </td>
                            <td>
                                <asp:Label ID="projeAdiLabel" runat="server" Text='<%# Eval("projeAdi") %>' />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table runat="server">
                            <tr runat="server">
                                <td runat="server">
                                    <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FCF1DE; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;">
                                        <tr runat="server" style="background-color: #FCF1DE; color: #333333;">
                                            <th runat="server"></th>
                                            <th runat="server">id</th>
                                            <th runat="server">projeAdi</th>
                                        </tr>
                                        <tr id="itemPlaceholder" runat="server">
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr runat="server">
                                <td runat="server" style="text-align: center; background-color: #FCF1DE; font-family: Verdana, Arial, Helvetica, sans-serif; color: #333333;">
                                    <asp:DataPager ID="DataPager1" runat="server">
                                        <Fields>
                                            <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                        </Fields>
                                    </asp:DataPager>
                                </td>
                            </tr>
                        </table>
                    </LayoutTemplate>
                    <SelectedItemTemplate>
                        <tr style="background-color: #FCF1DE; font-weight: bold; color: #000080;">
                            <td>
                                <%--<asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Sil" BackColor="#F5CE8D" />--%>
                                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Düzenle" />
                            </td>
                            <td>
                                <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                            </td>
                            <td>
                                <asp:Label ID="projeAdiLabel" runat="server" Text='<%# Eval("projeAdi") %>' />
                            </td>
                        </tr>
                    </SelectedItemTemplate>
                </asp:ListView>
                <br />
                <br />
                <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Geri Dön" BackColor="#F5CE8D" Font-Bold="True" Font-Names="Times New Roman" Font-Size="Medium" ForeColor="Black" Height="35px" Width="200px" />



                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:yıllıkizin %>" DeleteCommand="DELETE FROM [projeEkle] WHERE [id] = @id" InsertCommand="INSERT INTO [projeEkle] ([projeAdi]) VALUES (@projeAdi)" SelectCommand="SELECT * FROM [projeEkle]" UpdateCommand="UPDATE [projeEkle] SET [projeAdi] = @projeAdi WHERE [id] = @id">
                    <DeleteParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="projeAdi" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="projeAdi" Type="String" />
                        <asp:Parameter Name="id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>


        </div>

        <div class="split right" style="text-align: center">
            <asp:Label ID="Label5" runat="server" BorderColor="#2DB5B5" Font-Italic="False" Height="32px" Text="PERSONEL EKLEME BÖLÜMÜ" Width="353px" BackColor="#F5CE8D" Font-Bold="True" Font-Names="Times New Roman" Font-Size="Large" ForeColor="Black" BorderStyle="Dotted"></asp:Label>
            <br />
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Height="30px" Text="Proje  :" Width="90px" BorderColor="#F5CE8D"></asp:Label>
            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="auto-style10" Height="16px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Width="177px" AppendDataBoundItems="True">
            </asp:DropDownList>
            <br />
            <br />
            <asp:Label ID="Label4" runat="server" Height="30px" Text="Personel  :" Width="90px"></asp:Label>
            <asp:DropDownList ID="DropDownList2" runat="server" CssClass="auto-style11" Height="16px" Width="177px" AppendDataBoundItems="True">
            </asp:DropDownList>
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
          <asp:Button ID="Button1" runat="server" CssClass="auto-style12" OnClick="Button1_Click1" Text="Kaydet" BackColor="#F5CE8D" Font-Bold="True" Font-Names="Times New Roman" Font-Size="Medium" ForeColor="Black" Height="35px" Width="135px" />
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" BackColor="#FCF1DE" EnablePersistedSelection="True" SelectedRowStyle-BackColor="Yellow" AllowPaging="True" AllowSorting="True" PageSize="8" AutoGenerateColumns="False" OnPageIndexChanging="GridView1_PageIndexChanging" HorizontalAlign="Center" DataKeyNames="projeAdi , adSoyad" Height="417px" Width="453px">
                <Columns>
                    <asp:BoundField DataField="projeAdi" HeaderText="PROJE ADI" SortExpression="projeAdi" HeaderStyle-BackColor="#F5CE8D" HeaderStyle-BorderColor="Black" ItemStyle-BorderColor="Black" ControlStyle-BorderColor="Black" />
                    <asp:BoundField DataField="adSoyad" HeaderText="AD SOYAD" SortExpression="adSoyad" HeaderStyle-BackColor="#F5CE8D" />
                </Columns>
            </asp:GridView>
            <%-- <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:yıllıkizin %>" SelectCommand="SELECT projeEkle.projeAdi, Personel.adSoyad FROM projePersonelEkleme INNER JOIN projeEkle ON projePersonelEkleme.idProje = projeEkle.id INNER JOIN Personel ON projePersonelEkleme.idPersonel = Personel.id"></asp:SqlDataSource>            
            --%>
        </div>

    </form>
</body>
</html>
