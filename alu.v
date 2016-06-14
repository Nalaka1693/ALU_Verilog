module stimulus;
	reg [3:0] ALUctrl0;
	reg [31:0] A0, B0;
	wire [31:0] ALUOut0;
	wire Zero0;

	MIPS_ALU malu0 (ALUOut0, Zero0, ALUctrl0, A0, B0); //insatance

	initial
	begin
		$dumpfile ("test_alu.vcd");
		$dumpvars (0, stimulus);
		#0 ALUctrl0 = 4'b0000; 	//and
		#5 A0 = 32'b00000000000000000000000000011001;
		#0 B0 = 32'b00000000000000000000000000111101;
		#5 $display("A     = %b", A0);
		#0 $display("B     = %b", B0);
		#0 $display("A & B = %b", ALUOut0);
		#0 $display("Zero  = %d", Zero0);
		#0 ALUctrl0 = 4'b0001;	//or
		#5 A0 = 32'b00000000000000000000000000011001;
		#0 B0 = 32'b00000000000000000000000000111101;
		#5 $display("A     = %b", A0);
		#0 $display("B     = %b", B0);
		#0 $display("A | B = %b", ALUOut0);
		#0 $display("Zero  = %d", Zero0);
		#0 ALUctrl0 = 4'b0010;	//add
		#5 A0 = 32'b00000000000000000000000000011001;
		#0 B0 = 32'b00000000000000000000000000111101;
		#5 $display("A     = %b", A0);
		#0 $display("B     = %b", B0);
		#0 $display("A + B = %b", ALUOut0);
		#0 $display("Zero  = %d", Zero0);
		#0 ALUctrl0 = 4'b0110; 	//subtract
		#5 A0 = 32'b00000000000000000000000000000000;
		#0 B0 = 32'b00000000000000000000000000000001;
		#5 $display("A     = %b", A0);
		#0 $display("B     = %b", B0);
		#0 $display("A - B = %b", ALUOut0);
		#0 $display("Zero  = %d", Zero0);
		#0 ALUctrl0 = 4'b0111; 	//set less than
		#5 A0 = 32'b00000000000000000000000000000000;
		#0 B0 = 32'b00000000000000000000000000001001;
		#5 $display("A     = %b", A0);
		#0 $display("B     = %b", B0);
		#0 $display("A < B = %b", ALUOut0);
		#0 $display("Zero  = %d", Zero0);
		#0 ALUctrl0 = 4'b1100; 	//nor
		#5 A0 = 32'b00000000000000000000000000011001;
		#0 B0 = 32'b00000000000000000000000000111101;
		#5 $display("A      = %b", A0);
		#0 $display("B      = %b", B0);
		#0 $display("~(A|B) = %b", ALUOut0);
		#0 $display("Zero   = %d", Zero0);
		#5 $finish;
	end
endmodule

