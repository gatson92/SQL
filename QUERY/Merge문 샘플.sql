-- TargetTable과 SourceTable을 병합하여 TargetTable을 업데이트하거나 새 레코드를 삽입합니다.
MERGE INTO TargetTable AS t
USING SourceTable AS s
-- TargetTable과 SourceTable이 공통으로 참조하는 KeyColumn 값을 기준으로 레코드를 찾습니다.
ON t.KeyColumn = s.KeyColumn
-- 레코드가 이미 있는 경우 해당 레코드를 업데이트합니다.
WHEN MATCHED THEN
    -- SourceTable의 Column1과 Column2 값을 TargetTable의 해당 컬럼에 업데이트합니다.
    -- 이 때, SET 다음에 업데이트될 모든 컬럼과 해당 컬럼 값들을 나열합니다.
    UPDATE SET t.Column1 = s.Column1, t.Column2 = s.Column2
-- 레코드가 없는 경우에는 새 레코드를 삽입합니다.
WHEN NOT MATCHED THEN
    -- TargetTable의 KeyColumn, Column1, Column2 컬럼에 SourceTable의 해당 값들을 삽입합니다.
    -- 이 때, VALUES 다음에 삽입할 모든 컬럼과 해당 컬럼 값들을 나열합니다.
    INSERT (KeyColumn, Column1, Column2) VALUES (s.KeyColumn, s.Column1, s.Column2);
