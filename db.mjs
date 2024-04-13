import { createConnection } from 'mysql2'

// Crear conexión a la base de datos MySQL
const db = createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'api'
})

export default db
