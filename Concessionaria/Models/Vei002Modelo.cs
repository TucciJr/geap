using System;
using System.Collections.Generic;

#nullable disable

namespace Concessionaria.Models
{
    public partial class Vei002Modelo
    {
        public Vei002Modelo()
        {
            Vei004ModeloVersaos = new HashSet<Vei004ModeloVersao>();
        }

        public int IdeModelo { get; set; }
        public int IdeMarca { get; set; }
        public string CodModelo { get; set; }
        public string NmeModelo { get; set; }

        public virtual Vei001Marca IdeMarcaNavigation { get; set; }
        public virtual ICollection<Vei004ModeloVersao> Vei004ModeloVersaos { get; set; }
    }
}
