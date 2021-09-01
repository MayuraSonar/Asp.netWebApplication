using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace ELibrary
{
    public partial class adminauthormanagement : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
           // GridView1.DataBind();
        }
        // Go Button
        protected void Button1_Click(object sender, EventArgs e)
        {
            getAuthorByID();
        }
        // Add Button
        protected void Button2_Click(object sender, EventArgs e)
        {
            if (checkIfAuthorExists())
            {
                Response.Write("<script>alert('Author with this ID already Exist. You cannot add another Author with the same Author ID');</script>");
            }
            else
            {
                addNewAuthor();
            }
        }
        // update button
        protected void Button3_Click(object sender, EventArgs e)
        {
            if (checkIfAuthorExists())
            {
                updateAuthor();

            }

            else
            {
                Response.Write("<script>alert('Author does not exists');</script>");
            }
        }
        // delete button
        protected void Button4_Click(object sender, EventArgs e)
        {
            if (checkIfAuthorExists())
            {
                deleteAuthor();
            }

            else
            {
                Response.Write("<script>alert('Author does not exists')</script>");
            }
        }

        // Add custom method

        bool checkIfAuthorExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from author_master_tbl where author_id='" + TextBox1.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }


            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }


        void addNewAuthor()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO author_master_tbl(author_id,author_name) values (@author_id,@author_name)", con);
                cmd.Parameters.AddWithValue("@author_id", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@author_name", TextBox2.Text.Trim());
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Author Added Successfully');</script>");
                clearForm();
                GridView1.DataBind();
            }
            catch (Exception e)
            {
                Response.Write("<script>alert('" + e.Message + "');</script>");
            }
        }
        void getAuthorByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from author_master_tbl where author_id='" + TextBox1.Text.Trim() + "';", con);
               // SqlDataReader dr = cmd.ExecuteReader();
                //if(dr.HasRows)
                //{

                //        TextBox2.Text = dr.GetValue(0).ToString();

                //}

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    TextBox2.Text = dt.Rows[0][1].ToString();

                }

                else
                {
                    Response.Write("<script>alert('Invalid Author Id');</script>");
                }
            }

            catch (Exception e)
            {
                Response.Write("<script>alert('" + e.Message + "');</script>");
            }
        }

        void updateAuthor()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("UPDATE author_master_tbl set author_name=@author_name where author_id='" + TextBox1.Text.Trim() + "'", con);
                cmd.Parameters.AddWithValue("@author_name", TextBox2.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>('Author updated Successfully');</script>");
                clearForm();
                GridView1.DataBind();

            }

            catch (Exception e)
            {
                Response.Write("<script>alert('" + e.Message + "');</script>");
            }
        }
        void clearForm()
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
        }
        void deleteAuthor()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("Delete from author_master_tbl where author_id='" + TextBox1.Text.Trim() + "'", con);
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Author deleted Successfully');</script>");
                clearForm();
                GridView1.DataBind();
            }

            catch (Exception e)
            {
                Response.Write("<script>alert('" + e.Message + "');</script>");
            }
        }
    }
}
    