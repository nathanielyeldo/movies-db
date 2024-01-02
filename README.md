# movies-db
1. List all the movies under the genre “Horror” in which “Patric Wilson” has acted.
    SELECT m.Title
    FROM Movies m
    JOIN MovieDetails md ON m.MovieID = md.MovieID
    JOIN MovieCast mc ON md.MovieDetailsID = mc.MovieDetailsID
    JOIN Actors a ON mc.ActorID = a.ActorID
    JOIN Genres g ON md.GenreID = g.GenreID
    WHERE a.FirstName = 'Patrick' AND a.LastName = 'Wilson' AND g.GenreName = 'Horror';
   OUTPUT:
   ![Qn 1](https://github.com/nathanielyeldo/movies-db/assets/56597570/74bab68d-7135-4b60-8dff-097281bf9ad0)

2. List all the reviews for the movie “Salaar”
    SELECT mr.ReviewText
    FROM MovieRatings mr
    JOIN MovieDetails md ON mr.MovieDetailsID = md.MovieDetailsID
    JOIN Movies m ON md.MovieID = m.MovieID
    WHERE m.Title = 'Salaar';
   OUTPUT:
   ![Qn 2](https://github.com/nathanielyeldo/movies-db/assets/56597570/70701567-a80c-4552-afad-a2f3b96956d4)



![image](https://github.com/nathanielyeldo/movies-db/assets/56597570/7b781128-f4fa-4cf7-983a-d0f575c43367)
