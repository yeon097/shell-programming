#!/bin/bash
# ex3-8.sh : 팀원 이름과 생일/전화번호를 DB.txt 에 기록
#            이어서 추가하거나 처음부터 다시 작성 가능

DB="DB.txt"

echo "1) 기존 DB.txt 에 이어서 추가"
echo "2) 처음부터 다시 작성 (기존 내용 삭제)"
read -p "선택 (1/2): " mode

if [ "$mode" = "2" ]; then
    : > "$DB"        # 파일 비우기
    echo "→ DB.txt 를 새로 만들었습니다."
else
    touch "$DB"
    echo "→ 기존 DB.txt 에 이어서 추가합니다."
fi

while true; do
    read -p "이름 (끝내려면 그냥 엔터): " name
    [ -z "$name" ] && break
    read -p "생일 또는 전화번호: " info
    echo "$name | $info" >> "$DB"
    echo "→ 저장됨: $name | $info"
done

echo "================ DB.txt 내용 ================"
cat "$DB"
