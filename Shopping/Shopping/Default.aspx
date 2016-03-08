<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Shopping.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form3" runat="server">
    <asp:ScriptManager ID="ScriptManager" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
        <ContentTemplate>

            <table>

                <tr id="headerRow">
                   <td>
                       <asp:Image ID="Image1" runat="server" Height="91px" ImageUrl="~/Images/logoPic.jpg" Width="100px" />                
                   </td>
                   <td style="width:250px;text-align:center">
                      <asp:LinkButton ID="lblLogo" runat="server" Text="ShoppingHeart" CommandArgument="<%#Bind("ProductID") %>"" Font-Names="Eras Demi ITC" ForeColor="#ff0000" Font-Size="20pt" OnClick="lblLogo_Click"></asp:LinkButton>
                      <br />
                      <em>For Those Who Love Shopping</em>
                   </td>
                   <td style="width:360px;text-align:center">
                      <asp:Image ID="Image3" runat="server" Height="70px" Width="350px" ImageUrl="/Images/ShoppingBanner.jpg" />
                   </td>
                   <td style="width:210px;text-align:right">
                      <asp:Image ID="Image2" runat="server" Height="100px" Width="100px" ImageUrl="/Images/ShoppingCartIcon.jpg" />
                   </td>
                   <td style="width:50px">
                     <asp:LinkButton ID="buttonCartCount" runat="server" Font-Underline="false" Font-Size="20pt"
                                     ForeColor="Red" OnClick="buttonCartCount_Click" style="position:absolute;top:10px;">0</asp:LinkButton>
                   </td>                           
                </tr>                       
                             
                <tr>                   
                   <td colspan="3" style="text-align:center">                        
                      <asp:Label ID="lblCategoryName" runat="server" Font-Size="15pt" ForeColor="#6600CC"  style="text-align:center"></asp:Label>
                   </td>
                   <td colspan="2" style="text-align:center">                         
                      <asp:Label ID="lblProducts" runat="server" Text="Products" Font-Size="15pt" ForeColor="#6600CC"></asp:Label>
                   </td>
                </tr>                           
               
                <tr>
                      <td colspan="3">

                        <table>
                            <tr>
                                <td style="vertical-align:top;">
                                    <asp:Panel ID="panelProducts" runat="server" ScrollBars="Auto" Height="500px" BorderColor="Black"
                                               borderstyle="solid" BorderWidth="1px">
                                         <asp:DataList ID="dlProducts" runat="server" RepeatColumns="3" Width="719px" Font-Bold="False"
                                                       Font-Italic="false" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" 
                                                       OnSelectedIndexChanged="dlProducts_SelectedIndexChanged" CellPadding="4" ForeColor="#333333">
                                         
                                             <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                             <ItemStyle BackColor="#FFFBD6" ForeColor="#333333" />
                                             <itemtemplate>
                                                <div>
                                                    <table class="style4" style="border-spacing:1px;border:1px ridge #9900FF">
                                                        <tr>
                                                            <td style="border-bottom-style:ridge;border-width:1px;border-color:#000000">
                                                                <asp:Label ID="lblProductName" runat="server" Text='<%#Eval("Name") %>' style="font-weight:700"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <img alt="" src='<%# Bind("ImageUrl") %>' runat="server" id="imgProductPhoto" style="border:ridge 1px black;width:173px;height:160px;" />                                                            
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                Price:<asp:Label ID="lblPrice" runat="server" Text='<%# Bind("Price") %>'></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:Button ID="buttonAddToCart" runat="server" CommandArgument='<%#Bind("ProductID") %>' OnClick="buttonAddToCart_Click" 
                                                                    Text="Add To Cart" Width="100%" BorderColor="Black" BorderStyle="Inset" BorderWidth="1px"/>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                             </itemtemplate>                    
                                             <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />              
                                             <SelectedItemStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                                             <AlternatingItemStyle BackColor="White" />               
                                                 
                                         </asp:DataList>                                        
                                   </asp:Panel> 
                                    </td>
                            </tr>
                        </table>

                     </td>
                         
                     <td colspan="2" style="vertical-align:top;text-align:center">
                          <asp:Panel ID="panelCategories" runat="server" BorderColor="Black" BorderWidth="1px" Height="500px" ScrollBars="Auto">
                              <asp:DataList ID="dlCategories" runat="server" BackColor="White" ForeColor="Black" GridLines="Horizontal" Height="263px" OnSelectedIndexChanged="dlCategories_SelectedIndexChanged" Width="252px">
                           
                                  <headerstyle BackColor="#333333" Font-Bold="True" ForeColor="White" />

                                  <itemtemplate>
                                      <asp:LinkButton ID="linkButtonCategory" runat="server" CommandArgument='<%# Bind("CategoryID") %>' OnClick="linkButtonCategory_Click" Text='<%# Bind("CategoryName") %>'>
                                        </asp:LinkButton>
                                  </itemtemplate>

                                  <footerstyle BackColor="#CCCC99" ForeColor="Black" />

                                  <selecteditemstyle BackColor="#CC3333" Font-Bold="true" ForeColor="White" />

                              </asp:DataList>                              
                          </asp:Panel>
                      </td>
                </tr>

                <tr>
                    <td colspan="3">
                        <asp:Panel ID="panelMyCart" runat="server">
                            <asp:Image ID="emptyCart" runat="server" Height="75%" ImageUrl="~/ProductImages/emptyCart.jpg" Width="75%" />                
                            <asp:DataList ID="dlProductsCart" runat="server" RepeatColumns="3" Width="719px" Font-Bold="False"
                                          Font-Italic="false" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" 
                                          CellPadding="4" ForeColor="#333333">
                                         
                                   <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                   <ItemStyle BackColor="#FFFBD6" ForeColor="#333333" />
                                   <itemtemplate>
                                      <div>
                                            <table class="style4" style="border-spacing:1px;border:1px ridge #9900FF">
                                                <tr>
                                                    <td style="border-bottom-style:ridge;border-width:1px;border-color:#000000">
                                                        <asp:Label ID="lblProductNameCart" runat="server" Text='<%#Eval("ProductName") %>' style="font-weight:700"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <img alt="" src='<%#Bind("ImageUrl") %>' runat="server" id="imgProductPhotoCart" style="border:ridge 1px black;width:173px;height:160px;" />                                                            
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Price:<asp:Label ID="lblPriceCart" runat="server" Text='<%# Bind("ProductPrice") %>'></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Button ID="removeFromTCart" runat="server" CommandArgument='<%#Bind("ProductID") %>' OnClick="buttonRemoveFromCart_Click" 
                                                            Text="Remove From Cart" Width="100%" BorderColor="Black" BorderStyle="Inset" BorderWidth="1px"/>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                   </itemtemplate>                    
                                   <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />              
                                   <SelectedItemStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                                   <AlternatingItemStyle BackColor="White" />               
                                                 
                            </asp:DataList>
                        </asp:Panel> 
                    </td>
                    <td colspan="2">
                        <asp:Panel ID="panelCheckOut" runat="server">
                            <formview>
                                <table>

                                    <tr>
                                        <td>
                                            FirstName:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="fName" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>
                                            LastName:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="lName" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>
                                            Contact No:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="contactNo" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>
                                            Email:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="email" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>
                                            Address:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="address" TextMode="MultiLine"  runat="server"></asp:TextBox>
                                        </td>
                                    </tr>                                    

                                    <tr>
                                        <th>
                                            Payable Amount: 
                                        </th>
                                        <td>
                                            <asp:TextBox ID="totalAmt" ReadOnly="True"  runat="server"></asp:TextBox>
                                        </td>
                                    </tr>

                                    <tr>                                        
                                        <td colspan="2" style="text-align:center">
                                            <asp:Button ID="placeOrder" Text="Place Order" runat="server" OnClick="placeOrder_Click"></asp:Button>
                                        </td>
                                    </tr>

                                </table>
                            </formview>
                        </asp:Panel>
                    </td>
                </tr>             

                <tr>
                    <td colspan="5" style="text-align:right">
                       <a href="Admin/Login.aspx">Admin Panel</a>  <!--redirect to admin    -->
                    </td>
                </tr>
                
            </table>
                   
        </ContentTemplate>
    </asp:UpdatePanel>
  </form>
</body>
</html>
