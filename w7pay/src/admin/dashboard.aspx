﻿<%@ Page Title="" Language="C#" MasterPageFile="~/src/admin/principal.Master" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="w7pay.src.dashboard2" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentPlaceHolder" runat="server">
    <script src="../js/mascara.js"></script>
    <asp:HiddenField ID="hdfIdEmpresa" runat="server" />
    <!-- Title and Top Buttons Start -->
    <div class="page-title-container">
        <div class="row">
            <!-- Title Start -->
            <div class="col-12 col-md-10">
                <a class="muted-link pb-2 d-inline-block hidden" href="#">
                    <span class="align-middle lh-1 text-small">&nbsp;</span>
                </a>
                <h1 class="mb-0 pb-0 display-4" id="title">
                    <asp:Label ID="lblMensagemBoasVindas" runat="server"></asp:Label>
                </h1>
            </div>
            <%--<div class="col-auto d-flex align-items-end justify-content-end">
                <a href="pix.aspx" class="btn btn-primary btn-icon btn-icon-start" target="_blank">
                  <i data-acorn-icon="plus"></i>
                  <span>Novo Pagamento</span></a>
              </div>
              <!-- Title End -->
            </div>--%>
        </div>
    </div>

    <div class="row">
        <div class="col-12">
            <div class="d-flex">
                <h2 class="small-title">Estatísticas em tempo real</h2>
            </div>
            <div class="row mb-2">
                <div class="col-sm-12 col-md-5 col-lg-4 col-xxl-2 mb-1">
                    <div class="">
                        <label class="form-label">Fornecedores</label>
                        <asp:DropDownList ID="ddlFornecedores" runat="server" CssClass="form-control shadow dropdown-menu-end" DataSourceID="sdsFornecedores" DataTextField="name" DataValueField="id">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="sdsFornecedores" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select * from fornecedores order by name"></asp:SqlDataSource>
                    </div>
                </div>
                <div class="col-sm-12 col-md-5 col-lg-4 col-xxl-2 mb-1">
                    <div class="">
                        <label class="form-label">Data Início</label>
                        <asp:TextBox ID="txtDataInicio" runat="server" MaxLength="10"  onkeyup="formataData(this,event);" CssClass="form-control" placeholder="__/__/____" Required></asp:TextBox>
                    </div>
                </div>
                <div class="col-sm-12 col-md-5 col-lg-4 col-xxl-2 mb-1">
                    <div class="">
                        <label class="form-label">Data Final</label>
                        <asp:TextBox ID="txtDataFim" runat="server" MaxLength="10"  onkeyup="formataData(this,event);" CssClass="form-control" placeholder="__/__/____" Required></asp:TextBox>
                    </div>
                </div>
                <div class="col-sm-12 col-md-3 col-lg-2 col-xxl-2 mb-1">
                    <asp:LinkButton ID="lkbFiltro" runat="server"
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
            </div>
        </div>
    </div>
                
    <div class="mb-5">
        <div class="row g-2">
            <div class="col-6 col-md-4 col-lg-2">
                <div class="card h-100 hover-scale-up cursor-pointer">
                    <div class="card-body d-flex flex-column align-items-center">
                        <div class="sw-6 sh-6 rounded-xl d-flex justify-content-center align-items-center border border-primary mb-4">
                            <i data-acorn-icon="cart" class="text-primary"></i>
                        </div>
                        <div class="mb-1 d-flex align-items-center text-alternate text-small lh-1-25">
                            VENDAS TOTAIS
                        </div>
                        <div class="text-primary cta-4">
                            <asp:Label ID="lblTotalVendasRegistradas" runat="server"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-6 col-md-4 col-lg-2">
                <div class="card h-100 hover-scale-up cursor-pointer">
                    <div class="card-body d-flex flex-column align-items-center">
                        <div class="sw-6 sh-6 rounded-xl d-flex justify-content-center align-items-center border border-primary mb-4">
                            <i data-acorn-icon="dollar" class="text-primary"></i>
                        </div>
                        <div class="mb-1 d-flex align-items-center text-alternate text-small lh-1-25">
                            VENDAS TOTAIS
                        </div>
                        <div class="text-primary cta-4">
                            <asp:Label ID="lblTotalVendasPagas" runat="server"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%--<!-- Controls Start -->
    <div class="row mb-2">
    <!-- Search Start -->
    <div class="col-sm-12 col-md-5 col-lg-3 col-xxl-2 mb-1">
        <div class="d-inline-block float-md-start me-1 mb-1 search-input-container w-100 shadow bg-foreground">
            <asp:TextBox ID="txtInicio" runat="server" CssClass="form-control"></asp:TextBox>
 <asp:TextBox ID="txtFinal" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
    </div>
    <!-- Search End -->
            <div class="col-sm-12 col-md-7 col-lg-9 col-xxl-10 text-end mb-1">
        <div class="d-inline-block">
                                    <asp:DropDownList ID="ddlFornecedor" runat="server" CssClass="form-control shadow dropdown-menu-end" DataSourceID="sdsFornecedor" DataTextField="nomecompleto" DataValueField="id">
