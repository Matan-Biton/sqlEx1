import { Pool } from 'pg'

export const pool = new Pool({
    user: 'postgres',
    password: 'matan',
    host: 'localhost',
    port: 5432,
    database: 'sqlEx1'
});