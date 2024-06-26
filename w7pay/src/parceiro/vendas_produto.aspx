﻿<%@ Page Title="" Language="C#" MasterPageFile="~/src/parceiro/masterparceiro.Master" AutoEventWireup="true" CodeBehind="vendas_produto.aspx.cs" Inherits="w7pay.src.parceiro.vendas_produto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentPlaceHolder" runat="server">
    <asp:HiddenField ID="hdfIdEmpresa" runat="server" />
    <script src="../js/mascara.js"></script>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <!-- Title and Top Buttons Start -->
            <div class="page-title-container">
                <div class="row">
                    <!-- Title Start -->
                    <div class="col-auto mb-3 mb-md-0 me-auto">
                        <div class="w-auto sw-md-30">
                            <a href="dashboard.aspx" class="muted-link pb-1 d-inline-block breadcrumb-back">
                                <i data-acorn-icon="chevron-left" data-acorn-size="13"></i>
                                <span class="text-small align-middle">Página Inicial</span>
                            </a>
                            <h1 class="mb-0 pb-0 display-6" id="title">Relatório de Vendas/Produto</h1>
                        </div>
                    </div>
                    <!-- Title End -->
                </div>
            </div>
            <!-- Title and Top Buttons End -->

                                  <!-- Controls Start -->
            <div class="row mb-2">
                <!-- Search Start -->
                <div class="col-sm-12 col-md-5 col-lg-3 col-xxl-2 mb-1">
                    <div class="d-inline-block float-md-start me-1 mb-1 search-input-container w-100 shadow bg-foreground">
                       <asp:DropDownList ID="ddlProduto" CssClass="form-control" runat="server" DataSourceID="sdsProduto" DataTextField="product_name" DataValueField="product_id" AppendDataBoundItems="true">
    <asp:ListItem Text="Selecione um produto" Value="0"></asp:ListItem>
</asp:DropDownList>
<asp:SqlDataSource ID="sdsProduto" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT good_id as product_id, max(product_name) as product_name FROM vendas v where v.manufacturer_id = @id group by good_id">
    <SelectParameters>
        <asp:SessionParameter Name="id" SessionField="idempresa" />
    </SelectParameters>
</asp:SqlDataSource>
                    </div>
                </div>
                <div class="col-sm-12 col-md-5 col-lg-3 col-xxl-2 mb-1">
                    <div class="d-inline-block float-md-start me-1 mb-1 search-input-container w-100 shadow bg-foreground">
                        <asp:TextBox ID="txtDataInicio" runat="server" MaxLength="10"  onkeyup="formataData(this,event);" CssClass="form-control" placeholder="__/__/____" Required></asp:TextBox>
                    </div>
                </div>
                <div class="col-sm-12 col-md-5 col-lg-3 col-xxl-2 mb-1">
                    <div class="d-inline-block float-md-start me-1 mb-1 search-input-container w-100 shadow bg-foreground">
                        <asp:TextBox ID="txtDataFim" runat="server" MaxLength="10"  onkeyup="formataData(this,event);" CssClass="form-control" placeholder="__/__/____" Required></asp:TextBox>
                    </div>
                </div>
                <div class="col-sm-12 col-md-5 col-lg-3 col-xxl-2 mb-1">
                    <asp:LinkButton ID="LinkButton1" runat="server"
                        CssClass="btn btn-outline-primary btn-icon btn-icon-start ms-0 ms-sm-1 w-100 w-md-auto" OnClick="lkbFiltro_Click">
   <i data-acorn-icon="search"></i> Atualizar
                    </asp:LinkButton>
                </div>
                <div class="col-sm-12 col-md-5 col-lg-3 col-xxl-2 mb-1">
                    <asp:LinkButton ID="lkbLimpar" runat="server"
                        CssClass="btn btn-outline-primary btn-icon btn-icon-start ms-0 ms-sm-1 w-100 w-md-auto" OnClick="lkbLimpar_Click">
<i data-acorn-icon="close"></i> Limpar
                    </asp:LinkButton>
                </div>
                <!-- Search End -->
                                      
                <div class="col-sm-12 col-md-7 col-lg-9 col-xxl-10 text-end mb-1">
                    <div class="d-inline-block">
                        <!-- Print Button Start -->
                        <%--<asp:LinkButton ID="btnImprimir" runat="server" CssClass="btn btn-icon btn-icon-only btn-foreground-alternate shadow"><i data-acorn-icon="print"></i></asp:LinkButton>--%>
                        <!-- Print Button End -->

                        <!-- Export Dropdown Start -->
                       <%-- <div class="d-inline-block">
                            <button class="btn p-0" data-bs-toggle="dropdown" type="button" data-bs-offset="0,3">
                                <span
                                    class="btn btn-icon btn-icon-only btn-foreground-alternate shadow dropdown"
                                    data-bs-delay="0"
                                    data-bs-placement="top"
                                    data-bs-toggle="tooltip"
                                    title="Export">
                                    <i data-acorn-icon="download"></i>
                                </span>
                            </button>
                            <div class="dropdown-menu shadow dropdown-menu-end">
                                <asp:LinkButton ID="btnDownloadExcel" runat="server" CssClass="dropdown-item export-excel">Excel</asp:LinkButton>
                                <asp:LinkButton ID="btnDownloadPDf" runat="server" CssClass="dropdown-item export-pdf">Pdf</asp:LinkButton>
                                <asp:LinkButton ID="btnDownloadCSV" runat="server" CssClass="dropdown-item export-cvs">Csv</asp:LinkButton>
                            </div>

                        </div>--%>
                        <!-- Export Dropdown End -->

                        <!-- Length Start -->
                        <%--<div class="dropdown-as-select d-inline-block" data-childselector="span">
                            <button class="btn p-0 shadow" type="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-bs-offset="0,3">
                                <span
                                    class="btn btn-foreground-alternate dropdown-toggle"
                                    data-bs-toggle="tooltip"
                                    data-bs-placement="top"
                                    data-bs-delay="0"
                                    title="Item Count">10 Items
                                </span>
                            </button>
                            <div class="dropdown-menu shadow dropdown-menu-end">
                                <asp:LinkButton ID="btnView5" runat="server" CssClass="dropdown-item">5 Itens</asp:LinkButton>
                                <asp:LinkButton ID="btnView20" runat="server" CssClass="dropdown-item active">20 Itens</asp:LinkButton>
                                <asp:LinkButton ID="btnView50" runat="server" CssClass="dropdown-item">50 Itens</asp:LinkButton>
                            </div>
                        </div>--%>
                        <!-- Length End -->
                    </div>
                </div>
            </div>
            <asp:Label ID="lblErro" runat="server" Text=""></asp:Label>
            <!-- Order List Start -->
            <div class="row">
                <div class="row g-2">
                    <asp:Literal ID="ltrVendas" runat="server"></asp:Literal>
                </div>
            </div>
            <!-- Order List End -->
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
