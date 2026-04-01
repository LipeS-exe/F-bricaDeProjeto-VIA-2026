cat > src/controllers/authController.js << 'EOF'
const User = require('../models/user');

exports.register = async (req, res) => {
    try {
        const { nome, email, senha, cnpj, tipo_usuario } = req.body;

        if (!nome || !email || !senha || !tipo_usuario) {
            return res.status(400).json({ error: 'Todos os campos obrigatórios devem ser preenchidos' });
        }
        if (tipo_usuario !== 'empresa' && tipo_usuario !== 'motorista') {
            return res.status(400).json({ error: 'Tipo de usuário inválido' });
        }

        const usuarioExistente = await User.findByEmail(email);
        if (usuarioExistente) {
            return res.status(400).json({ error: 'E-mail já cadastrado' });
        }

        const novoUsuario = await User.create({ nome, email, senha, cnpj, tipo_usuario });
        return res.status(201).json({ message: 'Usuário criado com sucesso', userId: novoUsuario.id });
    } catch (error) {
        console.error('Erro no cadastro:', error);
        return res.status(500).json({ error: 'Erro interno no servidor' });
    }
};
EOF