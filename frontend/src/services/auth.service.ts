import type { User } from '@/types'
import { createDirectus, authentication, login, rest, createUser } from '@directus/sdk'
import { useRouter } from 'vue-router'

const router = useRouter()

const api = createDirectus(import.meta.env.VITE_API_URL)

// Login function
export const signIn = async (email: string, password: string) => {
  try {
    const response = await api
      .with(authentication('json'))
      .with(rest())
      .request(login(email, password))

    console.log('User is authenticated succesfully', response.access_token)

    if (response.access_token) {
      localStorage.setItem('userToken', response.access_token)
    }
  } catch (error) {
    console.log('Error during login:', error)
    throw new Error('Unable to log In. Please Check Credentials')
  }
}

// Register function
export const registerUser = async (user: User) => {
  try {
    const response = await api.with(rest()).request(
      createUser({
        first_name: user.first_name,
        last_name: user.last_name,
        email: user.email,
        password: user.password
      })
    )
    console.log('Signup successful:', response)
  } catch (error) {
    console.error('Signup failed:', error)
  }
}

export const signOut = async () => {
  localStorage.clear()
  router?.push({ name: 'Login' })
  window.location.reload()
  console.log('User Disconnected')
}

export const isAuthenticated = (): boolean => {
  // Check if the user is authenticated
  const token = localStorage.getItem('userToken')
  return !!token // Convert to boolean
}
