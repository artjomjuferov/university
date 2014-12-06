unit Un_Rab;

interface
   Uses StdCtrls;
   const NN=100;
   Type TMasStr=array[1..NN]of String;
   var Words, NewWords:TMasStr;
       N:integer=0;
   procedure ANALIZ(MEMO:TMemo;var k:integer);
implementation
   procedure ANALIZ(MEMO:TMemo;var k:integer);
      var i:integer;
      begin
         //UnPACK MEMO  to Words

         //Transform/Analiz to NewWords
 //=======================================
         //Dummy
         k:=9;
         NewWords[1]:='abc';
         NewWords[2]:='def';
         NewWords[3]:='ghi';
         NewWords[4]:='jkl';
         NewWords[5]:='mno';
         NewWords[6]:='pqr';
         NewWords[7]:='stu';
         NewWords[8]:='vwx';
         NewWords[9]:='yzz';
      end;
end.
