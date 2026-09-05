#!/bin/bash

# Claude CodeがHook実行時にstdinへJSON形式で渡すコンテキスト情報を読み取り
INPUT=$(cat)
CWD=$(echo "$INPUT" | jq -r '.cwd // empty' 2>/dev/null)
PROJECT_NAME=$(basename "$CWD")
EVENT=$1

if [ -z "$PROJECT_NAME" ]; then
    PROJECT_NAME="Unknown"
fi

# イベントに応じてメッセージとサウンドを設定
if [ "$EVENT" = "permission" ]; then
    MESSAGE="許可を求めています"
    SOUND="default"
else
    MESSAGE="処理が完了しました"
    SOUND="Glass"
fi

# 実行環境に応じてアクティブ化するアプリを判定
case "$TERM_PROGRAM" in
    vscode)
        ACTIVATE_APP="com.microsoft.VSCode"
        EXECUTE_CMD="open 'vscode://file$CWD'"
        ;;
    Apple_Terminal)
        ACTIVATE_APP="com.apple.Terminal"
        EXECUTE_CMD=""
        ;;
    *)
        ACTIVATE_APP="com.microsoft.VSCode"
        EXECUTE_CMD="open 'vscode://file$CWD'"
        ;;
esac

# 通知を表示
NOTIFIER_ARGS=(
    -title "Claude Code: $PROJECT_NAME"
    -message "$MESSAGE"
    -sound "$SOUND"
    -group "$PROJECT_NAME"
    -activate "$ACTIVATE_APP"
)

if [ -n "$EXECUTE_CMD" ]; then
    NOTIFIER_ARGS+=(-execute "$EXECUTE_CMD")
fi

terminal-notifier "${NOTIFIER_ARGS[@]}"
