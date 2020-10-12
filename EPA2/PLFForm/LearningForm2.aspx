<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LearningForm2.aspx.cs" Inherits="PLF.PLFForm.LearningForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Verify User </title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
    <meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <base target="_self" />
    <meta http-equiv="Pragma" content="No-cache">

    <style type="text/css">
        body {
            font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
            font-size: x-small;
        }

        td {
            vertical-align: top;
        }

        BDABox {
            height: 100%;
            background-color: floralwhite;
            width: 100%;
        }

        BDABox2 {
            height: 100%;
            background-color: floralwhite;
            width: 100%;
        }

        LabelP {
            font-size: 9px;
            vertical-align: top;
        }

        #pageBody {
            height: 650px;
            width: 100%;
            overflow: auto;
        }

        .imgButton {
            width: 18px;
            height: 18px;
            padding-right: 15px;
            margin-bottom: -5px;
            border: 0px;
        }

        .linkbutton {
            width: 160px;
            border: 3px outset orange;
            padding-left: 20px;
            margin-left: 50px;
        }
        .FormTable1 {
            border:1px solid grey;
             
        }
    </style>

</head>
<body >
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
            <Services>
                <asp:ServiceReference Path="~/Models/WebService.asmx" />
            </Services>
        </asp:ScriptManager>
        <div id="pageTop" runat="server">
            <asp:HiddenField ID="hfSchoolyear" runat="server" />
            <asp:HiddenField ID="hfSchoolcode" runat="server" />
            <asp:HiddenField ID="hfUserRole" runat="server" />
            <asp:HiddenField ID="hfUserID" runat="server" />
            <asp:HiddenField ID="hfSignOff" runat="server" />
            <asp:HiddenField ID="hfSignOffSO" runat="server" />
            <asp:HiddenField ID="hfPublish" runat="server" />
            <asp:Button ID="ButtonSave" runat="server" Text="Save & Submit" OnClick="ButtonSave_Click" />
            <a id="PrintPLF" href="#" runat="server" class="linkbutton">
                <img alt="pdf file" src="../images/pdfReport.bmp" class="imgButton" />
                View PDF Form</a>
            <a id="SignOffPLF" href="#" runat="server" class="linkbutton">
                <img alt="sign off" src="../images/signature.png" class="imgButton" />
                Sign Off Form</a>
            <a id="PublishPLF" href="#" runat="server" class="linkbutton">
                <img alt="Publish" src="../images/publish.png" class="imgButton" />
                Publish Form</a>
            <asp:Label ID="LabelSaveResult" runat="server" Text=""></asp:Label>


        </div>
        <div style="text-align: center;">
            <h2>Toronto Catholic District School Board
                <br />
                K to 12 Professional Learning Form
                <asp:Label ID="LabelSchoolyear" runat="server" Text="2018-2019"></asp:Label>

            </h2>
        </div>
        <div>
            School Name:
            <asp:Label ID="LabelSchool" runat="server" Text="2018-2019"></asp:Label>
            <br />
            Principal Name:
            <asp:Label ID="LabelPrincipal" runat="server" Text="2018-2019"></asp:Label>
            <br />
            Superintendent:
            <asp:Label ID="LabelSuperintendent" runat="server" Text="2018-2019"></asp:Label>
        </div>

        <div id="pageBody" runat="server">

            <div>
                Based on analysis of the data, in collaboration with staff identify a critical learning need area
            or strategy that addresses the learning of your school community (i.e., numeracy, assessment, 
            problem solving, inquiry learning, learning skills, etc.) 
            </div>

            <div id="FormContent" runat="server">
                <table class="FormTable1" >
                    <tr>
                        <td colspan="5" style="text-align: center">BACKGROUND - DATA ANALYSIS </td>
                    </tr>
                    <tr>
                        <th style="width: 20%">
                            <asp:Label ID="LabelBDA01" runat="server" Text="BDA01" CssClass="LabelP"></asp:Label></th>
                        <th style="width: 20%">
                            <asp:Label ID="LabelBDA02" runat="server" Text="BDA02" CssClass="LabelP"></asp:Label></th>
                        <th style="width: 20%">
                            <asp:Label ID="LabelBDA03" runat="server" Text="BDA03" CssClass="LabelP"></asp:Label></th>
                        <th style="width: 20%">
                            <asp:Label ID="LabelBDA04" runat="server" Text="BDA04" CssClass="LabelP"></asp:Label></th>
                        <th style="width: 20%">
                            <asp:Label ID="LabelBDA05" runat="server" Text="BDA05" CssClass="LabelP"></asp:Label></th>
                    </tr>
                    <tr style="height: 300px;">
                        <td>
                            <textarea id="TextBDA01" runat="server" textmode="MultiLine" class="BDABox" rows="20" cols="20"></textarea>
                        </td>
                        <td>
                            <textarea id="TextBDA02" runat="server" textmode="MultiLine" class="BDABox" rows="20" cols="20"></textarea></td>
                        <td>
                            <textarea id="TextBDA03" runat="server" textmode="MultiLine" class="BDABox" rows="20" cols="20"></textarea></td>
                        <td>
                            <textarea id="TextBDA04" runat="server" textmode="MultiLine" class="BDABox" rows="20" cols="20"></textarea></td>
                        <td>
                            <textarea id="TextBDA05" runat="server" textmode="MultiLine" class="BDABox" rows="20" cols="20"></textarea></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LabelBDA06" runat="server" Text="BDA06" CssClass="LabelP"></asp:Label>
                        </td>
                        <td colspan="4">
                            <textarea id="TextBDA06" runat="server" textmode="MultiLine" class="PLPBox2" rows="10" cols="90"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LabelBDA07" runat="server" Text="BDA07" CssClass="LabelP"></asp:Label>
                        </td>
                        <td colspan="4">
                            <textarea id="TextBDA07" runat="server" textmode="MultiLine" class="PLPBox2" rows="10" cols="90"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="5" style="text-align: center">PROFESSIONAL LEATNING PLAN TO MEET URGENT CRITICAL NEED: 
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LabelPLP11" runat="server" Text="PLP11" CssClass="LabelP"></asp:Label>
                        </td>
                        <td colspan="4">
                            <textarea id="TextPLP11" runat="server" textmode="MultiLine" class="PLPBox2" rows="10" cols="90"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LabelPLP12" runat="server" Text="PLP12" CssClass="LabelP"></asp:Label>
                        </td>
                        <td colspan="4">
                            <textarea id="TextPLP12" runat="server" textmode="MultiLine" class="PLPBox2" rows="10" cols="90"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LabelPLP13" runat="server" Text="PLP13" CssClass="LabelP"></asp:Label>
                        </td>
                        <td colspan="4">
                            <textarea id="TextPLP13" runat="server" textmode="MultiLine" class="PLPBox2" rows="10" cols="90"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LabelPLP14" runat="server" Text="PLP14" CssClass="LabelP"></asp:Label>
                        </td>
                        <td colspan="4">
                            <textarea id="TextPLP14" runat="server" textmode="MultiLine" class="PLPBox2" rows="10" cols="90"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LabelPLP15" runat="server" Text="PLP15" CssClass="LabelP"></asp:Label>
                        </td>
                        <td colspan="4">
                            <textarea id="TextPLP15" runat="server" textmode="MultiLine" class="PLPBox2" rows="10" cols="90"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LabelPLP16" runat="server" Text="PLP16" CssClass="LabelP"></asp:Label>
                        </td>
                        <td colspan="4">
                            <textarea id="TextPLP16" runat="server" textmode="MultiLine" class="PLPBox2" rows="10" cols="90"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LabelPLP17" runat="server" Text="PLP17" CssClass="LabelP"></asp:Label>
                        </td>
                        <td colspan="4">
                            <textarea id="TextPLP17" runat="server" textmode="MultiLine" class="PLPBox2" rows="10" cols="90"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LabelPLP18" runat="server" Text="PLP18" CssClass="LabelP"></asp:Label>
                        </td>
                        <td colspan="4">
                            <textarea id="TextPLP18" runat="server" textmode="MultiLine" class="PLPBox2" rows="10" cols="90"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LabelPLP19" runat="server" Text="PLP19" CssClass="LabelP"></asp:Label>
                        </td>
                        <td colspan="4">
                            <textarea id="TextPLP19" runat="server" textmode="MultiLine" class="PLPBox2" rows="10" cols="90"></textarea>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div id="pageFooter" runat="server"></div>

    </form>
