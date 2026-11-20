#!/bin/bash
# ex3-5b.sh : 내부 함수에서 리눅스 명령어(ls)를 실행하고
#             입력 인자를 그 명령어의 옵션으로 전달
# 사용법: ./ex3-5b.sh -l      ./ex3-5b.sh -la      ./ex3-5b.sh -lh /etc

run_ls() {
    echo ">> 실행: ls $*"
    ls "$@"
}

if [ $# -eq 0 ]; then
    echo "옵션을 인자로 주세요. 예) $0 -l   $0 -la   $0 -lh /etc"
    echo "(인자가 없어 기본값 -l 로 실행합니다)"
    run_ls -l
else
    run_ls "$@"
fi
