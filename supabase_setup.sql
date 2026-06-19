-- Supabase SQL Editor에서 실행하세요.
-- 프로젝트: jolaonlxlmnrqdusxjla.supabase.co

CREATE TABLE IF NOT EXISTS tycoon_rankings (
    id BIGSERIAL PRIMARY KEY,
    nickname TEXT NOT NULL,
    money NUMERIC DEFAULT 0,
    stage INTEGER DEFAULT 1,
    streak_points INTEGER DEFAULT 0,
    coins INTEGER DEFAULT 0,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 인덱스 (랭킹 정렬용)
CREATE INDEX IF NOT EXISTS idx_tycoon_rankings_money ON tycoon_rankings(money DESC);

-- RLS 활성화
ALTER TABLE tycoon_rankings ENABLE ROW LEVEL SECURITY;

-- 누구나 조회 가능
CREATE POLICY "Anyone can read rankings"
    ON tycoon_rankings FOR SELECT
    USING (true);

-- 누구나 등록 가능
CREATE POLICY "Anyone can insert rankings"
    ON tycoon_rankings FOR INSERT
    WITH CHECK (true);
