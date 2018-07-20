function [nM2,ic2] = Kim_spec1_approx2_prodmom2_num_eval(arg) 
sigu_11 = arg(1); 
sigu_21 = arg(2); 
sigu_31 = arg(3); 
sigu_22 = arg(4); 
sigu_32 = arg(5); 
sigu_33 = arg(6); 
sigxf_11 = arg(7); 
sigxf_21 = arg(8); 
sigxf_22 = arg(9); 
nM2=zeros(111,1);
nM2(1,1)= sigu_11;  
nM2(2,1)= sigu_21;  
nM2(3,1)= sigu_31;  
nM2(16,1)= sigu_22;  
nM2(17,1)= sigu_32;  
nM2(28,1)= sigu_33;  
nM2(37,1)= 2*sigu_11^2;  
nM2(38,1)= 2*sigu_11*sigu_21;  
nM2(39,1)= 2*sigu_11*sigu_31;  
nM2(40,1)= 2*sigu_21^2;  
nM2(41,1)= 2*sigu_21*sigu_31;  
nM2(42,1)= 2*sigu_31^2;  
nM2(49,1)= sigu_11*sigu_22 + sigu_21^2;  
nM2(50,1)= sigu_11*sigu_32 + sigu_21*sigu_31;  
nM2(51,1)= 2*sigu_21*sigu_22;  
nM2(52,1)= sigu_21*sigu_32 + sigu_22*sigu_31;  
nM2(53,1)= 2*sigu_31*sigu_32;  
nM2(60,1)= sigu_11*sigu_33 + sigu_31^2;  
nM2(61,1)= 2*sigu_21*sigu_32;  
nM2(62,1)= sigu_21*sigu_33 + sigu_31*sigu_32;  
nM2(63,1)= 2*sigu_31*sigu_33;  
nM2(70,1)= 2*sigu_22^2;  
nM2(71,1)= 2*sigu_22*sigu_32;  
nM2(72,1)= 2*sigu_32^2;  
nM2(79,1)= sigu_22*sigu_33 + sigu_32^2;  
nM2(80,1)= 2*sigu_32*sigu_33;  
nM2(87,1)= 2*sigu_33^2;  
nM2(94,1)= sigu_11*sigxf_11;  
nM2(95,1)= sigu_11*sigxf_21;  
nM2(96,1)= sigu_21*sigxf_11;  
nM2(97,1)= sigu_21*sigxf_21;  
nM2(98,1)= sigu_31*sigxf_11;  
nM2(99,1)= sigu_31*sigxf_21;  
nM2(100,1)= sigu_11*sigxf_22;  
nM2(101,1)= sigu_21*sigxf_22;  
nM2(102,1)= sigu_31*sigxf_22;  
nM2(103,1)= sigu_22*sigxf_11;  
nM2(104,1)= sigu_22*sigxf_21;  
nM2(105,1)= sigu_32*sigxf_11;  
nM2(106,1)= sigu_32*sigxf_21;  
nM2(107,1)= sigu_22*sigxf_22;  
nM2(108,1)= sigu_32*sigxf_22;  
nM2(109,1)= sigu_33*sigxf_11;  
nM2(110,1)= sigu_33*sigxf_21;  
nM2(111,1)= sigu_33*sigxf_22;  
nM2=reshape(nM2,[111    1]);
ic2=[1;2;3;4;5;6;7;8;9;10;11;12;13;14;15;16;17;18;19;20;21;22;23;12;13;24;25;26;27;28;29;30;31;32;33;34;14;15;26;27;35;36;37;38;39;40;41;42;43;44;45;46;47;48;49;50;51;52;53;54;55;56;57;58;59;60;61;62;63;64;65;66;67;68;69;70;71;72;73;74;75;76;77;78;79;80;81;82;83;84;85;86;87;88;89;90;91;92;93;94;95;96;97;98;99;100;97;101;99;102;103;104;105;106;107;106;108;109;110;111];