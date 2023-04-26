<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="MyGoalAssignment.Signup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <p style="text-align: center">
        <br />
        <table style="width: 100%">
            <tr>
                <td style="text-align: right; width: 328px; height: 29px">Email</td>
                <td style="text-align: left; width: 258px; height: 29px">
                    <asp:TextBox ID="email" runat="server" TextMode="Email" Width="247px"></asp:TextBox>
                </td>
                <td style="text-align: left; height: 29px">
                    <asp:RequiredFieldValidator ID="rfv1" runat="server" ControlToValidate="email" ErrorMessage="*Required" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="emailValidate" runat="server" ControlToValidate="email" ErrorMessage="* Must be an email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td style="text-align: right; width: 328px">Confirm Email</td>
                <td style="text-align: left; width: 258px">
                    <asp:TextBox ID="email0" runat="server" TextMode="Email" Width="247px"></asp:TextBox>
                </td>
                <td style="text-align: left">
                    <asp:RequiredFieldValidator ID="rfv2" runat="server" ControlToValidate="email0" ErrorMessage="*Required" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="cv1" runat="server" ControlToCompare="email" ControlToValidate="email0" ErrorMessage="* values must match"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td style="text-align: right; width: 328px; height: 26px">Password</td>
                <td style="text-align: left; height: 26px; width: 258px">
                    <asp:TextBox ID="password" runat="server" TextMode="Password" Width="247px"></asp:TextBox>
                </td>
                <td style="text-align: left; height: 26px">
                    <asp:RequiredFieldValidator ID="rfv3" runat="server" ControlToValidate="password" ErrorMessage="*Required" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="text-align: right; width: 328px">Confirm Password</td>
                <td style="text-align: left; width: 258px">
                    <asp:TextBox ID="password2" runat="server" TextMode="Password" Width="247px"></asp:TextBox>
                </td>
                <td style="text-align: left">
                    <asp:RequiredFieldValidator ID="rfv4" runat="server" ControlToValidate="password2" ErrorMessage="*Required" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="cv2" runat="server" ControlToCompare="password" ControlToValidate="password2" ErrorMessage="* values must match"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td style="text-align: right; width: 328px; height: 29px">First Name</td>
                <td style="text-align: left; width: 258px; height: 29px">
                    <asp:TextBox ID="firstName" runat="server" Width="248px"></asp:TextBox>
                </td>
                <td style="text-align: left; height: 29px">
                    <asp:RequiredFieldValidator ID="rfv5" runat="server" ControlToValidate="firstName" ErrorMessage="*Required" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="text-align: right; width: 328px">Last Name</td>
                <td style="text-align: left; width: 258px">
                    <asp:TextBox ID="lastName" runat="server" Width="248px"></asp:TextBox>
                </td>
                <td style="text-align: left">
                    <asp:RequiredFieldValidator ID="rfv6" runat="server" ControlToValidate="lastName" ErrorMessage="*Required" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="text-align: right; width: 328px">Year of Birth</td>
                <td style="text-align: left; width: 258px">
                    <asp:TextBox ID="yearOfBirth" runat="server" TextMode="Number" Width="248px"></asp:TextBox>
                </td>
                <td style="text-align: left">
                    <asp:RequiredFieldValidator ID="rfv7" runat="server" ControlToValidate="yearOfBirth" ErrorMessage="*Required" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="dateOfBirthVal" runat="server" ControlToValidate="yearOfBirth" ErrorMessage="* Must be a 4 digit year" ValidationExpression="\d{4}"></asp:RegularExpressionValidator>
                </td>
            </tr>
        </table>
    </p>
    <p style="text-align: center">
        <table style="width: 100%">
            <tr>
                <td style="width: 527px; text-align: left">Already have account?&nbsp;
                    <asp:Button ID="loginBtn" runat="server" CausesValidation="False" OnClick="loginBtn_Click" Text="Login" Width="107px" />
                </td>
                <td style="text-align: left">
        <asp:Button ID="Register" runat="server"  Text="Register" OnClick="Register_Click" />
                </td>
            </tr>
        </table>
    </p>
    <p>
        <asp:SqlDataSource ID="SqlDataReg" runat="server" ConnectionString="<%$ ConnectionStrings:Student5680ConnectionString %>" DeleteCommand="DELETE FROM [User] WHERE [User_ID] = @User_ID" InsertCommand="INSERT INTO [User] ([U_Email], [U_Password], [U_FName], [U_LName], [U_YoB]) VALUES (@U_Email, @U_Password, @U_FName, @U_LName, @U_YoB)" SelectCommand="SELECT * FROM [User] WHERE (([U_Email] = @U_Email) AND ([U_Password] = @U_Password) AND ([U_FName] = @U_FName) AND ([U_LName] = @U_LName) AND ([U_YoB] = @U_YoB))" UpdateCommand="UPDATE [User] SET [U_Email] = @U_Email, [U_Password] = @U_Password, [U_FName] = @U_FName, [U_LName] = @U_LName, [U_YoB] = @U_YoB WHERE [User_ID] = @User_ID">
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
                <asp:Parameter Name="U_Email" Type="String" />
                <asp:Parameter Name="U_Password" Type="String" />
                <asp:Parameter Name="U_FName" Type="String" />
                <asp:Parameter Name="U_LName" Type="String" />
                <asp:Parameter Name="U_YoB" Type="Int32" />
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
