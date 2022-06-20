play :-
    write("=== JOGO DOS ANIMAIS ==="), nl, nl,
    write("Bem-vindo ao Jogo dos Animais!"), nl,
    write("Eu vou tentar adivinhar qual animal você está pensando..."), nl,

    /*
        1. inicia um novo jogo
        2. computador verifica se ele acertou
            2.1 se acertou, passa direto
            2.2 se errou, adiciona animal para memória do jogo
    */

    write("Jogar novamente? (S/N): "), nl, 
    read(player_input),
    (   
        (player_input = S, nl, play, !, fail);
        (player_input = N, nl,   nl, !, fail)
    ).