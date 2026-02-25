// Verilog HDL : 4 bit Night Rider Ver 0.01 2028/08/23 by skyriver
module NightRider(
    input CLK,
    output wire[3:0] NIGHT_RIDER
    );
    integer COUNTER = 0;
    reg[3:0] LED = 4'b0001;
    reg DIR = 1'b0;
    always @ (posedge CLK) begin
        if (COUNTER == (20000000 - 1) ) begin	// 1sec when CLK is 20MHz
            COUNTER <= 0;
            if (DIR == 0) begin
                if (LED[3] == 0) begin
                    LED <= { LED[2:0], 1'b0 };
                end
                if (LED[2]) begin
                    DIR <= 1;
                end
            end else begin
                if (LED[0] == 0) begin
                    LED <= { 1'b0, LED[3:1] };
                end
                if (LED[1]) begin
                    DIR <= 0;
                end
            end
        end else begin
            COUNTER <= COUNTER + 1;
        end
    end
    assign NIGHT_RIDER = LED;
endmodule