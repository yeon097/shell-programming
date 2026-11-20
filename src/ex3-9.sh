#!/bin/bash
# ex3-9.sh : 이름으로 DB.txt 검색

DB="DB.txt"

if [ ! -f "$DB" ]; then
    echo "DB.txt 가 없습니다. 먼저 ex3-8.sh 로 만들어 주세요."
    exit 1
fi

read -p "검색할 이름: " name
[ -z "$name" ] && { echo "이름을 입력하세요."; exit 1; }

echo "---------- 검색 결과 ----------"
if ! grep -i -F -- "$name" "$DB"; then
    echo "'$name' 에 해당하는 팀원이 없습니다."
fi
