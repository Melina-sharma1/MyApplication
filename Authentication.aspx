<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Authentication.aspx.cs" Inherits="MyGoalAssignment.Authentication" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


    
    <div class="content-bg" style="text-align: center">
        <div>
            <span style="font-size: xx-large"><strong>  </strong></span>
            <h2>
                <asp:Label ID="authenticationMsg" runat="server" Text="Label"></asp:Label>
            </h2>
            <p>&nbsp;</p>
            <p>Now you can view my <a id="HyperLink8" href="Career.aspx">Career</a> page.</p>
        </div>
         
        

    </div>
</asp:Content>
