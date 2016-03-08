<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AddEditCategory.aspx.cs" Inherits="Shopping.Admin.AddEditCategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div>
        <h4>Add New Category</h4>
        <hr />
    </div>
    <table style="width:100%">
        <tr style="height:70px;text-align:center">
            <td>
                Category Name:
            </td>
            <td>
                <asp:TextBox ID="txtCategoryName" runat="server" Width="212px" />
            </td>
        </tr>
        <tr>
    
            <td rowspan="2" colspan="2" style="text-align:center; height:80px">
                <asp:Button ID="buttonSubmit" runat="server" Text="Submit" Width="100px" Height="30px" OnClick="buttonSubmit_Click"/>
            </td>
        </tr>
    </table>
</asp:Content>
