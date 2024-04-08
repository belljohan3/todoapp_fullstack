// auth.service.ts
import { createDirectus, authentication, rest } from '@directus/sdk'
import { useRouter } from 'vue-router'

const router = useRouter()

const api = createDirectus(import.meta.env.VITE_API_URL)

export const signIn = async (email: string, password: string) => {
  try {
    const response = await api.with(authentication('json')).with(rest()).login(email, password)

    if (response.access_token) {
      api.with(authentication()).with(rest()).setToken(response.access_token)
      return response.access_token
    } else {
      throw new Error('There is no token')
    }
  } catch (error) {
    console.log('Error during login:', error)
    throw new Error('Unable to log In. Please Check Credentials')
  }
}

export const signOut = async () => {
  await api.with(authentication()).with(rest()).logout()
  router?.push({ name: 'Login' })
  window.location.reload()
  console.log('User Disconnected')
}

export const isAuthenticated = (): boolean => {
  // Check if the user is authenticated
  const token = localStorage.getItem('access_token')
  return !!token // Convert to boolean
}
