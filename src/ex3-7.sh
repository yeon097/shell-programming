#!/bin/bash
# ex3-7.sh : 폴더에 파일 5개 이상 생성 → 파일 이름대로 하위 폴더 생성 → 각 폴더에 파일 링크
# 사용법: ./ex3-7.sh 폴더이름

if [ -n "$1" ]; then
    dir="$1"
else
    read -p "폴더 이름: " dir
fi
[ -z "$dir" ] && { echo "폴더 이름이 비어 있습니다."; exit 1; }

mkdir -p "$dir"

# 1) 파일 6개 생성
names=(apple banana cherry grape melon lemon)
for n in "${names[@]}"; do
    echo "내용: $n" > "$dir/$n.txt"
done
echo "[1] 파일 ${#names[@]}개 생성:"
ls "$dir"

# 2) 파일 이름대로 하위 폴더 만들고, 그 안에 원본 파일을 심볼릭 링크
for n in "${names[@]}"; do
    mkdir -p "$dir/$n"
    ln -sf "$(realpath "$dir/$n.txt")" "$dir/$n/$n.txt"
done

echo "[2] 하위 폴더와 링크 확인:"
ls -lR "$dir"
