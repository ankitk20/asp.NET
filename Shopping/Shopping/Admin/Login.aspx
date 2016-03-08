<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Shopping.Admin.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Page</title>
    <style>
        td{
            text-align:center;
        }
        table{
            border: 2px solid black;
            padding:20px;
            width:200px;
            height:150px;
           position:absolute;
            top:30%;
            left:40%;
        }
        h2{
            background-color:indianred;
            text-shadow:2px 1px 2px #333;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
         <div style="margin:200px;">
            <table>

                <tr>
                    <td colspan="2">
                        <h2>ADMIN PANEL</h2>
                        <hr />
                    </td>
                </tr>
         
                <tr style="height:60px;">
                    <td>
                        Username:
                    </td>
                    <td>
                        <asp:TextBox ID="loginId" runat="server"/>               
                    </td>
                </tr>
         
                <tr style="height:60px">
                    <td>
                        Password:
                    </td>
                    <td>
                        <asp:TextBox ID="password" runat="server" TextMode="Password"/>           
                    </td>
                </tr>
         
                <tr>
                    <td colspan="2">
                        <asp:Button ID="buttonSubmit" runat="server" Text="Submit" onclick="buttonSubmit_Click" style="height: 26px" />
                    </td>
                </tr>
         
           </table>
         </div>
    </form>
</body>
</html>
