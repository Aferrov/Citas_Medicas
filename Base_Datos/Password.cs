using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace Base_Datos
{
    public class Password
    {
        private static readonly string SecretKey = "Sakura1234";

        public string Encriptar(string password)
        {
            if (string.IsNullOrEmpty(password))
                throw new ArgumentException("La contraseña no puede estar vacía.");

            byte[] passwordBytes = Encoding.UTF8.GetBytes(password);
            byte[] keyBytes = Encoding.UTF8.GetBytes(SecretKey);

            for (int i = 0; i < passwordBytes.Length; i++)
            {
                passwordBytes[i] = (byte)(passwordBytes[i] ^ keyBytes[i % keyBytes.Length]);
            }

            return Convert.ToBase64String(passwordBytes);
        }

        public string Desencriptar(string encryptedPassword)
        {
            if (string.IsNullOrEmpty(encryptedPassword))
                throw new ArgumentException("La contraseña encriptada no puede estar vacía.");

            byte[] encryptedBytes = Convert.FromBase64String(encryptedPassword);
            byte[] keyBytes = Encoding.UTF8.GetBytes(SecretKey);

            for (int i = 0; i < encryptedBytes.Length; i++)
            {
                encryptedBytes[i] = (byte)(encryptedBytes[i] ^ keyBytes[i % keyBytes.Length]);
            }

            return Encoding.UTF8.GetString(encryptedBytes);
        }
    }
}

