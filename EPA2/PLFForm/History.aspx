<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="History.aspx.cs" Inherits="PLF.PLFForm.History" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Position Publsh List</title>
    <meta http-equiv="Pragma" content="No-cache" />
    <meta http-equiv="Cache-Control" content="no-Store,no-Cache" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="../Content/BubbleHelp.css" rel="stylesheet" />
    <link href="../Content/ListPage.css" rel="stylesheet" />
    <link href="../Scripts/JQueryUI/jquery-ui.min.css" rel="stylesheet" />
    <link href="../Scripts/JQueryUI/jquery-ui.theme.min.css" rel="stylesheet" type="text/css" />
    <link href="../Scripts/JQueryUI/jquery-ui.structure.min.css" rel="stylesheet" />

    <style type="text/css">
        body {
            height: 99.5%;
            width: 99.5%;
            font-size: x-small;
        }

        div {
            font-family: Arial;
            font-size: small;
        }


        .DataContentTile {
            font-family: Arial;
            font-size: small;
            font-weight: 300;
            color: blue;
            table-layout: auto;
            display: block;
            height: 99%;
        }



        .SubstituedCell {
            color: red;
            text-decoration: underline;
        }

        .emptyData {
            font-size: xx-large;
            text-align: center;
            color: blue;
        }


        .FixedHeader {
            position: absolute;
            font-weight: bold;
            width: 100%;
            display: block;
        }

        .highlightBoard {
            border: 1px blue solid;
        }

        .defaultBoard {
            border: 1px blue none;
        }

        #ActionMenuDIV {
            border: 2px lightblue ridge;
            height: 140px;
            width: 210px;
            background: lightblue; /* For browsers that do not support gradients */
            background: -webkit-linear-gradient(lightblue, white); /* For Safari 5.1 to 6.0 */
            background: -o-linear-gradient(lightblue, white); /* For Opera 11.1 to 12.0 */
            background: -moz-linear-gradient(lightblue, white); /* For Firefox 3.6 to 15 */
            background: linear-gradient(lightblue, white); /* Standard syntax */
        }

            #ActionMenuDIV li {
                height: 25px;
            }

        .hfSchoolYear, .hfSchoolCode, .hfEmployeeID, .hfTeacherName, .hfmyKey {
            display: none;
            width: 0px;
        }

        img {
            border-color: yellow;
        }

        #EmailTemplateDIV {
            border: 2px solid #00c2ff;
        }
       
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <asp:ScriptManager runat="server">
            <Services>
                <asp:ServiceReference Path="~/Models/WebService1.asmx" />
            </Services>
        </asp:ScriptManager>
        <div>
            <table>
                <tr>
                    <td>

                        <asp:Label ID="Label3" runat="server" Text="School Year: "></asp:Label>
                        <asp:DropDownList ID="ddlSchoolYear" runat="server" Width="90px" AutoPostBack="True" OnSelectedIndexChanged="ddlSchoolYear_SelectedIndexChanged">
                        </asp:DropDownList>
                        <asp:Label ID="Label2" runat="server" Text="School"></asp:Label>
                        <asp:DropDownList ID="ddlSchoolCode" runat="server" Width="60px" AutoPostBack="True" OnSelectedIndexChanged="ddlSchoolCode_SelectedIndexChanged">
                        </asp:DropDownList>
                        <asp:DropDownList ID="ddlSchool" runat="server" Width="300px" AutoPostBack="True" OnSelectedIndexChanged="ddlSchool_SelectedIndexChanged">
                        </asp:DropDownList>

                        <asp:Button ID="btnSearch" runat="server" Text="Go" OnClick="btnSearch_Click" />

                    </td>

                </tr>
            </table>
        </div>

        <div>

            <div id="DivRoot" style="width: 100%; height: 550px;">
                <div style="overflow: hidden;" id="DivHeaderRow">
                    <table id="GridView2" style="border: 1px ridge gray; width: 100%; height: 100%; background-color: white;" rules="all" cellpadding="1" gridlines="Both">
                    </table>
                </div>

                <div style="overflow: scroll; width: 100%; height: 100%" onscroll="OnScrollDiv(this)" id="DivMainContent">
                    <asp:GridView ID="GridView1" runat="server" CellPadding="1" Height="100%" Width="100%" GridLines="Both" AutoGenerateColumns="False" BackColor="White" BorderColor="gray" BorderStyle="Ridge" BorderWidth="1px" CellSpacing="1" EmptyDataText="No Appraisal Staff in current search condition" EmptyDataRowStyle-CssClass="emptyData" ShowHeaderWhenEmpty="true">
                        <Columns>

                            <asp:TemplateField HeaderText="Action" ItemStyle-CssClass="myAction">
                                <ItemTemplate>
                                    <asp:HyperLink ID="Link1" runat="server" Text='<%# Bind("GoAction") %>'>  </asp:HyperLink>
                                </ItemTemplate>
                                <ItemStyle Width="50px" Wrap="False" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="School Year" ItemStyle-CssClass="mySchoolyear">
                                <ItemTemplate>
                                    <asp:HyperLink ID="Link2" runat="server" Text='<%# Bind("SchoolYear") %>'>  </asp:HyperLink>
                                </ItemTemplate>
                                <ItemStyle Width="100px" Wrap="False" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Principal" ItemStyle-CssClass="myPrincipal">
                                <ItemTemplate>
                                    <asp:HyperLink ID="Link3" runat="server" Text='<%# Bind("Principal") %>'>  </asp:HyperLink>
                                </ItemTemplate>
                                <ItemStyle Width="150px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="School Sign Off" ItemStyle-CssClass="mySchoolSignOff">
                                <ItemTemplate>
                                    <asp:HyperLink ID="Link4" runat="server" Text='<%# Bind("SchoolSignOffDate") %>'>  </asp:HyperLink>
                                </ItemTemplate>
                                <ItemStyle Width="150px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="SO Sign Off" ItemStyle-CssClass="mySOSignOff">
                                <ItemTemplate>
                                    <asp:HyperLink ID="Link5" runat="server" Text='<%# Bind("SOSignOffDate") %>'>  </asp:HyperLink>
                                </ItemTemplate>
                                <ItemStyle Width="150px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Publish Date" ItemStyle-CssClass="myPublish">
                                <ItemTemplate>
                                    <asp:HyperLink ID="Link6" runat="server" Text='<%# Bind("PublishDate") %>'>  </asp:HyperLink>
                                </ItemTemplate>
                                <ItemStyle Width="150px" />
                            </asp:TemplateField>

                            <asp:BoundField DataField="SchoolArea" HeaderText="School Area" ItemStyle-CssClass="mySchoolArea">
                                <ItemStyle Width="80" />
                            </asp:BoundField>

                            <asp:BoundField DataField="Comments" HeaderText="Comments">
                                <ItemStyle Width="25%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="SchoolCode" ReadOnly="True" ItemStyle-CssClass="hfmyKey" />

                        </Columns>

                        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                        <HeaderStyle BackColor="cornflowerblue" ForeColor="white" Height="25px" />
                        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />

                        <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#594B9C" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#33276A" />
                    </asp:GridView>
                </div>
            </div>


        </div>
        <div style="color: Red; font-size: x-small; height: 20%">
            <asp:Label runat="server" ID="remaind22" Text="* Click on the Apply button to see interview candidate list "> </asp:Label>
        </div>


        <div id="cellEditDateDiv" class="bubble epahide">
            <input id="cellEditDeadLineDate" runat="server" type="text" size="9" style="display: none;" />
        </div>
        <div>
            <asp:HiddenField ID="hfUserRole" runat="server" />
            <asp:HiddenField ID="hfSignOff" runat="server" />
            <asp:HiddenField ID="hfPageID" runat="server" />
            <asp:HiddenField ID="hfUserID" runat="server" />
            <asp:HiddenField ID="hfUserLoginRole" runat="server" />
            <asp:HiddenField ID="hfSelectedID" runat="server" />
            <asp:HiddenField ID="hfCategory" runat="server" />
            <asp:HiddenField ID="hfRunningModel" runat="server" />

        </div>
    </form>
