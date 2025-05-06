\m5_TLV_version 1d: tl-x.org
\m5
   
   // ============================================
   // Welcome, new visitors! Try the "Learn" menu.
   // ============================================
   
   //use(m5-1.0)   /// uncomment to use M5 macro library.
\SV
   // Macro providing required top-level module definition, random
   // stimulus support, and Verilator config.
   m5_makerchip_module   // (Expanded in Nav-TLV pane.)
\TLV
   |calc
      @0
         $reset = *reset;
      @1
         $val1[31:0] = >>1$out[31:0];       // Random 4-bit input (zero-extended to 32-bit)
         $val2[31:0] = $rand2[3:0];
         $op[1:0] = $rand3[1:0];
         $sum  = $val1 + $val2;
         $diff = $val1 - $val2;
         $prod = $val1 * $val2;
         $quot = ($val2 == 0) ? 32'd0 : $val1 / $val2;   
         $out[31:0] = $reset ? 32'b0 :($op == 0) ? $sum :($op == 1) ? 
                $diff : ($op == 2) ? $prod : $quot ;
         $cnt[31:0] = $reset ?32'b0 : >>1$cnt +1;
         
   
  
 
        
   
   // Assert these to end simulation (before the cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
\SV
   endmodule
