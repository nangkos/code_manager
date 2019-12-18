USE DOTWARE
GO

WITH cte_group
AS (
  SELECT group_id, group_name, group_value,
  0 AS depth, RIGHT(REPLICATE('0', 3) + CAST(display_order AS NVARCHAR(MAX)), 3) AS hierarchy
  FROM CODE_GROUPS groups
  WHERE group_id = 0
  UNION ALL
  SELECT groups.group_id, groups.group_name, groups.group_value,
  parent.depth + 1 AS depth,
  parent.hierarchy + RIGHT(REPLICATE('0', 3) + CAST(groups.display_order AS NVARCHAR(MAX)), 3) AS hierarchy
  FROM cte_group parent
  INNER JOIN CODE_GROUPS groups ON (groups.parent_id = parent.group_id AND groups.usable = 1)
)
SELECT group_id AS id, group_name AS name, group_value AS value,
hierarchy, 0 AS display_order
FROM cte_group
UNION ALL
SELECT codes.code_id AS id, codes.code_name AS name, codes.code_value AS value,
groups.hierarchy, codes.display_order 
FROM cte_group groups
INNER JOIN CODES ON (codes.group_id = groups.group_id AND codes.usable = 1)
ORDER BY hierarchy, display_order
GO
/*
UPDATE CODE_GROUPS SET group_value = 'account_platform'
WHERE group_id = 12
*/

SELECT dbo.ufn_getCodeID('user_group', 'system')

SELECT dbo.ufn_getCodeID('account_platform', 'home')