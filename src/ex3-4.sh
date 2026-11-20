#!/bin/bash
# ex3-4.sh : 성적 관리 메뉴 (5번 종료 전까지 반복)

subjects=()   # 과목명
scores=()     # 점수

# 점수 → 등급 / GPA(4.0 만점)
to_grade() {
    awk -v s="$1" 'BEGIN {
        if      (s >= 90) print "A 4.0";
        else if (s >= 80) print "B 3.0";
        else if (s >= 70) print "C 2.0";
        else if (s >= 60) print "D 1.0";
        else              print "F 0.0";
    }'
}

average() {
    local sum=0 s
    for s in "${scores[@]}"; do
        sum=$(awk -v a="$sum" -v b="$s" 'BEGIN { print a + b }')
    done
    awk -v t="$sum" -v n="${#scores[@]}" 'BEGIN { printf "%.2f", t / n }'
}

while true; do
    echo "==================="
    echo "1) 과목 성적 추가"
    echo "2) 입력된 모든 점수 보기"
    echo "3) 평균 점수 확인"
    echo "4) 평균 등급 (GPA) 변환"
    echo "5) 종료"
    echo "==================="
    read -p "선택 (1~5): " choice

    case "$choice" in
        1)
            read -p "과목명: " name
            read -p "점수(0~100): " score
            if [[ "$score" =~ ^[0-9]+(\.[0-9]+)?$ ]] && \
               [ "$(awk -v s="$score" 'BEGIN { print (s <= 100) }')" -eq 1 ]; then
                subjects+=("$name")
                scores+=("$score")
                echo "→ 추가됨: $name $score 점"
            else
                echo "→ 0~100 사이의 숫자를 입력하세요."
            fi
            ;;
        2)
            if [ ${#scores[@]} -eq 0 ]; then
                echo "→ 입력된 점수가 없습니다."
            else
                for i in "${!scores[@]}"; do
                    echo "$((i + 1)). ${subjects[$i]} : ${scores[$i]} 점"
                done
            fi
            ;;
        3)
            if [ ${#scores[@]} -eq 0 ]; then
                echo "→ 입력된 점수가 없습니다."
            else
                echo "→ 평균 점수: $(average) 점 (${#scores[@]}과목)"
            fi
            ;;
        4)
            if [ ${#scores[@]} -eq 0 ]; then
                echo "→ 입력된 점수가 없습니다."
            else
                avg=$(average)
                read g p <<< "$(to_grade "$avg")"
                echo "→ 평균 $avg 점 = 등급 $g (GPA $p / 4.0)"
            fi
            ;;
        5)
            echo "프로그램을 종료합니다."
            break
            ;;
        *)
            echo "→ 1~5 중에서 선택하세요."
            ;;
    esac
done
