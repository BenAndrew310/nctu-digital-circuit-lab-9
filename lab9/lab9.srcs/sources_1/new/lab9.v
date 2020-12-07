`timescale 1ns / 1ps
/////////////////////////////////////////////////////////
module lab9(
  input clk,
  input reset_n,
  input [3:0] usr_btn,
  output [3:0] usr_led,
  output LCD_RS,
  output LCD_RW,
  output LCD_E,
  output [3:0] LCD_D
);

localparam [3:0] S_MAIN_IDLE = 0, S_MAIN_WAIT = 1, S_MAIN_START = 2,S_MAIN_STOP = 3;
localparam INIT_DELAY = 100_000;

reg [7:0] password0 [0:7];
reg [7:0] password1 [0:7];
reg [7:0] password2 [0:7];
reg [7:0] password3 [0:7];
reg [7:0] password4 [0:7];
reg [7:0] password5 [0:7];
reg [7:0] password6 [0:7];
reg [7:0] password7 [0:7];
reg [7:0] password8 [0:7];
reg [7:0] password9 [0:7];

reg [3:0] P, P_next;
reg [$clog2(INIT_DELAY):0] init_counter;
reg start = 0;
reg [0:9] success;

wire [1:0] btn_level, btn_pressed;
reg [1:0] prev_btn_level;
reg [127:0] row_A = "Press BTN3 to   "; // Initialize the text of the first row. 
reg [127:0] row_B = "start cracking  "; // Initialize the text of the second row.

LCD_module lcd0(
  .clk(clk),
  .reset(~reset_n),
  .row_A(row_A),
  .row_B(row_B),
  .LCD_E(LCD_E),
  .LCD_RS(LCD_RS),
  .LCD_RW(LCD_RW),
  .LCD_D(LCD_D)
);
    
debounce btn_db0(
  .clk(clk),
  .btn_input(usr_btn[3]),
  .btn_output(btn_level)
);

md5 digest0(
    .clk(clk),
    .reset(~reset_n),
    .crack(start),
    .d1(password0[0]),
    .d2(password0[1]),
    .d3(password0[2]),
    .d4(password0[3]),
    .d5(password0[4]),
    .d6(password0[5]),
    .d7(password0[6]),
    .d8(password0[7]),
    .rowA(row_A),
    .rowB(row_B),
    .success(success[0])
);

md5 digest1(
    .clk(clk),
    .reset(~reset_n),
    .crack(start),
    .d1(password1[0]),
    .d2(password1[1]),
    .d3(password1[2]),
    .d4(password1[3]),
    .d5(password1[4]),
    .d6(password1[5]),
    .d7(password1[6]),
    .d8(password1[7]),
    .rowA(row_A),
    .rowB(row_B),
    .success(success[1])
);

md5 digest2(
    .clk(clk),
    .reset(~reset_n),
    .crack(start),
    .d1(password2[0]),
    .d2(password2[1]),
    .d3(password2[2]),
    .d4(password2[3]),
    .d5(password2[4]),
    .d6(password2[5]),
    .d7(password2[6]),
    .d8(password2[7]),
    .rowA(row_A),
    .rowB(row_B),
    .success(success[2])
);

md5 digest3(
    .clk(clk),
    .reset(~reset_n),
    .crack(start),
    .d1(password3[0]),
    .d2(password3[1]),
    .d3(password3[2]),
    .d4(password3[3]),
    .d5(password3[4]),
    .d6(password3[5]),
    .d7(password3[6]),
    .d8(password3[7]),
    .rowA(row_A),
    .rowB(row_B),
    .success(success[3])
);

md5 digest4(
    .clk(clk),
    .reset(~reset_n),
    .crack(start),
    .d1(password4[0]),
    .d2(password4[1]),
    .d3(password4[2]),
    .d4(password4[3]),
    .d5(password4[4]),
    .d6(password4[5]),
    .d7(password4[6]),
    .d8(password4[7]),
    .rowA(row_A),
    .rowB(row_B),
    .success(success[4])
);

md5 digest5(
    .clk(clk),
    .reset(~reset_n),
    .crack(start),
    .d1(password5[0]),
    .d2(password5[1]),
    .d3(password5[2]),
    .d4(password5[3]),
    .d5(password5[4]),
    .d6(password5[5]),
    .d7(password5[6]),
    .d8(password5[7]),
    .rowA(row_A),
    .rowB(row_B),
    .success(success[5])
);

md5 digest6(
    .clk(clk),
    .reset(~reset_n),
    .crack(start),
    .d1(password6[0]),
    .d2(password6[1]),
    .d3(password6[2]),
    .d4(password6[3]),
    .d5(password6[4]),
    .d6(password6[5]),
    .d7(password6[6]),
    .d8(password6[7]),
    .rowA(row_A),
    .rowB(row_B),
    .success(success[6])
);

md5 digest7(
    .clk(clk),
    .reset(~reset_n),
    .crack(start),
    .d1(password7[0]),
    .d2(password7[1]),
    .d3(password7[2]),
    .d4(password7[3]),
    .d5(password7[4]),
    .d6(password7[5]),
    .d7(password7[6]),
    .d8(password7[7]),
    .rowA(row_A),
    .rowB(row_B),
    .success(success[7])
);

md5 digest8(
    .clk(clk),
    .reset(~reset_n),
    .crack(start),
    .d1(password8[0]),
    .d2(password8[1]),
    .d3(password8[2]),
    .d4(password8[3]),
    .d5(password8[4]),
    .d6(password8[5]),
    .d7(password8[6]),
    .d8(password8[7]),
    .rowA(row_A),
    .rowB(row_B),
    .success(success[8])
);

md5 digest9(
    .clk(clk),
    .reset(~reset_n),
    .crack(start),
    .d1(password9[0]),
    .d2(password9[1]),
    .d3(password9[2]),
    .d4(password9[3]),
    .d5(password9[4]),
    .d6(password9[5]),
    .d7(password9[6]),
    .d8(password9[7]),
    .rowA(row_A),
    .rowB(row_B),
    .success(success[9])
);

assign usr_led = 4'b0000;
assign btn_pressed = (btn_level & ~prev_btn_level);

always @(posedge clk) begin
  if (~reset_n) begin
    prev_btn_level <= 2'b00;
  end
  else begin;
    prev_btn_level <= btn_level;
  end
end

always @(posedge clk) begin
  if (P == S_MAIN_IDLE) init_counter <= init_counter + 1;
  else init_counter <= 0;
end

always @(*) begin
    case (P)
        S_MAIN_IDLE:
            if (init_counter < INIT_DELAY) P_next = S_MAIN_IDLE;
            else P_next = S_MAIN_WAIT;
        S_MAIN_WAIT:
            if (btn_pressed) P_next = S_MAIN_START;
            else P_next = S_MAIN_WAIT;
        S_MAIN_START:
            if (success[0] || success[1] || success[2] || success[3] || success[4] || success[5] || success[6] || success[7] || success[8]) P_next = S_MAIN_STOP;
            else P_next = S_MAIN_START;
        S_MAIN_STOP:
            P_next = S_MAIN_STOP;
    endcase
end

// password[n]
always @(posedge clk) begin
    if (~reset_n) begin
        {password0[0],password0[1],password0[2],password0[3],password0[4],password0[5],password0[6],password0[7]} 
        <= {8'h30, 8'h30, 8'h30, 8'h30, 8'h30, 8'h30, 8'h30, 8'h30};
        {password1[0],password1[1],password1[2],password1[3],password1[4],password1[5],password1[6],password1[7]} 
        <= {8'h31, 8'h30, 8'h30, 8'h30, 8'h30, 8'h30, 8'h30, 8'h30};
        {password2[0],password2[1],password2[2],password2[3],password2[4],password2[5],password2[6],password2[7]} 
        <= {8'h32, 8'h30, 8'h30, 8'h30, 8'h30, 8'h30, 8'h30, 8'h30};
        {password3[0],password3[1],password3[2],password3[3],password3[4],password3[5],password3[6],password3[7]} 
        <= {8'h33, 8'h30, 8'h30, 8'h30, 8'h30, 8'h30, 8'h30, 8'h30};
        {password4[0],password4[1],password4[2],password4[3],password4[4],password4[5],password4[6],password4[7]} 
        <= {8'h34, 8'h30, 8'h30, 8'h30, 8'h30, 8'h30, 8'h30, 8'h30};
        {password5[0],password5[1],password5[2],password5[3],password5[4],password5[5],password5[6],password5[7]} 
        <= {8'h35, 8'h30, 8'h30, 8'h30, 8'h30, 8'h30, 8'h30, 8'h30};
        {password6[0],password6[1],password6[2],password6[3],password6[4],password6[5],password6[6],password6[7]} 
        <= {8'h36, 8'h30, 8'h30, 8'h30, 8'h30, 8'h30, 8'h30, 8'h30};
        {password7[0],password7[1],password7[2],password7[3],password7[4],password7[5],password7[6],password7[7]} 
        <= {8'h37, 8'h30, 8'h30, 8'h30, 8'h30, 8'h30, 8'h30, 8'h30};
        {password8[0],password8[1],password8[2],password8[3],password8[4],password8[5],password8[6],password8[7]} 
        <= {8'h38, 8'h30, 8'h30, 8'h30, 8'h30, 8'h30, 8'h30, 8'h30};
        {password9[0],password9[1],password9[2],password9[3],password9[4],password9[5],password9[6],password9[7]} 
        <= {8'h39, 8'h30, 8'h30, 8'h30, 8'h30, 8'h30, 8'h30, 8'h30};
    end
end

//cracking
always @(posedge clk) begin
    if (~reset_n) start <= 0;
    else if (P == S_MAIN_START) start = 1;
    else if (P == S_MAIN_STOP) start = 0;
end

// Display
always @(posedge clk) begin
    if (~reset_n) begin
        row_A = "Press BTN3 to   ";
        row_B = "start cracking..";
    end 
end

endmodule

module md5(
    input clk,
    input reset,
    input crack,
    input [7:0] d1,
    input [7:0] d2,
    input [7:0] d3,
    input [7:0] d4,
    input [7:0] d5,
    input [7:0] d6,
    input [7:0] d7,
    input [7:0] d8,
    output [127:0] rowA,
    output [127:0] rowB,
    output success
);

localparam [3:0] S_MAIN_IDLE = 0,S_MAIN_RESET = 1, S_MAIN_MEMSET = 2,
                 S_MAIN_MEMCPY = 3, S_MAIN_BREAK_CHUNK = 4, S_MAIN_INIT_HASH = 5, S_MAIN_LOOP_1 = 6,
                 S_MAIN_LOOP_2 = 7, S_MAIN_LOOP_3 = 8, S_MAIN_LOOP_4 = 9, S_MAIN_ADD_CHUNK = 10,
                 S_MAIN_STORE_HASH = 11, S_MAIN_COMPARE = 12, S_MAIN_COUNT_UP = 13, S_MAIN_SHOW = 14;

reg [0:127] passwd_hash = 128'hE8CD0953ABDFDE433DFEC7FAA70DF7F6;
reg [3:0] P, P_next;
reg [31:0] r [0:63], k[0:63];
reg [7:0] timer [0:6];
reg [31:0] time_counter = 0;
reg [31:0] h0, h1, h2, h3;
reg [31:0] a, b, c, d, i, f, g, temp;
reg [7:0] msg [0:119];
reg [7:0] hash [0:15];
reg [31:0] w [0:15];
reg [31:0] x_lr, c_lr;
reg [7:0] password [0:7];

reg [127:0] row_A, row_B;

reg increment_i, loop_done;
reg all_done;
reg isSuccess;

integer i_msg;

assign success = isSuccess;

always @(posedge clk) begin
    if (reset || !crack) P <= S_MAIN_IDLE;
    else P <= P_next;
end

always @(*) begin
    case (P)
        S_MAIN_IDLE:
            if (crack) P_next = S_MAIN_RESET;
            else P_next = S_MAIN_IDLE;
        S_MAIN_RESET:
            P_next = S_MAIN_MEMSET;
        S_MAIN_MEMSET:
            P_next = S_MAIN_MEMCPY;
        S_MAIN_MEMCPY:
            P_next = S_MAIN_BREAK_CHUNK;
        S_MAIN_BREAK_CHUNK:
            P_next = S_MAIN_INIT_HASH;
        S_MAIN_INIT_HASH:
            P_next = S_MAIN_LOOP_1;
        S_MAIN_LOOP_1:
            P_next = S_MAIN_LOOP_2;
        S_MAIN_LOOP_2:
            P_next = S_MAIN_LOOP_3;
        S_MAIN_LOOP_3:
            P_next = S_MAIN_LOOP_4;
        S_MAIN_LOOP_4:
            if (loop_done) P_next = S_MAIN_ADD_CHUNK;
            else P_next = S_MAIN_LOOP_1;
        S_MAIN_ADD_CHUNK:
            P_next = S_MAIN_STORE_HASH;
        S_MAIN_STORE_HASH:
            P_next = S_MAIN_COMPARE;
        S_MAIN_COMPARE:
            if (isSuccess) P_next = S_MAIN_SHOW;
            else P_next = S_MAIN_COUNT_UP;
        S_MAIN_COUNT_UP:
            P_next = S_MAIN_RESET;
        S_MAIN_SHOW:
            P_next = S_MAIN_SHOW;
    endcase
end

always @(posedge clk) begin
    if (reset) begin
        { r[0 ], r[1 ], r[2 ], r[3 ], r[4 ], r[5 ], r[6 ], r[7 ], r[8 ], r[9 ], r[10], r[11], r[12], r[13], r[14], r[15],
          r[16], r[17], r[18], r[19], r[20], r[21], r[22], r[23], r[24], r[25], r[26], r[27], r[28], r[29], r[30], r[31],
          r[32], r[33], r[34], r[35], r[36], r[37], r[38], r[39], r[40], r[41], r[42], r[43], r[44], r[45], r[46], r[47],
          r[48], r[49], r[50], r[51], r[52], r[53], r[54], r[55], r[56], r[57], r[58], r[59], r[60], r[61], r[62], r[63]} <=
        { 32'd7, 32'd12, 32'd17, 32'd22, 32'd7, 32'd12, 32'd17, 32'd22, 32'd7, 32'd12, 32'd17, 32'd22, 32'd7, 32'd12, 32'd17, 32'd22,
          32'd5, 32'd9 , 32'd14, 32'd20, 32'd5, 32'd9 , 32'd14, 32'd20, 32'd5, 32'd9 , 32'd14, 32'd20, 32'd5,  32'd9, 32'd14, 32'd20,
          32'd4, 32'd11, 32'd16, 32'd23, 32'd4, 32'd11, 32'd16, 32'd23, 32'd4, 32'd11, 32'd16, 32'd23, 32'd4, 32'd11, 32'd16, 32'd23,
          32'd6, 32'd10, 32'd15, 32'd21, 32'd6, 32'd10, 32'd15, 32'd21, 32'd6, 32'd10, 32'd15, 32'd21, 32'd6, 32'd10, 32'd15, 32'd21};
        
        { k[0 ], k[1 ], k[2 ], k[3 ], k[4 ], k[5 ], k[6 ], k[7 ], k[8 ], k[9 ], k[10], k[11], k[12], k[13], k[14], k[15], 
            k[16], k[17], k[18], k[19], k[20], k[21], k[22], k[23], k[24], k[25], k[26], k[27], k[28], k[29], k[30], k[31], 
            k[32], k[33], k[34], k[35], k[36], k[37], k[38], k[39], k[40], k[41], k[42], k[43], k[44], k[45], k[46], k[47], 
            k[48], k[49], k[50], k[51], k[52], k[53], k[54], k[55], k[56], k[57], k[58], k[59], k[60], k[61], k[62], k[63]} <=
          { 32'hd76aa478, 32'he8c7b756, 32'h242070db, 32'hc1bdceee, 32'hf57c0faf, 32'h4787c62a, 32'ha8304613, 32'hfd469501,
            32'h698098d8, 32'h8b44f7af, 32'hffff5bb1, 32'h895cd7be, 32'h6b901122, 32'hfd987193, 32'ha679438e, 32'h49b40821,
            32'hf61e2562, 32'hc040b340, 32'h265e5a51, 32'he9b6c7aa, 32'hd62f105d, 32'h02441453, 32'hd8a1e681, 32'he7d3fbc8,
            32'h21e1cde6, 32'hc33707d6, 32'hf4d50d87, 32'h455a14ed, 32'ha9e3e905, 32'hfcefa3f8, 32'h676f02d9, 32'h8d2a4c8a,
            32'hfffa3942, 32'h8771f681, 32'h6d9d6122, 32'hfde5380c, 32'ha4beea44, 32'h4bdecfa9, 32'hf6bb4b60, 32'hbebfbc70,
            32'h289b7ec6, 32'heaa127fa, 32'hd4ef3085, 32'h04881d05, 32'hd9d4d039, 32'he6db99e5, 32'h1fa27cf8, 32'hc4ac5665,
            32'hf4292244, 32'h432aff97, 32'hab9423a7, 32'hfc93a039, 32'h655b59c3, 32'h8f0ccc92, 32'hffeff47d, 32'h85845dd1,
            32'h6fa87e4f, 32'hfe2ce6e0, 32'ha3014314, 32'h4e0811a1, 32'hf7537e82, 32'hbd3af235, 32'h2ad7d2bb, 32'heb86d391};
    end
end

//timer
always @(posedge clk) begin
    if (reset) begin
        time_counter <= 0;
        { timer[0], timer[1], timer[2], timer[3], timer[4], timer[5], timer[6]} <= { 8'h30, 8'h30, 8'h30, 8'h30, 8'h30, 8'h30, 8'h30};
    end
    else if (crack && P != S_MAIN_SHOW) begin
        time_counter = time_counter+1;
        if (time_counter == 100000) begin
            time_counter = 0;
            if (timer[6] != 8'h39) begin timer[6] <= timer[6] + 1; end
            else if (timer[5] != 8'h39) begin timer[5] <= timer[5] + 1; timer[6] <= 8'h30; end
            else if (timer[4] != 8'h39) begin timer[4] <= timer[4] + 1; timer[6] <= 8'h30; timer[5] <= 8'h30; end
            else if (timer[3] != 8'h39) begin timer[3] <= timer[3] + 1; timer[6] <= 8'h30; timer[5] <= 8'h30; timer[4] <= 8'h30; end
            else if (timer[2] != 8'h39) begin timer[2] <= timer[2] + 1; timer[6] <= 8'h30; timer[5] <= 8'h30; timer[4] <= 8'h30; timer[3] <= 8'h30; end
            else if (timer[1] != 8'h39) begin timer[1] <= timer[1] + 1; timer[6] <= 8'h30; timer[5] <= 8'h30; timer[4] <= 8'h30; timer[3] <= 8'h30; timer[2] <= 8'h30; end
            else if (timer[0] != 8'h39) begin timer[0] <= timer[0] + 1; timer[6] <= 8'h30; timer[5] <= 8'h30; timer[4] <= 8'h30; timer[3] <= 8'h30; timer[2] <= 8'h30; timer[1] <= 8'h30; end
        end
    end
end

// h0, h1, h2, h3
always @(posedge clk) begin
    if (P == S_MAIN_RESET) begin
        h0 <= 32'h67452301;
        h1 <= 32'hefcdab89;
        h2 <= 32'h98badcfe;
        h3 <= 32'h10325476;
    end
    else if (P == S_MAIN_ADD_CHUNK) begin
        h0 <= h0 + a;
        h1 <= h1 + b;
        h2 <= h2 + c;
        h3 <= h3 + d;
    end
end

// msg
always @(posedge clk) begin
    if (P == S_MAIN_MEMSET) begin
        for (i_msg = 0; i_msg < 120; i_msg=i_msg+1 ) begin
            msg[i_msg] <= 8'h0;
        end
    end
    if (P == S_MAIN_MEMCPY) begin
        msg[0] <= password[0];
        msg[1] <= password[1];
        msg[2] <= password[2];
        msg[3] <= password[3];
        msg[4] <= password[4];
        msg[5] <= password[5];
        msg[6] <= password[6];
        msg[7] <= password[7];
        msg[8] <= 8'd128;
    end
end

// a,b,c,d
always @(posedge clk) begin
    if (P == S_MAIN_INIT_HASH) begin
        a <= h0;
        b <= h1;
        c <= h2;
        d <= h3;
    end
    else if (P == S_MAIN_LOOP_1) increment_i = 0;
    else if (P == S_MAIN_LOOP_2) begin
        temp = d;
        d = c;
        c = b;
    end
    else if (P == S_MAIN_LOOP_3) begin
        x_lr = a + f + k[i] + w[g];
        c_lr = r[i];
    end
    else if (P == S_MAIN_LOOP_4 && !increment_i) begin
        b = (((x_lr) << (c_lr)) | ((x_lr) >> (32 - (c_lr))));
        a = temp;
        increment_i = 1;
    end
end

// w
always @(posedge clk) begin
    if (P==S_MAIN_BREAK_CHUNK) begin
        w[0 ] <= { msg[3 ], msg[2 ], msg[1 ], msg[0 ]};
        w[1 ] <= { msg[7 ], msg[6 ], msg[5 ], msg[4 ]};
        w[2 ] <= { msg[11], msg[10], msg[9 ], msg[8 ]};
        w[3 ] <= { msg[15], msg[14], msg[13], msg[12]};
        w[4 ] <= { msg[19], msg[18], msg[17], msg[16]};
        w[5 ] <= { msg[23], msg[22], msg[21], msg[20]};
        w[6 ] <= { msg[27], msg[26], msg[25], msg[24]};
        w[7 ] <= { msg[31], msg[30], msg[29], msg[28]};
        w[8 ] <= { msg[35], msg[34], msg[33], msg[32]};
        w[9 ] <= { msg[39], msg[38], msg[37], msg[36]};
        w[10] <= { msg[43], msg[42], msg[41], msg[40]};
        w[11] <= { msg[47], msg[46], msg[45], msg[44]};
        w[12] <= { msg[51], msg[50], msg[49], msg[48]};
        w[13] <= { msg[55], msg[54], msg[53], msg[52]};
        w[14] <= { msg[59], msg[58], msg[57], msg[56]};
        w[15] <= { msg[63], msg[62], msg[61], msg[60]};
    end
end

// i
always @(posedge clk) begin
    if (P == S_MAIN_RESET) begin
        i <= 32'd0;
        loop_done <= 0;
    end
    else if (P == S_MAIN_LOOP_4 && increment_i) begin
        i = i+1;
        if (i==64) loop_done = 1;
    end
end

//f, g
always @(posedge clk) begin
    if (P == S_MAIN_LOOP_1) begin
        if (i < 16) begin
            f = (b & c) | ((~b) & d);
            g = i;
        end else if (i < 32) begin
            f = (d & b) | ((~d) & c);
            g = (5*i + 1) % 16;
        end else if (i < 48) begin
            f = b ^ c ^ d;
            g = (3*i + 5) % 16;          
        end else begin
            f = c ^ (b | (~d));
            g = (7*i) % 16;
        end
    end
end

// hash
always @(posedge clk) begin
    if (P == S_MAIN_STORE_HASH) begin
        hash[0 ] <= h0[7 :0 ];
        hash[1 ] <= h0[15:8 ];
        hash[2 ] <= h0[23:16];
        hash[3 ] <= h0[31:24];
        hash[4 ] <= h1[7 :0 ];
        hash[5 ] <= h1[15:8 ];
        hash[6 ] <= h1[23:16];
        hash[7 ] <= h1[31:24];
        hash[8 ] <= h2[7 :0 ];
        hash[9 ] <= h2[15:8 ];
        hash[10] <= h2[23:16];
        hash[11] <= h2[31:24];
        hash[12] <= h3[7 :0 ];
        hash[13] <= h3[15:8 ];
        hash[14] <= h3[23:16];
        hash[15] <= h3[31:24];
    end
end

//compare
always @(posedge clk) begin
    if (P == S_MAIN_RESET) isSuccess <= 0;
    else if (P == S_MAIN_COMPARE) begin
        isSuccess <= ( hash[0 ] == passwd_hash[0  :7  ] && hash[1 ] == passwd_hash[8  :15 ] && hash[2 ] == passwd_hash[16 :23 ] && hash[3 ] == passwd_hash[24 :31 ] && 
                       hash[4 ] == passwd_hash[32 :39 ] && hash[5 ] == passwd_hash[40 :47 ] && hash[6 ] == passwd_hash[48 :55 ] && hash[7 ] == passwd_hash[56 :63 ] && 
                       hash[8 ] == passwd_hash[64 :71 ] && hash[9 ] == passwd_hash[72 :79 ] && hash[10] == passwd_hash[80 :87 ] && hash[11] == passwd_hash[88 :95 ] && 
                       hash[12] == passwd_hash[96 :103] && hash[13] == passwd_hash[104:111] && hash[14] == passwd_hash[112:119] && hash[15] == passwd_hash[120:127] );
    end
end

//count up
always @(posedge clk) begin
    if (reset || P == S_MAIN_IDLE) begin
        {password[0],password[1],password[2],password[3],password[4],password[5],password[6],password[7]}
        <= {d1,d2,d3,d4,d5,d6,d7,d8};
    end
    else if (P == S_MAIN_COUNT_UP) begin
        if (password[7] != 8'h39) password[7] <= password[7] + 1;
        else if (password[6] != 8'h39) begin password[6] <= password[6] + 1; password[7] <= 8'h30; end
        else if (password[5] != 8'h39) begin password[5] <= password[5] + 1; password[7] <= 8'h30; password[6] <= 8'h30; end
        else if (password[4] != 8'h39) begin password[4] <= password[4] + 1; password[7] <= 8'h30; password[6] <= 8'h30; password[5] <= 8'h30; end
        else if (password[3] != 8'h39) begin password[3] <= password[3] + 1; password[7] <= 8'h30; password[6] <= 8'h30; password[5] <= 8'h30; password[4] <= 8'h30; end
        else if (password[2] != 8'h39) begin password[2] <= password[2] + 1; password[7] <= 8'h30; password[6] <= 8'h30; password[5] <= 8'h30; password[4] <= 8'h30; password[3] <= 8'h30; end
        else if (password[1] != 8'h39) begin password[1] <= password[1] + 1; password[7] <= 8'h30; password[6] <= 8'h30; password[5] <= 8'h30; password[4] <= 8'h30; password[3] <= 8'h30; password[2] <= 8'h30; end
        else if (password[0] != 8'h39) begin password[0] <= password[0] + 1; password[7] <= 8'h30; password[6] <= 8'h30; password[5] <= 8'h30; password[4] <= 8'h30; password[3] <= 8'h30; password[2] <= 8'h30; password[1] <= 8'h30; end
    end
end

assign rowA = row_A;
assign rowB = row_B;

// Display
always @(posedge clk) begin
    if (P == S_MAIN_SHOW) begin
        row_A = {"Passwd: ",password[0],password[1],password[2],password[3],password[4],password[5],password[6],password[7]};
        row_B = {"Time:  ",timer[0],timer[1],timer[2],timer[3],timer[4],timer[5]," ms"};
    end 
end

endmodule





