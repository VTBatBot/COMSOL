function ComsolBeamPattern(filename)

%COLTON BEARDSEY BeamPatternRough

[~,p]=ComsolIn(filename);

s=size(p);

Env=zeros(1,s(2));
Amp=Env;

for i=1:s(2)
    
    lim=5*s(1)/6-rem(5*s(1),6);
    Env(i)=abs(hilbert(p(lim:s(1),i)));
    Amp(i)=rms(Env(i));
    
end

Theta=-1.5:.2:1.5;

polarplot(Theta,Amp)

% envelope = abs(hilbert(x));