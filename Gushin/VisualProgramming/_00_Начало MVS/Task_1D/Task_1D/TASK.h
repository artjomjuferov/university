#pragma once
  #include <stdlib.h>
  #include <math.h>
#include <stdio.h>

namespace Task_1D {

	using namespace System;
	using namespace System::ComponentModel;
	using namespace System::Collections;
	using namespace System::Windows::Forms;
	using namespace System::Data;
	using namespace System::Drawing;

	/// <summary>
	/// Summary for TASK



	public ref class TASK : public System::Windows::Forms::Form
	{
	public:
		TASK(void)
		{
			InitializeComponent();
			//
			//TODO: Add the constructor code here
			//
		}

	protected:
		/// <summary>
		/// Clean up any resources being used.
		/// </summary>
		~TASK()
		{
			if (components)
			{
				delete components;
			}
		}
	private: System::Windows::Forms::Button^  button1;
	private: System::Windows::Forms::ListBox^  listBox1;



	protected: 

	private:
		/// <summary>
		/// Required designer variable.
		/// </summary>
		System::ComponentModel::Container ^components;

#pragma region Windows Form Designer generated code
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		void InitializeComponent(void)
		{
			System::ComponentModel::ComponentResourceManager^  resources = (gcnew System::ComponentModel::ComponentResourceManager(TASK::typeid));
			this->button1 = (gcnew System::Windows::Forms::Button());
			this->listBox1 = (gcnew System::Windows::Forms::ListBox());
			this->SuspendLayout();
			// 
			// button1
			// 
			this->button1->Font = (gcnew System::Drawing::Font(L"Microsoft Sans Serif", 12, System::Drawing::FontStyle::Bold, System::Drawing::GraphicsUnit::Point, 
				static_cast<System::Byte>(204)));
			this->button1->Image = (cli::safe_cast<System::Drawing::Image^  >(resources->GetObject(L"button1.Image")));
			this->button1->ImageAlign = System::Drawing::ContentAlignment::MiddleLeft;
			this->button1->Location = System::Drawing::Point(458, 265);
			this->button1->Name = L"button1";
			this->button1->Size = System::Drawing::Size(109, 39);
			this->button1->TabIndex = 2;
			this->button1->Text = L"Close";
			this->button1->TextAlign = System::Drawing::ContentAlignment::MiddleRight;
			this->button1->UseVisualStyleBackColor = true;
			this->button1->Click += gcnew System::EventHandler(this, &TASK::button1_Click);
			// 
			// listBox1
			// 
			this->listBox1->Font = (gcnew System::Drawing::Font(L"Microsoft Sans Serif", 9.75F, System::Drawing::FontStyle::Bold, System::Drawing::GraphicsUnit::Point, 
				static_cast<System::Byte>(204)));
			this->listBox1->FormattingEnabled = true;
			this->listBox1->ItemHeight = 16;
			this->listBox1->Location = System::Drawing::Point(9, 9);
			this->listBox1->Name = L"listBox1";
			this->listBox1->Size = System::Drawing::Size(557, 244);
			this->listBox1->TabIndex = 3;
			// 
			// TASK
			// 
			this->AutoScaleDimensions = System::Drawing::SizeF(6, 13);
			this->AutoScaleMode = System::Windows::Forms::AutoScaleMode::Font;
			this->ClientSize = System::Drawing::Size(570, 306);
			this->Controls->Add(this->listBox1);
			this->Controls->Add(this->button1);
			this->Name = L"TASK";
			this->Text = L"TASK";
			this->Load += gcnew System::EventHandler(this, &TASK::TASK_Load);
			this->ResumeLayout(false);

		}
#pragma endregion
private:
	/// </summary>
	//ф-ция From File
  void LoadFromFile(char  *File, ListBox  ^lb){ 
	  char   s[300];
	  FILE  *fp;
      int i;
	  i=0;
	  lb -> Items -> Clear();
	  if(!(fp = fopen(File, "r")))
	  {
		  MessageBox::Show("Error OpenFile","Task_1D",
			  MessageBoxButtons::OK, 
			  MessageBoxIcon::Asterisk);
		  return;
	  }
	  while (!feof(fp))
	  { fgets(s, 300, fp);
	  String ^dd = gcnew String(s);
	  int j = dd -> Length -1;
	  dd = dd -> Substring(0,j);
	  lb ->Items -> Add(dd);
	  i++;
	  }
  }

	private: System::Void button1_Click(System::Object^  sender, System::EventArgs^  e) {
				 this -> Close();
			 }
	private: System::Void TASK_Load(System::Object^  sender, System::EventArgs^  e) {
				 // -> listBox1
           this -> LoadFromFile("c:\\WORK\\CC\\Task_1D\\TASK.txt", this -> listBox1);
			 }
};
}
