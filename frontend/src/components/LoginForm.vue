<template>
  <div class="flex justify-center items-center h-screen bg-gray-100">
    <div class="bg-white shadow-md rounded-lg p-8 w-full sm:w-96">
      <h2 class="text-2xl font-semibold mb-4">TODO App</h2>
      <form>
        <div class="mb-4">
          <label for="email" class="block text-gray-700 font-semibold">Email</label>
          <input
            type="email"
            id="email"
            v-model="email"
            placeholder="Entrer votre email"
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
          @click.prevent="loginUser"
          type="submit"
          class="w-full bg-indigo-500 text-white font-semibold py-2 px-4 rounded-md hover:bg-indigo-600 focus:outline-none focus:bg-indigo-600"
        >
          Se Connecter
        </button>
      </form>
    </div>
  </div>
</template>

<script lang="ts" setup>
import { signIn } from '@/services/auth'
import { ref } from 'vue'
import { useRouter } from 'vue-router'

const email = ref('')
const password = ref('')
const router = useRouter()

const loginUser = async () => {
  try {
    await signIn(email.value, password.value)
    router?.push({ name: 'Dashboard' })
    console.log('User connected. Redirecting to Dashboard...')
  } catch (error) {
    console.log(error)
  }
}
</script>
