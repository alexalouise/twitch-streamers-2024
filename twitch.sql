CREATE DATABASE twitch;

CREATE TABLE streamers2024 (
	rank SMALLINT  PRIMARY KEY,
	name NVARCHAR(50),
	language NVARCHAR(50),
	type NVARCHAR(50),
	most_streamed_game NVARCHAR(250),
	second_most_streamed_game NVARCHAR(250),
	average_stream_duration FLOAT,
	followers_gained_per_stream SMALLINT,
	avg_viewers_per_stream INTEGER,
	avg_games_per_stream FLOAT,
	total_time_streamed INTEGER,
	total_followers INTEGER,
	total_views INTEGER,
	total_games_streamed SMALLINT,
	active_days_per_week FLOAT,
	most_active_day NVARCHAR(50),
	day_with_most_followers_gained NVARCHAR(50)
);

-- Unique Languages
SELECT DISTINCT language FROM streamers2024;

--How many people on average watched these streamers in 2024?
SELECT AVG(avg_viewers_per_stream) FROM streamers2024;

--What are the most popular games in 2024?
SELECT most_streamed_game, COUNT(*) FROM streamers2024
GROUP BY most_streamed_game
ORDER BY COUNT(*) DESC;

--Where are these LoL stream viewers located in 2024?
SELECT language, COUNT(*) FROM streamers2024
WHERE most_streamed_game = 'League of Legends'
GROUP BY language
ORDER BY COUNT(*) DESC;

--What is the best day to stream in 2024?
SELECT day_with_most_followers_gained, COUNT(*) FROM streamers2024
GROUP BY day_with_most_followers_gained
ORDER BY COUNT(*) DESC;

--Which streamers have the most total views overall?
SELECT TOP 5 name, total_views FROM streamers2024
ORDER BY total_views DESC;

--Who is the top-ranked streamer in the dataset?
SELECT name FROM streamers2024
WHERE rank = 1;

--Which languages have the highest number of streamers?
SELECT TOP 5 language, COUNT(most_streamed_game) FROM streamers2024
GROUP BY language
ORDER BY COUNT(most_streamed_game) DESC;

--What is the average stream duration across all streamers?
SELECT AVG(average_stream_duration) AS avg_stream_duration FROM streamers2024;

--Which most streamed game has the highest average viewers per stream, considering only games streamed by at least 10 differentt creators?
SELECT TOP 1 most_streamed_game, AVG(avg_viewers_per_stream) AS avg_views FROM streamers2024
GROUP BY most_streamed_game
HAVING COUNT(*) >= 10
ORDER BY avg_views DESC;

--Which non-English streamers have over 10 million total followers, and what are their top languages?
SELECT name, language FROM streamers2024
WHERE language != 'English' AND total_followers >= 10000000;

--Which 5 streamers gain the highest ratio of total followers relative to their total hours streamed?
SELECT TOP 5 name, total_followers / total_time_streamed AS high_ratio FROM streamers2024
ORDER BY high_ratio DESC;

--What is the average stream duration and average total views for each streamer type?
SELECT type, AVG(CAST(average_stream_duration AS decimal(10,2))) AS avg_duration, AVG(CAST(total_views AS bigint)) AS avg_total_views
FROM streamers2024 GROUP BY type;

--Which day of the week is most frequently listed as day_with_most_followers_gained, and what is the total views generated on that day?
SELECT day_with_most_followers_gained, COUNT(day_with_most_followers_gained) AS total_count, SUM(CAST(total_views AS bigint)) AS total_views FROM streamers2024
GROUP BY day_with_most_followers_gained
ORDER BY total_count DESC;

--Do streamers who play an average of more than 2 games per stream pull higher average viewers than focused creators?
SELECT
	CASE
		WHEN avg_games_per_stream > 2.0 THEN 'Variety'
		ELSE 'Focused'
	END AS creator_type,
	AVG(avg_viewers_per_stream) AS avg_viewers
	FROM streamers2024
	GROUP BY
		CASE
			WHEN avg_games_per_stream > 2.0 THEN 'Variety'
			ELSE 'Focused'
		END;

--Among creators whose most_streamed_game is 'League of Legends', what are the top 3 most common choices for second_most_streamed_game?
SELECT TOP 3 second_most_streamed_game, COUNT(*) AS total_count FROM streamers2024
WHERE most_streamed_game = 'League of Legends'
GROUP BY second_most_streamed_game
ORDER BY total_count DESC;

--How many streamers achieve both an above-average stream duration AND above-average total views?
SELECT COUNT(*) AS above_avg_duration_views FROM streamers2024
WHERE average_stream_duration > (SELECT AVG(average_stream_duration) FROM streamers2024)
AND total_views > (SELECT AVG(CAST(total_views AS bigint)) FROM streamers2024);

--What is the #1 most streamed game for Portuguese-language streamers, and how many creators stream it?
SELECT TOP 1 most_streamed_game, COUNT(*) AS no_of_creators_streamed FROM streamers2024
WHERE language = 'Portuguese'
GROUP BY most_streamed_game
ORDER BY most_streamed_game DESC;

--What percentage of total views across the entire dataset belongs to the top 50 ranked streamers?
SELECT (SUM(CASE WHEN rank <= 50 THEN CAST(total_views AS bigint) ELSE 0 END) * 100.0)
/ SUM(CAST(total_views AS bigint)) AS top_50_percentage FROM streamers2024;