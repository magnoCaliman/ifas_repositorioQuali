s.boot
s.freqscope

(
{
	var osc1, osc2, mod;
	var posX = MouseX.kr(minval:200, maxval:1000);
	var posY = MouseY.kr(minval:1,   maxval:300);

	// osc1 = SinOsc.ar(freq:posX);
	osc1 = Pulse.ar(freq:posX);
	osc2 = SinOsc.ar(freq:posY);

	mod = osc1 * osc2;

	Pan2.ar(mod * 0.2);
}.play
)