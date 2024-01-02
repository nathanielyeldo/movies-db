# movies-db
1. List all the movies under the genre “Horror” in which “Patric Wilson” has acted. <br />
    SELECT m.Title<br />
    FROM Movies m<br />
    JOIN MovieDetails md ON m.MovieID = md.MovieID<br />
    JOIN MovieCast mc ON md.MovieDetailsID = mc.MovieDetailsID<br />
    JOIN Actors a ON mc.ActorID = a.ActorID<br />
    JOIN Genres g ON md.GenreID = g.GenreID<br />
    WHERE a.FirstName = 'Patrick' AND a.LastName = 'Wilson' AND g.GenreName = 'Horror';<br />
   OUTPUT:<br />
   ![Qn 1](https://github.com/nathanielyeldo/movies-db/assets/56597570/74bab68d-7135-4b60-8dff-097281bf9ad0)

2. List all the reviews for the movie “Salaar”<br />
    SELECT mr.ReviewText<br />
    FROM MovieRatings mr<br />
    JOIN MovieDetails md ON mr.MovieDetailsID = md.MovieDetailsID<br />
    JOIN Movies m ON md.MovieID = m.MovieID<br />
    WHERE m.Title = 'Salaar';<br />
   OUTPUT:<br />
   ![Qn 2](https://github.com/nathanielyeldo/movies-db/assets/56597570/70701567-a80c-4552-afad-a2f3b96956d4)



![image](https://github.com/nathanielyeldo/movies-db/assets/56597570/7b781128-f4fa-4cf7-983a-d0f575c43367)
