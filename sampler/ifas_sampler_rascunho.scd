~piano = Buffer.loadDialog; // ./sampler/sons/notaPiano.wav
~piano.play
~piano.bufnum

~sha = Buffer.loadDialog;  // ./sampler/sons/shamisen1.wav
~sha.play
~sha.bufnum

~excla = Buffer.loadDialog //./sampler/sons/exclamacion.wav  //reduzir para mono...
~excla.play
~excla.bufnum

(
SynthDef("tocaBuffer",{
	arg amp = 0.5, rate = 1, qualBuffer= ~piano.bufnum;
	var som = PlayBuf.ar(
		numChannels:1,
		bufnum:qualBuffer,
		rate:rate,
		doneAction:2
	);

	som = som * amp;
	Out.ar(0, som);
}).add
)

Synth("tocaBuffer", [rate:1]);
Synth("tocaBuffer", [rate:1, qualBuffer:~sha.bufnum]);


Synth("tocaBuffer", [rate:[0.5, 0.8, 1, 1.2, 1.5].choose]);

{
	Synth("tocaBuffer", [rate:[0.5, 0.8, 1, 1.2, 1.5].choose]);
	1.wait;
	Synth("tocaBuffer", [rate:[0.5, 0.8, 1, 1.2, 1.5].choose]);
	0.5.wait;
	Synth("tocaBuffer", [rate:[0.5, 0.8, 1, 1.2, 1.5].choose]);
}.fork

{
	12.do{
		Synth("tocaBuffer", [rate:[0.5, 0.8, 1, 1.2, 1.5].choose, qualBuffer: ~sha.bufnum]);
		[0.125, 0.25, 1, 1.5].choose.wait;
	}
}.fork

Synth("tocaBuffer", [rate: 0.midiratio, qualBuffer: ~excla.bufnum]);
//fazer i++.midiratio, tocar uma escala cromática

{
	inf.do{
		// Synth("tocaBuffer", [rate:((0,2..24)-12).midiratio.choose]);
		Synth("tocaBuffer", [rate:((0..24)-12).midiratio.choose, qualBuffer: ~excla.bufnum]);
		[0.125, 0.25, 1, 1.5].choose.wait;
	}
}.fork

/// daria pra fazer sem SynthDef? Só uma função com .set?