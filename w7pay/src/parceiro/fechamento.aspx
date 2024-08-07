﻿<%@ Page Title="" Language="C#" MasterPageFile="~/src/parceiro/masterparceiro.Master" AutoEventWireup="true"
    CodeBehind="fechamento.aspx.cs" Inherits="w7pay.src.parceiro.fechamento" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="contentPlaceHolder" runat="server">
        <script src="../js/mascara.js"></script>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:HiddenField ID="hdfId" runat="server" />
                <!-- Title and Top Buttons Start -->
                <div class="page-title-container">
                    <div class="row g-0">
                        <!-- Title Start -->
                        <div class="col-auto mb-3 mb-md-0 me-auto">
                            <div class="w-auto sw-md-30">
                                <a href="#" class="muted-link pb-1 d-inline-block breadcrumb-back">
                                    <i data-acorn-icon="chevron-left" data-acorn-size="13"></i>
                                    <span class="text-small align-middle">Administrador</span>
                                </a>
                                <h3 class="mb-0 pb-0 display-6" id="title">Fechamento Financeiro</h3>
                            </div>
                        </div>
                        <!-- Title End -->

                        <!-- Top Buttons Start -->

                        <div class="w-100 d-md-none"></div>

                        <!-- Top Buttons End -->
                    </div>
                </div>
                <!-- Title and Top Buttons End -->

                <!-- Controls Start -->
                <%--<div class="row mb-2">
                    <div class="col-sm-12 col-md-7 col-lg-9 col-xxl-10 text-end mb-1">
                        <div class="d-inline-block">

                            <!-- Export Dropdown Start -->
                            <div class="d-inline-block">
                                <asp:LinkButton ID="btnDownloadExcel" runat="server"
                                        CssClass="btn btn-primary export-excel" OnClick="btnDownloadExcel_Click">Exportar Excel
                                    </asp:LinkButton>                                
                            </div>
                            <!-- Export Dropdown End -->
                            <div>
                                <br />
                                <a runat="server" id="lkDownload" visible="true" href="../../assets/FechamentoFinanceiro.xlsx" style="font-size: 14px; color: #FF5858;">Abrir Excel</a>
                                <br />
                            </div>

                    <asp:UpdateProgress ID="LoaderBar" runat="server" DisplayAfter="300" DynamicLayout="true">
                        <ProgressTemplate>
                        <style type="text/css">
                            .updateprogress-overlay {
                                position: fixed;
                                top: 0;
                                left: 0;
                                width: 100%;
                                height: 100%;
                                background-color: rgba(0, 0, 0, 0.5);
                                z-index: 1000; 
                            }

                            .updateprogress-centered {
                                position: absolute;
                                top: 50%;
                                left: 50%;
                                transform: translate(-50%, -50%);
                                z-index: 1001; 
                            }

                            h1 {
                                font-size: 24px;
                                color: white;
                            }

                            h5 {
                                font-size: 18px;
                                color: white;
                                text-align: center;
                            }
                            </style>
                            <div class="updateprogress-centered">
                                <h1>Gerando arquivo... Por favor aguarde!</h1>
                                <h5>Clique em "Abrir Excel" para abrir o arquivo</h5>
                            </div>
                            <div class="updateprogress-overlay"></div>
                        </ProgressTemplate>
                    </asp:UpdateProgress>--%>
                    <!-- Export Dropdown End -->

                    <!-- Search Start -->
                    <div class="col-sm-12 col-md-5 col-lg-4 col-xxl-4 mb-1">
                        <div class="">
                            <label>Ano</label>
                            <asp:DropDownList ID="ddlAnoMes" runat="server"
                                CssClass="form-control shadow dropdown-menu-end" DataSourceID="sdsAnoMes"
                                DataTextField="anomes" DataValueField="anomes">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="sdsAnoMes" runat="server"
                                ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                SelectCommand=" select distinct substring(convert(varchar, mesano),3,4) as anomes from fechamento">
                            </asp:SqlDataSource>
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-5 col-lg-4 col-xxl-2 mb-1">
                        <div class="">
                            <label>Mês</label>
                            <asp:DropDownList ID="ddlMes" runat="server"
                                CssClass="form-control shadow dropdown-menu-end" DataSourceID="sdsMes"
                                DataTextField="anomes" DataValueField="anomes">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="sdsMes" runat="server"
                                ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                SelectCommand="select distinct substring(convert(varchar, mesano),1,1) as anomes from fechamento">
                            </asp:SqlDataSource>
                        </div>
                    </div>

                    <div class="col-sm-12 col-md-5 col-lg-4 col-xxl-2 mb-1">
                        <label>Atualizar</label><br />
                        <asp:LinkButton ID="lkbFiltro" runat="server"
                            CssClass="btn btn-outline-primary btn-icon btn-icon-start ms-0 ms-sm-1 w-100 w-md-auto"
                            OnClick="lkbFiltro_Click">
                            <i data-acorn-icon="send"></i> Visualizar Fechamento
                        </asp:LinkButton>
                    </div>

                    <div class col-sm-13 col-md-6 col-lg-"


                    <!-- Search End -->
                    <br />
                    <div class="col-sm-12 col-md-7 col-lg-4 col-xxl-12 text-end mb-1">
                        <div class="d-inline-block">
                            <table>
                                <tr>
                                    <td><b>Quant.: </b></td>
                                    <td>
                                        <asp:Label ID="lblQtdeTotal" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td><b>Saldo Vendas: </b></td>
                                    <td>
                                        <asp:Label ID="lblSaldoVendas" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td><b>Taxa Imagine <asp:Label ID="lblTaxa" runat="server" Text=""></asp:Label>% :
                                        </b></td>
                                    <td>
                                        <asp:Label ID="lblValorImagine" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td><b>Saldo Total a Receber: </b></td>
                                    <td>
                                        <asp:Label ID="lblValorAReceber" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>
                            </table>

                            <!-- Export Dropdown Start -->
                            <div class="d-inline-block">
                                <%--<button class="btn p-0" data-bs-toggle="dropdown" type="button"
                                    data-bs-offset="0,3">
                                    <span class="btn btn-icon btn-icon-only btn-foreground-alternate shadow dropdown"
                                        data-bs-delay="0" data-bs-placement="top" data-bs-toggle="tooltip"
                                        title="Export">
                                        <i data-acorn-icon="download"></i>
                                    </span>
                                    </button>>--%>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- Controls End -->
                <!-- Discount List Start -->
                <div class="row">
                    <div class="col-12 mb-5">
                        <asp:Label ID="lblMensagem" runat="server" Text=""></asp:Label>

                        <asp:GridView ID="gdvDetalhes" runat="server" Width="100%" ForeColor="#333333" GridLines="None"
                            AutoGenerateColumns="False" EmptyDataText="Não há dados para visualizar"
                            DataSourceID="sdsDetalhes" DataKeyNames="mesano,idfornecedor">
                            <Columns>
                                <asp:BoundField DataField="mesano" Visible="false" HeaderText="Mês/Ano"
                                    SortExpression="mesano" ReadOnly="True" />
                                <asp:BoundField DataField="fornecedor" Visible="false" HeaderText="Fornecedor"
                                    SortExpression="fornecedor" />
                                <asp:BoundField DataField="ean" HeaderText="EAN" SortExpression="ean" />
                                <asp:BoundField DataField="nomeproduto" HeaderText="Produto"
                                    SortExpression="nomeproduto" />
                                <asp:BoundField DataField="qtde_mes_anterior" HeaderText="Quant. Mês Anterior"
                                    SortExpression="qtde_mes_anterior" />
                                <asp:BoundField DataField="entrada" HeaderText="Entrada" SortExpression="entrada" />
                                <asp:BoundField DataField="valor" DataFormatString="R{0:c2}" HeaderText="Valor"
                                    SortExpression="valor" />
                                <asp:BoundField DataField="qtde_venda" HeaderText="Quant. Venda"
                                    SortExpression="qtde_venda" ItemStyle-Width="50px" />
                                <asp:BoundField DataField="faturamento" DataFormatString="R{0:c2}"
                                    HeaderText="Valor Venda" SortExpression="faturamento" />
                                <asp:BoundField DataField="qtde_dishonest" HeaderText="Quant. Dishonest"
                                    SortExpression="qtde_dishonest" />
                                <asp:BoundField DataField="valor_dishonest" DataFormatString="R{0:c2}"
                                    HeaderText="Valor Dishonest" SortExpression="valor_dishonest" />
                                <asp:BoundField DataField="estoquecd" HeaderText="Estoque CD"
                                    SortExpression="estoquecd" />
                                <asp:BoundField DataField="estoqueloja" HeaderText="Estoque Loja"
                                    SortExpression="estoqueloja" />
                                <asp:BoundField DataField="saldo" HeaderText="Saldo" SortExpression="saldo" />

                            </Columns>
                            <EditRowStyle BackColor="#7C6F57" />
                            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle />
                            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle Height="4em" BackColor="White" ForeColor="#a59e9e" CssClass="fix-margin" />
                            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F8FAFA" />
                            <SortedAscendingHeaderStyle BackColor="#246B61" />
                            <SortedDescendingCellStyle BackColor="#D4DFE1" />
                            <SortedDescendingHeaderStyle BackColor="#15524A" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="sdsDetalhes" runat="server"
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="select idfornecedor,ean, mesano, fornecedor, nomeproduto, case when qtde_mes_anterior = 0 then '-' else convert(varchar,qtde_mes_anterior) end as qtde_mes_anterior, case when entrada = 0 then '-' else convert(varchar,entrada) end as entrada, 
valor, qtde_venda, faturamento, case when qtde_dishonest = 0 then '-' else convert(varchar,qtde_dishonest) end as qtde_dishonest, case when valor_dishonest = 0 then '-' else convert(varchar,valor_dishonest) end as valor_dishonest, 
estoquecd, estoqueloja, saldo from fechamento
where idfornecedor = @id and mesano = convert(varchar,@mes)+'/'+convert(varchar,@ano) order by faturamento desc">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="hdfId" Name="id" PropertyName="Value" />
                                <asp:ControlParameter ControlID="ddlMes" Name="mes" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="ddlAnoMes" Name="ano" PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <br />

                    </div>


            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Content>