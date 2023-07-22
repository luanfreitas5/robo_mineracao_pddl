(define (problem problem1)
    (:domain robo-mineracao)

    (:objects
        area_1 area_2 area_3 area_4 area_5 - Area
        area_6 area_7 area_8 area_9 area_10 - Area
        robo_1 - Robo
        martelo - Martelo
        minerio_A - Minerio
        minerio_grande - MinerioGrande
        elevador - Elevador
        carregador - Carregador
        extintor_incendio - ExtintorIncendio
        estacao - Estacao
    )

    (:init

        (Objeto robo_1 area_1)

        (Objeto carregador area_3)
        (Objeto estacao area_6)
        (Objeto elevador area_9)

        (Objeto minerio_A area_2)

        (Objeto martelo area_4)
        (Rocha_Bloqueando area_7)
        (Objeto extintor_incendio area_10)
        (Fogo area_8)

        (= (bateria-quantidade robo_1) 50)
        (= (bateria-capacidade) 100)
        (= (oleo-quantidade robo_1) 50)
        (= (oleo-capacidade) 100)

        (Tunel area_6 area_4)
        (Tunel area_4 area_6)
        (Tunel area_1 area_3)
        (Tunel area_3 area_1)
        (Tunel area_9 area_8)
        (Tunel area_8 area_9)
        (Tunel area_10 area_8)
        (Tunel area_8 area_10)
        (Tunel area_4 area_2)
        (Tunel area_2 area_4)
        (Tunel area_9 area_5)
        (Tunel area_5 area_9)
        (Tunel area_2 area_5)
        (Tunel area_5 area_2)
        (Tunel area_5 area_1)
        (Tunel area_1 area_5)
        (Tunel area_8 area_2)
        (Tunel area_2 area_8)
        (Tunel area_5 area_7)
        (Tunel area_7 area_5)
    )

    (:goal
        (and
            (Minerio_Extraido minerio_A)
            (= (bateria-capacidade) 100)
            ;(= (bateria-quantidade robo_1) (bateria-capacidade))
        )
    )
    ;(:metric minimize (bateria-quantidade robo_1))
)