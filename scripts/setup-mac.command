#!/bin/bash
#
# LLMWiki_GNN — macOS 자동 세팅 스크립트
# 더블클릭(또는 터미널 실행)하면:
#   1) iCloud Drive의 Obsidian 폴더에 저장소를 클론(있으면 최신화)
#   2) Finder에서 폴더를 열고, Obsidian으로 보관소(vault) 열기를 시도
#   3) 남은 2단계(보관소 등록 / 플러그인 설치)를 안내
#
# 사용자님 Mac에서 실행하세요. (Claude는 클라우드에서 동작하므로 직접 실행 불가)

set -euo pipefail

REPO_URL="https://github.com/BancaKim/LLMWiki_GNN.git"
BRANCH="claude/gnn-research-knowledge-wuof6u"   # PR 머지 후에는 main 으로 바꾸세요
ICLOUD_OBSIDIAN="$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents"
DEST="${DEST:-$ICLOUD_OBSIDIAN/LLMWiki_GNN}"   # DEST 환경변수로 위치 변경 가능

echo "==> LLMWiki_GNN macOS 세팅 시작"
echo "    대상 위치: $DEST"

# 0) git 확인
if ! command -v git >/dev/null 2>&1; then
  echo "!! git 이 필요합니다. 터미널에서 'xcode-select --install' 후 다시 실행하세요."
  exit 1
fi

# 1) iCloud Obsidian 폴더 준비
#    (이 폴더는 Obsidian에서 iCloud 보관소를 한 번이라도 만들면 생성됩니다.)
mkdir -p "$ICLOUD_OBSIDIAN"

# 2) 클론 또는 최신화
if [ -d "$DEST/.git" ]; then
  echo "==> 이미 존재 → 최신 내용으로 pull"
  git -C "$DEST" pull --ff-only origin "$BRANCH" || git -C "$DEST" pull origin "$BRANCH"
else
  echo "==> 클론 중..."
  git clone -b "$BRANCH" "$REPO_URL" "$DEST"
fi

# 3) Finder로 폴더 열기 + Obsidian 보관소 열기 시도
open "$DEST" || true
# URL 인코딩 후 obsidian:// 로 보관소 열기 시도(이미 등록돼 있으면 바로 열림)
ENC_PATH=$(python3 - "$DEST" <<'PY'
import sys, urllib.parse
print(urllib.parse.quote(sys.argv[1], safe=''))
PY
)
open "obsidian://open?path=$ENC_PATH" 2>/dev/null || open -a Obsidian 2>/dev/null || true

cat <<EOF

==========================================================
✅ 클론/동기화 완료: $DEST

남은 단계 (Obsidian에서 클릭 몇 번):
  1) Obsidian이 열리면 → "Open folder as vault" → 위 폴더 선택
     (이미 열렸다면 생략)
  2) Settings → Community plugins → 'Restricted mode' 끄기 →
     'Dataview' 와 'Obsidian Git' 설치 후 Enable
        - Dataview     : dashboard.md 가 자동 표·목록으로 렌더링됨
        - Obsidian Git : 자동 commit/pull/push 로 GitHub 백업
  3) 첫 화면은 index.md, 생산성 대시보드는 dashboard.md

📱 아이패드/아이폰: App Store에서 Obsidian 설치 →
   "Open folder as vault" → iCloud의 같은 'LLMWiki_GNN' 폴더 선택 (자동 동기화)
   ⚠️ 모바일에서는 git 동기화를 켜지 마세요. GitHub 푸시는 맥에서만!
==========================================================
EOF
