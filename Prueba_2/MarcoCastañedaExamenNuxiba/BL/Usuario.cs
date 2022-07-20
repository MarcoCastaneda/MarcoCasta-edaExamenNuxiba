using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BL
{
    public class Usuario
    {


        public static ML.Result GetAll()

        {
            ML.Result result = new ML.Result();
            try
            {
                using (SqlConnection context = new SqlConnection(DL.Conexion.GetConnection()))
                {
                    string query = "UsuarioGetAll";

                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.Connection = context;
                        cmd.CommandText = query;
                        cmd.CommandType = CommandType.StoredProcedure;

                        DataTable tableMateria = new DataTable();
                        SqlDataAdapter da = new SqlDataAdapter(cmd);

                        da.Fill(tableMateria);

                        if (tableMateria.Rows.Count > 0)
                        {
                            result.Objects = new List<object>();
                            foreach (DataRow row in tableMateria.Rows)
                            {
                                ML.Usuario usuario = new ML.Usuario();
                                usuario.UserId = int.Parse(row[0].ToString());
                                usuario.Login = row[1].ToString();
                                usuario.Nombre = row[2].ToString();
                                usuario.Paterno = row[3].ToString();
                                usuario.Materno = row[4].ToString(); 
                                usuario.Sueldo = decimal.Parse(row[5].ToString());
                                usuario.Fecha = row[6].ToString();


                                result.Objects.Add(usuario);

                            }
                            result.Correct = true;
                        }
                        else
                        {
                            result.Correct = false;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                result.Correct = false;
                result.ErrorMessage = ex.Message;
            }
            return result;
        }


        public static ML.Result Add(ML.Usuario usuario)
        {
            ML.Result result = new ML.Result();
            try
            {
                using (SqlConnection context = new SqlConnection(DL.Conexion.GetConnection()))
                {
                    string query = "UsuarioAdd";
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.Connection = context;
                        cmd.CommandText = query;
                        cmd.CommandType = CommandType.StoredProcedure;

                        SqlParameter[] collection = new SqlParameter[5];

                        collection[0] = new SqlParameter("Login", SqlDbType.VarChar);
                        collection[0].Value = usuario.Login;

                        collection[1] = new SqlParameter("Nombre", SqlDbType.VarChar);
                        collection[1].Value = usuario.Nombre;


                        collection[2] = new SqlParameter("Paterno", SqlDbType.VarChar);
                        collection[2].Value = usuario.Paterno;

                        collection[3] = new SqlParameter("Materno", SqlDbType.VarChar);
                        collection[3].Value = usuario.Materno;

                        collection[4] = new SqlParameter("Sueldo", SqlDbType.Int);
                        collection[4].Value = usuario.empleado.Sueldo;


                        cmd.Parameters.AddRange(collection);
                        cmd.Connection.Open();
                        int RowsAffected = cmd.ExecuteNonQuery();

                        if (RowsAffected > 0)
                        {
                            result.Correct = true;
                        }

                        else
                        {
                            result.Correct = false;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                result.Correct = false;
                result.ErrorMessage = ex.Message;
            }
            return result;
        }



        public static ML.Result Delete(ML.Usuario usuario)
        {
            ML.Result result = new ML.Result();

            try
            {
                using (SqlConnection context = new SqlConnection(DL.Conexion.GetConnection()))
                {
                    String query = "UsuarioDelete";

                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = query;
                    cmd.Connection = context;
                    cmd.CommandType = CommandType.StoredProcedure;

                    SqlParameter[] collection = new SqlParameter[1];
                    collection[0] = new SqlParameter("@UserId", SqlDbType.Int);
                    collection[0].Value = usuario.UserId;

                    cmd.Parameters.AddRange(collection);
                    cmd.Connection.Open();

                    int RowsAffected = cmd.ExecuteNonQuery();
                    if (RowsAffected > 0)
                    {
                        result.Correct = true;
                    }
                    else
                    {

                        result.Correct = false;
                    }





                }
            }
            catch (Exception ex)
            {
                result.Correct = false;
                result.ErrorMessage = ex.Message;
            }

            return result;
        }




        public static ML.Result Convertir()
        {

            ML.Usuario usuario = new ML.Usuario();
            
            ML.Result result = BL.Usuario.GetAll();

            if (result.Correct == true)
            {
                usuario.Usuarios = result.Objects;
                TextWriter tw = new StreamWriter(@"C:\Users\digis\Documents\MCastaneda\MaCastaneda\Nuxiba\Prueba_2\MarcoCastañedaExamenNuxiba\Descarga\Usuarios.txt.txt");

                foreach (ML.Usuario usuario1 in usuario.Usuarios)
                {
                tw.WriteLine("El Login del usuario es: " + usuario1.Login + " " +
               "Nombre del usuario es : " + usuario1.Nombre + " " +
               "El Apellido Paterno es: " + usuario1.Paterno + " " +
               "El Apellido Materno es: " + usuario1.Materno + " ");
                }

                tw.Close();
                    
            }
        
             

          

            return result;
        }








    }














    
}
