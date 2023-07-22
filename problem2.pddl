(define (problem problem2)
    (:domain robo-mineracao)

    (:objects
        area_1 area_2 area_3 area_4 area_5 - Area
        area_6 area_7 area_8 area_9 area_10 - Area
        area_11 area_12 area_13 area_14 area_15 - Area
        area_16 area_17 area_18 area_19 area_20 - Area
        robo_1 - Robo
        robo_2 - Robo
        martelo - Martelo
        minerio_A minerio_B minerio_C - Minerio
        minerio_grande - MinerioGrande
        elevador - Elevador
        carregador - Carregador
        extintor_incendio - ExtintorIncendio
        estacao - Estacao
    )

    (:init
        (Objeto robo_1 area_9)

        (Objeto carregador area_14)
        (Objeto estacao area_17)
        (Objeto elevador area_12)

        (Objeto minerio_A area_2)
        (Objeto minerio_B area_7)
        (Objeto minerio_C area_8)

        (Objeto martelo area_4)
        (Rocha_Bloqueando area_7)
        (Objeto extintor_incendio area_10)
        (Fogo area_8)

        (= (bateria-quantidade robo_1) 50)
        (= (bateria-capacidade) 100)
        (= (oleo-quantidade robo_1) 50)
        (= (oleo-capacidade) 100)

        (Tunel area_8 area_4)
        (Tunel area_4 area_8)
        (Tunel area_11 area_18)
        (Tunel area_18 area_11)
        (Tunel area_3 area_11)
        (Tunel area_11 area_3)
        (Tunel area_3 area_19)
        (Tunel area_19 area_3)
        (Tunel area_4 area_13)
        (Tunel area_13 area_4)
        (Tunel area_5 area_19)
        (Tunel area_19 area_5)
        (Tunel area_15 area_19)
        (Tunel area_19 area_15)
        (Tunel area_1 area_14)
        (Tunel area_14 area_1)
        (Tunel area_10 area_11)
        (Tunel area_11 area_10)
        (Tunel area_7 area_8)
        (Tunel area_8 area_7)
        (Tunel area_7 area_12)
        (Tunel area_12 area_7)
        (Tunel area_13 area_3)
        (Tunel area_3 area_13)
        (Tunel area_17 area_5)
        (Tunel area_5 area_17)
        (Tunel area_7 area_11)
        (Tunel area_11 area_7)
        (Tunel area_18 area_14)
        (Tunel area_14 area_18)
        (Tunel area_18 area_15)
        (Tunel area_15 area_18)
        (Tunel area_10 area_20)
        (Tunel area_20 area_10)
        (Tunel area_9 area_5)
        (Tunel area_5 area_9)
        (Tunel area_20 area_3)
        (Tunel area_3 area_20)
        (Tunel area_13 area_2)
        (Tunel area_2 area_13)
    )

    (:goal
        (and
            (Minerio_Extraido minerio_A)
            (Minerio_Extraido minerio_B)
            (Minerio_Extraido minerio_C)
            (not (Fogo area_8))
        )
    )
)