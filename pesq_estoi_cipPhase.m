
cMag_cPhase_path        = '/Users/cdn16hqu/PycharmProjects/aachen_paper/look_out.wav';
cMag_cipPhase_path      = '/Users/cdn16hqu/PycharmProjects/aachen_paper/cMag_cipPhase.wav';
cMag_nPhase_path   = '/Users/cdn16hqu/PycharmProjects/aachen_paper/cMag_nPhase.wav';
maskedMag_cPhase_path   = '/Users/cdn16hqu/PycharmProjects/aachen_paper/maskedMag_cPhase.wav';
maskedMag_cipPhase_path = '/Users/cdn16hqu/PycharmProjects/aachen_paper/maskedMag_cipPhase.wav';
maskedMag_nPhase_path   = '/Users/cdn16hqu/PycharmProjects/aachen_paper/maskedMag_nPhase.wav';
nMag_cPhase_path        = '/Users/cdn16hqu/PycharmProjects/aachen_paper/nMag_cPhase.wav';
nMag_cipPhase_path      = '/Users/cdn16hqu/PycharmProjects/aachen_paper/nMag_cipPhase.wav';
nMag_nPhase_path        = '/Users/cdn16hqu/PycharmProjects/aachen_paper/noisy_look_out_0db.wav';

% Read in audio for estoi
[cMag_cPhase, fs] = audioread(cMag_cPhase_path);
[cMag_cipPhase, fs] = audioread(cMag_cipPhase_path);
[cMag_nPhase, fs] = audioread(cMag_nPhase_path);
[maskedMag_cPhase, fs] = audioread(maskedMag_cPhase_path);
[maskedMag_cipPhase, fs] = audioread(maskedMag_cipPhase_path);
[maskedMag_nPhase, fs] = audioread(maskedMag_nPhase_path);
[nMag_cPhase, fs] = audioread(nMag_cPhase_path);
[nMag_cipPhase, fs] = audioread(nMag_cipPhase_path);
[nMag_nPhase, fs] = audioread(nMag_nPhase_path);


pesq_cMag_cPhase   = pesq(cMag_cPhase_path, cMag_cPhase_path)
estoi_cMag_cPhase = estoi(cMag_cPhase, cMag_cPhase, fs)
pesq_cMag_cipPhase = pesq(cMag_cPhase_path, cMag_cipPhase_path)
estoi_cMag_cipPhase = estoi(cMag_cPhase, cMag_cipPhase, fs)
pesq_cMag_nPhase = pesq(cMag_cPhase_path, cMag_nPhase_path)
estoi_cMag_nPhase = estoi(cMag_cPhase, cMag_nPhase, fs)


pesq_maskedMag_cPhase = pesq(cMag_cPhase_path, maskedMag_cPhase_path)
estoi_maskedMag_cPhase = estoi(cMag_cPhase, maskedMag_cPhase, fs)
pesq_maskedMag_cipPhase = pesq(cMag_cPhase_path, maskedMag_cipPhase_path)
estoi_maskedMag_cipPhase = estoi(cMag_cPhase, maskedMag_cipPhase, fs)
pesq_maskedMag_nPhase = pesq(cMag_cPhase_path, maskedMag_nPhase_path)
estoi_maskedMag_nPhase = estoi(cMag_cPhase, maskedMag_nPhase, fs)


pesq_nMag_cPhase = pesq(cMag_cPhase_path, nMag_cPhase_path)
estoi_nMag_cPhase = estoi(cMag_cPhase, nMag_cPhase, fs)
pesq_nMag_cipPhase = pesq(cMag_cPhase_path, nMag_cipPhase_path)
estoi_nMag_cipPhase = estoi(cMag_cPhase, nMag_cipPhase, fs)
pesq_nMag_nPhase = pesq(cMag_cPhase_path, nMag_nPhase_path)
estoi_nMag_nPhase = estoi(cMag_cPhase, nMag_nPhase, fs)

