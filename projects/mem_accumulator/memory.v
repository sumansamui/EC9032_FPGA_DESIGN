module memory (
    input wire clk,          // Clock signal
    input wire rw,           // Read/Write control (1 = Read, 0 = Write)
    input wire [3:0] addr,   // 4-bit address (16 locations)
    input wire [7:0] data_in,// 8-bit input data (for write)
    output reg [7:0] data_out // 8-bit output data (for read)
);

    reg [7:0] mem [0:15]; // 16x8 memory array

    // Load memory with 10 predefined values
 
   
    // Load memory from a file at startup
    initial begin
       $readmemh("data.mem", mem); // Load hexadecimal data from file
    end
    
    // Initialize memory with values directly in Verilog
   /*
    initial begin
        mem[0] = 8'h0A; // 10
        mem[1] = 8'h14; // 20
        mem[2] = 8'h1E; // 30
        mem[3] = 8'h28; // 40
        mem[4] = 8'h32; // 50
        mem[5] = 8'h3C; // 60
        mem[6] = 8'h46; // 70
        mem[7] = 8'h50; // 80
        mem[8] = 8'h5A; // 90
        mem[9] = 8'h64; // 100
    end
    */
    
    
    
    always @(posedge clk) begin
        if (rw) 
            data_out <= mem[addr]; // Read operation (rw = 1)
        else if (!rw)
            mem[addr] <= data_in;  // Write operation (rw = 0)
    end

endmodule
