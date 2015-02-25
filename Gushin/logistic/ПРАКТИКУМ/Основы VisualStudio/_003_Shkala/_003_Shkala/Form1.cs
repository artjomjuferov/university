using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace _003_Shkala
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
      

        int rR, rG, rB;
        double minZ = -100.0, maxZ = 100.0;
        int  Mmin   = 0,    Mmax  = 1000;
        int kIZO = 25;

        void GetRGB(int m )
        {            
            int di = m / 256;   int mo = m % 256;
            switch (di)
            {
                case 0: rR = 0; rG = mo; rB = 255; break;
                case 1: rR = 0; rG = 255; rB = 255 - mo; break;
                case 2: rR = mo; rG = 255; rB = 0; break;
                case 3: rR = 255; rG = 255 - mo; rB = 0; break;
                case 4: rR = 255; rG = 0; rB = mo; break;
                case 5: rR = 255 - mo; rG = 0; rB = 255; break;
            }
        }


        private void button2_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            minZ = Convert.ToDouble(textBox1.Text);
            maxZ = Convert.ToDouble(textBox2.Text);            
            kIZO = int.Parse(textBox3.Text);
            double z_rab=(maxZ - minZ)/kIZO;
            listBox1.Items.Clear();  
            string s0, s1, s2, s3; // for zr, rR, rG, rB
            for (int i = 0; i < kIZO; ++i)
            {
               double z1=minZ + i*z_rab, z2= z1+ z_rab;
               s1 = Convert.ToString(Math.Round(z1,2));
               s2 = Convert.ToString(Math.Round(z2,2));
               listBox1.Items.Add((i + 1).ToString() + " ->  " + s1+" <->"+s2);
            }
            pictureBox1.Refresh();
        }

        private void pictureBox1_Paint(object sender, PaintEventArgs e)
        {
            int dm = (Mmax - Mmin) / (kIZO - 1); string sr, sg, sb;
            Font font = new Font("Arial", 9); // 3
            SolidBrush brush1 = new SolidBrush(Color.Navy); //4
            listBox2.Items.Clear();
             for( int i=0; i< kIZO;i++) 
             {               
                  int  m_rab = Mmin + i*dm; GetRGB(m_rab);
                  sr = rR.ToString(); sg = rG.ToString(); sb = rB.ToString();
                  string st = (i + 1).ToString() + " " + sr + " " + sg + " " + sb;
                  listBox2.Items.Add(st);
                  // Изменение цвета в цикле 
                  using (Pen pen = new Pen(Color.FromArgb(255, rR, rG, rB), 20))
                  {
                      e.Graphics.DrawLine(pen, (i + 1) * 30, 20, (i + 1) * 30, 520 );
                  }

                  string s = (i+1).ToString();                  
                  float x = (i + 1) * 30-10; float у = 520.0F;
                  e.Graphics.DrawString(s, font, brush1, x, у);                   
             }
             font.Dispose(); // 5
             brush1.Dispose(); // б 
        }                     
    }
}
