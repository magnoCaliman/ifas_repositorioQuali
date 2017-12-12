s.boot

~monge = Buffer.loadDialog; // ../sampler/sons/voice2.wav

(
SynthDef("foo",{
	arg amp = 0.5, rate = 1, qualBuffer= ~monge.bufnum;
	var som = PlayBuf.ar(
		numChannels:2,
		bufnum:qualBuffer,
		rate:rate,
		doneAction:2
	);

	som = som * amp;
	Out.ar(0, som);
}).add
)

//coral de monges bêbados
15.do{Synth("foo", [qualBuffer:~monge, rate:rrand(0.95, 1.05), amp:0.1])};

//

b = Buffer.loadDialog //cherokee. alguma outra voz?

SynthDef(\help_PlayBuf, {| out = 0, bufnum = 0 |
    Out.ar(out,
        PlayBuf.ar(1, bufnum, BufRateScale.kr(bufnum), doneAction:2)
    )
}).play(s, [\out, 0, \bufnum, b]);


// trigger one shot
SynthDef(\help_PlayBuf, {| out = 0, bufnum = 0 |
    var trig;
    trig = Impulse.kr(XLine.kr(0.1, 100, 30));
    Out.ar(out,
        PlayBuf.ar(1, bufnum, BufRateScale.kr(bufnum), trig, 5000, 0)
    )
}).play(s, [\out, 0, \bufnum, b]);


// mouse. granulacao fake
SynthDef(\help_PlayBuf, { arg out=0, bufnum=0;
    var trig;
    trig = Impulse.kr(MouseY.kr(0.5, 200, 1));
    Out.ar(out,
        PlayBuf.ar(1, bufnum, BufRateScale.kr(bufnum), trig, MouseX.kr(0, BufFrames.kr(bufnum)), 1)
    )
}).play(s, [\out, 0, \bufnum, b]);


// drunk walk tape head
SynthDef(\help_PlayBuf, {| out = 0, bufnum = 0 |
    var rate;
    rate = LFNoise2.kr(XLine.kr(1, 20, 60), 2);
    Out.ar(out,
        PlayBuf.ar(1, bufnum, BufRateScale.kr(bufnum) * rate, 1, 0, 1)
    )
}).play(s, [\out, 0, \bufnum, b]);

b.free;