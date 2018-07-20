% Writes symbolic expressions of model objects of a DSGE model to an m-file for numeric evaluation.
%
% Inputs: 
%       DSGE_Model: structure containing all symbolic information about DSGE Model
%       approx: order of approximation
%
% Output: m-file "filename_num_eval.m" 
%
% Based upon anal_deriv_print2f.m by Andrea Pescatori (http://www.columbia.edu/~mu2166/2nd_order.htm)
%
% Modified April 16, 2015 by Willi Mutschler (willi@mutschler.eu)

function anal_deriv_f_print2f(DSGE_Model,approx)
fprintf('WRITE SYMBOLIC EXPRESSIONS OF MODEL OBJECTS TO M-FILE FOR FURTHER EVALUATION...')
filename = ['./models/', DSGE_Model.shortname,'/',DSGE_Model.shortname,'_spec',num2str(DSGE_Model.spec),'_approx',];
gra = DSGE_Model.symbolic.gra;   
hes = DSGE_Model.symbolic.hes;   
f = DSGE_Model.symbolic.f;
Sigma = DSGE_Model.symbolic.Sigma;
etatilde = DSGE_Model.symbolic.etatilde;
sig = DSGE_Model.symbolic.sig;
SelectMat = DSGE_Model.symbolic.SelectMat;
dfstudt = DSGE_Model.symbolic.dfstudt;

nd = DSGE_Model.numbers.nd;
nv = DSGE_Model.numbers.nv;
nx = DSGE_Model.numbers.nx;
ny = DSGE_Model.numbers.ny;
nu = DSGE_Model.numbers.nu;

%% Open file and write some information
    fid=fopen([filename,num2str(approx),'_num_eval.m'],'w');
    fprintf(fid,'%% File name: %s_num_eval.m \n',filename);
    fprintf(fid,'%% File generated by anal_deriv_f_print2f.m Date: %s\n\n',date);

%% Print gra
    S = char(gra(:));
    if length(gra(:))==1
        S=['ngra=', S(1:end),';\n'];
    else
        S=['ngra=', S(8:end-1),';\n'];
    end
    S=regexprep(S, ',', '\r');
    fprintf(fid,S);

    S2F = ['ngra=reshape(ngra,[', num2str(size(gra)),']);\n'];
    fprintf(fid,S2F);
%%%

%% Print f
    S = char(f(:));
    S=['nf=', S(8:end-1),';\n'];
    if length(f(:))==1
        S=['nf=', S(1:end),';\n'];
    else
        S=regexprep(S, ',', '\r');
    end
    fprintf(fid,S);

    S2F = ['nf=reshape(nf,[', num2str(size(f)),']);\n'];
    fprintf(fid,S2F);
%%%

%% Print hes
    S = char(hes(:));
    if length(hes(:))==1
        S=['nhes=', S(1:end),';\n'];
    else
        S=['nhes=', S(8:end-1),';\n'];
    end
    S=regexprep(S, ',', '\r');
    fprintf(fid,S);
    
    S2F = ['nhes=reshape(nhes,[', num2str(size(hes)),']);\n'];
    fprintf(fid,S2F);
%%%


%% Print SigmaEps
    S = char(sym(Sigma(:)));
    if length(Sigma(:))==1
        S=['nSigma=', S(1:end),';\n'];  
    else
        S=['nSigma=', S(8:end-1),';\n'];  
    end
    S=regexprep(S, ',', '\r');
    fprintf(fid,S);

    S2F = ['nSigma=reshape(nSigma,[', num2str(size(Sigma)),']);\n'];
    fprintf(fid,S2F);
%%%

%% Print etatilde
    S = char(sym(etatilde(:)));
    if length(etatilde(:))==1
        S=['netatilde=', S(1:end),';\n'];  
    else
        S=['netatilde=', S(8:end-1),';\n'];  
    end
    S=regexprep(S, ',', '\r');
    fprintf(fid,S);

    S2F = ['netatilde=reshape(netatilde,[', num2str(size(etatilde)),']);\n'];
    fprintf(fid,S2F);
%%%

%% Print sig
    S = char(sig);
    S=['nsig=', S,';\n'];  
    S=regexprep(S, ',', '\r');
    fprintf(fid,S);

    S2F = ['nsig=reshape(nsig,[', num2str(size(sig)),']);\n'];
    fprintf(fid,S2F);
%%%

%% Print SelectMat
    S = char(sym(SelectMat(:)));
    if length(SelectMat(:))==1
        S=['nSelectMat=', S(1:end),';\n'];
    else
        S=['nSelectMat=', S(8:end-1),';\n'];
    end
    S=regexprep(S, ',', '\r');
    fprintf(fid,S);

    S2F = ['nSelectMat=reshape(nSelectMat,[', num2str(size(SelectMat)),']);\n'];
    fprintf(fid,S2F);
%%%

%% Print dfstudt
if strcmp(DSGE_Model.symbolic.distribution,'Student-t')
    S = char(dfstudt);
    S=['ndfstudt=', S,';\n'];  
    S=regexprep(S, ',', '\r');
    fprintf(fid,S);

    S2F = ['ndfstudt=reshape(ndfstudt,[', num2str(size(dfstudt)),']);\n'];
else
    S2F = 'ndfstudt=[];\n';
end
    fprintf(fid,S2F);
%%%

%% Print nd,nx,ny,nu,nv,nX,nY
    S = ['nd=',num2str(nd),';\n']; fprintf(fid,S);
    S = ['nx=',num2str(nx),';\n']; fprintf(fid,S);
    S = ['nv=',num2str(nv),';\n']; fprintf(fid,S);
    S = ['ny=',num2str(ny),';\n']; fprintf(fid,S);
    S = ['nu=',num2str(nu),';\n']; fprintf(fid,S);    
    
fclose(fid);
fprintf('FINISHED!\n');