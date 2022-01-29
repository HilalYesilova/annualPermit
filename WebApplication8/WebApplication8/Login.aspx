<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplication8.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <%--<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />--%>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="author" content="Aldi Duzha" />
    <meta name="description" content="Free Bulma Login Template, part of Awesome Bulma Templates" />
    <meta name="keywords" content="bulma, login, page, website, template, free, awesome" />
    <link rel="canonical" href="https://aldi.github.io/bulma-login-template/" />
    <title>HOŞGELDİNİZ</title>
    <link href="https://fonts.googleapis.com/css?family=Quicksand" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.0/css/bulma.min.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma-social@1/bin/bulma-social.min.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.13.0/css/all.min.css" />
    <link rel="stylesheet" href="./bulma-login-template-master/css/styles.css" />

    <style type="text/css">
        .auto-style4 {
            background-image: url('background.jpg');
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;
            height: 319px;
        }

        .container {
            
            width:100%;
        }
    </style>

</head>
<body class="auto-style4" style="height: 708px">
    <section class="hero is-fullheight">
        <div class="hero-body">
            <div class="container has-text-centered" style="width:200px; height:500px;">
                <div class="column is-4 is-offset-4">
                    <div class="box">
                        <p class="subtitle is-4">Lütfen Giriş Yapınız</p>
                        <br />
                        <form id="form1" runat="server">
                            <div class="field">
                                <p class="control has-icons-left has-icons-right">
                                    <td class="auto-style5">Kullanıcı Adı :&nbsp;&nbsp; </td>
                                    &nbsp;<asp:TextBox ID="txtAd" runat="server" OnTextChanged="txtAd_TextChanged"></asp:TextBox>
                                    <span class="icon is-medium is-left">
                                        <i class="fas fa-envelope" title="Kullanıcı adı"></i>
                                    </span>
                                    <span class="icon is-medium is-right">
                                        <i class="fas fa-check"></i>
                                    </span>
                                </p>
                            </div>
                            <div class="field">
                                <p class="control has-icons-left">
                                    <td class="auto-style5">Şifre :</td>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:TextBox ID="txtSifre" runat="server" OnTextChanged="txtSifre_TextChanged" TextMode="Password"></asp:TextBox>
                                    <span class="icon is-small is-left">
                                        <i class="fas fa-lock"></i>
                                    </span>
                                </p>
                            </div>

                            <%--<button class="button is-block is-info is-large is-fullwidth">Login</button>--%>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnGiris" runat="server" OnClick="btnGiris_Click" Text="Giriş" BackColor="#F5CE8D" Font-Size="Medium" Height="26px" Width="130px" Style="margin-left: 0px" /><br />
                            <asp:Label ID="lblDurum" runat="server" Text="" Height="26px" Width="130px" BorderColor="Red" ></asp:Label>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
</html>
