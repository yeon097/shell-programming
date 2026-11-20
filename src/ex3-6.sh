#!/bin/bash
# ex3-6.sh : 폴더 확인/생성 → 파일 5개 생성 → 압축 → 새 폴더에 압축 해제
# 사용법: ./ex3-6.sh 폴더이름

if [ -n "$1" ]; then
    dir="$1"
else
    read -p "폴더 이름: " dir
fi
[ -z "$dir" ] && { echo "폴더 이름이 비어 있습니다."; exit 1; }

# 1) 폴더 확인 후 없으면 생성
if [ -d "$dir" ]; then
    echo "[1] '$dir' 폴더가 이미 있습니다."
else
    mkdir -p "$dir"
    echo "[1] '$dir' 폴더를 생성했습니다."
fi

# 2) 파일 5개 생성
for i in 1 2 3 4 5; do
    echo "이것은 file$i 입니다." > "$dir/file$i.txt"
done
echo "[2] 파일 5개를 만들었습니다:"
ls "$dir"

# 3) 압축
tar -czf "$dir.tar.gz" "$dir"
echo "[3] 압축 완료: $dir.tar.gz"
ls -lh "$dir.tar.gz"

# 4) 새 폴더를 만들어 압축 해제
newdir="${dir}_extracted"
mkdir -p "$newdir"
tar -xzf "$dir.tar.gz" -C "$newdir"
echo "[4] '$newdir' 폴더에 압축을 풀었습니다:"
ls -R "$newdir"
