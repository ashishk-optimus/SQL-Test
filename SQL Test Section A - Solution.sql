--Solution SQL Test

-------------------------------------------------Question : 1 ------------------------------------

--Query gives the route map for each train and also the total distance (in KM) covered by each train 
--and their average speed (In Km/hr) during the journey

SELECT Y.train_id, Y.Station_Name, Y.Distance, CONVERT(NUMERIC(20, 2),ROUND(Y.Distance / Z.[Time Taken(in hr.)], 2)) AS [Avg. Speed]
FROM 
	(SELECT t1.train_id,
		   Station_Name =REPLACE( (SELECT s.station_name AS [data()]
			   FROM Journey_Details t2
			   INNER JOIN station_details s
			   ON t2.station_id = s.station_id
			  WHERE t2.train_id = t1.train_id
			  ORDER BY s.station_name
				FOR XML PATH('')
				), ' ', ','), SUM(t1.distance) AS Distance
		  FROM Journey_Details t1
		  GROUP BY train_id)Y
INNER JOIN
	(SELECT X.train_id, MAX(X.[Time Taken]) / 60.0 AS [Time Taken(in hr.)] 
	FROM
		(SELECT j1.train_id, DATEDIFF(minute, j1.[Departure(GMT)],j2.[Schedule_Arrival(GMT)])   AS [Time Taken]
		FROM Journey_Details j1
		INNER JOIN Journey_Details j2
		ON j1.train_id = j2.train_id
		WHERE j1.[Schedule_Arrival(GMT)] IS NULL OR j2.[Schedule_Arrival(GMT)] IS NULL)X
	GROUP BY X.train_id)Z
ON Y.train_id = Z.train_id

--------------------------------------------------Question : 2(a) ----------------------------------

--Return name of the train which covered the maximum distance during its journey.

SELECT TOP 1 t.train_name
FROM train_details t
INNER JOIN journey_details j
ON t.train_id = j.train_id
GROUP BY train_name 
ORDER BY SUM(j.distance) desc

--------------------------------------------------Question : 2(b) ----------------------------------

--Return name of the train which has the max Average speed.

SELECT TOP 1 t.train_name
FROM
	(SELECT Y.train_id, CONVERT(NUMERIC(20, 2),ROUND(Y.Distance / Z.[Time Taken(in hr.)], 2)) AS [Avg. Speed]
	FROM 
		(SELECT t1.train_id,SUM(t1.distance) AS Distance
			  FROM Journey_Details t1
			  GROUP BY train_id)Y
	INNER JOIN
		(SELECT X.train_id, MAX(X.[Time Taken]) / 60.0 AS [Time Taken(in hr.)] 
		FROM
			(SELECT j1.train_id, DATEDIFF(minute, j1.[Departure(GMT)],j2.[Schedule_Arrival(GMT)])   AS [Time Taken]
			FROM Journey_Details j1
			INNER JOIN Journey_Details j2
			ON j1.train_id = j2.train_id
			WHERE j1.[Schedule_Arrival(GMT)] IS NULL OR j2.[Schedule_Arrival(GMT)] IS NULL)X
		GROUP BY X.train_id)Z
	ON Y.train_id = Z.train_id)W
INNER JOIN Train_Details t
ON
W.train_id = t.train_id

--------------------------------------------------Question : 2(c) ----------------------------------

--Return name of those trains which stop at least at three stations.

WITH K 
AS
(
SELECT t.train_name, COUNT(j.station_id) as [No. of Stoppage]
FROM train_details t
INNER JOIN journey_details j
ON t.train_id = j.train_id
GROUP BY train_name
)
SELECT train_name AS [Train Name] from K where [No. of Stoppage] > 2

--------------------------------------------------Question : 2(d) ----------------------------------

--Return name of those trains whose stoppage is not Aligarh and Kanpur.

SELECT t.Train_Name 
FROM
	(SELECT Train_Id FROM Journey_Details
	EXCEPT
	SELECT Train_Id FROM Journey_Details
	WHERE station_id IN(102,104))X
INNER JOIN Train_Details t
ON
X.train_id = t.train_id

--------------------------------------------------Question : 3 ----------------------------------

--Query will results out the boarding and destination station name for each train 

SELECT j1.train_id, t.train_name, s1.station_name AS Boarding, s2.station_name AS Destination
FROM journey_details j1
INNER JOIN journey_details j2
ON
j1.train_id = j2.train_id
INNER JOIN train_details t
ON t.train_id = j1.train_id
INNER JOIN Station_Details s1
ON j1.station_id = s1.station_id
INNER JOIN Station_Details s2
ON j2.station_id = s2.station_id
WHERE (j1.[Schedule_Arrival(GMT)] IS NULL ) AND (j2.[Departure(GMT)] IS NULL )

--------------------------------------------------Question : 4 ----------------------------------

--Query which displays time taken by a train to reach the respective destination 

SELECT Train_Id, [101], [102], [103], [104], [101] + [102] + [103] + [104]
FROM (SELECT X.train_id, MAX(X.[Time Taken]) / 60.0 AS [Time Taken(in hr.)] 
	FROM
		(SELECT j1.train_id, DATEDIFF(minute, j1.[Departure(GMT)],j2.[Schedule_Arrival(GMT)])   AS [Time Taken]
		FROM Journey_Details j1
		INNER JOIN Journey_Details j2
		ON j1.train_id = j2.train_id
		WHERE j1.[Schedule_Arrival(GMT)] IS NULL OR j2.[Schedule_Arrival(GMT)] IS NULL)X
	GROUP BY X.train_id)Z
PIVOT
(
	SUM(Distance)
	FOR Station_Id
	IN([101], [102], [103], [104])
)AS Aggregated
SELECT t.train_name AS [Train Name], L.[Delhi(hr)], L.[Aligarh(hr)], L.[Lucknow(hr)], L.[Kanpur(hr)], L.[Total Time(hr)]
FROM
	(SELECT Train_id, CONVERT(NUMERIC(5,1),COALESCE([101],0)) AS [Delhi(hr)], 
	CONVERT(NUMERIC(5,1), COALESCE([102],0)) AS [Aligarh(hr)], CONVERT(NUMERIC(5,1), COALESCE([103],0)) AS [Lucknow(hr)], 
	CONVERT(NUMERIC(5,1), COALESCE([104],0)) AS [Kanpur(hr)], CONVERT(NUMERIC(5,1),
	COALESCE([101],0) + COALESCE([102],0) + COALESCE([103],0) + COALESCE([104],0)) AS [Total Time(hr)]
	FROM
	(SELECT X.train_id,X.station_id, (X.[Time Taken]) / 60.0 AS [Time Taken(in hr.)] 
			FROM
				(SELECT j1.train_id,J1.station_id, COALESCE(DATEDIFF(minute, j2.[Departure(GMT)],j1.[Schedule_Arrival(GMT)]), 0)   AS [Time Taken]
				FROM Journey_Details j1
				INNER JOIN Journey_Details j2
				ON j1.train_id = j2.train_id
				WHERE j1.[Schedule_Arrival(GMT)] IS NULL OR j2.[Schedule_Arrival(GMT)] IS NULL)X)Y

PIVOT( MAX(Y.[Time Taken(in hr.)])
		FOR Y.station_id
		IN([101], [102], [103], [104])
		)AS Agg)L
INNER JOIN Train_Details t
ON
L.Train_id = t.Train_id






