# misc_link_tests

16bit assembling, compiling and linking tests as preparation for a big evil reversing project (origin half C, half asm - self modifiying code, etc.)

the build.bat contains exact the command line parameters i use to build the sample, always up to date with my current state

| file       | info               |                                                  
| :--------- | :----------------- |
| part_0.asm | startup code       |   
| part_1.c   | some C code        | 
| part_2.asm | some asm code/data | 
| build.bat  | build script       | 


defined segments in obj files (veryfied with dmpobj output)

| obj-file   | segment  | class  | content                    |
| :--------- | :------- | :----- | :------------------------- |
| part_0.obj |  seg000  | CODE   | code + asm0_hello string   |
|            |  _DATA   | DATA   | empty                      |
| part_1.obj |  seg000  | CODE   | code                       |
|            |  CONST   | DATA   | hello from c code2 string  |
|            |  CONST2  | DATA   | hello from c code1 string  |
|            |  _DATA   | DATA   | offset var to code2 string |
| part_2.obj |  seg000  | CODE   | code + asm2_hello string, nothing behind string   |
|            |  _DATA   | DATA   | empty                      |


the segments gets merged into the resulting main.com this way

| obj-file   | segment  | class  | content                    |
| :--------- | :------- | :----- | :------------------------- |
| part_0.obj |  seg000  | CODE   | code + asm0_hello string   |
| part_1.obj |  seg000  | CODE   | code                       |
| part_2.obj |  seg000  | CODE   | code + asm2_hello, nothing behind string   |
| part_1.obj |  _DATA   | DATA   | offset var to code2 string |
| part_1.obj |  CONST   | DATA   | hello from c code2 string  |
| part_1.obj |  CONST2  | DATA   | hello from c code1 string  |


