<template>
  <div class="flex justify-center items-center h-screen bg-gray-100">
    <div class="bg-white shadow-md rounded-lg p-8 w-full sm:w-96">
      <h2 class="text-2xl font-semibold mb-4">TODO App</h2>
      <form>
        <div class="mb-4">
          <label for="firstName" class="block text-gray-700 font-semibold">Email</label>
          <input
            type="firstName"
            id="firstName"
            v-model="firstName"
            placeholder="Entrer votre Prenom"
            class="w-full mt-1 px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:border-indigo-500"
          />
        </div>
        <div class="mb-4">
          <label for="lastName" class="block text-gray-700 font-semibold">Email</label>
          <input
            type="lastName"
            id="lastName"
            v-model="lastName"
            placeholder="Entrer votre Nom"
            class="w-full mt-1 px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:border-indigo-500"
          />
        </div>
        <div class="mb-4">
          <label for="email" class="block text-gray-700 font-semibold">Email</label>
          <input
            type="email"
            id="email"
            v-model="email"
            placeholder="Entrer votre Nom"
            class="w-full mt-1 px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:border-indigo-500"
          />
        </div>
        <div class="mb-6">
          <label for="password" class="block text-gray-700 font-semibold">Mot de Passe</label>
          <input
            type="password"
            id="password"
            v-model="password"
            placeholder="Entrer votre mot de passe"
            class="w-full mt-1 px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:border-indigo-500"
          />
        </div>
        <button
          @click.prevent="handleSignup"
          type="submit"
          class="w-full bg-indigo-500 text-white font-semibold py-2 px-4 rounded-md hover:bg-indigo-600 focus:outline-none focus:bg-indigo-600"
        >
          Se Connecter
        </button>
      </form>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref } from 'vue'
import type { User } from '../types/index'
import { registerUser } from '../services/auth.service'
import { useRouter } from 'vue-router'

const router = useRouter()

const firstName = ref('')
const lastName = ref('')
const email = ref('')
const password = ref('')

const handleSignup = async () => {
  try {
    const userData: User = {
      first_name: firstName.value,
      last_name: lastName.value,
      email: email.value,
      password: password.value
    }
    await registerUser(userData)
    router?.push({ name: 'Dashboard' })
    console.log('User added succesfuuly')
  } catch (error) {
    console.log('There is an error:', error)
  }
}
</script>
