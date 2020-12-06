`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/28 22:09:57
// Design Name: 
// Module Name: INSTMEM
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module INSTMEM(Addr,Inst);//指令存储器
input[31:0]Addr;
//input InsMemRW;//状态为'0'，写指令寄存器，否则为读指令寄存器
output[31:0]Inst;
wire[31:0]Rom[31:0];
    assign Rom[5'h00] = 32'b001101_00001_00001_00000_00000_000100;//ori，使&1=4
    assign Rom[5'h01] = 32'b001000_00011_00011_00000_00000_001000;//addi,使&3=8
    assign Rom[5'h02] = 32'b000000_00001_00011_00010_00000_100000;//add,使&2=&1+&3=12
    assign Rom[5'h03] = 32'b000000_00011_00001_00100_00000_100010;//sub,使$4=$3-$1=4
    assign Rom[5'h04] = 32'b000000_00001_00011_00101_00000_100100;//and,使&5=&1与&3=0
    assign Rom[5'h05] = 32'b000000_00001_00011_00110_00000_100100;//or,使&6=&1或&3=12  
    assign Rom[5'h06] = 32'b001100_00001_00111_00000_00000_000111;//andi,&7=&1与7=4
    assign Rom[5'h07] = 32'b001101_00001_01000_00000_00000_000111;//ori,&8=&1与7=7
    assign Rom[5'h08] = 32'b100011_00001_01001_0000000000010000;//lw,&9=&1+4=5
    assign Rom[5'h09] = 32'b101011_00001_01010_00000_00000_010000;//sw,&10=20
    assign Rom[5'h0A] = 32'b000100_00001_00100_0000000000000010;//,beq,若&1=&4，则下一个指令地址为PC+4+8
    assign Rom[5'h0B] = 32'bXXXXXX_XXXXX_XXXXX_XXXXX_XXXXX_XXXXXX;//空指令
    assign Rom[5'h0C] = 32'bXXXXXX_XXXXX_XXXXX_XXXXX_XXXXX_XXXXXX;//空指令
    assign Rom[5'h0D] = 32'b100011_00000_01011_00000_00000_000100;//lw,&11=1
    assign Rom[5'h0E] = 32'b000101_00001_00011_0000000000000011;//bne,若&1！=&3，则下一个指令地址为PC+4+12
    assign Rom[5'h0F] = 32'b100011_00000_01101_00000_00000_000100;//lw,&13=1
    assign Rom[5'h10] = 32'b100011_00000_01110_00000_00000_000100;//lw,&14=1
    assign Rom[5'h11] = 32'b100011_00000_01111_00000_00000_000100;//lw,&15=1
    assign Rom[5'h12] = 32'b100011_00000_01100_00000_00000_000100;//lw,&12=1
    assign Rom[5'h13] = 32'b000010_00000_00000_00000_00000_001111;//j,跳转至第15条指令
    

//assign Rom[5'h00] = 32'b001000_00000_00001_0000000000001000;//addi $1,$0,8 $1=8
//assign Rom[5'h01] = 32'b001101_00000_00010_00000000000001100;//ori $2,$0,12 $2=12
//assign Rom[5'h02] = 32'b000000_00010_00001_00011_000001_00000;//$3=$2+$1=20
//assign Rom[5'h03] = 32'b000000_00010_00001_00100_000001_00010;//$4=$2-$1=4
//assign Rom[5'h04] = 32'b000000_00011_00010_00101_000001_00100;//$5=$2&$3=0
//assign Rom[5'h05] = 32'b000000_00011_00010_00110_000001_00101;//$6=$2|$3=7  
//assign Rom[5'h06] = 32'b001100_00011_00111_0000000000000010;//$7=$3&2=0
//assign Rom[5'h07] = 32'b001101_00011_01000_0000000000000010;//$8=$3|2=7
//assign Rom[5'h08] = 32'b001000_00110_01001_0000000000000010;//$9=$6+2=9
//assign Rom[5'h09] = 32'b100011_01001_01010_0000000000001000;//取出数放在$10=$9+1000=100.01=4
//assign Rom[5'h0A] = 32'b000100_00110_01000_0000000000000001;//$6、$8相等则跳转到下面第二条
//assign Rom[5'h0B] = 32'b100011_00000_01011_00000_000000_00100;//取出数放在$11=1
//assign Rom[5'h0C] = 32'b100011_00000_01100_00000_000000_00100;//取出数放在$12=1
//assign Rom[5'h0D] = 32'b000101_00010_00001_0000000000000001;//$1、$2不相等则跳转到下面第二条
//assign Rom[5'h0E] = 32'b100011_00000_01101_00000_000000_00100;//取出数放在$13=1
//assign Rom[5'h0F] = 32'b100011_00000_01110_00000_000000_00100;//取出数放在$14=1
//assign Rom[5'h10] = 32'b000010_00000_00000_00000_000000_01110;//跳转到上数第二条指令;
//assign Rom[5'h12] = 32'hXXXXXXXX;
//assign Rom[5'h14] = 32'hXXXXXXXX;
//assign Rom[5'h15] = 32'hXXXXXXXX;
//assign Rom[5'h16] = 32'hXXXXXXXX;
//assign Rom[5'h17] = 32'hXXXXXXXX;
//assign Rom[5'h18] = 32'hXXXXXXXX;
//assign Rom[5'h19] = 32'hXXXXXXXX;
//assign Rom[5'h1A] = 32'hXXXXXXXX;
//assign Rom[5'h1B] = 32'hXXXXXXXX;
//assign Rom[5'h1C] = 32'hXXXXXXXX;
//assign Rom[5'h1D] = 32'hXXXXXXXX;
//assign Rom[5'h1E] = 32'hXXXXXXXX;
//assign Rom[5'h1F] = 32'hXXXXXXXX;

//assign Rom[5'h00]=32'h20010008;//addi $1,$0,8 $1=8
//assign Rom[5'h01]=32'h3402000C;//ori $2,$0,12 $2=12
//assign Rom[5'h02]=32'h00221820;//add $3,$1,$2 $3=20
//assign Rom[5'h03]=32'h00412022;//sub $4,$2,$1 $4=4
//assign Rom[5'h04]=32'h00222824;//and $5,$1,$2
//assign Rom[5'h05]=32'h00223025;//or $6,$1,$2
//assign Rom[5'h06]=32'h14220002;//bne $1,$2,2
//assign Rom[5'h07]=32'hXXXXXXXX;
//assign Rom[5'h08]=32'hXXXXXXXX;
//assign Rom[5'h09]=32'h10220002;// beq $1,$2,2
//assign Rom[5'h0A]=32'h0800000D;// J 0D 
//assign Rom[5'h0B]=32'hXXXXXXXX;
//assign Rom[5'h0C]=32'hXXXXXXXX;
//assign Rom[5'h0D]=32'hAD02000A;// sw $2 10($8) memory[$8+10]=12
//assign Rom[5'h0E]=32'h8D04000A;//lw $4 10($8) $4=12
//assign Rom[5'h0F]=32'h10440003;//beq $2,$4,3
//assign Rom[5'h10]=32'hXXXXXXXX;
//assign Rom[5'h11]=32'hXXXXXXXX;
//assign Rom[5'h12]=32'hXXXXXXXX;
//assign Rom[5'h13]=32'h30470009;//andi $2,9,$7
//assign Rom[5'h14]=32'hXXXXXXXX;
//assign Rom[5'h15]=32'hXXXXXXXX;
//assign Rom[5'h16]=32'hXXXXXXXX;
//assign Rom[5'h17]=32'hXXXXXXXX;
//assign Rom[5'h18]=32'hXXXXXXXX;
//assign Rom[5'h19]=32'hXXXXXXXX;
//assign Rom[5'h1A]=32'hXXXXXXXX;
//assign Rom[5'h1B]=32'hXXXXXXXX;
//assign Rom[5'h1C]=32'hXXXXXXXX;
//assign Rom[5'h1D]=32'hXXXXXXXX;
//assign Rom[5'h1E]=32'hXXXXXXXX;
//assign Rom[5'h1F]=32'hXXXXXXXX;
assign Inst=Rom[Addr[6:2]];
endmodule