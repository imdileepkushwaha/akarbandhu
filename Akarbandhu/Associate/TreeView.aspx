<%@ Page Title="Tree View" Language="C#" MasterPageFile="associatemaster.master" AutoEventWireup="true" CodeFile="TreeView.aspx.cs" Inherits="admin_DownlineReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <style>
        .treeviewclass {
        
        
        }
            /*.treeviewclass div  {
            
           background-color:yellow;
            }
             .treeviewclass div table  {
            
           background-color:green;
            }*/
                .treeviewclass div table tr  {
            
          display: inline-table;
          margin-top:5px;
          margin-bottom:5px;
            }
               
         .treeNode
        {
            transition: all .3s;
            padding: 12px 5px;
            text-align: center;
            /*width: 100%;*/
         
            min-width: 250px !important;
            /*border: 2px solid #8e44ad;*/
            text-decoration:none !important;
            color:white;
            /*color:blue;
            font:14px Arial, Sans-Serif;*/
            border-radius:5px;
              background-color:#FF5252;
              margin:10px 0px;
        }
     .rootNode
        {
            font-size:18px;
            /*width:100%;*/
            /*border-bottom:Solid 1px black;*/
            color:white;
              border-radius:5px;
              background-color:#6bd404;
              margin:10px 0px;
        }
     .leafNode {
            /*border: Dotted 2px black;*/
            padding: 10px;
            background-color: #eeeeee;
            font-weight: bold;
              border-radius:5px;
              background-color:#d705bb;
              
              margin:10px 0px;
        }
     .selectNode 
   {
        background-color:Black;
        /*border:Dotted 2px black;*/
        font-weight:bold;
        color:#fff;
          border-radius:5px;
          background-color:lawngreen;
          
              margin:10px 0px;
    }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHeader" Runat="Server">
  <li class="breadcrumb-item"><a href="Dashboard.aspx"><i class="feather icon-home"></i></a></li>
                            <li class="breadcrumb-item"><a href="#">Treeview Report</a></li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentData" Runat="Server">
       <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <div class="card">
        <div class="card-header">
            <strong>Search Criteria</strong>
        </div>
        <div class="card-body">
                                <div class="row">
                                    <div class="col-md-2">Assoiate Id</div>
                                    <div class="col-md-2">
                                        <asp:TextBox ID="txtuserid" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                  
                                </div>
                              
                                <hr />
                                <div class="row">
                                    <div class="col-md-12">
                                        <asp:Button ID="btnSubmit"  CssClass="btn btn-success" runat="server" Text="Search" OnClick="btnSubmit_Click" />
                                        <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                                    </div>
                                </div>
                </div>
            </div>

             <div class="card">
        <div class="card-header">
            <strong>Tree View</strong>
        </div>
        <div class="card-body">

                        <div class="table-responsive">

                                <asp:Panel ID="pnllist" runat="server" Visible="false">
                     <div class="widget  box-inverse">
            <h4 class="widgettitle">Associate List</h4>
            <div class="widgetcontent">
                 <div class="table-responsive">
                          <div class="table-responsive">
                         `<asp:TreeView ShowLines="true" ID="Account_Chart" runat="server" ExpandDepth="0" ImageSet="Simple"  OnTreeNodePopulate="Account_Chart_TreeNodePopulate" BorderStyle="None" NodeStyle-CssClass="treeNode"
    RootNodeStyle-CssClass="rootNode"
    LeafNodeStyle-CssClass="leafNode" SelectedNodeStyle-CssClass="selectNode" CssClass="treeviewclass" >
                                        <%--    <HoverNodeStyle Font-Underline="True" ForeColor="#5555DD" />
                                            <NodeStyle Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" HorizontalPadding="0px" NodeSpacing="0px" VerticalPadding="0px" />
                                            <ParentNodeStyle Font-Bold="False" />
                                            <SelectedNodeStyle Font-Underline="True" HorizontalPadding="0px" VerticalPadding="0px" ForeColor="#5555DD" />
                                            <LeafNodeStyle ForeColor="#C00000" />
                                            <NodeStyle Font-Names="Tahoma" Font-Size="10pt" ForeColor="Black" HorizontalPadding="5px"
                                                NodeSpacing="0px" VerticalPadding="0px" />--%>
                                        </asp:TreeView>

                        <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                     </div>


                        <asp:Literal ID="ltteam" runat="server"></asp:Literal>
                     </div>

             
            </div>          
                
            </div>
                            </asp:Panel>
                        </div>
                    </div>
                </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" Runat="Server">
</asp:Content>

