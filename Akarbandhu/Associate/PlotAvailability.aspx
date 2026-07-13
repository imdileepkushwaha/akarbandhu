<%@ Page Title="Plot Availability" Language="C#" MasterPageFile="associatemaster.master" AutoEventWireup="true" CodeFile="PlotAvailability.aspx.cs" Inherits="admin_AssociateReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentHeader" runat="Server">
 <li class="breadcrumb-item"><a href="Dashboard.aspx"><i class="feather icon-home"></i></a></li>
                            <li class="breadcrumb-item"><a href="#">Add KYC Detail</a></li>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentData" runat="Server">
     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

        </ContentTemplate>
    </asp:UpdatePanel>

   



                                  <div class="card">
        <div class="card-header">
            <strong>Search Citeria</strong> 
        </div>
        <div class="card-body">
                      
                        <div class="row">
  <div class="col-md-2">
                                <label for="exampleInputEmail1">Select Project :</label>
                            </div>
                            <div class="col-md-3">

                                <asp:DropDownList ID="ddproject" AutoPostBack="true" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddproject_SelectedIndexChanged"></asp:DropDownList>

                            </div>
                            <div class="col-md-2">
                                <label for="exampleInputEmail1">Select Block :</label>
                            </div>
                            <div class="col-md-3">

                                <asp:DropDownList ID="ddblock" CssClass="form-control" runat="server">
                                    <asp:ListItem Value="0">Select Block</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-2">
                                     <asp:Button ID="btnsearch" runat="server" OnClick="btnsearch_Click" CssClass="btn btn-primary btn-sm" Text="Search"></asp:Button>
                            </div>
    
  </div>
        
                    </div>
                    <!-- /.box-body -->

                

                </div>
               
        <!-- /.row -->
     

           <asp:Panel ID="pnllist" runat="server" >
            <div class="row">
                <div class="col-md-12">
                    <!-- general form elements -->
                       <div class="card">
        <div class="card-header">
            <strong>Plot Availability</strong> 
        </div>
        <div class="card-body">
                      


                           <asp:DataList ID="DataList1" runat="server" RepeatColumns="8" OnItemDataBound="DataList1_ItemDataBound" style="width:100%;" RepeatDirection="Horizontal">
          <ItemTemplate>
              <div class="text-center" style="margin:10px 0px;">
              <asp:Literal ID="ltimage" runat="server"></asp:Literal><br />
    <asp:Label ID="lblblockname" runat="server" Text='<%#Eval("blockname") %>'></asp:Label>   -   <asp:Label ID="lblplotno" runat="server" Text='<%#Eval("plotno") %>'></asp:Label>
         <br />  <asp:Label ID="Label1" runat="server" Text='<%#Eval("landarea") %>'></asp:Label>sqft.
              <asp:Label ID="lblstatus" Visible="false" runat="server" Text='<%#Eval("plotstatus2") %>'></asp:Label>
                  </div>
          </ItemTemplate>
      </asp:DataList>




                        </div>
                        <!-- /.box-body -->



                    </div>
                    <!-- /.box -->


                </div>
                <!--/.col (left) -->


            </div>
        </asp:Panel>

   
    <!-- /.content -->
</asp:Content>