module MIPS_ALU (ALUout, Zero, ALUctrl, A, B);
	input [3:0] ALUctrl;
	input [31:0] A, B;
	output [31:0] ALUout;
	output Zero;
	
	wire [1:0] op;
	wire [31:0] cout;
	wire [31:0] set;
	wire actrl, bneg;
	wire less, less0;
	assign less = 1'b0;
	assign less0 = set[31];

	ALU_OP aluop0 (op, actrl, bneg, ALUctrl);
	ONE_BIT_ALU obalu0  (ALUout[0],  cout[0],   set[0],  op, A[0],  B[0],  actrl, bneg, less0,    bneg);
	ONE_BIT_ALU obalu1  (ALUout[1],  cout[1],   set[1],  op, A[1],  B[1],  actrl, bneg, less,  cout[0]);
	ONE_BIT_ALU obalu2  (ALUout[2],  cout[2],   set[2],  op, A[2],  B[2],  actrl, bneg, less,  cout[1]);
	ONE_BIT_ALU obalu3  (ALUout[3],  cout[3],   set[3],  op, A[3],  B[3],  actrl, bneg, less,  cout[2]);
	ONE_BIT_ALU obalu4  (ALUout[4],  cout[4],   set[4],  op, A[4],  B[4],  actrl, bneg, less,  cout[3]);
	ONE_BIT_ALU obalu5  (ALUout[5],  cout[5],   set[5],  op, A[5],  B[5],  actrl, bneg, less,  cout[4]);
	ONE_BIT_ALU obalu6  (ALUout[6],  cout[6],   set[6],  op, A[6],  B[6],  actrl, bneg, less,  cout[5]);
	ONE_BIT_ALU obalu7  (ALUout[7],  cout[7],   set[7],  op, A[7],  B[7],  actrl, bneg, less,  cout[6]);
	ONE_BIT_ALU obalu8  (ALUout[8],  cout[8],   set[8],  op, A[8],  B[8],  actrl, bneg, less,  cout[7]);
	ONE_BIT_ALU obalu9  (ALUout[9],  cout[9],   set[9],  op, A[9],  B[9],  actrl, bneg, less,  cout[8]);
	ONE_BIT_ALU obalu10 (ALUout[10], cout[10],  set[10], op, A[10], B[10], actrl, bneg, less,  cout[9]);
	ONE_BIT_ALU obalu11 (ALUout[11], cout[11],  set[11], op, A[11], B[11], actrl, bneg, less, cout[10]);
	ONE_BIT_ALU obalu12 (ALUout[12], cout[12],  set[12], op, A[12], B[12], actrl, bneg, less, cout[11]);
	ONE_BIT_ALU obalu13 (ALUout[13], cout[13],  set[13], op, A[13], B[13], actrl, bneg, less, cout[12]);
	ONE_BIT_ALU obalu14 (ALUout[14], cout[14],  set[14], op, A[14], B[14], actrl, bneg, less, cout[13]);
	ONE_BIT_ALU obalu15 (ALUout[15], cout[15],  set[15], op, A[15], B[15], actrl, bneg, less, cout[14]);
	ONE_BIT_ALU obalu16 (ALUout[16], cout[16],  set[16], op, A[16], B[16], actrl, bneg, less, cout[15]);
	ONE_BIT_ALU obalu17 (ALUout[17], cout[17],  set[17], op, A[17], B[17], actrl, bneg, less, cout[16]);
	ONE_BIT_ALU obalu18 (ALUout[18], cout[18],  set[18], op, A[18], B[18], actrl, bneg, less, cout[17]);
	ONE_BIT_ALU obalu19 (ALUout[19], cout[19],  set[19], op, A[19], B[19], actrl, bneg, less, cout[18]);
	ONE_BIT_ALU obalu20 (ALUout[20], cout[20],  set[20], op, A[20], B[20], actrl, bneg, less, cout[19]);
	ONE_BIT_ALU obalu21 (ALUout[21], cout[21],  set[21], op, A[21], B[21], actrl, bneg, less, cout[20]);
	ONE_BIT_ALU obalu22 (ALUout[22], cout[22],  set[22], op, A[22], B[22], actrl, bneg, less, cout[21]);
	ONE_BIT_ALU obalu23 (ALUout[23], cout[23],  set[23], op, A[23], B[23], actrl, bneg, less, cout[22]);
	ONE_BIT_ALU obalu24 (ALUout[24], cout[24],  set[24], op, A[24], B[24], actrl, bneg, less, cout[23]);
	ONE_BIT_ALU obalu25 (ALUout[25], cout[25],  set[25], op, A[25], B[25], actrl, bneg, less, cout[24]);
	ONE_BIT_ALU obalu26 (ALUout[26], cout[26],  set[26], op, A[26], B[26], actrl, bneg, less, cout[25]);
	ONE_BIT_ALU obalu27 (ALUout[27], cout[27],  set[27], op, A[27], B[27], actrl, bneg, less, cout[26]);
	ONE_BIT_ALU obalu28 (ALUout[28], cout[28],  set[28], op, A[28], B[28], actrl, bneg, less, cout[27]);
	ONE_BIT_ALU obalu29 (ALUout[29], cout[29],  set[29], op, A[29], B[29], actrl, bneg, less, cout[28]);
	ONE_BIT_ALU obalu30 (ALUout[30], cout[30],  set[30], op, A[30], B[30], actrl, bneg, less, cout[29]);
	ONE_BIT_ALU obalu31 (ALUout[31], cout[31],  set[31], op, A[31], B[31], actrl, bneg, less, cout[30]);
	
	wire z;
	or(z, ALUout[0],  ALUout[1],  ALUout[2],  ALUout[3],  ALUout[4],  ALUout[5],  ALUout[6],  ALUout[7],
		  ALUout[8],  ALUout[9],  ALUout[10], ALUout[11], ALUout[12], ALUout[13], ALUout[14], ALUout[15],
	      ALUout[16], ALUout[17], ALUout[18], ALUout[19], ALUout[20], ALUout[21], ALUout[22], ALUout[23],
	      ALUout[24], ALUout[25], ALUout[26], ALUout[27], ALUout[28], ALUout[29], ALUout[30], ALUout[31]);
	not(Zero, z);
