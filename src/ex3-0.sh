#!/bin/bash
# ex3-0.sh : 환경변수 MYENV 를 .bashrc 에 등록 / 확인 / 해제
# 사용법: ./ex3-0.sh set | check | unset

BASHRC="$HOME/.bashrc"
LINE='export MYENV="Hello Shell"'

case "$1" in
    set)
        # 이미 등록돼 있지 않을 때만 추가
        if grep -qF "$LINE" "$BASHRC"; then
            echo "이미 .bashrc 에 등록되어 있습니다."
        else
            echo "$LINE" >> "$BASHRC"
            echo ".bashrc 에 MYENV 를 등록했습니다."
        fi
        echo "새 터미널을 열거나 'source ~/.bashrc' 를 실행한 뒤 './ex3-0.sh check' 로 확인하세요."
        ;;
    check)
        echo "[.bashrc 등록 여부]"
        grep -n "MYENV" "$BASHRC" || echo "  (.bashrc 에 MYENV 없음)"
        echo "[현재 셸에서의 MYENV 값]"
        if [ -n "$MYENV" ]; then
            echo "  MYENV = $MYENV  → 값이 유지되고 있습니다."
        else
            echo "  MYENV 가 설정되어 있지 않습니다."
        fi
        ;;
    unset)
        # .bashrc 에서 해당 줄 삭제 (원본은 .bashrc.bak 으로 백업)
        sed -i.bak '/export MYENV=/d' "$BASHRC"
        unset MYENV
        echo ".bashrc 에서 MYENV 를 삭제했습니다."
        echo "※ 지금 열려 있는 터미널에는 값이 남아 있으니 터미널에서 'unset MYENV' 를 직접 입력하거나"
        echo "   새 터미널을 열어 './ex3-0.sh check' 로 해제됐는지 확인하세요."
        ;;
    *)
        echo "사용법: $0 set | check | unset"
        exit 1
        ;;
esac
