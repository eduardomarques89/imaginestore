﻿<%@ Page Title="" Language="C#" MasterPageFile="~/src/admin/principal.Master" AutoEventWireup="true" CodeBehind="faturamento_cliente.aspx.cs" Inherits="w7pay.src.faturamento_cliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentPlaceHolder" runat="server">
    <asp:HiddenField ID="hdfIdEmpresa" runat="server" />
    <script src="js/mascara.js"></script>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <contenttemplate>
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
                            <h1 class="mb-0 pb-0 display-6" id="title">Relatório de Faturamento Clientes</h1>
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
                        <asp:TextBox ID="txtBuscar" runat="server" CssClass="form-control" placeholder="Filtrar"></asp:TextBox>
                        <span class="search-magnifier-icon">
                            <i data-acorn-icon="search"></i>
                        </span>
                        <span class="search-delete-icon d-none">
                            <i data-acorn-icon="close"></i>
                        </span>
                    </div>
                </div>

                <div class="col-sm-12 col-md-5 col-lg-3 col-xxl-2 mb-1">
                    <asp:LinkButton ID="lkbFiltro" runat="server" CssClass="btn btn-outline-primary btn-icon btn-icon-start ms-0 ms-sm-1 w-100 w-md-auto" OnClick="lkbFiltro_Click">
                       <i data-acorn-icon="send"></i>
                       Atualizar Dados
                    </asp:LinkButton>
                </div>
            </div>

            <asp:Label ID="lblErro" runat="server" Text=""></asp:Label>
            <!-- Order List Start -->
            <div class="row">
                <div class="col-12 mb-5">
                    <asp:GridView ID="gdvDados" Width="100%" runat="server" CellPadding="4" EmptyDataText="Não há dados para visualizar" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataSourceID="sdsDados">
                        <alternatingrowstyle />
                        <columns>
                            <asp:BoundField DataField="cliente" HeaderText="Cliente" SortExpression="cliente" ReadOnly="True" />
                            <asp:BoundField DataField="qtde" HeaderText="Quant." SortExpression="qtde" ReadOnly="True" />
                            <asp:BoundField DataField="valor" DataFormatString="{0:c2}" HeaderText="Valor" SortExpression="valor" ReadOnly="True" />
                        </columns>
                        <editrowstyle backcolor="#7C6F57" />
                        <footerstyle backcolor="#1C5E55" font-bold="True" forecolor="White" />
                        <headerstyle />
                        <pagerstyle backcolor="#666666" forecolor="White" horizontalalign="Center" />
                        <rowstyle height="4em" backcolor="White" forecolor="#a59e9e" cssclass="fix-margin" />
                        <selectedrowstyle backcolor="#C5BBAF" font-bold="True" forecolor="#333333" />
                        <sortedascendingcellstyle backcolor="#F8FAFA" />
                        <sortedascendingheaderstyle backcolor="#246B61" />
                        <sorteddescendingcellstyle backcolor="#D4DFE1" />
                        <sorteddescendingheaderstyle backcolor="#15524A" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="sdsDados" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="select cliente, sum(qtde) as qtde, sum(valor) as valor from (
select masked_card_number as cliente, count(*) as qtde, sum(value) as valor from vendas 
where masked_card_number is not null and masked_card_number &lt;&gt; ''
group by masked_card_number
union all
select convert(varchar,id) as cliente, count(*) as qtde, sum(value) as valor from vendas 
where masked_card_number is null and masked_card_number = ''
group by id) as tab
group by cliente
order by valor desc, qtde desc"></asp:SqlDataSource>
                </div>
            </div>
            <!-- Order List End -->
        </contenttemplate>
    </asp:UpdatePanel>
</asp:Content>
