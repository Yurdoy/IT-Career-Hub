#!/bin/bash

# Функция для проверки времени пинга
check_ping() {
    local address=$1
    local timeout=3  # Количество попыток
    local count=0    # Счетчик неудачных попыток

    # Бесконечный цикл
    while :
    do
        # Выполнение пинга и получение времени в миллисекундах
        local response=$(ping "$address" | grep "time=" | cut -d '=' -f 4 | cut -d ' ' -f 1)
        
        # Проверка времени пинга и неудачных попыток
        if [ -z "$response" ]; then
            ((count++))
            if [ $count -eq $timeout ]; then
                echo "Пинг не удался $timeout раз подряд."
                exit 1
            fi
        elif (( $(echo "$response > 100" | bc -l) )); then
            echo "Время пинга превысило 100 мс: $response мс."
            exit 1
        else
            count=0
            echo "Время пинга: $response мс."
        fi
        
        # Пауза в 1 секунду
        sleep 1
    done
}

# Получение адреса от пользователя
read -p "Введите адрес для пинга: " address

# Вызов функции для проверки пинга
check_ping "$address"
