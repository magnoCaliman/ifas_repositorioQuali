s.boot
s.freqscope

// gera array
(
~numHarm = 10;
~freqFund = 300;

~listaFreq = {
	Array.fill(~numHarm,
		{
			arg i;
			(i * ~freqFund) + ~freqFund;
	    }
	)
};

~listaFreq.value;
)

// acessa valores no array
(
Ndef(\serieHarm01, {
	// var signal = SinOsc.ar(freq:~listaFreq.value/2, mul:0.1);
	var signal = SinOsc.ar(freq:~listaFreq.value.at([4, 5, 7]-1), mul:0.1);
	Mix.ar(signal);
});
)

Ndef(\serieHarm01).play;
Ndef(\serieHarm01).stop;

//

(
Ndef(\serieHarm02, {
	var signal = SinOsc.ar(
		// freq:~listaFreq.value.at([1, 2, rrand(3, 10), rrand(3, 10)]-1).poll,
		freq:~listaFreq.value.at([1, 2, [3, 4, 5].choose]-1),
		mul:0.1);
	Mix.ar(signal);
});
)

Ndef(\serieHarm02).play;
Ndef(\serieHarm02).stop


// VIDEO PARTE 2
//modifica valores no array
(
Ndef(\desafinado01, {
	Mix.ar(SinOsc.ar(
		freq:~listaFreq.value.putEach(
			// [4, 5, 6], [666, 677, 667]
			[4, 5], [rrand(100, 400), rrand(400, 1000)]
		),
		mul:0.1))!2
});
)

Ndef(\desafinado01).play;
Ndef(\desafinado01).stop(2);
Ndef(\desafinado01).fadeTime = 2;

//

(
Ndef(\desafinado02, {
	Mix.ar(SinOsc.ar(
		freq:~listaFreq.value.putEach(
			[2,4,6,8,10]-1, Array.fill(5,{rrand(100, 3000)})
			// (1..~numHarm)-1, Array.fill(~numHarm,{rrand(50, 1000)})
		),
		mul:0.1))!2
});
)

Ndef(\desafinado02).play;
Ndef(\desafinado02).stop(2);
Ndef(\desafinado02).fadeTime = 2;