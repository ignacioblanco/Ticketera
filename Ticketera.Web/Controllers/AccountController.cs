using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Mvc;
using Ticketera;
using Ticketera.Entidades;
using System.Data.Entity.Infrastructure;

namespace Ticketera.Controllers
{
    public class AccountController : Controller, IDisposable
    {
        // GET: Account
        public DatabaseContext db;

        public AccountController() {
        }

        public ActionResult Register()
        {
            return View();
        }

        // POST: Account/Register
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Register(Cuenta model)
        {

            db = new DatabaseContext();
            if (ModelState.IsValid)
            {
                db.Cuenta.Add(model);
                db.SaveChanges();
                return RedirectToAction("Login");
            }

            return View(model);
        }

        // GET: Account/Login
        public ActionResult Login()
        {
            return View();
        }

        // POST: Account/Login
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(Cuenta model)
        {
            if (ModelState.IsValid)
            {
                var user = db.Cuenta.FirstOrDefault(u => u.Usuario == model.Usuario && u.Contraseña == model.Contraseña);
                if (user != null)
                {
                    
                    return RedirectToAction("Index", "Home");
                }
                ModelState.AddModelError("", "Invalid username or password.");
            }

            return View(model);
        }

        private static byte[] GenerarSalt(int size)
        {
            using (var rng = new RNGCryptoServiceProvider())
            {
                byte[] salt = new byte[size];
                rng.GetBytes(salt);
                return salt;
            }
        }

        // Combina la contraseña con el salt y genera el hash
        public static string HashPassword(string password, out string salt)
        {
            // Genera un salt de 16 bytes
            byte[] saltBytes = GenerarSalt(16);
            salt = Convert.ToBase64String(saltBytes);

            // Combina el salt y la contraseña
            byte[] passwordBytes = Encoding.UTF8.GetBytes(password);
            byte[] passwordWithSaltBytes = new byte[saltBytes.Length + passwordBytes.Length];
            Buffer.BlockCopy(saltBytes, 0, passwordWithSaltBytes, 0, saltBytes.Length);
            Buffer.BlockCopy(passwordBytes, 0, passwordWithSaltBytes, saltBytes.Length, passwordBytes.Length);

            using (SHA256 sha256Hash = SHA256.Create())
            {
                // Computa el hash de la combinación de salt y contraseña
                byte[] hashBytes = sha256Hash.ComputeHash(passwordWithSaltBytes);

                // Convierte el hash a una cadena en formato hexadecimal
                StringBuilder builder = new StringBuilder();
                for (int i = 0; i < hashBytes.Length; i++)
                {
                    builder.Append(hashBytes[i].ToString("x2"));
                }
                return builder.ToString();
            }
        }

        // Método para verificar una contraseña contra un hash almacenado y un salt
        public static bool VerifyPassword(string password, string storedHash, string storedSalt)
        {
            // Convierte el salt almacenado de Base64 a bytes
            byte[] saltBytes = Convert.FromBase64String(storedSalt);

            // Combina el salt y la contraseña
            byte[] passwordBytes = Encoding.UTF8.GetBytes(password);
            byte[] passwordWithSaltBytes = new byte[saltBytes.Length + passwordBytes.Length];
            Buffer.BlockCopy(saltBytes, 0, passwordWithSaltBytes, 0, saltBytes.Length);
            Buffer.BlockCopy(passwordBytes, 0, passwordWithSaltBytes, saltBytes.Length, passwordBytes.Length);

            using (SHA256 sha256Hash = SHA256.Create())
            {
                // Computa el hash de la combinación de salt y contraseña
                byte[] hashBytes = sha256Hash.ComputeHash(passwordWithSaltBytes);

                // Convierte el hash a una cadena en formato hexadecimal
                StringBuilder builder = new StringBuilder();
                for (int i = 0; i < hashBytes.Length; i++)
                {
                    builder.Append(hashBytes[i].ToString("x2"));
                }

                // Compara el hash computado con el hash almacenado
                return builder.ToString() == storedHash;
            }
        }
    }

}