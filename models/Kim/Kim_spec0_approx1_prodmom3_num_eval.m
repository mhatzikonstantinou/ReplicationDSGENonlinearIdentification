function [nM3,ic3] = Kim_spec0_approx1_prodmom3_num_eval(arg) 
sigu_11 = arg(1); 
sigxf_11 = arg(2); 
sigxf_21 = arg(3); 
sigxf_22 = arg(4); 
nM3=zeros(20,1);
 nM3(2,1)= 2*sigu_11^2;  
 nM3(11,1)= 8*sigu_11^3;  
 nM3(14,1)= 2*sigu_11^2*sigxf_11;  
 nM3(15,1)= 2*sigu_11^2*sigxf_21;  
 nM3(16,1)= 2*sigu_11^2*sigxf_22;  
nM3=reshape(nM3,[20   1]);
ic3=[1;2;3;4;5;6;7;8;9;10;11;12;13;14;15;16;17;18;19;20];