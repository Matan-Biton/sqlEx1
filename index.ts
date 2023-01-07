import express from "express";
import cors from "cors";
import { pool } from "./db";
import { json, urlencoded } from "body-parser";

const app = express();

const port = 3001;

app.use(cors());
app.use(json());

app.get("/", (_, res) => res.json("hello world"));

app.get("/q1", async (_, res) => {
  try {
    const SQL = `SELECT firstName, surName FROM actor WHERE dateOfBirth >= '1975-01-01' ORDER BY firstName ASC, surName ASC`;
    const result = await pool.query(SQL);
    res.json(result.rows);
  } catch (error) {
    const err = error as Error;
    console.error(err.message);
  }
});

app.get("/q2", async (_, res) => {
  try {
    const SQL = `SELECT actor.* FROM actor inner join director on actor.firstName = director.firstName AND actor.surName = director.surName`;
    const result = await pool.query(SQL);
    res.json(result.rows);
  } catch (error) {
    const err = error as Error;
    console.error(err.message);
  }
});

app.get("/q3", async (_, res) => {
  try {
    const SQL = `SELECT DISTINCT actor.actorNum FROM actor inner join actedIn on actor.actorNum = actedIn.actorNum
     inner join film on actedIn.filmNum = film.filmNum
     inner join director on film.directorNum = director.directorNum
     where film.releasedYear BETWEEN 2000 and 2010 AND director.firstName = 'Francis' AND director.surName = 'Kopola'`;
    const result = await pool.query(SQL);
    res.json(result.rows);
  } catch (error) {
    const err = error as Error;
    console.error(err.message);
  }
});

app.get("/q4", async (_, res) => {
  try {
    const SQL = `SELECT organizationCode, awardName FROM award where awardRank = (SELECT max(awardRank) FROM award)`;
    const result = await pool.query(SQL);
    res.json(result.rows);
  } catch (error) {
    const err = error as Error;
    console.error(err.message);
  }
});

app.get("/q5", async (_, res) => {
  try {
    const SQL = `SELECT director.* FROM director inner join 
    (SELECT directorNum, COUNT(*) FROM film GROUP BY filmName, directorNum HAVING COUNT(*) >= 2) as modFilm
     on director.directorNum = modFilm.directorNum;`;
    const result = await pool.query(SQL);
    res.json(result.rows);
  } catch (error) {
    const err = error as Error;
    console.error(err.message);
  }
});

app.get("/q6", async (_, res) => {
  try {
    const SQL = `SELECT director.* FROM director inner join film 
    on director.directorNum = film.directorNum inner join actedIn
    on film.filmNum = actedIn.filmNum
    WHERE actedIn.movieRole ilike '%Police%' or actedIn.movieRole ilike '%detective%'`;
    const result = await pool.query(SQL);
    res.json(result.rows);
  } catch (error) {
    const err = error as Error;
    console.error(err.message);
  }
});

app.get("/q7", async (_, res) => {
  try {
    const SQL = `SELECT actor.* FROM actor inner join actedIn 
    on actor.actorNum = actedIn.actorNum inner join film
    on actedIn.filmNum = film.filmNum
    where film.releasedYear = (SELECT EXTRACT(YEAR FROM CURRENT_TIMESTAMP))
    ORDER BY actor.dateOfBirth ASC LIMIT 1`;
    const result = await pool.query(SQL);
    res.json(result.rows);
  } catch (error) {
    const err = error as Error;
    console.error(err.message);
  }
});

app.listen(port, () => {
  console.log(`server is listening on http://localhost:${port}`);
});
