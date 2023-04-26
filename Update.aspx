<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Update.aspx.cs" Inherits="MyGoalAssignment.Update" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <p>
        <br />
        <table style="width: 100%">
            <tr>
                <td style="text-align: center; width: 108px">
                    <asp:CheckBox ID="emailchkbox" runat="server" AutoPostBack="True" OnCheckedChanged="emailchkbox_CheckedChanged" />
                </td>
                <td style="width: 116px; text-align: right">Email</td>
                <td style="width: 194px">
                    <asp:TextBox ID="email" runat="server" AutoPostBack="True" Width="185px" ReadOnly="True"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="email" ErrorMessage="This Field is Required" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="email" ErrorMessage="Enter Valid Email" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td style="text-align: center; width: 108px; height: 94px">
                    <asp:CheckBox ID="passwordchkbox0" runat="server" AutoPostBack="True" OnCheckedChanged="passwordchkbox0_CheckedChanged" />
                </td>
                <td style="width: 116px; text-align: right; height: 94px">Password</td>
                <td style="width: 194px; height: 94px">
                    <asp:TextBox ID="passwordtxt" runat="server" AutoPostBack="True" Width="185px" ReadOnly="True"></asp:TextBox>
                     <br />
                     <br />

                    <asp:TextBox ID="confirmPass" runat="server" AutoPostBack="True" TextMode="Password" Width="185px" ReadOnly="True" Visible="False"></asp:TextBox>
                </td>
                <td style="height: 94px">
                    <br />
                    <br />
                </td>
                <td style="height: 94px">
                    
                    <asp:RequiredFieldValidator ID="passValid" runat="server" ControlToValidate="passwordtxt" ErrorMessage="This Field is Required" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                     <br />

                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="passwordtxt" ErrorMessage="Password Must Match" ForeColor="Red" ControlToValidate="confirmPass"></asp:CompareValidator>

                </td>
            </tr>
            <tr>
                <td style="text-align: center; width: 108px">
                    <asp:CheckBox ID="FNamechkbox1" runat="server" AutoPostBack="True" OnCheckedChanged="FNamechkbox1_CheckedChanged"  />
                </td>
                <td style="width: 116px; text-align: right">First Name</td>
                <td style="width: 194px">
                    <asp:TextBox ID="fnametxt" runat="server" AutoPostBack="True" Width="185px" ReadOnly="True"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="fnametxt" ErrorMessage="This Field is Required" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="text-align: center; width: 108px">
                    <asp:CheckBox ID="LNamechkbox2" runat="server" AutoPostBack="True" OnCheckedChanged="LNamechkbox2_CheckedChanged" />
                </td>
                <td style="width: 116px; text-align: right">Last Name</td>
                <td style="width: 194px">
                    <asp:TextBox ID="lnametxt" runat="server" AutoPostBack="True" Width="185px" ReadOnly="True"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="lnametxt" ErrorMessage="This Field is Required" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="text-align: center; width: 108px">
                    <asp:CheckBox ID="YBOchkbox3" runat="server" OnCheckedChanged="YBOchkbox3_CheckedChanged" />
                </td>
                <td style="width: 116px; text-align: right">Year of Birth</td>
                <td style="width: 194px">
                    <asp:TextBox ID="yobtxt" runat="server" CausesValidation="True" Width="185px" ReadOnly="True"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="yobtxt" ErrorMessage="This Field is Required" ForeColor="Red"></asp:RequiredFieldValidator>
                   <br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="yobtxt" ErrorMessage="*Must be a 4 digit year" ValidationExpression="/d{4}" ForeColor="Red"></asp:RegularExpressionValidator>
                </td>
            </tr>
        </table>
    </p>
    <p style="text-align: center">
        <asp:SqlDataSource ID="updateSql" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [User] WHERE [User_ID] = @User_ID" InsertCommand="INSERT INTO [User] ([U_Email], [U_Password], [U_FName], [U_LName], [U_YoB]) VALUES (@U_Email, @U_Password, @U_FName, @U_LName, @U_YoB)" SelectCommand="SELECT * FROM [User] WHERE ([User_ID] = @User_ID)" UpdateCommand="UPDATE [User] SET [U_Email] = @U_Email, [U_Password] = @U_Password, [U_FName] = @U_FName, [U_LName] = @U_LName, [U_YoB] = @U_YoB WHERE [User_ID] = @User_ID">
            <DeleteParameters>
                <asp:Parameter Name="User_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="U_Email" Type="String" />
                <asp:Parameter Name="U_Password" Type="String" />
                <asp:Parameter Name="U_FName" Type="String" />
                <asp:Parameter Name="U_LName" Type="String" />
                <asp:Parameter Name="U_YoB" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:Parameter Name="User_ID" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="U_Email" Type="String" />
                <asp:Parameter Name="U_Password" Type="String" />
                <asp:Parameter Name="U_FName" Type="String" />
                <asp:Parameter Name="U_LName" Type="String" />
                <asp:Parameter Name="U_YoB" Type="Int32" />
                <asp:Parameter Name="User_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:Button ID="updateAccount" runat="server" Height="44px" Text="Update Account" Width="248px" OnClick="updateAccount_Click" />
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
</asp:Content>
