USE DOTWARE
GO


CREATE FUNCTION ufn_getCodeID (
  @group_value NVARCHAR(50),
  @code_value NVARCHAR(50)
)
RETURNS INT
AS
BEGIN
  DECLARE @id INT
  SELECT @id = codes.code_id
  FROM CODE_GROUPS groups
  INNER JOIN CODES codes ON (codes.group_id = groups.group_id AND codes.usable = 1)
  WHERE groups.group_value = @group_value
  AND codes.code_value = @code_value

  RETURN ISNULL(@id, -1)
END
GO