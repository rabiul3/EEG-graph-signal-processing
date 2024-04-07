function [data cnt pos nfo]  = dcompose(fn, dirc, freqband, time, dly_trial)
% fn: file name
% dirc: directory name
% freqband: passband of the bandpass filter e.g. [7 30] (Hz)
% time: observatio period for each trial
% dly_trial: delay from a cue

clclass = [1 2];
load([dirc '/' fn])
cnt = double(cnt);
fs = nfo.fs;
N = time*fs;
M = size(cnt, 2);

if length(freqband) == 0
	bb = 1;
	ba = 1;
else
	butterorder = 4; % 4 or 5
	Wn = freqband/(fs*.5);

	if length(freqband) == 1
		[bb ba] = butter(butterorder, Wn, 'high');
	else
		[bb ba] = butter(butterorder, Wn);
	end
end
cnt = filter(bb, ba, cnt);
pos = mrk.pos + dly_trial*fs;
y = mrk.y;
Ntr = length(y);

sig = zeros(N, M, Ntr);
prd = zeros(N, Ntr);
frave = zeros(N, M);
for ii = 1:Ntr
	prd1 = pos(ii):(pos(ii) + N - 1);
	sig1 = cnt(prd1, :);
	sig(:, :, ii) = sig1 - ones(N, 1)*mean(sig1, 1);
	sig2(:,:,ii) = sig1;
	prd(:, ii) = prd1;
end

data.sig = sig;
data.sig2 = sig2;
data.prd = prd;
data.fs = fs;

% labels
if length(unique(y)) == 2
	uy = unique(y);
	newy = zeros(length(y), 1);
	newy(find(y==uy(1))) = 1;
	newy(find(y==uy(2))) = -1;
	y = newy;
end
data.labels = y;
