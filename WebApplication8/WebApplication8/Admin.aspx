<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="WebApplication8.Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Yönetici Paneli</title>
    <style type="text/css">
        .auto-style1 {
            
            height: 946px;
            text-align: center;
        }
        .auto-style2 {
            text-align: center;
        }
        .auto-style3 {}
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
        <div class="auto-style1"  style="text-align:center">
            <asp:Label ID="Label1" runat="server" CssClass="auto-style2" Font-Italic="False" ForeColor="Black" Height="35px" Text="Beklenen İzinler" Width="200px" Font-Bold="True" Font-Names="Times New Roman" Font-Size="Large"></asp:Label>
            <asp:GridView HorizontalAlign="Center" ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" CssClass="auto-style3" ForeColor="Black" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="954px" OnRowCommand="GridView1_RowCommand" DataKeyNames="id" AutoGenerateSelectButton="False">
                <AlternatingRowStyle BackColor="Silver" BorderColor="#003300" ForeColor="#003300" HorizontalAlign="Center" VerticalAlign="Middle" />
                <Columns>
                    <asp:BoundField HeaderText="ID" DataField="id" ></asp:BoundField>
                    <asp:BoundField HeaderText="Ad Soyad" DataField="adSoyad"></asp:BoundField>
                    <asp:BoundField HeaderText="Izin Başlangıç Tarihi" DataField="izinBaslangicTarihi"></asp:BoundField>
                    <asp:BoundField HeaderText="Izin Bitiş Tarihi" DataField="izinBitisTarihi"></asp:BoundField>
                    <asp:ButtonField ButtonType="Button" Text="Onayla" CommandName="onayla">
                    <ControlStyle BackColor="#A4FDD2" BorderColor="Black" Font-Bold="False" Font-Names="Times New Roman" />
                    </asp:ButtonField>
                    <asp:ButtonField ButtonType="Button" Text="Reddet" CommandName="reddet">
                    <ControlStyle BackColor="#FDECF9" Font-Bold="False" Font-Names="Times New Roman" />
                    </asp:ButtonField>
                </Columns>
                <EditRowStyle BackColor="#FDECF9" BorderColor="#003300" ForeColor="#003300" HorizontalAlign="Center" VerticalAlign="Middle" />
                <EmptyDataRowStyle BackColor="White" />
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                <RowStyle BackColor="Silver" BorderColor="#003300" ForeColor="#003300" HorizontalAlign="Center" VerticalAlign="Middle" />
                
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="Gray" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#383838" />
            </asp:GridView>

            
            <br />
            <asp:Label ID="Label2" runat="server" CssClass="auto-style2" Font-Italic="False" ForeColor="Green" BorderColor="Green" Height="35px" Text="Onaylanan İzinler" Width="200px" Font-Bold="True" Font-Names="Times New Roman" Font-Size="Large"></asp:Label>
            <br />
            <asp:GridView HorizontalAlign="Center" ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" CssClass="auto-style3" ForeColor="Black" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="954px" OnRowCommand="GridView1_RowCommand">
                <AlternatingRowStyle BackColor="#A4FDD2" BorderColor="#003300" ForeColor="#003300" HorizontalAlign="Center" VerticalAlign="Middle" />
                <Columns>                   
                    <asp:BoundField HeaderText="Ad Soyad" DataField="adSoyad"></asp:BoundField>
                    <asp:BoundField HeaderText="Izin Başlangıç Tarihi" DataField="izinBaslangicTarihi"></asp:BoundField>
                    <asp:BoundField HeaderText="Izin Bitiş Tarihi" DataField="izinBitisTarihi"></asp:BoundField>                                       
                    <asp:BoundField HeaderText="Onay Durumu" DataField="onayRetDurumu" />
                </Columns>
                <EditRowStyle BackColor="#FDECF9" BorderColor="#003300" ForeColor="#003300" HorizontalAlign="Center" VerticalAlign="Middle" />
                <EmptyDataRowStyle BackColor="White" />
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                <RowStyle BackColor="#A4FDD2" BorderColor="#003300" ForeColor="#003300" HorizontalAlign="Center" VerticalAlign="Middle" />
                
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="Gray" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#383838" />
            </asp:GridView>
            <br />
            <asp:Label ID="Label3" runat="server" CssClass="auto-style2" Font-Italic="False" ForeColor="Red" BorderColor="Red" Height="35px" Text="Reddedilen İzinler" Width="200px" Font-Bold="True" Font-Names="Times New Roman" Font-Size="Large"></asp:Label>
            <br />
            <asp:GridView HorizontalAlign="Center" ID="GridView3" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" CssClass="auto-style3" ForeColor="Black" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="954px" OnRowCommand="GridView1_RowCommand">
                <AlternatingRowStyle BackColor="#FDECF9" BorderColor="#003300" ForeColor="#003300" HorizontalAlign="Center" VerticalAlign="Middle" />
                <Columns>                   
                    <asp:BoundField HeaderText="Ad Soyad" DataField="adSoyad"></asp:BoundField>
                    <asp:BoundField HeaderText="Izin Başlangıç Tarihi" DataField="izinBaslangicTarihi"></asp:BoundField>
                    <asp:BoundField HeaderText="Izin Bitiş Tarihi" DataField="izinBitisTarihi"></asp:BoundField>                                       
                    <asp:BoundField HeaderText="Onay Durumu" DataField="onayRetDurumu" />
                </Columns>
                <EditRowStyle BackColor="#FDECF9" BorderColor="#003300" ForeColor="#003300" HorizontalAlign="Center" VerticalAlign="Middle" />
                <EmptyDataRowStyle BackColor="White" />
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                <RowStyle BackColor="#FDECF9" BorderColor="#003300" ForeColor="#003300" HorizontalAlign="Center" VerticalAlign="Middle" />
                
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="Gray" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#383838" />
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
            <br />
            <asp:Button ID="projeEkle" runat="server" BackColor="#CCCCFF" Height="35px" OnClick="projeEkle_Click" Text="Yeni Proje Oluştur" Width="200px" Font-Bold="True" Font-Names="Times New Roman" Font-Size="Large" ForeColor="Black" /><br /><br />
            
            <asp:Button ID="Button1" runat="server" BackColor="#CCCCCC" Height="29px" OnClick="cikis_Click" Text="Çıkış" Width="128px" Font-Bold="True" Font-Names="Times New Roman" Font-Size="Medium" ForeColor="Black" />
        </div>
    </form>
</body>
</html>
