import Pool from 'pg-pool'

const pool = new Pool({
    user: 'postgres',
    password: 'matan',
    host: 'localhost',
    port: 5432,
    database: 'sqlEx1'
});

export default pool