</body>
</html>

    <script src="../Scripts/jquery-3.2.1.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>

<script type="text/javascript">

     var UserID = $("#hfUserID").val();
    var schoolyear = $("#hfSchoolyear").val();
    var schoolcode = $("#hfSchoolcode").val();
  
    var workingYear;



    $(document).ready(function () {


        $(".BDABox").change(function (event) {
            var id = $(this)[0].id; //event.id;
            var code = id.replace("Text", "");
            var value = $("#" + id).val();

            SaveTextContent(code, value);
        });

        $(".PLPBox2").change(function (event) {
            var id = $(this)[0].id; //event.id;
            var code = id.replace("Text", "");
            var value = $("#" + id).val();

            SaveTextContent(code, value);
        });
        $(".PLPBox2").keydown(function (event) {
            $("#LabelSaveResult").text("");
        });
        $("#PrintPLF").click(function (event) {
             var rName = "PLFDocument"
            window.open('PDFPrint.aspx?rID=' + rName + '&yID=' + schoolyear +'&sID=' + schoolcode + '&rType=' + 'PDF' + '&rBlank=' + 'N', "PrintForm", "width=800 height=600, top=50, left=50, toolbars=no, scrollbars=no,status=no,resizable=yes");

        });
        $("#SignOffPLF").click(function (event) {
            var useRole = $("#hfUserRole").val()
            if (useRole == "Principal" || useRole == "Admin") {
                var signType = "School";
                var result = window.showModalDialog("LearningFormSignOff.aspx?yID=" + schoolyear + "&sID=" + schoolcode + "&tID=" + signType, "singoff", "scroll:no;resizable:no;help:no;status:no;dialogTop:100;dialogLeft:100;dialogHeight:300px;dialogWidth:400px;");
                if (result == UserID) {
                    window.alert("Sign off form complete!");
                }

            }
            else { window.alert("No Permission to sign off this Document.") }

        });
        $("#PublishPLF").click(function (event) {
            var signedOff = $("#hfSignOffSO").val()
            if (signedOff == "SignedOff") {
                 var signType = "Publish";
               var result = window.showModalDialog("LearningFormPublish.aspx?yID=" + schoolyear + "&sID=" + schoolcode + "&tID=" + signType, "publish", "scroll:no;resizable:no;help:no;status:no;dialogTop:100;dialogLeft:100;dialogHeight:300px;dialogWidth:400px;");
                 if (result == UserID) {
                    window.alert("Publish form complete!");
                }

            }
            else {  window.alert ("Please have your school superintendet sign off first! ")}

        });
    });

    function SaveTextContent(itemCode, value) {
        var helptext = PLF.Models.WebService.SaveText(UserID, schoolyear, schoolcode, itemCode, value, onSuccess, onFailure);

    }
    function onSuccess(result) {
        $("#LabelSaveResult").text("Save... : " + result);
    }
    function onFailure(result) {
        $("#LabelSaveResult").text("Save... : " + result);
    }

</script>