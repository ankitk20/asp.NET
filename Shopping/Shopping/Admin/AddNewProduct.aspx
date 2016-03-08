<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AddNewProduct.aspx.cs" Inherits="Shopping.Admin.AddNewProduct" EnableSessionState="true" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    
     <div>
        <h4>Add New Products</h4>
        <hr />
     </div> 
    
    <table style="width:100%">
   
        <tr>
            <td style="width: 128px">
                Product Name :
            </td>
            <td>
                <asp:TextBox ID="txtProductName" runat="server" Width="212px" />
            </td>
        </tr>
        <tr>
            <td style="width: 280px">
                Product Category :
            </td>
            <td>
                <asp:DropdownList ID="ddlCategory" DataTextField="CategoryName" DataValueField="CategoryID" runat="server" Width="212px" >
                    <asp:ListItem Text="" Value="0"></asp:ListItem>
                    <asp:ListItem Text="Laptop" Value="1"></asp:ListItem>
                    <asp:ListItem Text="Men-Women Wear" Value="2"></asp:ListItem>
                    <asp:ListItem Text="Mobile" Value="3"></asp:ListItem>
                    <asp:ListItem Text="Watch" Value="4"></asp:ListItem>
                </asp:DropdownList>
            </td>
        </tr>

        <tr>
            <td style="width: 128px">
                Product Description :
            </td>
            <td>
                <asp:TextBox ID="txtProductDescription" runat="server" Width="212px" Height="80px" TextMode="MultiLine"/>
            </td>
        </tr>
        <tr>
            <td style="width: 128px">
                Product Image :
            </td>
            <td>
                <asp:FileUpload ID="uploadProductPhoto" runat="server" />
            </td>
        </tr>
        <tr>
            <td style="width: 128px">
                Product Price :
            </td>
            <td>
                <asp:TextBox ID="txtProductPrice" runat="server" Width="212px" />
            </td>
        </tr>
        <tr>
            <td style="width: 128px">
               &nbsp;
            </td>
            <td>
                <asp:Button ID="buttonSubmit" runat="server" Text="Submit" Width="100px" Height="30px" OnClick="ProductSubmit_Click" />
            </td>
        </tr>
         
    </table>
</asp:Content>