</asp:DropDownList>
<asp:SqlDataSource ID="sdsFornecedor" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="select name as nomecompleto, id from fornecedores order by name"></asp:SqlDataSource>

            <!-- Export Dropdown Start -->
            <div class="d-inline-block">
                <asp:Button ID="btnFiltrar" runat="server" Text="Filtrar" OnClick="btnFiltrar_Click" />   
            </div>
            <!-- Export Dropdown End -->

            <!-- Length Start -->
            <div class="dropdown-as-select d-inline-block" data-childselector="span">
                 <asp:DropDownList ID="ddlPeriodo" runat="server">
     <asp:ListItem Text="Últimos 7 dias" Value="7"></asp:ListItem>
     <asp:ListItem Text="Últimos 30 dias" Value="30"></asp:ListItem>
     <asp:ListItem Text="Últimos 90 dias" Value="90"></asp:ListItem>
 </asp:DropDownList>
            </div>
            <!-- Length End -->
            </div>
        </div>
    </div>--%>
        <%--<div class="row">--%>
        <!-- Recent Orders Start -->
        <%--<div class="col-xl-4 mb-5">
            <h2 class="small-title">Quantidade de Vendas por Fornecedor</h2>
            <div class="card h-xl-100-card">
                <div class="card-body h-100">
                    <div class="h-100">
                        <div class="row">
                            <div class="col-12 mb-5" style="overflow: auto">
                                <asp:Chart ID="Chart1" runat="server" DataSourceID="sdsDados" Height="1000px" Palette="EarthTones">
                                    <Series>
                                        <asp:Series Name="Series1" ChartType="Bar" YValuesPerPoint="4" XValueMember="nomecliente" YValueMembers="qtde" IsValueShownAsLabel="true"></asp:Series>
                                    </Series>
                                    <ChartAreas>
                                        <asp:ChartArea Name="ChartArea1">
                                            <AxisY IntervalType="Number" LineDashStyle="NotSet">
                                                <MajorGrid Enabled="False" />
                                                <MajorTickMark Enabled="False" />
                                                <LabelStyle Enabled="false" />
                                            </AxisY>
                                            <AxisX IntervalType="Days" LineDashStyle="NotSet" Interval="1">
                                                <MajorGrid Enabled="False" />
                                                <MajorTickMark Enabled="False" />
                                                <LabelStyle Enabled="true" />                                                
                                            </AxisX>
                                            <AxisX2>
                                                <MajorTickMark Enabled="False" />
                                            </AxisX2>
                                        </asp:ChartArea>
                                    </ChartAreas>
                                </asp:Chart>                    
         <asp:SqlDataSource ID="sdsDados" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="select top 10 count(quantity) as qtde, sum(value) as fatura, max(f.name) as nomecliente from vendas v (nolock)
join clientes c on c.id = v.client_id
join locais l on l.id = v.location_id
join maquinas m on m.id = v.machine_id
join produtos p on p.id = v.good_id
join fornecedores f on f.id = p.manufacturer_id
join categorias ct on ct.id = p.category_id
group by f.id
having count(quantity) &gt; 0
order by qtde">
                </asp:SqlDataSource>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>--%>
        <!-- Recent Orders End -->

        <!-- Performance Start -->
        <%--<div class="col-xl-4 mb-5">
            <div class="d-flex">
                <h2 class="small-title">Faturamento por Fornecedor</h2>
            </div>
            <div class="card h-xl-100-card">
                <div class="card-body h-100">
                    <div class="h-100">
                        <div class="row">
                            <div class="col-12 mb-5" style="overflow: auto">
                                    <asp:Chart ID="Chart2" runat="server" DataSourceID="SqlDataSource1" Height="1000px" Palette="EarthTones">
    <Series>
        <asp:Series Name="Series1" ChartType="Bar" YValuesPerPoint="4" XValueMember="nomecliente" LabelFormat="{0:c2}" YValueMembers="fatura" IsValueShownAsLabel="true"></asp:Series>
    </Series>
    <ChartAreas>
            <asp:ChartArea Name="ChartArea1">
    <AxisY IntervalType="Number" LineDashStyle="NotSet">
        <MajorGrid Enabled="False" />
        <MajorTickMark Enabled="False" />
        <LabelStyle Enabled="false" />
    </AxisY>
    <AxisX IntervalType="Days" LineDashStyle="NotSet" Interval="1">
        <MajorGrid Enabled="False" />
        <MajorTickMark Enabled="False" />
        <LabelStyle Enabled="true" />                                                
    </AxisX>
    <AxisX2>
        <MajorTickMark Enabled="False" />
    </AxisX2>
</asp:ChartArea>
    </ChartAreas>
