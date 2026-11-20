#!/bin/bash
# ex3-2.sh : y = (1/2) * x^2 계산 (실수 가능, 값 2개 이상 입력)

read -p "x 값을 2개 이상 입력하세요 (공백으로 구분, 실수 가능): " -a xs

if [ ${#xs[@]} -lt 2 ]; then
    echo "값을 2개 이상 입력해야 합니다."
    exit 1
fi

echo "-------------------------"
for x in "${xs[@]}"; do
    # awk 로 실수 계산
    y=$(awk -v x="$x" 'BEGIN { printf "%.4f", 0.5 * x * x }')
    echo "x = $x  →  y = 1/2 * x^2 = $y"
done
