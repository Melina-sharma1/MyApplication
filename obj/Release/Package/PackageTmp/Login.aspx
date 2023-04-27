<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MyGoalAssignment.Login" %>


<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">

    <h2>Login</h2>

    <br />
          <div style="text-align: center">
              <table align="center" style="width: 100%">
                  <tr>
                      <td style="text-align: right">
        <label for="user" Font-size="50px">Username:</label>
        </td>
                      <td style="text-align: left; width: 310px">
        <asp:TextBox ID="txtemail" runat="server" Height="24px" Width="245px"></asp:TextBox>
                      </td>
                      <td style="text-align: left">
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtemail" ErrorMessage="Username is required" ForeColor="Red"></asp:RequiredFieldValidator>
                          <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtemail" ErrorMessage="Invalid email" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                      </td>
                  </tr>
                  <tr>
                      <td style="text-align: right">
        <label for="pass" Font-size="50px">Password:</label></td>
                      <td style="text-align: left; width: 310px">
        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Height="22px" Width="244px"></asp:TextBox>
                      </td>
                      <td style="text-align: left">
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password is Required" ForeColor="Red"></asp:RequiredFieldValidator>
                      </td>
                  </tr>
                  <tr>
                      <td style="height: 47px">
                           <asp:SqlDataSource ID="SqlDataLogin" runat="server" ConnectionString="<%$ ConnectionStrings:Student5680ConnectionString %>"  SelectCommand="SELECT * FROM [User] WHERE (([U_Email] = @U_Email) AND ([U_Password] = @U_Password))">
            <SelectParameters>
                <asp:Parameter Name="U_Email" Type="String" />
                <asp:Parameter Name="U_Password" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

                      </td>
                      <td style="height: 47px; text-align: left; width: 310px">
        <asp:Button ID="loginbtn" runat="server" Text="Login" OnClick="OnClick_login" Height="43px" Width="157px" />
                      </td>
                      <td style="height: 47px"></td>
                  </tr>
                  <tr>
                      <td></td>
                      <td style="width: 310px">

    <asp:Label ID="ErrorMessagelbl" runat="server" ForeColor="Red" Visible="False" Font-Size="Medium" Height="50px" Width="303px"></asp:Label>
                          <br />
                      </td>
                      <td>
                          <br />
                      </td>
                  </tr>
                  <tr>
                      <td>&nbsp;</td>
                      <td style="width: 310px; text-align: left;">

              <asp:Button ID="signupBtn" runat="server" CausesValidation="False" OnClick="signupBtn_Click" Text="Create new account" Height="50px" Width="206px" />
                      </td>
                      <td>&nbsp;</td>
                  </tr>
                 
              </table>
    </div>


</asp:Content>
