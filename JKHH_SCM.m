% Compute sorted covariance matrices.
% For MDRM and TSLDA
% by Uehara
function [P1, P2, P3, P4 sig1, sig2, sig3, sig4] = JKHH_SCM(sig, labels)

% regularization coefficient
epsilon = 10^(-10);

% extract class data 
sig1_ind = find( labels == 1 );
sig2_ind = find( labels == 2 );
sig3_ind = find( labels == 3 );
sig4_ind = find( labels == 4 );

% make each class sig
sig1 = sig(:,:,sig1_ind);
sig2 = sig(:,:,sig2_ind);
sig3 = sig(:,:,sig3_ind);
sig4 = sig(:,:,sig4_ind);

%%%%%%%%%%%% make outliers %%%%%%%%%%%
%sig1([101:200],:,[1:10]) = 10000 + sig1([101:200],:,[1:10]);
%sig2([101:200],:,[1:10]) = 10000 + sig2([101:200],:,[1:10]);
%sig1(:,:,[1:3]) = sig2(:,:,[11:13]);
%sig2(:,:,[1:3]) = sig1(:,:,[11:13]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% make SCMs
P1 = zeros(size(sig1,2), size(sig1,2), size(sig1,3));
P2 = zeros(size(sig2,2), size(sig2,2), size(sig2,3));
for ii = 1 : numel(sig1_ind)
	P1(:,:,ii) = cov(sig1(:,:,ii)) + epsilon * eye(size(sig1,2));
	P2(:,:,ii) = cov(sig(:,:,sig2_ind(ii))) + epsilon * eye(size(sig2,2));
	P3(:,:,ii) = cov(sig3(:,:,ii)) + epsilon * eye(size(sig3,2));
	P4(:,:,ii) = cov(sig4(:,:,ii)) + epsilon * eye(size(sig4,2));
end



% make labels
label1 = labels(sig1_ind,1);
label2 = labels(sig2_ind,1);
label3 = labels(sig3_ind,1);
label4 = labels(sig4_ind,1);


% data sorting
% create SCM
sig = cat(3,sig1,sig2); %sorted data
M = size(sig,2);
