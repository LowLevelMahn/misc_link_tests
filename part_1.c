extern char asm0_hello[];
extern char asm2_hello[];

const char c_hello1[] = "hello data from c code1\r\n$"; 
const char* c_hello2 = "hello data from c code2\r\n$"; 

static inline void asm_dos_print2(const char *text_ofs_);
#pragma aux asm_dos_print2 = \
    "mov ah,09h" \
    "int 21h" \
__parm [__dx] __modify [__ax]
	
void cdecl near asm1_proc()
{
  asm_dos_print2(asm0_hello);
  asm_dos_print2(asm2_hello);
  asm_dos_print2(c_hello1);
  asm_dos_print2(c_hello2);
}
