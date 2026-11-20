#!/bin/bash
# ex3-3.sh : 점수(0~100)를 받아 A(90 이상) / B 등급으로 변환
#            과목별 등급과 평균 등급 출력

read -p "과목별 점수를 2개 이상 입력하세요 (공백으로 구분): " -a scores

if [ ${#scores[@]} -lt 2 ]; then
    echo "점수를 2개 이상 입력해야 합니다."
    exit 1
fi

grade() {   # 점수 → 등급
    awk -v s="$1" 'BEGIN { print (s >= 90) ? "A" : "B" }'
}

sum=0
i=1
for s in "${scores[@]}"; do
    # 숫자이고 0~100 범위인지 검사
    if ! [[ "$s" =~ ^[0-9]+(\.[0-9]+)?$ ]] || \
       [ "$(awk -v s="$s" 'BEGIN { print (s >= 0 && s <= 100) }')" -ne 1 ]; then
        echo "오류: '$s' 는 0~100 사이의 숫자가 아닙니다."
        exit 1
    fi
    echo "과목 $i: $s 점 → $(grade "$s") 등급"
    sum=$(awk -v a="$sum" -v b="$s" 'BEGIN { print a + b }')
    i=$((i + 1))
done

avg=$(awk -v t="$sum" -v n="${#scores[@]}" 'BEGIN { printf "%.2f", t / n }')
echo "-------------------------"
echo "평균 점수: $avg 점 → 평균 등급: $(grade "$avg")"
