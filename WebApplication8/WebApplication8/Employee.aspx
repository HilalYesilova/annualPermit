<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Employee.aspx.cs" Inherits="WebApplication8.Employee" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Personel Sayfası</title>
    <style type="text/css">
        .auto-style1 {
            background-image: url('background.jpg');
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;
            text-align: center;
            
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
        <div class="auto-style1" style="text-align:center">
          <br />
            <asp:Label ID="Label1" runat="server" Text="Bilgilerim" BorderColor="#2DB5B5" Font-Italic="False" Height="29px" Width="259px" BackColor="#F5CE8D" Font-Bold="True" Font-Names="Times New Roman" Font-Size="Large" ForeColor="Black" BorderStyle="Dotted"></asp:Label>
          <br />
          <br />
          <br />
            <asp:GridView ID="GridView1" runat="server" BackColor="#FCF1DE" HorizontalAlign="Center" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CellSpacing="1" Height="69px" style="text-align: center" Width="834px" >
            </asp:GridView>
          <br />
          <br />
          <br />
          <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="İzin Talebi Oluştur" BackColor="#F5CE8D" Font-Bold="True" Font-Names="Times New Roman" Font-Size="Medium" ForeColor="Black" Width="180px" Height="38px" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="İzin Çıktısı" BackColor="#F5CE8D" Font-Bold="True" Font-Names="Times New Roman" Font-Size="Medium" ForeColor="Black" Width="124px" Height="38px" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Çıkış Yap" BackColor="#BEEFEF" Font-Bold="True" Font-Names="Times New Roman" Font-Size="Medium" ForeColor="Black" Width="124px" Height="38px" />

        </div>


        
    </form>
</body>
</html>
