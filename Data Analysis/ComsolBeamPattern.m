function ComsolBeamPattern(filename)

%COLTON BEARDSEY BeamPattern

[~,p]=ComsolIn(filename);
close

s=size(p);

Amp=zeros(s(2),1);

for i=1:s(2)
    lim=s(2)/2-rem(s(2),2)/2;
    Env=abs(hilbert(p(lim:end,i)));
    Amp(i)=rms(Env);
    
end

Theta=-1.55:.05:1.55;

polarplot(Theta,Amp)
title('Example Beam Pattern')


% envelope = abs(hilbert(x));