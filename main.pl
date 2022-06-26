:- dynamic pergunta_s/2.
:- dynamic pergunta_n/2.
:- dynamic animal_s/2.
:- dynamic animal_n/2.

adiciona_animal(AntigoAnimal) :-
    write("Puxa! Eu não sei! Qual animal pensou?"), nl,
    read(NovoAnimal),

    write("Qual pergunta devo fazer para distinguir "), write(NovoAnimal), write(" de "), write(AntigoAnimal), write("?"), nl,
    read(NovaPergunta),

    write("E qual seria a resposta certa para essa pergunta? (s./n.)"), nl, 
    read(NovaResposta),
    
    (
        % Se a resposta para o AntigoAnimal era Sim
        (
            animal_s(PerguntaAntiga, AntigoAnimal),
            retract(animal_s(PerguntaAntiga, AntigoAnimal)),
            assertz(pergunta_s(PerguntaAntiga, NovaPergunta))
        );
        % se a resposta que direcionava para o AntigoAnimal era Não
        (
            animal_n(PerguntaAntiga, AntigoAnimal),
            retract(animal_n(PerguntaAntiga, AntigoAnimal)),
            assertz(pergunta_n(PerguntaAntiga, NovaPergunta))
        )
    ),
    (
        % Se a resposta para o NovoAnimal é Sim
        (
            NovaResposta==s,
            assertz(animal_s(NovaPergunta, NovoAnimal)),
            assertz(animal_n(NovaPergunta, AntigoAnimal))
        );
        % Se a resposta para o NovoAnimal é Não
        (
            NovaResposta==n,
            assertz(animal_n(NovaPergunta, NovoAnimal)),
            assertz(animal_s(NovaPergunta, AntigoAnimal))
        )
    ).

save :-
    tell('jogo_atual.txt'),
    listing(pergunta_inicial), listing(pergunta_s), listing(pergunta_n),
    listing(animal_s), listing(animal_n),
    told.

verifica_resposta(Animal, InputJogador) :-
    write("Por acaso seu animal é um... "), write(Animal), write("? (s./n.)"), nl, 
    read(InputJogador), nl,
    (
        (InputJogador==s, write("Ganhei!"), nl);
        (InputJogador==n, write("OK... Você venceu..."), nl)
    ).

procura_animal(Pergunta, Animal) :-
    write(Pergunta), write(" (s./n.)"), nl,
    read(InputJogador), nl,
    (
        (InputJogador==s, pergunta_s(Pergunta, NovaPergunta), procura_animal(NovaPergunta, Animal), !);
        (InputJogador==s, not(pergunta_s(Pergunta, _)), animal_s(Pergunta, Animal), !);
        (InputJogador==n, pergunta_n(Pergunta, NovaPergunta), procura_animal(NovaPergunta, Animal), !);
        (InputJogador==n, not(pergunta_n(Pergunta, _)), animal_n(Pergunta, Animal), !)
    ).

load :- 
    consult('jogo_base.txt').

play :-
    write("=== JOGO DOS ANIMAIS ==="), nl, write("Bem-vindo ao jogo dos animais!"), nl, nl,
    write("Eu vou tentar adivinhar qual animal você está pensando..."), nl, 
    
    load, 
    pergunta_inicial(PerguntaInicial),
    procura_animal(PerguntaInicial, Animal),
    verifica_resposta(Animal, Resultado),
    (
        (Resultado==s, nl);
        (Resultado==n, adiciona_animal(Animal), write("Obrigada por me ensinar algo novo!"), nl)
    ),
    save,
    write("Jogar novamente? (S/N): "), nl, 
    read(InputJogador),
    (   
        (InputJogador==s, nl, play, !, fail);
        (InputJogador==n, write("Até mais!"), nl, !, fail)
    ).
