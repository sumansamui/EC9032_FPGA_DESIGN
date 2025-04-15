module clock_divider (
    input clk,    // 100 MHz input clock
    input rst,    // Reset
    output reg slow_clk// Slower clock output (1 Hz in this case)
);
    reg [25:0] counter; // 27-bit counter (2^26 = 67M > 50M)
    
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            counter <= 0;
            slow_clk <= 0;
        end 
        else begin
            counter <= counter + 1;
            if (counter == 50_000_000) begin // Toggle at 50M counts (1 Hz)
                slow_clk <= ~slow_clk;
                counter <= 0;
            end
        end
    end
endmodule