using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace _005_ShablonForm
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

       

        private void exitToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void textToolStripMenuItem_Click(object sender, EventArgs e)
        {
            //Task
            Form2 f = new Form2();
            f.Show();
            //MessageBox.Show("TASK");
        }

        private void avtorToolStripMenuItem_Click(object sender, EventArgs e)
        {
            //Avtor
            Form3 f = new Form3();
            f.Show();
           //MessageBox.Show("Avtor");
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Close();
        }
    }
}
