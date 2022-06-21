load :-
    consult('jogo_base.txt').

play :-
    write("=== JOGO DOS ANIMAIS ==="), nl, write("Bem-vindo ao jogo dos animais!"), nl, nl,
    write("Eu vou tentar adivinhar qual animal você está pensando..."), nl, 
    
    load, 
    write("Jogar novamente? (S/N): "), nl, 
    read(InputJogador),
    (   
        (InputJogador=s, nl, play, !, fail);
        (InputJogador=n, write("Até mais!"), nl, !, fail)
    ).