SELECT sum(CAST(rushing_yards AS INTEGER))
FROM bills
WHERE season_type = 'REG' 
    AND CAST(rush_attempt AS INTEGER) = 1 
    AND posteam = 'BUF';

select week, sum(rushing_yards)
from bills
WHERE season_type = 'REG' 
    AND CAST(rush_attempt AS INTEGER) = 1 
    AND posteam = 'BUF'
group by week
order by sum(rushing_yards) desc;

SELECT COUNT(*)
FROM bills
WHERE posteam = 'BUF' 
    AND season_type = 'REG' 
    AND season = '2024'
    AND (play_type = 'run' OR play_type = 'pass' OR play_type = 'qb_kneel');

SELECT sum(CAST(rushing_yards AS INTEGER))
FROM bills
WHERE season_type = 'REG'
  AND CAST(rush_attempt AS INTEGER) = 1
  AND posteam = 'BUF';

select week, sum(rushing_yards)
from bills
where season_type = 'REG'
    and CAST(rush_attempt AS INTEGER) = 1
    and posteam = 'BUF'
group by week
order by sum(rushing_yards) desc;

SELECT COUNT(*)
FROM bills
WHERE posteam = 'BUF'
  AND season_type = 'REG'
  AND season = '2024'
  AND (play_type = 'run' OR play_type = 'pass' OR play_type = 'qb_kneel');

SELECT
  COALESCE(
    (SELECT sum(CAST(yards_gained AS INTEGER)) - 2
     FROM bills
     WHERE posteam = 'BUF'
       AND season_type = 'REG'
       AND season = '2024'
       AND play_type = 'pass'
       AND two_point_attempt != '1'
       AND play_type != 'qb_spike'
       AND play_type != 'no_play'
       AND interception != '1'
       AND fumble != '1'
       AND (play_deleted IS NULL OR play_deleted != '1')
       AND penalty != '1'), 0)
  +
  COALESCE(
    (SELECT sum(CAST(yards_gained AS INTEGER))
     FROM bills
     WHERE posteam = 'BUF'
       AND season_type = 'REG'
       AND season = '2024'
       AND play_type = 'sack'
       AND two_point_attempt != '1'
       AND play_type != 'qb_spike'
       AND play_type != 'no_play'
       AND interception != '1'
       AND fumble != '1'
       AND (play_deleted IS NULL OR play_deleted != '1')
       AND penalty != '1'), 0)
  AS net_passing_yards;



