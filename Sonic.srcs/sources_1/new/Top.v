`timescale 1ns / 1ps
module Top(
    input clk,
    input [2:0] echo,

    output [2:0] trig,
    output [3:0] post1,
    output [3:0] post2,
    output [7:0] seg1,
    output [7:0] seg2,
    output [1:0] motor1,
    output [1:0] motor2,
    output [1:0] motor3,
    output [1:0] motor4,
    output [7:0] led
);

wire [15:0] text1;
wire [15:0] text2;
wire [15:0] text3;

wire [3:0] type;

Sonic_trig prog1(clk, trig[0]);
Sonic_echo prog2(clk, echo[0], text1);
Sonic_trig prog3(clk, trig[1]);
Sonic_echo prog4(clk, echo[1], text2);
Sonic_trig prog5(clk, trig[2]);
Sonic_echo prog6(clk, echo[2], text3);
PWM prog7(clk,type[0],motor1);
PWM prog8(clk,type[1],motor2);
PWM prog9(clk,type[2],motor3);
PWM prog10(clk,type[3],motor4);
Control prog11(text1,text2,text3,type);
led_seg prog12(clk, text2, text3, post1, post2, seg1, seg2);
led_display prog13(type, led);


endmodule