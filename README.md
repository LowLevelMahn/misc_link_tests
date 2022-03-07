# misc_link_tests
16bit linking tests as preparation for a reversing project


defined segments in obj files (veryfied with dmpobj output)

| obj-file   | segment  | class  |                                                  
| :--------- | :------- | :----- |
| part_0.obj |  seg000  | CODE   | 
|            |  _DATA   | DATA   |
| part_1.obj |  seg000  | CODE   |
|            |  CONST   | DATA   |
|            |  CONST2  | DATA   |
|            |  _DATA   | DATA   |
| part_2.obj |  seg000  | CODE   |
|            |  _DATA   | DATA   |



