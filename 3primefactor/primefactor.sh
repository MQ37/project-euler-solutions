#!/bin/sh
is_prime () {
    for j in $(seq 2 $(echo "sqrt($1)" | bc))
    do
        if [ $(($1 % $j)) -eq 0 ]
        then
            return 1
        fi
    done
    return 0
}

prime_factor () {
    f=0
    for i in $(seq 2 $(echo "sqrt($1)+1" | bc))
    do
        if [ $(($1 % $i)) -eq 0 ]
        then
            if is_prime $i && [ $i -gt $f ]
            then
                f=$i
            fi
            inv=$(($1/$i))
            if is_prime $inv && [ $inv -gt $f ]
            then
                f=$inv
            fi
        fi
    done
    echo "Largest prime factor: $f"
}

prime_factor 600851475143

