module test_fifo(
	input ck,reset,
	output wrfull,rdempty,
	output [10:0]rdusedw,wrusedw,
	output [15:0]data_out
);

reg [15:0]data_in;
reg rd,wr;

always@(posedge ck,negedge reset)
begin
	if(reset == 1'b0)
	begin
		data_in <= 16'd0;
	end
	else
	begin
		if(data_in <= 16'd5)
		begin
			wr <= 1'b1;
			rd <= 1'b0;
			data_in <= data_in + 16'd1;
		end
		else if(data_in == 16'd6)
		begin
			wr <= 1'b0;
			rd <= 1'b0;
			data_in <= data_in + 16'd1;
		end
		else
		begin
			wr <= 1'b0;
			rd <= 1'b1;
		end
	end
end

fifo_module add1(
	.data(data_in),
	.rdclk(ck),
	.rdreq(rd),
	.wrclk(ck),
	.wrreq(wr),
	.q(data_out),
	.rdempty(rdempty),
	.rdusedw(rdusedw),
	.wrusedw(wrusedw),
	.wrfull(wrfull)
);

endmodule
