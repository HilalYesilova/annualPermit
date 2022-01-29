<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AnnualPermit.aspx.cs" Inherits="WebApplication8.AnnualPermit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>İzin Talebi Oluşturma</title>
    <style type="text/css">
        .auto-style1 {
            height: 679px;
            width: 1261px;
        }
        .auto-style2 {
            width: 33%;
            height: 243px;
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
        <div style="text-align:center" class="auto-style1">
          <br />
          <br />
          <br />
            <asp:Label ID="Label1" runat="server" Text="İzin Türü :" Height="29px" Width="100px" Font-Names="Times New Roman" Font-Size="Large" ForeColor="Black"></asp:Label>
           &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AppendDataBoundItems="True" Height="25px" Width="189px">
                <asp:ListItem Value="Yıllık İzin">Yıllık İzin</asp:ListItem>
                <asp:ListItem>Evlenme</asp:ListItem>
                <asp:ListItem>Doğum</asp:ListItem>
                <asp:ListItem>Ölüm</asp:ListItem>
                <asp:ListItem>Afet</asp:ListItem>
                <asp:ListItem>Ücretsiz Mazeret </asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            &nbsp;
            <asp:Label ID="Label2" runat="server" Text="Yol İzni :" Height="30px" Width="90px" Font-Names="Times New Roman" Font-Size="Large" ForeColor="Black" ></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
            <asp:TextBox ID="TextBox2" runat="server" OnTextChanged="TextBox2_TextChanged" Height="23px" Width="188px">0</asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Text="İzin Süresi :" Height="31px" Width="113px" Font-Names="Times New Roman" Font-Size="Large" ForeColor="Black"></asp:Label>
&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
            <asp:TextBox ID="TextBox3" runat="server" OnTextChanged="TextBox3_TextChanged" Height="23px" Width="188px"></asp:TextBox>
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label4" runat="server" Text="İzin Başlangıç Tarihi :" Height="35px" Width="214px" Font-Names="Times New Roman" Font-Size="Large" ForeColor="Black" ></asp:Label>
            <br />
            
            <div style="margin: 0 auto;" class="auto-style2">

             <asp:Calendar ID="Calendar1" runat="server" OnSelectionChanged="Calendar1_SelectionChanged" Height="245px" Width="504px" BackColor="#FCF1DE" BorderColor="#CCF2F2" Font-Names="Times New Roman" Font-Size="Medium" Font-Strikeout="False" Font-Underline="True" ForeColor="Black">
                 <DayHeaderStyle BackColor="#F4CF91" Font-Underline="False" />
                 <DayStyle Font-Underline="False" />
                 <SelectedDayStyle BackColor="#F4CF91" />
                 <TitleStyle BackColor="#FCF1DE" Font-Underline="False" />
                </asp:Calendar>
            </div>
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="Label5" runat="server" Text="İzinteki Adres :" Height="30px" Width="150px" Font-Names="Times New Roman" Font-Size="Large" ForeColor="Black" ></asp:Label>
            &nbsp;&nbsp; &nbsp;
            <asp:TextBox ID="TextBox5" runat="server" OnTextChanged="TextBox5_TextChanged" Height="23px" Width="325px" ></asp:TextBox>
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <br />
&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Kaydet" BackColor="#F5CE8D" Font-Bold="True" Font-Names="Times New Roman" Font-Size="Medium" ForeColor="Black" Width="180px" Height="38px" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Çıkış" BackColor="#F5CE8D" Font-Bold="True" Font-Names="Times New Roman" Font-Size="Medium" ForeColor="Black" Width="180px" Height="38px"  />
        </div>
    </form>
</body>
</html>
