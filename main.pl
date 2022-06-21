load :-
    consult('jogo_base.txt').

procura_animal(Pergunta, Animal) :-
    write(Pergunta), write(" (s./n.)"), nl,
    read(InputJogador), nl,
    (
        (InputJogador=s, pergunta_s(Pergunta, NovaPergunta), procura_animal(NovaPergunta, Animal), !);
        (InputJogador=s, not(pergunta_s(Pergunta, _)), animal_sim(Pergunta, Animal), !);
        (InputJogador=n, pergunta_n(Pergunta, NovaPergunta), procura_animal(NovaPergunta, Animal), !);
        (InputJogador=n, not(pergunta_n(Pergunta, _)), animal_nao(Pergunta, Animal), !)
    ).

verifica_resposta(Animal, InputJogador) :-
    write("Por acaso seu animal é um... "), write(Animal), write("? (s./n.)"), nl, 
    read(InputJogador), nl,
    (
        (InputJogador=s, write("Ganhei!"), nl);
        (InputJogador=n, write("OK... Você venceu..."), nl)
    ).

save :-
    tell('jogo_atual.txt'),
    listing(pergunta_inicial), listing(pergunta_s), listing(pergunta_n),
    listing(animal_s), listing(animal_n),
    told.

play :-
    write("=== JOGO DOS ANIMAIS ==="), nl, write("Bem-vindo ao jogo dos animais!"), nl, nl,
    write("Eu vou tentar adivinhar qual animal você está pensando..."), nl, 
    
    load, 
    pergunta_inicial(PerguntaInicial),
    procura_animal(PerguntaInicial, Animal),
    verifica_resposta(Animal, Resultado),
    save,
    write("Jogar novamente? (S/N): "), nl, 
    read(InputJogador),
    (   
        (InputJogador=s, nl, play, !, fail);
        (InputJogador=n, write("Até mais!"), nl, !, fail)
    ).