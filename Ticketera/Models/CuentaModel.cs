using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace Ticketera.Models
{
    public class CuentaModel
    {

        [Required(ErrorMessage = "Debe ingresar el nombre de usuario")]
        [Display(Name = "usuario")]
        public string Username { get; set; }

        [Required]
        [StringLength(100)]
        public string Password { get; set; }

        [Required]
        [StringLength(100)]
        [EmailAddress]
        public string Email { get; set; }
    }
}