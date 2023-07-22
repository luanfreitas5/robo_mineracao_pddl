(define (problem problem4)
    (:domain robo-mineracao)

    (:objects
        area_1 area_2 area_3 area_4 area_5 - Area
        area_6 area_7 area_8 area_9 area_10 - Area
        area_11 area_12 area_13 area_14 area_15 - Area
        area_16 area_17 area_18 area_19 area_20 - Area
        area_21 area_22 area_23 area_24 area_25 - Area
        area_26 area_27 area_28 area_29 area_30 - Area
        robo_1 - Robo
        robo_2 - Robo
        martelo - Martelo
        minerio_A minerio_B minerio_C - Minerio
        minerio_grande_1 minerio_grande_2 - MinerioGrande
        elevador - Elevador
        carregador - Carregador
        extintor_incendio - ExtintorIncendio
        estacao - Estacao
    )

    (:init
        (Objeto robo_1 area_23)
        (Objeto robo_2 area_17)

        (Objeto carregador area_20)
        (Objeto estacao area_11)
        (Objeto elevador area_10)

        (Objeto minerio_A area_4)
        (Objeto minerio_B area_25)
        (Objeto minerio_C area_8)

        (Objeto minerio_grande_1 area_3)
        (Objeto minerio_grande_2 area_16)

        (Rocha_Bloqueando area_3)
        (Rocha_Bloqueando area_16)
        (Rocha_Bloqueando area_4)

        (Fogo area_25)
        (Fogo area_8)

        (Objeto martelo area_15)
        (Objeto extintor_incendio area_2)

        (= (bateria-quantidade robo_1) 50)
        (= (bateria-capacidade) 100)
        (= (oleo-quantidade robo_1) 50)
        (= (oleo-capacidade) 100)

        (= (bateria-quantidade robo_2) 50)
        (= (bateria-capacidade) 100)
        (= (oleo-quantidade robo_2) 50)
        (= (oleo-capacidade) 100)

        (Tunel area_11 area_9)
        (Tunel area_9 area_11)
        (Tunel area_1 area_10)
        (Tunel area_10 area_1)
        (Tunel area_30 area_14)
        (Tunel area_14 area_30)
        (Tunel area_27 area_22)
        (Tunel area_22 area_27)
        (Tunel area_7 area_13)
        (Tunel area_13 area_7)
        (Tunel area_9 area_24)
        (Tunel area_24 area_9)
        (Tunel area_10 area_20)
        (Tunel area_20 area_10)
        (Tunel area_4 area_3)
        (Tunel area_3 area_4)
        (Tunel area_12 area_2)
        (Tunel area_2 area_12)
        (Tunel area_8 area_4)
        (Tunel area_4 area_8)
        (Tunel area_1 area_21)
        (Tunel area_21 area_1)
        (Tunel area_13 area_17)
        (Tunel area_17 area_13)
        (Tunel area_27 area_4)
        (Tunel area_4 area_27)
        (Tunel area_12 area_25)
        (Tunel area_25 area_12)
        (Tunel area_16 area_19)
        (Tunel area_19 area_16)
        (Tunel area_10 area_29)
        (Tunel area_29 area_10)
        (Tunel area_15 area_29)
        (Tunel area_29 area_15)
        (Tunel area_13 area_11)
        (Tunel area_11 area_13)
        (Tunel area_24 area_21)
        (Tunel area_21 area_24)
        (Tunel area_29 area_14)
        (Tunel area_14 area_29)
        (Tunel area_12 area_15)
        (Tunel area_15 area_12)
        (Tunel area_25 area_6)
        (Tunel area_6 area_25)
        (Tunel area_28 area_4)
        (Tunel area_4 area_28)
        (Tunel area_23 area_11)
        (Tunel area_11 area_23)
        (Tunel area_28 area_24)
        (Tunel area_24 area_28)
        (Tunel area_20 area_13)
        (Tunel area_13 area_20)
        (Tunel area_17 area_1)
        (Tunel area_1 area_17)
        (Tunel area_14 area_9)
        (Tunel area_9 area_14)
        (Tunel area_30 area_25)
        (Tunel area_25 area_30)
        (Tunel area_27 area_23)
        (Tunel area_23 area_27)
    )

    (:goal
        (and
            (Minerio_Extraido minerio_A)
            (Minerio_Extraido minerio_B)
            (Minerio_Extraido minerio_C)
            (MinerioGrande_Extraido minerio_grande_1)
            (MinerioGrande_Extraido minerio_grande_2)
            (not (Fogo area_25))
            (not (Fogo area_8))
        )
    )
)