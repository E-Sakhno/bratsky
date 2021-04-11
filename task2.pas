var
 x: Integer;
 y: Word;

begin
 Writeln ('Введите х и в зависимости от его значения выполним действия:');
 Writeln ('y=x^2+2*x    если X>0');
 Writeln ('y=10*x       если x<0');
 Writeln ('y=x^3        если 1<=X<=5');
 Write ('Введите x= ');
 Readln (x);
  asm
   mov cx,x
   cmp cx,0
   jl @1{X<0}

   cmp cx,1
   jge @2
   @2:
   cmp cx,5
   jle @3

   cmp cx,0
   jg  @4 {X>0}
   
   

@1:
   mov ax,x     {В регистр AL вводиться старший байт слова N}
   mov cl,10
   imul cl
   mov y,ax
   jmp @ends     {Перепрыгиваем на метку ENDS}


@3:
   mov ax,x
   mul x
   mul x
   mov y,ax
   jmp @ends


@4:
mov ax,x
mul x 
mov y,ax

mov cx,2
mov ax,x 
mul cx

add y,ax
jmp @ends
   

@ends:
 end;
Writeln ('Y= ',y);
end.
