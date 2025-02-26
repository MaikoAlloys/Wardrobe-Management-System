<template>
    <div class="login-container">
        <h2>Login</h2>
        <form @submit.prevent="handleLogin">
            <input v-model="email" type="email" placeholder="Email" required />
            <input v-model="password" type="password" placeholder="Password" required />
            
            <button type="button" @click="$router.push('/dashboard')">Login</button>
        </form>
        <p>Don't have an account? <router-link to="/register">Register</router-link></p>
    </div>
</template>

<script>
import axios from 'axios';

export default {
    data() {
        return {
            email: '',
            password: '',
        };
    },
    methods: {
        async handleLogin() {
            try {
                const response = await axios.post('http://127.0.0.1:8000/api/login', {
                    email: this.email,
                    password: this.password,
                });
                localStorage.setItem('token', response.data.token);
                this.$router.push('/dashboard');
            } catch (error) {
                alert('Invalid login credentials');
            }
        },
    },
};
</script>

<style scoped>
.login-container {
    max-width: 400px;
    margin: auto;
    padding: 20px;
    text-align: center;
    border: 1px solid #ccc;
    border-radius: 10px;
    box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
}
input {
    width: 100%;
    padding: 10px;
    margin: 10px 0;
}
button {
    width: 100%;
    padding: 10px;
    background-color: #28a745;
    color: white;
    border: none;
    cursor: pointer;
}
button:hover {
    background-color: #218838;
}
</style>
