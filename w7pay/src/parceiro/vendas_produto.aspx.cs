﻿using Microsoft.Practices.EnterpriseLibrary.Data;
using RestSharp;
using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;

namespace w7pay.src.parceiro
{
    public partial class vendas_produto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    hdfIdEmpresa.Value = Session["idempresa"].ToString();
                    txtDataInicio.Text = DateTime.Now.Date.AddDays(-7).ToString(CultureInfo.CreateSpecificCulture("pt-BR")).Substring(0, 10);
                    txtDataFim.Text = DateTime.UtcNow.ToString(CultureInfo.CreateSpecificCulture("pt-BR")).Substring(0, 10);//DateTime.Now.Date.ToShortDateString();
                }
                catch
                {
                    Response.Redirect("../sessao.aspx", false);
                }

                using (IDataReader reader = DatabaseFactory.CreateDatabase("ConnectionString").ExecuteReader(CommandType.Text,
                              "select v.good_id, max(v.product_name) as nomeproduto, count(*) as qtde, cast(sum(v.[value]) as decimal(10,2)) as valor from vendas v where v.manufacturer_id = '" + Session["idempresa"].ToString() + "' and v.occurred_at > getdate() - 7 group by v.good_id order by valor desc"))
                {
                    while (reader.Read())
                    {
                        ltrVendas.Text += "<div class='col-6 col-md-4 col-lg-2'><div class='card h-100 hover-scale-up cursor-pointer'><div class='card-body d-flex flex-column align-items-center'><div class='sw-6 sh-6 rounded-xl d-flex justify-content-center align-items-center border border-primary mb-4'><i data-acorn-icon='cart' class='text-primary'></i></div><div class='mb-1 d-flex align-items-center text-alternate text-small lh-1-25'>" + reader["nomeproduto"].ToString() +"</div><div class='text-primary cta-4'>Quant.: " + reader["qtde"].ToString() +" | R$ " + reader["valor"].ToString() +"</div></div></div></div>";
                    }
                }            
            }
        }

     
        protected void lkbFiltro_Click(object sender, EventArgs e)
        {
            string filtrodata = "", filtroid = "";
            DateTime datainicio = Convert.ToDateTime(txtDataInicio.Text.Substring(3, 2) + "/" + txtDataInicio.Text.Substring(0, 2) + "/" + txtDataInicio.Text.Substring(6, 4));
            DateTime datafim = Convert.ToDateTime(txtDataFim.Text.Substring(3, 2) + "/" + txtDataFim.Text.Substring(0, 2) + "/" + txtDataFim.Text.Substring(6, 4));
            filtrodata = " and occurred_at >= '" + datainicio + "' and occurred_at <= '" + datafim + "' ";

            if (ddlProduto.SelectedValue != "0")
                filtroid = " and v.product_id = '" + ddlProduto.SelectedValue + "'";
            ltrVendas.Text = "";
            using (IDataReader reader = DatabaseFactory.CreateDatabase("ConnectionString").ExecuteReader(CommandType.Text,
                              "select v.good_id, max(v.product_name) as nomeproduto, count(*) as qtde, cast(sum(v.[value]) as decimal(10,2)) as valor from vendas v  where v.manufacturer_id = '" + Session["idempresa"].ToString() + "' " + filtroid + " " + filtrodata + " group by v.good_id  order by valor desc"))
            {
                while (reader.Read())
                {
                    ltrVendas.Text += "<div class='col-6 col-md-4 col-lg-2'><div class='card h-100 hover-scale-up cursor-pointer'><div class='card-body d-flex flex-column align-items-center'><div class='sw-6 sh-6 rounded-xl d-flex justify-content-center align-items-center border border-primary mb-4'><i data-acorn-icon='cart' class='text-primary'></i></div><div class='mb-1 d-flex align-items-center text-alternate text-small lh-1-25'>" + reader["nomeproduto"].ToString() + "</div><div class='text-primary cta-4'>Quant.: " + reader["qtde"].ToString() + " | R$ " + reader["valor"].ToString() + "</div></div></div></div>";
                }
            }
        }

        protected void lkbLimpar_Click(object sender, EventArgs e)
        {
            txtDataInicio.Text = DateTime.Now.Date.AddDays(-7).ToString(CultureInfo.CreateSpecificCulture("pt-BR")).Substring(0, 10);
            txtDataFim.Text = DateTime.UtcNow.ToString(CultureInfo.CreateSpecificCulture("pt-BR")).Substring(0, 10);//DateTime.Now.Date.ToShortDateString();
            ddlProduto.SelectedValue = "0";
            ltrVendas.Text = "";
            using (IDataReader reader = DatabaseFactory.CreateDatabase("ConnectionString").ExecuteReader(CommandType.Text,
                              "select v.good_id, max(v.product_name) as nomeproduto, count(*) as qtde, cast(sum(v.[value]) as decimal(10,2)) as valor from vendas v  where v.manufacturer_id = '" + Session["idempresa"].ToString() + "' and v.occurred_at > getdate() - 7 group by v.good_id  order by valor desc"))
            {
                while (reader.Read())
                {
                    ltrVendas.Text += "<div class='col-6 col-md-4 col-lg-2'><div class='card h-100 hover-scale-up cursor-pointer'><div class='card-body d-flex flex-column align-items-center'><div class='sw-6 sh-6 rounded-xl d-flex justify-content-center align-items-center border border-primary mb-4'><i data-acorn-icon='cart' class='text-primary'></i></div><div class='mb-1 d-flex align-items-center text-alternate text-small lh-1-25'>" + reader["nomeproduto"].ToString() + "</div><div class='text-primary cta-4'>Quant.: " + reader["qtde"].ToString() + " | R$ " + reader["valor"].ToString() + "</div></div></div></div>";
                }
            }
        }
    }
}