<%@ Page Title="" Language="C#" MasterPageFile="~/Associate/associatemaster.master" AutoEventWireup="true" CodeFile="PaidJoiningClosingDaily.aspx.cs" Inherits="PaidJoiningClosingDaily"  EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <script type="text/javascript" language="javascript">
         functionCheckall(Checkbox)
         {
             var GridView1 = document.getElementById("<%=GridView1.ClientID %>");
             for (i = 1; i
                     < GridView1.rows.length; i++) {
                 GridView1.rows[i].cells[3].getElementsByTagName("INPUT")[0].checked = Checkbox.checked;
             }
         } </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHeader" Runat="Server">
  <section class="content-header">
      <h1>
    Payout Report
      </h1>
     
    </section>  
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentData" Runat="Server">
       <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

              <div class="row">
                  <div class="col-md-12" style="background-color:#fff">

                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">Search Crteria</h3>
                        </div>

                        <div class="box-body">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Select Date</label>

                                        <asp:DropDownList ID="DDlstFromdate" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                       <label>User ID</label>
                                        <asp:TextBox ID="TxtUserId" runat="server" CssClass="form-control"></asp:TextBox>
                                     
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                      
                                    
                                    </div>
                                </div>
                            </div>
                            

                             

                        </div>
                        <div class="box-footer">
                               
                           
                             <asp:Button ID="btnSubmit"  CssClass="btn btn-primary" runat="server" Text="Search" OnClick="btnSubmit_Click" />
                             <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                     
                           
                            
                            <div style="float: right">
                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="../user/img/excel123.png" Height="25px" Width="25px" OnClick = "ExportToExcel" /></div>
                        </div>

                    </div>
                </div>
                  <div class="col-md-12">

                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">Details</h3>                           
                            
                        </div>
                    
                        <div class="box-body"  style="background-color:#fff">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <div class="table-responsive">
                                       <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-hover dataTable" Width="100%" AutoGenerateColumns="False" OnRowDataBound="GridView1_RowDataBound">
                                <Columns>
                                      <asp:TemplateField HeaderText="#">
                                         
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chk" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                               
                                    <asp:TemplateField HeaderText="From date">
                                        <ItemTemplate>
                                            <asp:Label ID="lblfromdate" runat="server" Text='<%#Eval("Fromdate") %>'></asp:Label>
                                            
                                               <asp:Label ID="LabMobile" runat="server" Text='<%#Eval("MObile") %>' Visible="false"></asp:Label>
                                            <asp:Label ID="lblId" runat="server" Text='<%#Eval("id") %>' Visible="false"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="To Date">
                                        <ItemTemplate>
                                            <asp:Label ID="lbltodate" runat="server" Text='<%#Eval("ToDate") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                         <asp:TemplateField HeaderText="Associate ID">
                                        <ItemTemplate>
                                            <asp:Label ID="lbluserid" runat="server" Text='<%#Eval("userid") %>'></asp:Label>||
                                              <asp:Label ID="lblusername" runat="server" Text='<%#Eval("associatename") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>                                      
                                     <asp:TemplateField HeaderText="Bank Account">
                                        <ItemTemplate>
                                            A/C:<asp:Label ID="lblaccountno" runat="server" Text='<%#Eval("accountno") %>'></asp:Label><br />
                                            IFSC:   <asp:Label ID="Labelifsccode" runat="server" Text='<%#Eval("ifsccode") %>'></asp:Label>
                                             A/C Holder:   <asp:Label ID="LabelacHolder" runat="server" Text='<%#Eval("associatename") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField> 
                                     
                                             
                                   <%--  <asp:TemplateField HeaderText="Binary Income" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblBindaryincome" runat="server" Text='<%#Eval("BinaryIncome") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>    --%>     
                                       
                                    
                                          <asp:TemplateField HeaderText="Incomee">
                                        <ItemTemplate>
                                            <asp:Label ID="lblbinaryincome" runat="server" Text='<%#Eval("income  ") %>'></asp:Label>
                                        </ItemTemplate>
                                               </asp:TemplateField>
                                     
                                     
                                  
                                     
                                    
                                      <%--   <asp:TemplateField HeaderText="Award Income">
                                        <ItemTemplate>
                                            <asp:Label ID="lblAward" runat="server" Text='<%#Eval("Levelincome") %>'></asp:Label>
                                        </ItemTemplate>  
                                    </asp:TemplateField>--%>
                              
                                      
                                    <asp:TemplateField HeaderText="TotalIncome">
                                        <ItemTemplate>
                                            <asp:Label ID="lblmathingBv" runat="server" Text='<%#Eval("TotalIncome") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>                                    
                                    <%-- <asp:TemplateField HeaderText="AdminCharge">
                                        <ItemTemplate>
                               
                                              <asp:Label ID="lblAdminCharge" runat="server" Text='<%#Eval("AdminCharge") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField> --%>                                                                       
                                    
                                     
                                      <asp:TemplateField HeaderText="Generate Date" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblgeneratedate" runat="server" Text='<%#Eval("GenerateDate") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Status">
                                        <ItemTemplate>
                                            <asp:Label ID="lblstatus" runat="server" Text='<%#Eval("Status1") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                       <asp:TemplateField HeaderText="TransactionID" Visible="false">
                                        <ItemTemplate>
                                            <asp:TextBox ID="TxtTransaction" runat="server"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>  
                                       <asp:TemplateField HeaderText="TransactionID" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblTransaction" runat="server" Text='<%#Eval("TransactionID") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>                                     
                                  
                                    
                                   
                                </Columns>
                            </asp:GridView>
                                            </div>
                                    </div>
                                </div>
                               
                               
                            </div>
                            

                             

                        </div>
                        <div class="box-footer">
                               
                           


                        </div>

                    </div>
                </div>
                  </div>



           
        </ContentTemplate>
          <Triggers>
      
        <asp:PostBackTrigger ControlID = "ImageButton1" />
    </Triggers>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" Runat="Server">
</asp:Content>
