<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MyGoalAssignment.Login" %>


<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server" bg>

    <h2>Login</h2>
    <hr />
    
    <div>
        <label for="user" Font-size="50px">Username:</label>
        <asp:TextBox ID="txtemail" runat="server" Height="24px" Width="223px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtemail" ErrorMessage="Email Is required" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtemail" ErrorMessage="Input valid email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red"></asp:RegularExpressionValidator>
    </div>
    <br />
    <div>
        <label for="pass" Font-size="50px">Password:</label>
        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Height="22px" Width="226px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password is Required" ForeColor="Red"></asp:RequiredFieldValidator>
    </div>
    <br />
    <div style="text-align: left">
        <asp:Button ID="loginbtn" runat="server" Text="Login" OnClick="OnClick_login" Height="43px" Width="157px" />
    </div>

    <strong>

    <asp:Label ID="ErrorMessagelbl" runat="server" ForeColor="Red" Visible="False" Height="69px" Width="700px" Font-Size="XX-Large"></asp:Label>

    </strong>

</asp:Content>
