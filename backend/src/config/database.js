cat > src/config/database.js << 'EOF'
const { Pool } = require('pg');
require('dotenv').config();

// Configura a conexão com o PostgreSQL usando as variáveis do .env
const pool = new Pool({
    host: process.env.DB_HOST,
    port: process.env.DB_PORT,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME,
});

module.exports = pool;
EOF