</body>
</html>

<script src="../Scripts/jquery-3.2.1.min.js"></script>
<script src="../Scripts/JQueryUI/jquery-ui.min.js" type="text/javascript"></script>
<script src="../Scripts/GridView.js"></script>
<script src="../Scripts/Appr_ListPage.js"></script>
<script type="text/javascript">
    var IE = document.all ? true : false
    document.onmousemove = getMousepoints;
    var mousex = 0;
    var mousey = 0;
    function getMousepoints() {
        mousex = event.clientX + document.body.scrollLeft;
        mousey = event.clientY + document.body.scrollTop;
        return true;
    }
</script>

<script type="text/javascript">
    var rowNo;
    var teachername;
    var schoolyear;
    var schoolcode;
    var myKey;
    var currentTR;
    var eventCell;
    function pageLoad(sender, args) {

        $(document).ready(function () {
            MakeStaticHeader("GridView1", 600, 1000, 25, false);


            $("#chbAll").click(function (event) {
                var checkedValue = "";
                if ($("#chbAll").prop("checked")) {
                    checkedValue = "checked";   //var checkedValue = $("#chbAll").prop("checked");
                }
                var x = 0;
                $("#GridView1 tr").each(function () {
                    try {
                        // $(this).find("#GridView1_cbSelect_" + x.toString()).prop("checked", checkedValue);
                        $("#GridView1_cbSelect_" + x.toString()).prop("checked", checkedValue);
                    }
                    catch (ex) {
                        window.alert(ex.message);
                    }
                    x++;
                })
            });
            $('td.myAction').click(function (event) {
                myKey = $(this).closest('tr').find('td.hfmyKey').text();
                rowNo = $(this).closest('tr').find('td.myRowNo').text();
            });
            $('td.myAction').mouseenter(function (event) {
                myKey = $(this).closest('tr').find('td.hfmyKey').text();
                rowNo = $(this).closest('tr').find('td.myRowNo').text();
            });

            $('td.myDate').click(function (event) {
                eventCell = $(this);
                var cellValue = $(this).closest('tr').find('td.myDate').text();

                $("#cellEditDeadLineDate").val(cellValue);
                $("#cellEditDeadLineDate").show();
                var xTop = event.currentTarget.offsetTop + 65;
                var xLeft = event.currentTarget.offsetLeft;
                var key = "NoticeDate";
                openDateCellEdit(key, xTop, xLeft, 20, 100);
                $("#cellEditDeadLineDate").datepicker(
                    {
                        dateFormat: 'yy-mm-dd',
                    });
                $("#cellEditDeadLineDate").focus();

            });
            $('#cellEditDeadLineDate').change(function () {
                var newValue = $('#cellEditDeadLineDate').val();
                eventCell.closest('tr').find('td.myDate').text(newValue);
                $("#cellEditDateDiv").hide();
            });
        });

    }
    function openDateCellEdit(vKey, vTop, vLeft, vHeight, vWidth) {
        $("#cellEditDateDiv").css({
            top: vTop,
            left: vLeft,
            height: vHeight,
            width: vWidth
        })
        $("#cellEditDateDiv").show();// .fadeToggle("fast");
    }
    function onSuccess(result) {
        // alert(result);
    }
    function onFailure(result) {
    }
    function openForm(sYear, sCode) {
        schoolyear = sYear;
        schoolcode = sCode;
        var goPage = "PLFForm/Loading.aspx?pID=FormContent&yID=" + schoolyear + "&sID=" + schoolcode
        var vHeight = window.screen.height - 130;
        var vWidth = 980;
        var pTitle = "Professional Learning Form";
        openEditPage3(vHeight, vWidth, goPage, pTitle);
    }
    function openSignOff(sYear, sCode, sType) {
        schoolyear = sYear;
        schoolcode = sCode;
        signtype = sType;
        var userRole = document.getElementById("hfUserRole").value;
        if (userRole == "Principal" || userRole == "Superintendent" || userRole == "Admin") {
            var UserID = document.getElementById("hfUserID").value;
            //  var result = window.showModalDialog("LearningFormSignOff.aspx?yID=" + schoolyear + "&sID=" + schoolcode + "&tID=" + signtype, "singoff", "scroll:no;resizable:no;help:no;status:no;dialogTop:100;dialogLeft:100;dialogHeight:300px;dialogWidth:400px;");
            var goPage = "PLForm/Loading.aspx?pID=FormSignOff&yID=" + schoolyear + "&sID=" + schoolcode
            var vHeight = 300;
            var vWidth = 400;
            var pTitle = "Form Sign Off";
            openEditPage3(vHeight, vWidth, goPage, pTitle);


            if (result == UserID) {
                window.alert("Sign off form complete!");
            }
        }
        else { window.alert("No Permission to Sign Off!") }

    }

    function openPublish(sYear, sCode, sDate) {
        schoolyear = sYear;
        schoolcode = sCode;
        signOffDate = sDate;
        if (signOffDate == "") {
            window.alert("Please have your school superintendent sign off first!");
        }
        else {
            var UserID = document.getElementById("hfUserID").value;
            //  var result = window.showModalDialog("LearningFormPublish.aspx?yID=" + schoolyear + "&sID=" + schoolcode + "&pDate=" + signOffDate, "publish", "scroll:no;resizable:no;help:no;status:no;dialogTop:100;dialogLeft:100;dialogHeight:300px;dialogWidth:400px;");
            var goPage = "PLFForm/Loading.aspx?pID=FormPublish&yID=" + schoolyear + "&sID=" + schoolcode
            var vHeight = 300;
            var vWidth = 400;
            var pTitle = "Form Publish";
            openEditPage3(vHeight, vWidth, goPage, pTitle);
        }
    }



    function IECompatibility() {
        var agentStr = navigator.userAgent;
        this.IsIE = false;
        this.IsOn = undefined;  //defined only if IE
        this.Version = undefined;
        this.Compatible = undefined;

        if (agentStr.indexOf("compatible") > -1) {
            this.IsIE = true;
            this.IsOn = true;
            this.Compatible = true;
        }
        else {
            this.Compatible = false;
        }

    }

</script>
