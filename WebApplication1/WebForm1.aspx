<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication1.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

    <title></title>
<head runat="server">  
    <title>CRUD Operation Using Entity Framework In ASP.NET Grid View</title>  
</head>  
<body>  
    <form id="form1" runat="server">  
        <div>  
            <table style="border: solid 15px blue; width: 100%; vertical-align: central;">  
                <tr>  
                    <td style="padding-left: 20px; padding-top: 20px; padding-bottom: 20px;   
                        background-color: skyblue; font-family: 'Times New Roman';   
                            font-size: 20pt; color: red;">CRUD Operation Using Entity Framework In ASP.NET Grid View  
                    </td>  
                </tr>  
                <tr>  
                    <td style="text-align: left;">  
  
                        <asp:GridView ID="GVEmployee" runat="server"   
                            AutoGenerateColumns="False" ShowFooter="True"   
                            PageSize="10" AllowPaging="true"  
                            OnRowCommand="GVEmployee_RowCommand"  
                            DataKeyNames="Emp_ID" CellPadding="4" ForeColor="#333333"  
                            GridLines="None" OnRowCancelingEdit="GVEmployee_RowCancelingEdit"  
                            OnRowEditing="GVEmployee_RowEditing"  
                            OnRowUpdating="GVEmployee_RowUpdating"  
                            OnRowDeleting="GVEmployee_RowDeleting"  
                            OnPageIndexChanging="GVEmployee_OnPageIndexChanging" OnSelectedIndexChanged="GVEmployee_SelectedIndexChanged">  
                            <AlternatingRowStyle BackColor="White" />  
                            <Columns>  
                                <asp:TemplateField HeaderText="Employee Name" HeaderStyle-HorizontalAlign="Left">  
                                    <EditItemTemplate>  
                                        <asp:TextBox ID="txtEmpName" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>  
                                        <asp:RequiredFieldValidator ID="valEmpName" runat="server" ControlToValidate="txtEmpName"  
                                            Display="Dynamic" ErrorMessage="Employee Name is required." ForeColor="Red" SetFocusOnError="True"  
                                            ValidationGroup="vldEditRecord">*</asp:RequiredFieldValidator>  
                                    </EditItemTemplate>  
                                    <ItemTemplate>  
                                        <asp:Label ID="lblEmpName" runat="server" Text='<%# Bind("Name") %>'></asp:Label>  
                                    </ItemTemplate>  
                                    <FooterTemplate>  
                                        <asp:TextBox ID="txtEmpNameNew" runat="server"></asp:TextBox>  
                                        <asp:RequiredFieldValidator ID="valEmpNameNew" runat="server" ControlToValidate="txtEmpNameNew"  
                                            Display="Dynamic" ErrorMessage="Employee Name is required." ForeColor="Red" SetFocusOnError="True"  
                                            ValidationGroup="vldNewRecord">*</asp:RequiredFieldValidator>  
                                    </FooterTemplate>  
                                </asp:TemplateField>  
                                <asp:TemplateField HeaderText="Designation" HeaderStyle-HorizontalAlign="Left">  
                                    <EditItemTemplate>  
                                        <asp:TextBox ID="txtDesignation" runat="server" Text='<%# Bind("Designation") %>'></asp:TextBox>  
                                        <asp:RequiredFieldValidator ID="valDesignation" runat="server" ControlToValidate="txtDesignation"  
                                            Display="Dynamic" ErrorMessage="Designation is required." ForeColor="Red" SetFocusOnError="True"  
                                            ValidationGroup="vldEditRecord">*</asp:RequiredFieldValidator>  
                                    </EditItemTemplate>  
                                    <ItemTemplate>  
                                        <asp:Label ID="lblDesignation" runat="server" Text='<%# Bind("Designation") %>'></asp:Label>  
                                    </ItemTemplate>  
                                    <FooterTemplate>  
                                        <asp:TextBox ID="txtDesignationNew" runat="server"></asp:TextBox>  
                                        <asp:RequiredFieldValidator ID="valDesignationNew" runat="server" ControlToValidate="txtDesignationNew"  
                                            Display="Dynamic" ErrorMessage="Designation is required." ForeColor="Red" SetFocusOnError="True"  
                                            ValidationGroup="vldNewRecord">*</asp:RequiredFieldValidator>  
                                    </FooterTemplate>  
                                </asp:TemplateField>  
                                <asp:TemplateField HeaderText="City" HeaderStyle-HorizontalAlign="Left">  
                                    <EditItemTemplate>  
                                        <asp:TextBox ID="txtCity" runat="server" Text='<%# Bind("City") %>'></asp:TextBox>  
                                        <asp:RequiredFieldValidator ID="valCity" runat="server" ControlToValidate="txtCity"  
                                            Display="Dynamic" ErrorMessage="City is required." ForeColor="Red" SetFocusOnError="True"  
                                            ValidationGroup="vldEditRecord">*</asp:RequiredFieldValidator>  
                                    </EditItemTemplate>  
                                    <ItemTemplate>  
                                        <asp:Label ID="lblCity" runat="server" Text='<%# Bind("City") %>'></asp:Label>  
                                    </ItemTemplate>  
                                    <FooterTemplate>  
                                        <asp:TextBox ID="txtCityNew" runat="server"></asp:TextBox>  
                                        <asp:RequiredFieldValidator ID="valCityNew" runat="server" ControlToValidate="txtCityNew"  
                                            Display="Dynamic" ErrorMessage="City is required." ForeColor="Red" SetFocusOnError="True"  
                                            ValidationGroup="vldNewRecord">*</asp:RequiredFieldValidator>  
                                    </FooterTemplate>  
                                </asp:TemplateField>  
                                <asp:TemplateField HeaderText="State" HeaderStyle-HorizontalAlign="Left">  
                                    <EditItemTemplate>  
                                        <asp:TextBox ID="txtState" runat="server" Text='<%# Bind("State") %>'></asp:TextBox>  
                                        <asp:RequiredFieldValidator ID="valState" runat="server" ControlToValidate="txtState"  
                                            Display="Dynamic" ErrorMessage="State is required." ForeColor="Red" SetFocusOnError="True"  
                                            ValidationGroup="vldEditRecord">*</asp:RequiredFieldValidator>  
                                    </EditItemTemplate>  
                                    <ItemTemplate>  
                                        <asp:Label ID="lblState" runat="server" Text='<%# Bind("State") %>'></asp:Label>  
                                    </ItemTemplate>  
                                    <FooterTemplate>  
                                        <asp:TextBox ID="txtStateNew" runat="server"></asp:TextBox>  
                                        <asp:RequiredFieldValidator ID="valStateNew" runat="server" ControlToValidate="txtStateNew"  
                                            Display="Dynamic" ErrorMessage="State is required." ForeColor="Red" SetFocusOnError="True"  
                                            ValidationGroup="vldNewRecord">*</asp:RequiredFieldValidator>  
                                    </FooterTemplate>  
                                </asp:TemplateField>  
  
                                <asp:TemplateField HeaderText="Country" HeaderStyle-HorizontalAlign="Left">  
                                    <EditItemTemplate>  
                                        <asp:TextBox ID="txtCountry" runat="server" Text='<%# Bind("Country") %>'></asp:TextBox>  
                                        <asp:RequiredFieldValidator ID="valCountry" runat="server" ControlToValidate="txtCountry"  
                                            Display="Dynamic" ErrorMessage="Country is required." ForeColor="Red" SetFocusOnError="True"  
                                            ValidationGroup="vldEditRecord">*</asp:RequiredFieldValidator>  
                                    </EditItemTemplate>  
  
                                    <ItemTemplate>  
                                        <asp:Label ID="lblCountry" runat="server" Text='<%# Bind("Country") %>'></asp:Label>  
                                    </ItemTemplate>  
  
                                    <FooterTemplate>  
                                        <asp:TextBox ID="txtCountryNew" runat="server"></asp:TextBox>  
                                        <asp:RequiredFieldValidator ID="valCountryNew" runat="server" ControlToValidate="txtCountryNew"  
                                            Display="Dynamic" ErrorMessage="Country is required." ForeColor="Red" SetFocusOnError="True"  
                                            ValidationGroup="vldNewRecord">*</asp:RequiredFieldValidator>  
                                    </FooterTemplate>  
                                </asp:TemplateField>  
  
                                <asp:TemplateField HeaderText="">  
                                    <ItemTemplate>  
                                        <asp:LinkButton ID="lnkEdit" runat="server" Text="" CommandName="Edit" ToolTip="Edit">  
                                         Edit
                                        </asp:LinkButton>  
                                        <asp:LinkButton ID="lnkDelete" runat="server" Text="Delete" CommandName="Delete"  
                                            ToolTip="Delete" OnClientClick='return confirm("Are you sure you want to delete employee record?");'>  
                                            Delete
                                        </asp:LinkButton>  
                                    </ItemTemplate>  
  
                                    <EditItemTemplate>  
                                        <asp:LinkButton ID="lnkInsert" runat="server" Text="" ValidationGroup="vldEditRecord"   
                                            CommandName="Update" ToolTip="Save"  
                                            OnClientClick='return confirm("Employee Record Saved Successfully.");'>  
                                          Save
                                                                                         
                                        </asp:LinkButton>  
                                        <asp:LinkButton ID="lnkCancel" runat="server" Text="" CommandName="Cancel" ToolTip="Cancel">  
                                            Cancel
                                        </asp:LinkButton>  
                                    </EditItemTemplate>  
  
                                    <FooterTemplate>  
                                        <asp:LinkButton ID="lnkInsert" runat="server" Text="" ValidationGroup="vldNewRecord"   
                                            CommandName="InsertNew" ToolTip="Add New Employee"  
                                            OnClientClick='return confirm("Employee Record addedd Successfully.");'>  
                                                Insert
                                        </asp:LinkButton>  
                                        <asp:LinkButton ID="lnkCancel" runat="server" Text="" CommandName="CancelNew" ToolTip="Cancel">  
                                     Cancel
                                        </asp:LinkButton>  
                                    </FooterTemplate>  
  
                                </asp:TemplateField>  
                            </Columns>  
                            <EditRowStyle BackColor="#2461BF" />  
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />  
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />  
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />  
                            <RowStyle BackColor="#EFF3FB" />  
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />  
                            <SortedAscendingCellStyle BackColor="#F5F7FB" />  
                            <SortedAscendingHeaderStyle BackColor="#6D95E1" />  
                            <SortedDescendingCellStyle BackColor="#E9EBEF" />  
                            <SortedDescendingHeaderStyle BackColor="#4870BE" />  
                        </asp:GridView>  
                    </td>  
                </tr>  
            </table>  
        </div>  
    </form>  
</body>  
</html>  
