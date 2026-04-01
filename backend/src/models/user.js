class User {
    // Metodo para criar um novo usuário
    static async create({ nome, email, senha, cnpj, tipo_usuario }) {
        //isso aqui Criptografa a senha com fator de custo 10
        const senha_hash = await bcrypt.hash(senha, 10);

        // isso usa para inserir os dados
        const query = `
            INSERT INTO usuarios (nome, email, senha_hash, cnpj, tipo_usuario)
            VALUES ($1, $2, $3, $4, $5)
            RETURNING id
        `;
        const values = [nome, email, senha_hash, cnpj || null, tipo_usuario];
        const result = await pool.query(query, values);
        return result.rows[0]; //id do novo usuario
    }

    // isso é o metodo para buscar usuário por e-mail
    static async findByEmail(email) {
        const result = await pool.query('SELECT * FROM usuarios WHERE email = $1', [email]);
        return result.rows[0];
    }
}

    module.exports = User;
    
    EOF