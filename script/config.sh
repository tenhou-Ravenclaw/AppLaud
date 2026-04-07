#!/bin/zsh

# --- 設定（すべてexportで環境変数化）---

# .envファイルからAPIキーを読み込む
_ENV_FILE="${SCRIPT_DIR}/.env"
if [ ! -f "$_ENV_FILE" ]; then
    echo "エラー: .envファイルが見つかりません: $_ENV_FILE" >&2
    echo "script/.env.example をコピーして script/.env を作成し、APIキーを設定してください。" >&2
    exit 1
fi
set -a
source "$_ENV_FILE"
set +a

# --- TODO: Setting ---
# 監視するボイスレコーダーのボリューム名
export RECORDER_NAME="NO NAME"

# --- TODO: Setting ---
# 音声ファイルが格納されているUSBデバイス内のサブディレクトリ名
export VOICE_FILES_SUBDIR="RECORD"

# --- TODO: Setting ---
# 音声ファイルを移動する先のローカルディレクトリ
export AUDIO_DEST_DIR="../audio"

# --- TODO: Setting ---
# 実行するPythonスクリプトのパス
export PYTHON_SCRIPT_PATH="./transcribe_summarize.py"

# --- TODO: Setting ---
# 要約時に使用するプロンプトファイルのパス
export SUMMARY_PROMPT_FILE_PATH="../prompt/summary_prompt.txt"

# --- TODO: Setting ---
# 処理済みファイルを記録するJSONLファイルのパス
export PROCESSED_LOG_FILE="../debug/processed_log.jsonl"

# --- TODO: Setting ---
# 処理対象の拡張子 (zsh配列形式で定義)
export TARGET_EXTENSIONS_ARRAY=(-iname '*.wav' -o -iname '*.mp3' -o -iname '*.m4a')

# --- TODO: Setting ---
# ステータス管理ファイル
export STATUS_FILE_PATH="../processing_status.jsonl"

# --- TODO: Setting ---
# プロンプトテンプレートファイル
export PROMPT_TEMPLATE_PATH="../prompt/template.txt"

# script/config.sh の中
export PATH="/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"

# --- ここまで設定 ---

# 設定値の確認 (デバッグ用)
echo "--- config.sh 設定値 (スクリプト基準での解決前) --- "
echo "RECORDER_NAME: ${RECORDER_NAME}"
echo "AUDIO_DEST_DIR: ${AUDIO_DEST_DIR}"
echo "MARKDOWN_OUTPUT_DIR: ${MARKDOWN_OUTPUT_DIR}"
echo "PYTHON_SCRIPT_PATH: ${PYTHON_SCRIPT_PATH}"
echo "SUMMARY_PROMPT_FILE_PATH: ${SUMMARY_PROMPT_FILE_PATH}"
echo "PROCESSED_LOG_FILE: ${PROCESSED_LOG_FILE}"
echo "TARGET_EXTENSIONS_ARRAY (各要素):"
for element in "${TARGET_EXTENSIONS_ARRAY[@]}"; do
  echo "  - '$element'"
done
echo "-------------------------"

# 設定内容の確認用 (デバッグ時にコメントを外してください)
# echo "RECORDER_NAME: $RECORDER_NAME"
# echo "AUDIO_DEST_DIR: $AUDIO_DEST_DIR"
# echo "MARKDOWN_OUTPUT_DIR: $MARKDOWN_OUTPUT_DIR"
# echo "PYTHON_SCRIPT_PATH: $PYTHON_SCRIPT_PATH"
# echo "SEARCH_PATTERNS: ${SEARCH_PATTERNS[@]}"
# echo "STATUS_FILE_PATH: $STATUS_FILE_PATH"
# echo "PROMPT_TEMPLATE_PATH: $PROMPT_TEMPLATE_PATH" 