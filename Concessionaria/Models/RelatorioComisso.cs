#nullable disable

namespace Concessionaria.Models
{
    public partial class RelatorioComissao
    {
        public string Vendedor { get; set; }
        public int? QuantidadeVendas { get; set; }
        public int? QuantidadeVales { get; set; }
        public decimal? TotalVendas { get; set; }
        public decimal? TotalFinalComissao { get; set; }
    }
}
