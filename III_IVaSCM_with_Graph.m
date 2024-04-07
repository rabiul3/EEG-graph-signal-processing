% Compute sorted covariance matrices.
% For MDRM and TSLDA
% by Uehara
function [P1, P2] = III_IVaSCM_with_Graph(dataset, sig, labels, U, basis, Class)


for k = 1:size(sig,3)
    sig0(:,:,k) = sig(:,:,k) * U(:,1:basis);
    %sig0(:,:,k) = sig(:,:,k) * U;
end


switch dataset
    case 'III_IVa'
        [P1, P2] = III_IVaSCM(sig0, labels);
    case 'JKHH'
        [P(:,:,:,1), P(:,:,:,2), P(:,:,:,3), P(:,:,:,4)] = JKHH_SCM(sig, labels);
        P1 = P(:,:,:,Class(1)); P2 = P(:,:,:,Class(2));
    end
end

