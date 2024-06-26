﻿using RestSharp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.Tab;

namespace w7pay.src
{
    public partial class estoque : System.Web.UI.Page
    {
        public class inventories
        {
            /// <summary>
            /// Nome do campo.
            /// </summary>
            public string distribution_center_id { get; set; }

            public string total_quantity { get; set; }
            public string committed_quantity { get; set; }
        }

        public class itemestoque
        {
            /// <summary>
            /// Nome do campo.
            /// </summary>
            public int id { get; set; }

            public int type { get; set; }
            public int manufacturer_id { get; set; }
            public int category_id { get; set; }
            public int name { get; set; }
            public int upc_code { get; set; }
            public int barcode { get; set; }
            public int external_id { get; set; }
            public int url { get; set; }
            public List<inventories> inventoriess { get; set; }
        }

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

                //atualizacao.GETEstoque();               
            }
        }

        protected void lkbFiltro_Click(object sender, EventArgs e)
        {
            sdsDados.SelectCommand = "select e.id, f.name as fornecedor, ct.descricao, e.name as produto, p.image, e.upc_code, e.total_quantity, e.committed_quantity, sald from estoque1 e (nolock) join fornecedores f on f.id = e.manufacturer_id join categorias ct on ct.id = e.category_id join produtos p on p.id = e.id where e.name like '%" + txtBuscar.Text + "%' and f.id = '" + ddlFornecedores.SelectedValue + "' order by f.name, ct.descricao, e.NAME";
            gdvDados.DataBind();
        }
    }
}