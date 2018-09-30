`timescale 1ns/10ps

module testbench;

reg ck,reset;
wire wrfull,rdempty;
wire [10:0]rdusedw,wrusedw;
wire [15:0]data_out;

test_fifo test_top(
	.ck(ck),
	.reset(reset),
	.wrfull(wrfull),
	.rdempty(rdempty),
	.rdusedw(rdusedw),
	.wrusedw(wrusedw),
	.data_out(data_out)
);

always
	#10 ck = ~ck;
	
initial
begin
			ck = 1'b0;
			reset = 1'b0;
#100 		reset = 1'b1;
#1000	$finish;
end

endmodule
