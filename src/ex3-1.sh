#!/bin/bash
# ex3-1.sh : 두 정수를 인자로 받아 사칙연산 수행
# 사용법: ./ex3-1.sh 10 3

if [ $# -ne 2 ]; then
    echo "사용법: $0 숫자1 숫자2"
    exit 1
fi

a=$1
b=$2

# 정수인지 검사
case "$a$b" in
    *[!0-9-]*|"") echo "정수만 입력하세요."; exit 1 ;;
esac

echo "$a + $b = $((a + b))"
echo "$a - $b = $((a - b))"
echo "$a * $b = $((a * b))"

if [ "$b" -eq 0 ]; then
    echo "$a / $b = 계산 불가 (0으로 나눌 수 없음)"
else
    echo "$a / $b = $((a / b))  (몫)"
    echo "$a % $b = $((a % b))  (나머지)"
fi
