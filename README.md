# INF1771 – Jogo dos Animais

## Alunos

- Laís Corbellini Fagundes (1720482)
- Leonardo Santiago (1520893)
- Maria Clara Werneck (201209)
- Pedro Chamberlain (1710883)
- Rachel Elisa Szenberg (1811508)

## Arquivos

- `main.pl`: Configuração principal do jogo.
- `jogo_base.txt`: Estrutura utilizada para setar a árvore inicial.
- `jogo_atual.txt`: Estrutura utilizada para salvar árvore do jogo entre partidas.

## Rodando o Projeto

1. Abra o terminal da sua escolha;
2. Execute ```swipl``` para ativar o [SWI-Prolog](https://www.swi-prolog.org/);
3. Execute o jogo, com o comando a seguir:

```prolog
?- consult("main.pl").
?- play.
```

## Detalhes sobre a implementação do programa

### Pergunta

Uma pergunta é um nó. Ela é descendente de outra pergunta e pode ser pai de perguntas ou animais.

- `pergunta_s(X, Y)` significa que existe uma Pergunta X cuja resposta "s." liga a uma Pergunta Y;
- `pergunta_n(X, Y)` significa que existe uma Pergunta X cuja resposta "n." liga a uma Pergunta Y.

### Animal

Um animal é uma folha. Ele é descendente de outra pergunta, mas não é pai de ninguém.

- `animal_sim(X, Y)` significa que existe uma Pergunta X cuja resposta "s." liga a um Animal Y;
- `animal_nao(X, Y)` significa que existe uma Pergunta X cuja resposta "n." liga a um Animal Y.
