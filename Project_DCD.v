module dcd_project();

//Password checker module
module password_checker(pass_input, pass_correct, pass_check);
	input [7:0] pass_input, pass_correct;
	output reg pass_check;
	always @(pass_input, pass_correct)
	pass_check = 0;
	if(pass_input == pass_correct)
		pass_check = !pass_check;
endmodule

//Comfort System
module comfort(T_ideal,T_sens,T_set,L_ideal,L_sens,L_set,pass_check);
	input pass_check;
	input [7:0] T_ideal,L_ideal,T_sens,L_sens;
	output reg [7:0] T_set,L_set;
	integer i,j;
	integer T_del = 0;
	integer L_del = 0;	

	always @(pass_check,T_ideal,L_ideal,T_sens,L_sens)
	if(pass_check == 1) 
		if(T_sens < T_ideal)
			for(i = T_sens; i < T_ideal; T_del = T_del+10)
				#T_del T_set = T_set + 1
			end
		if(L_sens < L_ideal)
			for(j = L_sens; j < L_ideal; L_del = L_del+10)
				#L_del L_set = L_set + 1
			end
	endmodule
     

     