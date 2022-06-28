using System;
using System.Collections.Generic;

#nullable disable

namespace Concessionaria.Models
{
    public partial class Vei001Marca
    {
        public Vei001Marca()
        {
            Vei002Modelos = new HashSet<Vei002Modelo>();
        }

        public int IdeMarca { get; set; }
        public string NmeMarca { get; set; }

        public virtual ICollection<Vei002Modelo> Vei002Modelos { get; set; }
    }
}
