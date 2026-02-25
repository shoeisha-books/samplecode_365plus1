bits 32
extern MessageBoxA
extern ExitProcess

global winmain

section .text

winmain:
    push dword 0
    push dword title
    push dword string
    push dword 0
    call MessageBoxA   

    push dword 0    
    call ExitProcess 


section .data
    title: db 'Hello!', 0
    string: db 'SampleCode365+1', 0