# Solution
I'll use a SQL solution, considering real time is very critical; it's very important to have updated results very often and it should be easy to recalculate and mantain them fast. Of course, some caching is needed.

We will have two tables: One for users, and one for games. The games table will be related to each user with a user_id field.
The games table will have mainly these columns: user_id, created_at, current_bankroll, amount_staked and total_sum. The total_sum sums current_bankroll and  amount_staked (it will be updated with a before_save for each game).

The leaderboard will be cached with, for example, a fragment cache.

The games table must be updated every time a real match (or event) ends. This table will be updated in batches, and only games that are currenly active (use created_at) will be updated. As I mentioned, a before_save will update the total_sum column of games table.

Once all those active games are updated, it will be possible to recalculate the leader board in background, expiring the fragment cache and updating it with the new leader board, ordering all still active games by total_sum, column that will be indexed in MySQL, for example.


