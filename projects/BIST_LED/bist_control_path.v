module bist_controlpath (
    input clk,
    input rst,
    input [1:0] mode,
    output reg ring_counter_enable,
    output reg johnson_counter_enable,
    output reg lfsr_enable
);

reg [1:0] PS, NS;

parameter [1:0] idle = 2'b00;
parameter [1:0] ring_counter = 2'b01;
parameter [1:0] johnson_counter = 2'b10;
parameter [1:0] lfsr = 2'b11;

//State Updation logic
always @(posedge(clk)) begin
    if(rst) begin
        PS <= idle;
    end
    else begin
        PS <= NS;
    end
end

//State transition logic
always @(PS or mode) begin
    case (PS)
        2'b00 : begin 
            if(mode == 2'b01) begin
                NS = ring_counter;
            end
            else if(mode == 2'b10) begin
                NS = johnson_counter;
            end
            else if(mode == 2'b11) begin
                NS = lfsr;
            end
            else begin
                NS = idle;
            end
        end
        2'b01 : begin
            if(mode == 2'b00) begin
                NS = idle;
            end
            else if(mode == 2'b11) begin
                NS = lfsr;
            end
            else if(mode == 2'b10) begin
                NS = johnson_counter;
            end
            else begin
                NS = ring_counter;
            end
        end
        2'b10 : begin
            if(mode == 2'b01) begin
                NS = ring_counter;
            end
            else if(mode == 2'b00) begin
                NS = idle;
            end
            else if(mode == 2'b11) begin
                NS = lfsr;
            end
            else begin
                NS = johnson_counter;
            end
        end
        2'b11 : begin
            if(mode == 2'b01) begin
                NS = ring_counter;
            end
            else if(mode == 2'b10) begin
                NS = johnson_counter;
            end
            else if(mode == 2'b00) begin
                NS = idle;
            end
            else begin
                NS = lfsr;
            end
        end
        default: begin
            NS = idle;
        end
    endcase   
end

//Control Output logic
always @(PS) begin
    if (PS == ring_counter) begin
        ring_counter_enable = 1'b1;
        johnson_counter_enable = 1'b0;
        lfsr_enable = 1'b0;
    end
    else if(PS == johnson_counter) begin
        johnson_counter_enable = 1'b1;
        ring_counter_enable = 1'b0;
        lfsr_enable = 1'b0;
    end
    else if(PS == lfsr) begin
        lfsr_enable = 1'b1;
        ring_counter_enable = 1'b0;
        johnson_counter_enable = 1'b0;
    end
end

endmodule