</asp:Chart>                  
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="select top 10 count(quantity) as qtde, sum(value) as fatura, max(f.name) as nomecliente from vendas v (nolock)
join clientes c on c.id = v.client_id
join locais l on l.id = v.location_id
join maquinas m on m.id = v.machine_id
join produtos p on p.id = v.good_id
join fornecedores f on f.id = p.manufacturer_id
join categorias ct on ct.id = p.category_id
group by f.id
having count(quantity) &gt; 0
order by qtde  ">
                </asp:SqlDataSource>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>--%>

        <!-- Performance Start -->
        <%--<div class="col-xl-4 mb-5">
            <div class="d-flex">
                <h2 class="small-title">Faturamento por Produto</h2>
            </div>
            <div class="card h-xl-100-card">
                <div class="card-body h-100">
                    <div class="h-100">
                        <div class="row">
                            <div class="col-12 mb-5" style="overflow: auto">
                                <asp:Chart ID="Chart3" runat="server" DataSourceID="SqlDataSource2" Height="1000px" Palette="EarthTones">
    <Series>
        <asp:Series Name="Series1" ChartType="Bar" YValuesPerPoint="4" XValueMember="nomeproduto" YValueMembers="fatura" IsValueShownAsLabel="true"></asp:Series>
    </Series>
    <ChartAreas>
            <asp:ChartArea Name="ChartArea1">
    <AxisY IntervalType="Number" LineDashStyle="NotSet">
        <MajorGrid Enabled="False" />
        <MajorTickMark Enabled="False" />
        <LabelStyle Enabled="false" />
    </AxisY>
    <AxisX IntervalType="Days" LineDashStyle="NotSet" Interval="1">
        <MajorGrid Enabled="False" />
        <MajorTickMark Enabled="False" />
        <LabelStyle Enabled="true" />                                                
    </AxisX>
    <AxisX2>
        <MajorTickMark Enabled="False" />
    </AxisX2>
</asp:ChartArea>
    </ChartAreas>
</asp:Chart>                 
         <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="select top 10 count(quantity) as qtde, sum(value) as fatura, max(p.name) as nomeproduto from vendas v (nolock)
join clientes c on c.id = v.client_id
join locais l on l.id = v.location_id
join maquinas m on m.id = v.machine_id
join produtos p on p.id = v.good_id
join fornecedores f on f.id = p.manufacturer_id
join categorias ct on ct.id = p.category_id
group by p.id
having count(quantity) &gt; 0
order by fatura desc">
</asp:SqlDataSource>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>--%>
        <!-- Performance End -->

                    <!-- Performance Start -->
       <%-- <div class="col-xl-12 mb-5">
            <div class="d-flex">
                <h2 class="small-title">Quantidade/Faturamento por mês</h2>
            </div>
            <div class="card h-xl-100-card">
                <div class="card-body h-100">
                    <div class="h-100">
                        <div class="row">
                            <div class="col-12 mb-5" style="overflow: auto">
                                                              <asp:Chart ID="Chart4" runat="server" Width="970px" DataSourceID="SqlDataSource3" Palette="EarthTones">
    <Series>
        <asp:Series Name="Series1" ChartType="Spline" YValuesPerPoint="4" XValueMember="mesano" LabelFormat="{0:c2}" YValueMembers="fatura" IsValueShownAsLabel="true"></asp:Series>        
    </Series>
    <ChartAreas>
            <asp:ChartArea Name="ChartArea1">
    <AxisY IntervalType="Number" LineDashStyle="NotSet">
        <MajorGrid Enabled="False" />
        <MajorTickMark Enabled="False" />
        <LabelStyle Enabled="false" />
    </AxisY>
    <AxisX IntervalType="Days" LineDashStyle="NotSet" Interval="1">
        <MajorGrid Enabled="False" />
        <MajorTickMark Enabled="False" />
        <LabelStyle Enabled="true" />                                                
    </AxisX>
    <AxisX2>
        <MajorTickMark Enabled="False" />
    </AxisX2>
</asp:ChartArea>
    </ChartAreas>
</asp:Chart>    
         <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="select top 12 count(quantity) as qtde, sum(value) as fatura, convert(varchar,month(v.occurred_at))+'/'+  convert(varchar,year(v.occurred_at)) as mesano from vendas v (nolock)
join clientes c on c.id = v.client_id
join locais l on l.id = v.location_id
join maquinas m on m.id = v.machine_id
join produtos p on p.id = v.good_id
join fornecedores f on f.id = p.manufacturer_id
join categorias ct on ct.id = p.category_id             
group by month(v.occurred_at), year(v.occurred_at)
having count(quantity) > 0
order by year(v.occurred_at), month(v.occurred_at)">
                </asp:SqlDataSource>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>--%>
        <!-- Performance End -->

    <div>
        <asp:LinkButton ID="rotinaVendas" runat="server" CssClass="dropdown-item export-cvs" onClick="rodarVendas">Vendas</asp:LinkButton>
        <asp:LinkButton ID="rotinaFornecedores" runat="server" CssClass="dropdown-item export-cvs" onClick="rodarFornecedores">Fornecedores</asp:LinkButton>
        <asp:LinkButton ID="rotinaProdutos" runat="server" CssClass="dropdown-item export-cvs" onClick="rodarProdutos">Produtos</asp:LinkButton>

    </div>
</asp:Content>
