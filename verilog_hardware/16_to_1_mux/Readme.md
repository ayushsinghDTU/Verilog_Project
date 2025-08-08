step 1: waveform done  mux_16to_1_tb -> behavioral level 
step 2: 4*1 mux behavioral using this to make structural -> mux_16to_1
# 16-to-1 Multiplexer (MUX) in Verilog

This project demonstrates a simple 16-to-1 multiplexer designed in Verilog, with a testbench and waveform analysis using GTKWave.

---

## 🧠 Project Structure
verilog_hardware/
├── 16_to_1_mux/
│ ├── mux_16to_1.v # Verilog module for 16-to-1 mux
│ ├── mux_16to_1_tb.v # Testbench file
│ └── mux_16to_1_tb.vcd # Generated waveform
├── README.md # Project documentation

---

## 🔧 How to Run

### 1. Compile with Icarus Verilog
```bash
iverilog -o mux_16to_1_tb.vvp mux_16to_1_tb.v

3. View Waveform in GTKWave

gtkwave mux_16to_1_tb.vcd

📜 Verilog Module
verilog

module mux_16to_1(in, sel, out);
  input [15:0] in;
  input [3:0] sel;
  output out;

  assign out = in[sel];
endmodule
🧪 Testbench
initial begin
  $dumpfile("mux_16to_1_tb.vcd");
  $dumpvars(0, mux_16to_1_tb);
  $monitor($time, " A=%h, s=%h, f=%b", A, s, f);

  A = 16'hF0A5; s = 4'h0; #5;
  s = 4'h1; #5;
  s = 4'h6; #5;
  s = 4'hC; #5;

  $display("Test completed!");
  $finish;
end

📈 Output (Waveform)
Use GTKWave to view how the sel signal selects a corresponding bit from the 16-bit input.

WAVEFORM 
![Waveform Screenshot](mux_16to_1_tb.png)

✅ Tools Used
Icarus Verilog (iverilog, vvp)
GTKWave for waveform visualization
VS Code for code editing



