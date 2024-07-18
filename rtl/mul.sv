module mul (
    input [3:0] a,
    input [3:0] b, 
  output [7:0] y
);

wire [7:0] partial_products [3:0];

assign partial_products[0] = a[0] ? {4'b0000, b} : 8'b00000000;
assign partial_products[1] = a[1] ? {3'b000, b, 1'b0} : 8'b00000000;
assign partial_products[2] = a[2] ? {2'b00, b, 2'b00} : 8'b00000000;
assign partial_products[3] = a[3] ? {1'b0, b, 3'b000} : 8'b00000000;

assign y = partial_products[0] + partial_products[1] + partial_products[2] + partial_products[3];

endmodule
