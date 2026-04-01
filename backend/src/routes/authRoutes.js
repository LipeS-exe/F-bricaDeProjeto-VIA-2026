cat > src/controllers/authController.js << 'EOF'
const express = require('express');
const router = express.Router();
const authController = require('../controllers/authController');

// Rota para registro de usuário blaster master 
router.post('/register', authController.register);

// login pro lipe colocar ]
// router.post('/login', authController.login);

module.exports = router;
EOF