import express from "express";
import cors from "cors"
const pool = require('./db')

const app = express()

const port = 3001

app.use(cors())
app.use(express.json())

app.post('/', async(req, res) => {
    try {
        pool.query()
    } catch (err) {
        throw new Error("Failed to send this post request");
    }
})

app.listen(port, () => {
    console.log(`server is listening on http://localhost:${port}`);
})