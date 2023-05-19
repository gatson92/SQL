USE WOORIM_230215
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- DROP TABLE HqInventory_His
CREATE TABLE HqInventory_His(
    seq			INT IDENTITY(1,1) PRIMARY KEY, 
    hqSeq		INT NOT NULL, 
    preInv		VARCHAR(50) NOT NULL, 
    nxtInv		VARCHAR(50) NOT NULL, 
    qty			INT NOT NULL, 
    rgtId		VARCHAR(20), 
    rgtDt	DATETIME NOT NULL
);

EXEC sp_addextendedproperty 
@name = N'MS_Description', 
@value = N'seq', 
@level0type = N'SCHEMA', @level0name = 'dbo',
@level1type = N'TABLE',  @level1name = 'HqInventory_His',
@level2type = N'COLUMN', @level2name = 'seq';

EXEC sp_addextendedproperty 
@name = N'MS_Description', 
@value = N'본사 창고의 SEQ', 
@level0type = N'SCHEMA', @level0name = 'dbo',
@level1type = N'TABLE',  @level1name = 'HqInventory_His',
@level2type = N'COLUMN', @level2name = 'hqSeq';

EXEC sp_addextendedproperty 
@name = N'MS_Description', 
@value = N'재고가 이동될 창고의 이름', 
@level0type = N'SCHEMA', @level0name = 'dbo',
@level1type = N'TABLE',  @level1name = 'HqInventory_His',
@level2type = N'COLUMN', @level2name = 'preInv';

EXEC sp_addextendedproperty 
@name = N'MS_Description', 
@value = N'재고가 이동한 창고의 이름', 
@level0type = N'SCHEMA', @level0name = 'dbo',
@level1type = N'TABLE',  @level1name = 'HqInventory_His',
@level2type = N'COLUMN', @level2name = 'nxtInv';


EXEC sp_addextendedproperty 
@name = N'MS_Description', 
@value = N'이동하는 재고의 수량', 
@level0type = N'SCHEMA', @level0name = 'dbo',
@level1type = N'TABLE',  @level1name = 'HqInventory_His',
@level2type = N'COLUMN', @level2name = 'qty';

EXEC sp_addextendedproperty 
@name = N'MS_Description', 
@value = N'재고 이동을 요청한 사용자ID', 
@level0type = N'SCHEMA', @level0name = 'dbo',
@level1type = N'TABLE',  @level1name = 'HqInventory_His',
@level2type = N'COLUMN', @level2name = 'rgtId';

EXEC sp_addextendedproperty 
@name = N'MS_Description', 
@value = N'재고 이동을 요청한 날짜.', 
@level0type = N'SCHEMA', @level0name = 'dbo',
@level1type = N'TABLE',  @level1name = 'HqInventory_His',
@level2type = N'COLUMN', @level2name = 'rgtDt';
