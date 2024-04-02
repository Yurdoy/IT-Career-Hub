#1/bin/bash
# Функция для выполнения пинга
perform_ping()
#address=$1
result=$(ping -c 3 -1 1 -W 1 "$address" 2>&1) if [I $? -eq 0 71; then
avg ping=$(echo "$result" | tail -1 | awk -F'/' '(print $5)') if (( (echo "$avg_ping > 100" | bc -1) )); then
echo "Среднее время пинга превышает 100 мс: $avg-ping MC"
fi
else
echo "Пинг не удался для адреса: $address"
fi
#Copy code
# Получаем адрес для пинга
read -р "Введите адрес для пинга: " address="192.168.1.20"
# Бесконечный цикл для выполнения пинга
while true; do
perform-ping
"Baddress"
sleep 1
done
