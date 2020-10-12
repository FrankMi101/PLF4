<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SchoolTeam.aspx.cs" Inherits="PLF.PLFForm.SchoolTeam" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
                        <asp:DropDownList ID="ddlSchoolCode" runat="server" Width="60px"  Enabled="false" >
                        </asp:DropDownList>
                        <asp:DropDownList ID="ddlSchool" runat="server" Width="300px"  Enabled="false">
                        </asp:DropDownList>

                        <asp:Button ID="btnSearch" runat="server" Text="Go" OnClick="btnSearch_Click" />
                    </td>
                    <td style="width: 50%"></td>
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
                            <asp:BoundField DataField="TeacherName" HeaderText="Teacher Name">
                                <ItemStyle Width="20%" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Selected">
                                <ItemTemplate>
                                    <asp:CheckBox ID="cbSelect" Checked='<%# Bind("SelectedC") %>' runat="server" CssClass="myCheck"></asp:CheckBox>
                                </ItemTemplate>
                                <ItemStyle Width="50px" Wrap="False" HorizontalAlign="Center" />
                            </asp:TemplateField>

                            <asp:BoundField DataField="Comments" HeaderText="Comments">
                                <ItemStyle Width="65%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="TeacherID" ReadOnly="True" ItemStyle-CssClass="hfmyKey" />

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
            <asp:HiddenField ID="hfCategory" runat="server" />
            <asp:HiddenField ID="hfPageID" runat="server" />
            <asp:HiddenField ID="hfUserID" runat="server" />
            <asp:HiddenField ID="hfUserLoginRole" runat="server" />
            <asp:HiddenField ID="hfRunningModel" runat="server" />
            <asp:HiddenField ID="hfSelectedID" runat="server" />
        </div>
    </form>
</body>
</html>

<script src="../Scripts/jquery-3.2.1.min.js"></script>
<script src="../Scripts/JQueryUI/jquery-ui.min.js" type="text/javascript"></script>
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
 
   
    var currentTR;
    var myParameter = {
        "UserID":"",
        "SchoolYear": "",
        "SchoolCode": "",
        "TeacherID": "",
        "Checked": "",
        "Comment": "",
        "ActionType":""
    }
    function pageLoad(sender, args) {

        $(document).ready(function () {
           // MakeStaticHeader("GridView1", 500, 1000, 25, false);
            $('#GridView1 tr').mouseenter(function (event) {
                if (currentTR != undefined) { currentTR.removeClass("highlightBoard"); }
                currentTR = $(this)
                currentTR.addClass("highlightBoard");
            });


            var x = 0;
            $('td > .myCheck').click(function (event) {
                var eventCell = $(this);
                var checkValue = (eventCell[0].childNodes['0'].checked ? "X" : "");
                if ($("#hfUserRole").val() == "Principal") {
                    myParameter.TeacherID =$(this).closest('tr').find('td.myTeacherID').text();                   
                    myParameter.SchoolYear = $("#hfSchoolYear").val();
                    myParameter.SchoolCode = $("#hfSchoolCode").val();
                    myParameter.UserID = $("#hfUserID").val();
                    myParameter.Checked = checkValue;
                    myParameter.ActionType = "Check";
                    myParameter.Comment =""
                    ChangeSelectSign();
                }
            });
            $('td > .myComment').change(function (event) {
                var eventCell = $(this);

                if ($("#hfUserRole").val() == "Principal") {
                    var teacherID = $(this).closest('tr').find('td.myTeacherID').text();
                    var comments = eventCell[0].value;
                    myParameter.TeacherID = $(this).closest('tr').find('td.myTeacherID').text();
                    myParameter.SchoolYear = $("#hfSchoolYear").val();
                    myParameter.SchoolCode = $("#hfSchoolCode").val();
                    myParameter.UserID = $("#hfUserID").val();
                    myParameter.Checked = "";
                    myParameter.ActionType = "Comments";
                    myParameter.Comment = comments
                    ChangeSelectSign();
                }
            });
        });
    }

    
    var signCell;

    function ChangeSelectSign() {

        var newSelect = PLF.Models.WebService.SaveTeam(myParameter.UserID, myParameter.SchoolYear, myParameter.SchoolCode, myParameter.TeacherID, myParameter.Checked, myParameter.Comment, myParameter.ActionType, onSuccess, onFailure);

    }

    function onSuccess(result) {
        //  changeSign(result)
        $("#labelSelected").text(result);

    }
    function onFailure(result) {
        $("#labelSelected").text(result);
        window.alert(result);
    }


</script>
