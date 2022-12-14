module adder_subtractor(s, cout, a, b, mode);
	input [3:0]a, b;
	input mode;
	output [3:0]s;
	output cout;
	wire c0, c1,c2;
	full fa1(s[0], c0, a[0], (b[0]^mode), mode);
	full fa2(s[1], c1, a[1], (b[1]^mode), c0);
	full fa3(s[2], c2, a[2], (b[2]^mode), c1);
	full fa4(s[3], cout, a[3], (b[3]^mode), c2);
endmodule


module full(s, cout, a, b, cin);
	input a, b, cin;
	output s, cout;
	wire p, q, r;
	half ha1(p, q, a, b);
	half ha2(s, r, p, cin);
	or(cout, q, r);
endmodule
module half(s, cout, a, b);
	input a, b;
	output s, cout;
	xor(s, a, b);
	and(cout, a, b);
endmodule
