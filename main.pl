load :-
    consult('jogo_base.txt').


save :-
    tell('jogo_atual.txt'),
    listing(pergunta_inicial), listing(pergunta_s), listing(pergunta_n),
    listing(animal_s), listing(animal_n),
    told.

play :-
    write("=== JOGO DOS ANIMAIS ==="), nl, write("Bem-vindo ao jogo dos animais!"), nl, nl,
    write("Eu vou tentar adivinhar qual animal você está pensando..."), nl, 
    
    load, 
    save,
    write("Jogar novamente? (S/N): "), nl, 
    read(InputJogador),
    (   
        (InputJogador=s, nl, play, !, fail);
        (InputJogador=n, write("Até mais!"), nl, !, fail)
    ).