#!/bin/bash
# ex3-5.sh : 리눅스 시스템 상태 확인 메뉴

while true; do
    echo "==================="
    echo "1) 사용자 정보"
    echo "2) GPU 또는 CPU 사용률 확인"
    echo "3) 메모리 사용량 확인"
    echo "4) 디스크 사용량 확인"
    echo "5) 종료"
    echo "==================="
    read -p "선택 (1~5): " choice

    case "$choice" in
        1)
            echo "[사용자 정보]"
            echo "사용자 이름 : $(whoami)"
            echo "UID/GID     : $(id)"
            echo "홈 디렉터리 : $HOME"
            echo "사용 셸     : $SHELL"
            echo "현재 로그인 :"; who
            ;;
        2)
            if command -v nvidia-smi > /dev/null 2>&1; then
                echo "[GPU 사용률]"
                nvidia-smi
            else
                echo "[GPU 없음 → CPU 사용률]"
                top -bn1 | head -n 12
            fi
            ;;
        3)
            echo "[메모리 사용량]"
            free -h
            ;;
        4)
            echo "[디스크 사용량]"
            df -h
            echo
            echo "[현재 폴더 용량]"
            du -sh .
            ;;
        5)
            echo "종료합니다."
            break
            ;;
        *)
            echo "→ 1~5 중에서 선택하세요."
            ;;
    esac
done
