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

namespace w7pay.src
{
    public partial class vendas_fornecedor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    //hdfIdEmpresa.Value = Session["idempresa"].ToString();
                }
                catch
                {
                    Response.Redirect("../sessao.aspx", false);
                }

                using (IDataReader reader = DatabaseFactory.CreateDatabase("ConnectionString").ExecuteReader(CommandType.Text,
                              "select f.id, max(f.name) as nomefornecedor, count(*) as qtde, cast(sum(v.[value]) as decimal(10,2)) as valor from vendas v join produtos p on p.id = v.good_id join fornecedores f on f.id = p.manufacturer_id group by f.id order by valor desc"))
                {
                    while (reader.Read())
                    {
                        ltrVendas.Text += "<div class='col-6 col-md-4 col-lg-2'><div class='card h-100 hover-scale-up cursor-pointer'><div class='card-body d-flex flex-column align-items-center'><div class='sw-6 sh-6 rounded-xl d-flex justify-content-center align-items-center border border-primary mb-4'><i data-acorn-icon='cart' class='text-primary'></i></div><div class='mb-1 d-flex align-items-center text-alternate text-small lh-1-25'>" + reader["nomefornecedor"].ToString() +"</div><div class='text-primary cta-4'>Quant.: " + reader["qtde"].ToString() +" | R$ " + reader["valor"].ToString() +"</div></div></div></div>";
                    }
                }            
            }
        }

    }
}