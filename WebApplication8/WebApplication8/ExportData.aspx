<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ExportData.aspx.cs" Inherits="WebApplication8.ExportData" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>İZİN ÇIKTISI</title>
    <script src="jsfiles/html2canvas.min.js"></script>
    <script src="jsfiles/pdfmake.min.js"></script>
    <script type="text/javascript">
        function Export() {
            html2canvas(document.getElementById('form'), {
                onrendered: function (canvas) {
                    var data = canvas.toDataURL();
                    var docDefinition = {
                        content: [{
                            image: data,
                            width: 500
                        }]
                    };
                    pdfMake.createPdf(docDefinition).download("izinForm.pdf");
                    alert("İndirme Başladı");
                }
            });
        }
    </script>
    <style type="text/css">
        .auto-style1 {
            height: 1007px;
            width: 1399px;
        }

        .auto-style2 {
            height: 8px;
            width: 1397px;
        }

        .auto-style3 {
            width: 91%;
            height: 938px;
            margin-bottom: 0px;
            table-layout: auto;
        }

        .auto-style4 {
            width: 255px;
        }

        .auto-style5 {
            width: 271px;
        }

        .auto-style7 {
            width: 65px;
        }

        .auto-style8 {
            width: 80px;
        }

        .auto-style9 {
            width: 64px;
        }

        .auto-style11 {
            width: 62px;
        }

        .auto-style12 {
            width: 255px;
            height: 46px;
        }

        .auto-style13 {
            width: 271px;
            height: 46px;
            text-align: center;
        }

        .auto-style15 {
            height: 46px;
            text-align: center;
        }

        .auto-style16 {
            width: 255px;
            height: 52px;
        }

        .auto-style17 {
            width: 271px;
            height: 52px;
            text-align: center;
        }

        .auto-style19 {
            height: 52px;
            text-align: center;
        }

        .auto-style20 {
            width: 255px;
            height: 75px;
        }

        .auto-style21 {
            width: 271px;
            height: 75px;
            text-align: center;
        }

        .auto-style23 {
            height: 75px;
            text-align: center;
        }

        .auto-style24 {
            width: 255px;
            height: 56px;
        }

        .auto-style25 {
            width: 271px;
            height: 56px;
            text-align: center;
        }

        .auto-style27 {
            height: 56px;
            text-align: center;
        }

        .auto-style28 {
            height: 91px;
            text-align: center;
        }

        .auto-style29 {
            width: 255px;
            height: 50px;
        }

        .auto-style30 {
            width: 271px;
            height: 50px;
            text-align: center;
        }

        .auto-style31 {
            width: 255px;
            height: 37px;
            text-align: center;
        }

        .auto-style32 {
            width: 271px;
            height: 37px;
            text-align: center;
        }

        .auto-style35 {
            width: 255px;
            height: 36px;
        }

        .auto-style39 {
            width: 255px;
            height: 74px;
        }

        .auto-style40 {
            width: 271px;
            height: 74px;
        }

        .auto-style42 {
            height: 74px;
        }

        .auto-style43 {
            text-align: center;
        }

        .auto-style44 {
            width: 259px;
        }

        .auto-style45 {
            width: 259px;
            height: 56px;
            text-align: center;
        }

        .auto-style46 {
            width: 259px;
            height: 46px;
            text-align: center;
        }

        .auto-style47 {
            width: 259px;
            height: 52px;
            text-align: center;
        }

        .auto-style48 {
            width: 259px;
            height: 75px;
            text-align: center;
        }

        .auto-style49 {
            width: 259px;
            height: 37px;
            text-align: center;
        }

        .auto-style50 {
            width: 259px;
            height: 74px;
        }

        .auto-style51 {
            width: 259px;
            text-align: center;
        }

        .auto-style52 {
            height: 51px;
        }

        .auto-style53 {
            width: 271px;
            text-align: center;
        }

        .auto-style54 {
            width: 255px;
            height: 36px;
            text-align: center;
        }

        .auto-style55 {
            height: 37px;
            text-align: center;
        }

        .auto-style56 {
            width: 16px;
        }

        .auto-style57 {
            width: 288px;
            height: 51px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" class="auto-style1">
        <div class="auto-style2" style="text-align:center;">
            <br />
            <table class="auto-style3" style="font-family: 'Times New Roman'; margin: 1px; padding: 1px;" border="4" id="form">
                <tr>
                    <td colspan="9" class="auto-style52"><strong>DSİ PERSONELİ İZİN FORMU&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                        2021 YILI İZİNİ<br />
                    </strong></td>
                </tr>
                <tr>
                    <td class="auto-style4">DAİRESİ-BÖLGESİ-ŞUBESİ</td>
                    <td class="auto-style5">
                        <asp:TextBox ID="daire" runat="server" Height="42px" OnTextChanged="TextBox1_TextChanged" Width="274px"></asp:TextBox>
                    </td>
                    <td class="auto-style51">İZNİN NEV&#39;İ</td>
                    <td class="auto-style7">Yıllık<br />
                        Ücretli</td>
                    <td class="auto-style8">Evlenme</td>
                    <td class="auto-style9">Doğum</td>
                    <td class="auto-style7">Ölüm</td>
                    <td class="auto-style11">Afet</td>
                    <td class="auto-style56">Ücretsiz
                        <br />
                        Mazeret</td>
                </tr>
                <tr>
                    <td class="auto-style24">SERVİSİ</td>
                    <td class="auto-style25">
                        <asp:TextBox ID="servis" runat="server" Height="42px" Width="275px"></asp:TextBox>
                    </td>
                    <td class="auto-style45">İZİN MÜDDETİ</td>
                    <td class="auto-style27" colspan="6">
                        <asp:TextBox ID="izinTuru" runat="server" Height="42px" Width="527px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style12">ADI-SOYADI</td>
                    <td class="auto-style13">
                        <asp:TextBox ID="adSoyad" runat="server" Height="42px" Width="275px"></asp:TextBox>
                    </td>
                    <td class="auto-style46">Yol izni talep ediyorsa<br />
                        müddeti</td>
                    <td class="auto-style15" colspan="6">
                        <asp:TextBox ID="yolizni" runat="server" Height="42px" Width="524px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">Sicil veya dosya NO</td>
                    <td class="auto-style53">
                        <asp:TextBox ID="sicil" runat="server" Height="42px" Width="275px"></asp:TextBox>
                    </td>
                    <td class="auto-style51">Yıllık iznin ne kadarını
                        <br />
                        kullanacağı</td>
                    <td colspan="6" class="auto-style43">
                        <asp:TextBox ID="günsayisi" runat="server" Height="42px" Width="523px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">POZİSYONU</td>
                    <td class="auto-style53">
                        <asp:TextBox ID="pozisyon" runat="server" Height="42px" Width="275px"></asp:TextBox>
                    </td>
                    <td class="auto-style51">İzine Başlama Tarihi</td>
                    <td colspan="6" class="auto-style43">
                        <asp:TextBox ID="baslama" runat="server" Height="42px" Width="523px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style16">Ücret Statüsü       Ma.Üc. M/SY . S/SY</td>
                    <td class="auto-style17">
                        <asp:TextBox ID="ücret" runat="server" Height="42px" Width="275px"></asp:TextBox>
                    </td>
                    <td class="auto-style47">İzindeki Adres</td>
                    <td class="auto-style19" colspan="6">
                        <asp:TextBox ID="adres" runat="server" Height="42px" Width="522px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style20">İşe giriş tarihi</td>
                    <td class="auto-style21">
                        <asp:TextBox ID="iseGiris" runat="server" Height="42px" Width="275px"></asp:TextBox>
                    </td>
                    <td class="auto-style48">İzin talep tarihi<br />
                        ve imza</td>
                    <td class="auto-style23" colspan="6">
                        <asp:TextBox ID="taleptarihi" runat="server" Height="42px" Width="525px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style29">Kayıtlı olduğu sendika</td>
                    <td class="auto-style30">
                        <asp:TextBox ID="sendika" runat="server" Height="42px" Width="275px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style28" colspan="9">İZİN MEMURLUĞUNA&nbsp; ..../...../2021 TARİHİNDEN İTİBAREN İZİNLİ&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SERVİS ŞEFİ<br />
                        AYRILMASINDA MAHZUR YOKTUR.&nbsp; ..../...../2021</td>
                </tr>
                <tr>
                    <td class="auto-style4">İzin hakkının doğduğu tarih</td>
                    <td class="auto-style5">İzine çıkış tarihindeki hizmet<br />
                        süresi</td>
                    <td class="auto-style44">Yıllık izin müddeti<br />
                        (yol hariç)</td>
                    <td colspan="3">Kullanacağı miktar</td>
                    <td colspan="3">Yıllık izinden bakiye</td>
                </tr>
                <tr>
                    <td class="auto-style31">
                        <asp:TextBox ID="izinhakkitarihi" runat="server" Height="42px" Width="219px"></asp:TextBox>
                    </td>
                    <td class="auto-style32">
                        <asp:TextBox ID="hizmetsuresi" runat="server" Height="42px" Width="273px"></asp:TextBox>
                    </td>
                    <td class="auto-style49">
                        <asp:TextBox ID="izinsuresi" runat="server" Height="42px" Width="219px"></asp:TextBox>
                    </td>
                    <td class="auto-style55" colspan="3">
                        <asp:TextBox ID="kullanacagimiktar" runat="server" Height="32px" Width="214px"></asp:TextBox>
                    </td>
                    <td class="auto-style55" colspan="3">
                        <asp:TextBox ID="bakiye" runat="server" Height="36px" Width="223px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style39">İzine başlama tarihi</td>
                    <td class="auto-style40">İzin komisyonu başkanı<br />
                        veya izin memuru</td>
                    <td class="auto-style50">İzin komisyonu üyesi</td>
                    <td class="auto-style42" colspan="3">İzin komisyonu üyesi</td>
                    <td class="auto-style43" colspan="3" rowspan="4">İZİN VERİLMİŞTİR
                        <br />
                        <br />
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ..../...../2021<br />
                        <br />
                        YETKİLİ AMİR</td>
                </tr>
                <tr>
                    <td class="auto-style54">
                        <asp:TextBox ID="izinebaslama" runat="server" Height="42px" Width="219px"></asp:TextBox>
                    </td>
                    <td class="auto-style5" rowspan="3"></td>
                    <td class="auto-style44" rowspan="3"></td>
                    <td colspan="3" rowspan="3"></td>
                </tr>
                <tr>
                    <td class="auto-style35">İzinden dönme tarihi</td>
                </tr>
                <tr>
                    <td class="auto-style54">
                        <asp:TextBox ID="izindendonme" runat="server" Height="42px" Width="219px"></asp:TextBox>
                    </td>
                </tr>
            </table>            
            <div style="text-align: center">
                <br />
                <br />
                <input type="button" id="btnExport" value="ÇIKTISINI AL" onclick="Export()" class="auto-style57" style="background-color: #F5CE8D" />

            </div>
        </div>
    </form>
</body>
</html>
