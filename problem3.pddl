(define (problem problem3)
    (:domain robo-mineracao)

    (:objects
        area_1 area_2 area_3 area_4 area_5 - Area
        area_6 area_7 area_8 area_9 area_10 - Area
        area_11 area_12 area_13 area_14 area_15 - Area
        area_16 area_17 area_18 area_19 area_20 - Area
        area_21 area_22 area_23 - Area
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

        (Objeto robo_1 area_17)
        (Objeto robo_2 area_4)

        (Objeto minerio_A area_1)
        (Objeto minerio_B area_3)
        (Objeto minerio_C area_10)

        (Rocha_Bloqueando area_1)
        (Rocha_Bloqueando area_10)
        (Rocha_Bloqueando area_3)
        (Rocha_Bloqueando area_13)

        (Objeto extintor_incendio area_14)
        (Objeto minerio_grande area_13)
        (Objeto estacao area_22)

        (Objeto martelo area_8)
        (Objeto elevador area_23)
        (Objeto carregador area_12)

        (Fogo area_7)

        (= (bateria-quantidade robo_1) 50)
        (= (bateria-capacidade) 100)
        (= (oleo-quantidade robo_1) 50)
        (= (oleo-capacidade) 100)
        (= (bateria-quantidade robo_2) 50)
        (= (bateria-capacidade) 100)
        (= (oleo-quantidade robo_2) 50)
        (= (oleo-capacidade) 100)

        (Tunel area_2 area_3)
        (Tunel area_2 area_7)
        (Tunel area_7 area_11)
        (Tunel area_11 area_12)
        (Tunel area_11 area_17)
        (Tunel area_13 area_14)
        (Tunel area_14 area_15)
        (Tunel area_15 area_16)
        (Tunel area_16 area_17)
        (Tunel area_17 area_19)
        (Tunel area_19 area_22)
        (Tunel area_22 area_21)
        (Tunel area_21 area_23)
        (Tunel area_20 area_21)
        (Tunel area_18 area_20)
        (Tunel area_15 area_18)
        (Tunel area_9 area_13)
        (Tunel area_8 area_9)
        (Tunel area_4 area_9)
        (Tunel area_4 area_5)
        (Tunel area_5 area_6)
        (Tunel area_1 area_5)
        (Tunel area_6 area_10)
        (Tunel area_10 area_15)

        (Tunel area_3 area_2)
        (Tunel area_7 area_2)
        (Tunel area_11 area_7)
        (Tunel area_12 area_11)
        (Tunel area_17 area_11)
        (Tunel area_14 area_13)
        (Tunel area_15 area_14)
        (Tunel area_16 area_15)
        (Tunel area_17 area_16)
        (Tunel area_19 area_17)
        (Tunel area_22 area_19)
        (Tunel area_21 area_22)
        (Tunel area_23 area_21)
        (Tunel area_21 area_20)
        (Tunel area_20 area_18)
        (Tunel area_18 area_15)
        (Tunel area_13 area_9)
        (Tunel area_9 area_8)
        (Tunel area_9 area_4)
        (Tunel area_5 area_4)
        (Tunel area_6 area_5)
        (Tunel area_5 area_1)
        (Tunel area_10 area_6)
        (Tunel area_15 area_10)
    )

    (:goal
        (and
            (Minerio_Extraido minerio_A)
            (Minerio_Extraido minerio_B)
            (Minerio_Extraido minerio_C)
            (not (Fogo area_7))
            (MinerioGrande_Extraido minerio_grande)
        )
    )
)