function LU = graphLaplacian(dataset, kappa, theta)

switch dataset
	case 'III_IVa'
		path = '../datasets/III_IVa';

		load([path '/bci4aloc'])

		M = size(chanlocs, 2);
		for ii = 1:M
			xyz(ii, 1, 1) = chanlocs(ii).X;
			xyz(ii, 1, 2) = chanlocs(ii).Y;
			xyz(ii, 1, 3) = chanlocs(ii).Z;
		end

	case 'JKHH'
		path = '/Users/rabiul/Desktop/Musa project/datasets/midatasets/fs128/';
		load([path '/JKHHloc'])
		M = 29;
		for ii = 1:M
			xyz(ii, 1, 1) = EEG_JKHH(ii, 1);
			xyz(ii, 1, 2) = EEG_JKHH(ii, 2);
			xyz(ii, 1, 3) = EEG_JKHH(ii, 3);
		end
end


mat1 = repmat(xyz, [1 M 1]);
xyz = squeeze(xyz);
mat2 = permute(mat1, [2 1 3]);
mat3 = (mat1 - mat2).^2;
Dis = sqrt(sum(mat3, 3));
%Dis(find(Dis>.5)) = inf;
Dis(find(Dis>kappa)) = inf;
%theta = .1;
W = exp(-(Dis.^2)./(2*theta^2));
D = diag(sum(W, 2));
L = D - W;
[LU Lam] = eig(L);
grprm.LU = LU;