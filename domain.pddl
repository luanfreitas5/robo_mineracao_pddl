; Dominio que representa um robo num ambiente de mineracao.
(define (domain robo-mineracao)
    (:requirements :strips :typing :adl :fluents)

    (:types
        Area Item ItemGrande Robo Elevador Carregador Estacao - object
        Minerio Martelo ExtintorIncendio - Item
        MinerioGrande - ItemGrande
    )

    (:predicates
        ; Predicado para indicar se um objeto esta em um area especificada
        (Objeto ?objeto - object ?area - Area)

        ; Predicado para indicar se duas areas possui tunel conectando ambas
        (Tunel ?inicio - Area ?fim - Area)

        ; Predicado para indicar se um minerio foi extraido
        (Minerio_Extraido ?minerio - Minerio)

        ; Predicado para indicar se um minerio grande foi extraido
        (MinerioGrande_Extraido ?minerioGrande - MinerioGrande)

        ; Predicado para indicar se o robo esta segurando um item
        (Segurando_Item ?robo - Robo)

         ; Predicado para indicar se o robo esta segurando um item grande
        (Segurando_ItemGrande ?robo - Robo)

        ; Predicado para indicar qual item o robo esta segurando
        (Qual_Item ?robo - Robo ?item - Item)

        ; Predicado para indicar se uma rocha esta bloqueando um area
        (Rocha_Bloqueando ?area - Area)

        ; Predicado para indicar se ha fogo em uma area especificada
        (Fogo ?area - Area)

        ; Predicado para indicar se o elevador esta ligado
        (Elevador_Ligado ?elevador - Elevador)
    )

    (:functions
        ; Funcao para obter a quantidade de bateria do robo
        (bateria-quantidade ?robo - Robo)

        ; Funcao para obter a capacidade total da bateria
        (bateria-capacidade)

        ; Funcao para obter a quantidade de oleo do robo
        (oleo-quantidade ?robo - Robo)

        ; Funcao para obter a capacidade total de oleo do robo
        (oleo-capacidade)
    )

    ; Acao para recarregar a bateria do robo
    (:action RECARREGAR_BATERIA
        :parameters (?robo - Robo ?carregador - Carregador ?area - Area)
        :precondition (and
            (Objeto ?robo ?area)  ; O robo esta na area especificada
            (Objeto ?carregador ?area)  ; O carregador esta na area especificada
            (< (bateria-quantidade ?robo) (bateria-capacidade))  ; A quantidade de bateria do robo e menor que a capacidade
            (> (oleo-quantidade ?robo) 1)  ; A quantidade de oleo do robo e maior que 1
        )
        :effect (and
            (assign (bateria-quantidade ?robo) (bateria-capacidade))  ; Carrega completamente a bateria do robo
            (decrease (oleo-quantidade ?robo) 1)  ; Diminui a quantidade de oleo do robo em 1
        )
    )

    ; Acao para trocar o oleo do robo em uma estacao de troca de oleo
    (:action TROCAR_OLEO
        :parameters (?estacao - Estacao ?robo - Robo ?area - Area)
        :precondition (and
            (Objeto ?robo ?area)  ; O robo esta na area especificada
            (Objeto ?estacao ?area)  ; A estacao de troca de oleo esta na area especificada
            (< (oleo-quantidade ?robo) (oleo-capacidade))  ; A quantidade de oleo do robo e menor que a capacidade do poco
        )
        :effect (and
            (assign (oleo-quantidade ?robo) (oleo-capacidade))  ; A quantidade de oleo do robo e definida como a capacidade do poco
        )
    )

    ; Acao para mover o robo sem nenhum item segurando
    (:action MOVER_SEM_ITEM
        :parameters (?robo - Robo ?origem - Area ?destino - Area)
        :precondition (and
            (Tunel ?origem ?destino)  ; A area de origem e a area de destino
            (Objeto ?robo ?origem)  ; O robo esta na area de origem
            (not (Segurando_Item ?robo))  ; O robo nao esta segurando nenhum item
            (not (Segurando_ItemGrande ?robo))  ; O robo nao esta segurando nenhum item grande
            (>= (bateria-quantidade ?robo) 1)  ; A quantidade de bateria do robo e maior ou igual a 1
            (> (oleo-quantidade ?robo) 1)  ; A quantidade de oleo do robo e maior que 1
        )
        :effect (and
            (Objeto ?robo ?destino)  ; O robo se move para a area de destino
            (not (Objeto ?robo ?origem))  ; O robo deixa de estar na area de origem
            (decrease (bateria-quantidade ?robo) 1)  ; Diminui a quantidade de bateria do robo em 1
            (decrease (oleo-quantidade ?robo) 2)  ; Diminui a quantidade de oleo do robo em 2
        )
    )

    ; Acao para mover o robo segurando um item
    (:action MOVER_COM_ITEM
        :parameters (?robo - Robo ?origem - Area ?destino - Area)
        :precondition (and
            (Tunel ?origem ?destino)  ; A area de origem e a area de destino
            (Objeto ?robo ?origem)  ; O robo esta na area de origem
            (Segurando_Item ?robo)  ; O robo esta segurando um item
            (>= (bateria-quantidade ?robo) 3)  ; A quantidade de bateria do robo e maior ou igual a 3
            (> (oleo-quantidade ?robo) 1)  ; A quantidade de oleo do robo e maior que 1
        )
        :effect (and
            (Objeto ?robo ?destino)  ; O robo se move para a area de destino
            (not (Objeto ?robo ?origem))  ; O robo deixa de estar na area de origem
            (decrease (bateria-quantidade ?robo) 3)  ; Diminui a quantidade de bateria do robo em 3
            (decrease (oleo-quantidade ?robo) 3)  ; Diminui a quantidade de oleo do robo em 3
        )
    )

    ; Acao para o robo pegar um item
    (:action PEGAR_ITEM
        :parameters (?item - Item ?robo - Robo ?area - Area)
        :precondition (and
            (Objeto ?item ?area)  ; O item esta na area especificada
            (Objeto ?robo ?area)  ; O robo esta na area especificada
            (not (Segurando_Item ?robo))  ; O robo nao esta segurando nenhum item
            (not (Segurando_ItemGrande ?robo))  ; O robo nao esta segurando nenhum item grande
            (not (Rocha_Bloqueando ?area))  ; A area nao esta bloqueada por uma rocha
            (> (oleo-quantidade ?robo) 1)  ; A quantidade de oleo do robo e maior que 1
        )
        :effect (and
            (Segurando_Item ?robo)  ; O robo comeca a segurar o item
            (Qual_Item ?robo ?item)  ; O item e segurado pelo robo
            (not (Objeto ?item ?area))  ; O item nao esta mais na area
            (decrease (oleo-quantidade ?robo) 1)  ; Diminui a quantidade de oleo do robo em 1
        )
    )

    ; Acao para o robo pegar um item grande
    (:action PEGAR_ITEM_GRANDE
        :parameters (?itemGrande - ItemGrande ?robo_1 - Robo ?robo_2 - Robo ?area - Area)
        :precondition (and
            (Objeto ?itemGrande ?area)  ; O item grande esta na area especificada
            (Objeto ?robo_1 ?area)  ; O primeiro robo esta na area especificada
            (Objeto ?robo_2 ?area)  ; O segundo robo esta na area especificada
            (not (Segurando_Item ?robo_1))  ; O primeiro robo nao esta segurando nenhum item
            (not (Segurando_Item ?robo_2))  ; O segundo robo nao esta segurando nenhum item
            (not (Segurando_ItemGrande ?robo_1))  ; O primeiro robo nao esta segurando nenhum item grande
            (not (Segurando_ItemGrande ?robo_2))  ; O segundo robo nao esta segurando nenhum item grande
            (not (Rocha_Bloqueando ?area))  ; A area nao esta bloqueada por uma rocha
            (> (oleo-quantidade ?robo_1) 1)  ; A quantidade de oleo do primeiro robo e maior que 1
            (> (oleo-quantidade ?robo_2) 1)  ; A quantidade de oleo do segundo robo e maior que 1
        )
        :effect (and
            (Segurando_ItemGrande ?robo_1)  ; O primeiro robo comeca a segurar o item grande
            (Segurando_ItemGrande ?robo_2)  ; O segundo robo comeca a segurar o item grande
            (not (Objeto ?itemGrande ?area))  ; O item grande nao esta mais na area
            (decrease (oleo-quantidade ?robo_1) 1)  ; Diminui a quantidade de oleo do primeiro robo em 1
            (decrease (oleo-quantidade ?robo_2) 1)  ; Diminui a quantidade de oleo do segundo robo em 1
        )
    )

    ; Acao para o robo soltar um item
    (:action SOLTAR_ITEM
        :parameters (?item - Item ?robo - Robo ?area - Area)
        :precondition (and
            (Qual_Item ?robo ?item)  ; O robo esta segurando o item
            (Segurando_Item ?robo)  ; O robo esta segurando um item
            (> (oleo-quantidade ?robo) 1)  ; A quantidade de oleo do robo e maior que 1
        )
        :effect (and
            (Objeto ?item ?area)  ; O item e colocado na area
            (not (Segurando_Item ?robo))  ; O robo deixa de segurar o item
            (decrease (oleo-quantidade ?robo) 1)  ; Diminui a quantidade de oleo do robo em 1
        )
    )

    ; Acao para o robo soltar um item grande
    (:action SOLTAR_ITEM_GRANDE
        :parameters (?itemGrande - ItemGrande ?robo_1 - Robo ?robo_2 - Robo ?area - Area)
        :precondition (and
            (Objeto ?robo_1 ?area)  ; O primeiro robo esta na area especificada
            (Objeto ?robo_2 ?area)  ; O segundo robo esta na area especificada
            (> (oleo-quantidade ?robo_1) 1)  ; A quantidade de oleo do primeiro robo e maior que 1
            (> (oleo-quantidade ?robo_2) 1)  ; A quantidade de oleo do segundo robo e maior que 1
        )
        :effect (and
            (Objeto ?itemGrande ?area)  ; O item grande esta na area
            (not (Segurando_ItemGrande ?robo_1))  ; O primeiro robo nao esta mais segurando o item grande
            (not (Segurando_ItemGrande ?robo_2))  ; O segundo robo nao esta mais segurando o item grande
            (decrease (oleo-quantidade ?robo_1) 1)  ; Diminui a quantidade de oleo do primeiro robo em 1
            (decrease (oleo-quantidade ?robo_2) 1)  ; Diminui a quantidade de oleo do segundo robo em 1
        )
    )

    ; Acao para ligar o elevador
    (:action LIGAR_ELEVADOR
        :parameters (?elevador - Elevador ?robo - Robo ?area - Area)
        :precondition (and
            (Objeto ?robo ?area)  ; O robo esta na area especificada
            (Objeto ?elevador ?area)  ; O elevador esta na area especificada
            (> (oleo-quantidade ?robo) 1)  ; A quantidade de oleo do robo e maior que 1
        )
        :effect (and
            (Elevador_Ligado ?elevador)  ; O elevador e ligado
            (decrease (oleo-quantidade ?robo) 1)  ; Diminui a quantidade de oleo do robo em 1
        )
    )

    ; Acao para colocar minerio no elevador
    (:action TRANSPORTAR_MINERIO
        :parameters (?minerio - Minerio ?robo - Robo ?elevador - Elevador ?area - Area)
        :precondition (and
            (Objeto ?robo ?area)  ; O robo esta na area especificada
            (Objeto ?elevador ?area)  ; O elevador esta na area especificada
            (Elevador_Ligado ?elevador)  ; O elevador esta ligado
            (Qual_Item ?robo ?minerio)  ; O robo esta segurando o item
            (Segurando_Item ?robo)  ; O robo esta segurando um item
            (> (oleo-quantidade ?robo) 1)  ; A quantidade de oleo do robo e maior que 1
        )
        :effect (and
            (not (Segurando_Item ?robo))  ; O robo deixa de segurar o item
            (not (Qual_Item ?robo ?minerio))  ; O robo deixa de segurar o item
            (Minerio_Extraido ?minerio)  ; O minerio extraido
            (decrease (oleo-quantidade ?robo) 1)  ; Diminui a quantidade de oleo do robo em 1
        )
    )

    ; Acao para colocar minerio grande no elevador
    (:action TRANSPORTAR_MINERIO_GRANDE
        :parameters (?minerioGrande - MinerioGrande ?elevador - Elevador ?robo_1 - Robo ?robo_2 - Robo ?area - Area)
        :precondition (and
            (Objeto ?robo_1 ?area)  ; O primeiro robo esta na area especificada
            (Objeto ?robo_2 ?area)  ; O segundo robo esta na area especificada
            (Objeto ?elevador ?area)  ; O elevador esta na area especificada
            (Elevador_Ligado ?elevador)  ; O elevador esta ligado
            (Segurando_ItemGrande ?robo_1)  ; O primeiro robo esta segurando um item grande
            (Segurando_ItemGrande ?robo_2)  ; O segundo robo esta segurando um item grande
            (> (oleo-quantidade ?robo_1) 1)  ; A quantidade de oleo do primeiro robo e maior que 1
            (> (oleo-quantidade ?robo_2) 1)  ; A quantidade de oleo do segundo robo e maior que 1
        )
        :effect (and
            (not (Segurando_ItemGrande ?robo_1))  ; O primeiro robo nao esta mais segurando o item grande
            (not (Segurando_ItemGrande ?robo_2))  ; O segundo robo nao esta mais segurando o item grande
            (MinerioGrande_Extraido ?minerioGrande)  ; O item grande extraido
            (decrease (oleo-quantidade ?robo_1) 1)  ; Diminui a quantidade de oleo do primeiro robo em 1
            (decrease (oleo-quantidade ?robo_2) 1)  ; Diminui a quantidade de oleo do segundo robo em 1
        )
    )

    ; Acao para quebrar uma rocha com um martelo
    (:action QUEBRAR_ROCHA
        :parameters (?martelo - Martelo ?robo - Robo ?area - Area)
        :precondition (and
            (Segurando_Item ?robo)  ; O robo esta segurando um item
            (Qual_Item ?robo ?martelo)  ; O robo esta segurando o martelo
            (Objeto ?robo ?area)  ; O robo esta na area especificada
            (Rocha_Bloqueando ?area)  ; A area esta bloqueada por uma rocha
            (> (oleo-quantidade ?robo) 1)  ; A quantidade de oleo do robo e maior que 1
        )
        :effect (and
            (not (Rocha_Bloqueando ?area))  ; A rocha deixa de bloquear a area
            (decrease (oleo-quantidade ?robo) 1)  ; Diminui a quantidade de oleo do robo em 1
        )
    )

    ; Acao para o robo usar um extintor para apagar um fogo
    (:action APAGAR_FOGO
        :parameters (?extintorIncendio - ExtintorIncendio ?robo - Robo ?localizacao - Area ?area - Area)
        :precondition (and
            (Objeto ?robo ?area)  ; O robo esta na area especificada
            (Segurando_Item ?robo)  ; O robo esta segurando um item
            (Qual_Item ?robo ?extintorIncendio)  ; O robo esta segurando o extintor
            (Tunel ?area ?localizacao)  ; A area especificada da localizacao do fogo
            (Fogo ?localizacao)  ; A localizacao do fogo
            (> (oleo-quantidade ?robo) 1)  ; A quantidade de oleo do robo e maior que 1
        )
        :effect (and
            (not (Fogo ?localizacao))  ; O fogo e extinto
            (decrease (oleo-quantidade ?robo) 1)  ; Diminui a quantidade de oleo do robo em 1
        )
    )

    
)
