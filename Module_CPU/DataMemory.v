
// DataMemory：用于内存存储，内存读写

module DataMemory(
    input DataMemRW,           //读写信号，1为写，0为读
    input [15:0] DAddress,  //地址
    input [15:0] DataIn,     //输入数据

    output reg [15:0] DataOut  //输出数据
); 

    // 模拟内存，以8位为一字节存储，共64字节
    reg[7:0] memory[0:63]; 

    // 初始化内存
    integer i;
    initial 
     begin
        for(i = 0; i < 64; i = i + 1) memory[i] = 8'b0;
     end

    //  读写内存
    always @(DAddress or DataIn)
    begin
        // 写入内存,先写高八位，再写低八位
        if (DataMemRW) begin
            memory[DAddress] = DataIn[15:8];
            memory[DAddress + 1] = DataIn[7:0];
        end
        // 读取内存
        else begin
            DataOut[15:8] = memory[DAddress];
            DataOut[7:0] = memory[DAddress + 1];
        end
    end
    


endmodule