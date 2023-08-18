-- TargetTable�� SourceTable�� �����Ͽ� TargetTable�� ������Ʈ�ϰų� �� ���ڵ带 �����մϴ�.
MERGE INTO TargetTable AS t
USING SourceTable AS s
-- TargetTable�� SourceTable�� �������� �����ϴ� KeyColumn ���� �������� ���ڵ带 ã���ϴ�.
ON t.KeyColumn = s.KeyColumn
-- ���ڵ尡 �̹� �ִ� ��� �ش� ���ڵ带 ������Ʈ�մϴ�.
WHEN MATCHED THEN
    -- SourceTable�� Column1�� Column2 ���� TargetTable�� �ش� �÷��� ������Ʈ�մϴ�.
    -- �� ��, SET ������ ������Ʈ�� ��� �÷��� �ش� �÷� ������ �����մϴ�.
    UPDATE SET t.Column1 = s.Column1, t.Column2 = s.Column2
-- ���ڵ尡 ���� ��쿡�� �� ���ڵ带 �����մϴ�.
WHEN NOT MATCHED THEN
    -- TargetTable�� KeyColumn, Column1, Column2 �÷��� SourceTable�� �ش� ������ �����մϴ�.
    -- �� ��, VALUES ������ ������ ��� �÷��� �ش� �÷� ������ �����մϴ�.
    INSERT (KeyColumn, Column1, Column2) VALUES (s.KeyColumn, s.Column1, s.Column2);