endmodule

module ONE_BIT_ALU (ALUout, Cout, Set, ALUop, A, B, Actrl, Bneg, Less, Cin);
	output ALUout, Cout, Set;
	input A, B, Actrl, Bneg, Less, Cin;
	input [1:0] ALUop;
	wire AndOut, OrOut, AddSubOut;
	wire mAout, mBout, Ainv, Binv;
	
	not(Ainv, A), (Binv, B);
	MUX2 mux20 (mAout, A, Ainv, Actrl);
	MUX2 mux21 (mBout, B, Binv, Bneg);
	
	and(AndOut, mAout, mBout);
	or(OrOut, mAout, mBout);
	FULL_ADD fa0 (AddSubOut, Cout, mAout, mBout, Cin);
	assign Set = AddSubOut;
	
	MUX4 mux40 (ALUout, AndOut, OrOut, AddSubOut, Less, ALUop[1], ALUop[0]);
endmodule

module MUX4 (Out, In0, In1, In2, In3, S1, S2);
	output Out;
	input In1, In2, In3, In0;
	input S1, S2;
	wire [3:0] And;
	wire n1, n2;
	
	not(n1, S1), (n2, S2);	
	and(And[0], In0, n1, n2);
	and(And[1], In1, n1, S2);
	and(And[2], In2, S1, n2);
	and(And[3], In3, S1, S2);
	or(Out, And[0], And[1], And[2], And[3]);
endmodule

module MUX2 (Out, In0, In1, S1);
	output Out;
	input In0, In1;
	input S1;
	wire [1:0] And;
	wire n1;
	
	not(n1, S1);	
	and(And[0], In0, n1);
	and(And[1], In1, S1);
	or(Out, And[0], And[1]);
endmodule

module FULL_ADD (Sum, Cout, A, B, Cin);
	output Sum, Cout;
	input A, B, Cin;
	
	wire axb;
	xor(axb, A, B);
	xor(Sum, axb, Cin);
	wire ab;
	and(ab, A, B);
	wire caxb;
	and(caxb, Cin, axb);	
	or(Cout, ab, caxb);
endmodule

module ALU_OP (Op, Actrl, Bneg, ALUctrl);
	input [3:0] ALUctrl;
	output [1:0] Op;
	output Actrl, Bneg;
	
	reg [1:0] Op;
	reg Actrl = 1'b0;
	reg Bneg  = 1'b0;	
	reg [3:0] And = 4'b0000; 	//00
	reg [3:0] Or  = 4'b0001; 	//01
	reg [3:0] Add = 4'b0010; 	//10
	reg [3:0] Sub = 4'b0110; 	//10
	reg [3:0] Slt = 4'b0111; 	//11
	reg [3:0] Nor = 4'b1100; 	//00
	wire eql0, eql1, eql2, eql3, eql4, eql5;
	
	FOUR_BIT_COMP fbc0 (eql0, ALUctrl, And);
	FOUR_BIT_COMP fbc1 (eql1, ALUctrl, Or);
	FOUR_BIT_COMP fbc2 (eql2, ALUctrl, Add);
	FOUR_BIT_COMP fbc3 (eql3, ALUctrl, Sub);
	FOUR_BIT_COMP fbc4 (eql4, ALUctrl, Slt);
	FOUR_BIT_COMP fbc5 (eql5, ALUctrl, Nor);

	always @* begin
		if (eql0)
			Op = 2'b00;
		else if (eql1)
			Op = 2'b01;
		else if (eql2)
			Op = 2'b10;
		else if (eql3) begin
			Op = 2'b10;
			Bneg = 1'b1;			
		end
		else if (eql4)
			Op = 2'b11;
		else if (eql5) begin
			Op = 2'b00;
			Actrl = 1'b1;
			Bneg = 1'b1;
		end
	end
endmodule

module FOUR_BIT_COMP (Eql, A, B);
	input [3:0] A, B;
	output Eql;
	wire [3:0] eql0;
	
	ONE_BIT_COMP obc0 (eql0[0], A[0], B[0]);
	ONE_BIT_COMP obc1 (eql0[1], A[1], B[1]);
	ONE_BIT_COMP obc2 (eql0[2], A[2], B[2]);
	ONE_BIT_COMP obc3 (eql0[3], A[3], B[3]);
	
	and(Eql, eql0[0], eql0[1], eql0[2], eql0[3]);
endmodule

module ONE_BIT_COMP (Eql, A, B);
	input A, B;
	output Eql;
	
	xnor(Eql, A, B);
endmodule






