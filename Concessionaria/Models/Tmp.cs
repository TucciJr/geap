using System;
using System.Collections.Generic;

#nullable disable

namespace Concessionaria.Models
{
    public partial class Tmp
    {
        public int IdeVenda { get; set; }
        public string NmeVendedor { get; set; }
        public int? Vale { get; set; }
        public decimal VlrPrecoVenda { get; set; }
        public int Desconto { get; set; }
        public decimal? Comissao { get; set; }
    }
}
