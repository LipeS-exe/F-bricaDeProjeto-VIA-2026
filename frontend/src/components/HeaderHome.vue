<script setup lang="ts">
import { ref, watch, onMounted } from "vue";

const isDark = ref(false);
</script>

<template>
  <header :class="isDark ? 'light-mode' : 'dark-mode'">
    <div class="logo-container">
      <div class="logo-icon"></div>

      <h1 class="logo-text">VIA</h1>

      <div class="header-right">
        <div class="theme-switch-wrapper" :class="{ dark: isDark }">
          <span>
            {{ isDark ? "Escuro" : "Claro" }}
          </span>
          <label class="theme-switch">
            <input type="checkbox" v-model="isDark">
            <div class="slider round" :class="{ dark: isDark }"></div>
          </label>

        </div>

        <nav>
          <a href="#" class="active">HOME</a>
          <a href="#">SOBRE</a>
          <a href="#">MINHA EMPRESA</a>
          <a href="#">AGENDA</a>
        </nav>
      </div>
    </div>
  </header>
</template>

<style scoped>
:root {
    /* Fundo Escuro: Radial degrade solicitado */
    --bg-color: radial-gradient(circle at center, #3D3D3D 0%, #1F1F1F 50%, #000 100%);
    --header-bg: #000000;
    --text-color: #363636; /* Texto geral em branco */
    --logo-text-color: #ffffff; /* VIA do logo em branco puro */
    --watermark-color: #ffffff; /* VIA gigante em branco puro */
    --watermark-opacity: 0.80; /* Baixa opacidade para o VIA gigante */
    --subtext-color: rgba(255, 255, 255, 0.7);
    --gradient-verde: linear-gradient(90deg, #25D9B8, #3ADF81);
    --accent-color: #25D9B8;
    --divider-color: var(--gradient-verde);
}

.light-mode {
    /* Fundo Claro: Gradiente verde */
    --bg-color: linear-gradient(90deg, #25D9B8, #3ADF81);
    --header-bg: #ffffff;
    --text-color: #ffffff;
    --logo-text-color: #363636; /* VIA do logo em cinza */
    --watermark-color: #737373; /* VIA gigante em cinza */
    --watermark-opacity: 0.80; /* Opacidade um pouco maior no claro */
    --subtext-color: #363636;
    --accent-color: #ffffff; 
    --divider-color: #363636;
}

* {
    padding: 0;
    margin: 0;
    box-sizing: border-box;
    transition: background 0.4s, background-color 0.4s, color 0.4s;
}

header.light-mode {
  background: white;
  color: black;
}

header.dark-mode {
  background: #1e1e1e;
  color: var(--text-color);
}

header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 20px 8%;
    background-color: var(--header-bg);
    position: relative;
    z-index: 10;
}

.logo-container {
    display: flex;
    align-items: center;
    gap: 15px;
}

.logo-img {
    height: 70px;
    width: auto;
    object-fit: contain;
}

.logo-text {
    font-family: "Greenth", sans-serif;
    font-size: 35px;
    letter-spacing: 2px;
    color: var(--logo-text-color); /* Usa a variável específica */
}

.header-right {
    display: flex;
    align-items: center;
    gap: 30px;
}

nav a {
    text-decoration: none;
    color: var(--text-color);
    opacity: 0.8;
    font-weight: 600;
    font-size: 14px;
    margin-left: 20px;
}

nav a.active, nav a:hover {
    opacity: 1;
    color: #25D9B8;
}

.light-mode nav a.active, .light-mode nav a:hover {
    color: #25D9B8;
}

.divider {
    width: 100%;
    height: 2px;
    background: var(--divider-color);
}

/* ================= THEME SWITCH ================= */
.theme-switch .slider {
  background-color: #ccc;
  transition: 0.3s;
}

/* modo escuro */
.theme-switch.dark .slider {
  background-color: #333;
}

.theme-switch-wrapper {
    display: flex;
    align-items: center; /* modo claro */
    padding: 5px 15px;
    gap: 10px;
    background: linear-gradient(90deg, #25D9B8, #3ADF81);
    border-radius: 12px;
    color: white;
    transition: .1s;
}

/* quando for dark */
.theme-switch-wrapper.dark {
    display: flex;
    align-items: center;
    gap: 10px;
    background: linear-gradient(90deg, #25D9B8, #3ADF81);
    padding: 5px 15px;
    border-radius: 12px;
    color: white;
    font-weight: 600;
}

/* .theme-switch-wrapper {
    display: flex;
    align-items: center;
    gap: 10px;
    background: var(--gradient-verde);
    padding: 5px 15px;
    border-radius: 12px;
    color: #000;
    font-weight: 600;
}

.light-mode .theme-switch-wrapper {
    background: #363636;
    color: #fff;
} */

.theme-switch {
    display: inline-block;
    height: 20px;
    position: relative;
    width: 40px;
}

.theme-switch input { display: none; }

.slider {
    background-color: rgba(0,0,0,0.3);
    position: absolute;
    cursor: pointer;
    top: 0; left: 0; right: 0; bottom: 0;
    transition: .4s;
    border-radius: 34px;
}

.slider:before {
    background-color: #fff;
    content: "";
    height: 14px; width: 14px;
    left: 4px; bottom: 3px;
    position: absolute;
    transition: .4s;
    border-radius: 50%;
}

input:checked + .slider:before {
    transform: translateX(18px);
}
</style>