<script setup lang="ts">
import { ref } from "vue";

const isLogin = ref(true);
</script>

<template>
    <section class="containerPai">
    <div :class="['card', isLogin ? 'loginActive' : 'cadastroActive']">

        <!-- ESQUERDA -->
        <div class="esquerda">
            <div class="formLogin">
                <h2 id="branco">LOGIN</h2>
                <form>
                    <input type="text" placeholder="Inserir seu Cnpj" name="cnpj-login" id="CnpjLogin">
                    <input type="password" placeholder="Inseir sua Senha" name="senha-login" id="SenhaLogin">
                    <button type="submit" @click="isLogin = true">ENTRAR</button>
                </form>
            </div>

            <div class="facaLogin">
                <h2>POSSUI UMA <br><span id="verde">CONTA</span>?</h2>
                <p>Realize seu login</p>
                <button class="loginButton" @click="isLogin = true">LOGIN</button>
            </div>
        </div>

        <!-- DIREITA -->
        <div class="direita">
            <div class="formCadastro">
                <h2 id="branco">CADASTRE-SE</h2>
                <form>
                    <input type="text" placeholder="Nome da empresa" name="nome-cadstro" id="NomeCadastro">
                    <input type="email" placeholder="E-mail" name="email-cadastro" id="EmailCadastro">
                    <input type="email" placeholder="Cnpj/CPF" name="cnpj-cadastro" id="CnpjCadastro">
                    <input type="password" placeholder=" Crie uma Senha" name="senha-cadastro" id="SenhaCadastro">
                    <input type="password" placeholder="Confirmar senha" name="confirm-senha-c" id="ConfirmSenhaCadastro">
                    <button type="submit" >CADASTRAR</button>
                </form>
            </div>

            <div class="facaCadastro">
                <h2>BEM VINDO <br><span id="verde">VIA</span></h2>
                <p>Não possui usuário? Faça seu cadastro.</p>
                <button @click="isLogin = false">CADASTRO</button>
            </div>
        </div>
    </div>
</section>
</template>

<style scoped>
        /* ================= FONTES E CONFIGURAÇÃO BASE ================= */
    @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap');

    @font-face {
        font-family: "Greenth";
        src: url("assets/Greenth.ttf") format("truetype");
    }

    * {
        padding: 0;
        margin: 0;
        box-sizing: border-box;
    }

    body {
        color: white;
        font-family: "Poppins", Arial, Helvetica, sans-serif;
        background-color: black;
        overflow-x: hidden;
    }

    /* ================= CORES E ESTILOS GERAIS ================= */
    #branco { color: #3A3A3A; }

    #verde {
        background: linear-gradient(90deg, #25D9B8, #3ADF81);
        background-clip: text;
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
    }

    h2 {
        font-family: "Greenth", sans-serif;
        font-size: clamp(30px, 5vw, 50px);
        margin-bottom: 24px;
        text-align: center;
    }

    p {
        margin-bottom: 32px;
        width: 100%;
        max-width: 400px;
        text-align: center;
        color: rgba(255,255,255,0.7);
        line-height: 1.4;
    }

    /* ================= FORMULÁRIO E INPUTS ================= */
    form {
        display: flex;
        flex-direction: column;
        gap: 16px;
        width: 100%;
        align-items: center;
    }

    input {
        padding: 14px 20px;
        border-radius: 20px;
        border: none;
        width: 100%;
        max-width: 400px;
        background: rgba(0,0,0,0.25);
        color: white;
        outline: none;
    }

    button {
        padding: 14px;
        border-radius: 20px;
        border: none;
        width: 100%;
        max-width: 400px;
        cursor: pointer;
        transition: .3s;
        font-weight: 600;
    }

    form button { background: #2f2f2f; color: white; }

    .facaLogin button,
    .facaCadastro button {
        background: linear-gradient(90deg, #25D9B8, #3ADF81);
        color: black;
    }

    button:hover { transform: translateY(-2px); }

    /* ================= CONTAINER E CARD ================= */
    .containerPai {
        width: 100%;
        min-height: 100vh;
        min-height: 100dvh;
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 20px;
    }

    .card {
        width: 100%;
        max-width: 1000px;
        min-height: 600px;
        position: relative;
        overflow: hidden;
        display: flex;
        background: linear-gradient(90deg, #25D9B8 0%, #3ADF81 100%);
        border-radius: 20px;
        box-shadow: 0 20px 40px rgba(0,0,0,0.4);
    }

    .esquerda, .direita {
        width: 50%;
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
        z-index: 3;
        padding: 40px;
        transition: opacity 0.3s ease;
    }

    /* ================= ELEMENTOS VISUAIS ================= */
    .card::before {
        content: "";
        position: absolute;
        inset: 0;
        background-image: url("assets/caminhao-de-carga.png"), url("assets/local-de-pesquisa.png");
        background-repeat: no-repeat;
        background-position: 5% 135%, 102% 103%;
        background-size: 40%, 35%;
        opacity: 0.20;
        z-index: 1;
    }

    .card::after {
        content: "";
        position: absolute;
        inset: 0;
        background: radial-gradient(circle at center, #3D3D3D 0%, #1F1F1F 50%, #000 100%);
        z-index: 2;
        transition: transform 0.6s cubic-bezier(0.7, 0, 0.3, 1);
    }

    /* ================= LÓGICA DE TRANSIÇÃO (Desktop) ================= */
    .facaLogin, .facaCadastro { position: absolute; z-index: 4; transition: 0.5s; }
    .formLogin, .formCadastro { opacity: 0; transition: 0.5s; position: relative; z-index: 3; }

    .card.loginActive .formLogin, 
    .card.loginActive .facaCadastro { opacity: 1; transform: translate(0); pointer-events: all; }

    .card.loginActive .formCadastro, 
    .card.loginActive .facaLogin { opacity: 0; transform: scale(0.8); pointer-events: none; }

    .card.loginActive::after { transform: translateX(50%); }

    .card.cadastroActive .formCadastro, 
    .card.cadastroActive .facaLogin { opacity: 1; transform: translate(0); pointer-events: all; }

    .card.cadastroActive .formLogin, 
    .card.cadastroActive .facaCadastro { opacity: 0; transform: scale(0.8); pointer-events: none; }

    .card.cadastroActive::after { transform: translateX(-50%); }

    /* ================= RESPONSIVIDADE (Ajustada para centralização total) ================= */

    @media (max-width: 850px) {
        .card {
            flex-direction: column;
            max-width: 450px;
            min-height: 90vh;
            height: auto;
        }

        .esquerda, .direita {
            width: 100%;
            height: 50%; 
            min-height: 400px;
            padding: 40px 20px;
        }

        
        .card.loginActive::after { transform: translateY(50%); }
        .card.cadastroActive::after { transform: translateY(-50%); }

    
        .facaLogin, .facaCadastro, .formLogin, .formCadastro {
            position: relative;
            transform: none !important;
            opacity: 1 !important;
            width: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

    
        
        .card.loginActive .formCadastro, 
        .card.loginActive .facaLogin { display: none; }

        .card.cadastroActive .formLogin, 
        .card.cadastroActive .facaCadastro { display: none; }

        .card.loginActive .formLogin,
        .card.loginActive .facaCadastro,
        .card.cadastroActive .formCadastro,
        .card.cadastroActive .facaLogin {
            display: flex;
        }
    }

    @media (max-width: 400px) {
        .containerPai { padding: 10px; }
        h2 { font-size: 26px; }
        p { font-size: 13px; }
        input, button { padding: 12px 16px; }
    }
</style>