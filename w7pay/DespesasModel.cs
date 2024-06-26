﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.IO;
using System.Linq;
using System.Text;

namespace w7pay
{
    internal class DespesasModel
    {
        [Description("Codigo")]
        public int Id { get; set; }

        [Description("Fornecedor")]
        public string Fornecedor { get; set; }

        [Description("Vencimento")]
        public DateTime Vencimento { get; set; }

        [Description("Valor Devido")]
        public decimal ValorDevido { get; set; }

        [Description("Data do Pagamento")]
        public DateTime Pagamento { get; set; }

        [Description("Valor Pago")]
        public decimal ValorPago { get; set; }

        [Description("Descrição")]
        public string Descricao { get; set; }
    }
}