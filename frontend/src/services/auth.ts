// auth.service.ts
import { createDirectus, authentication, rest } from '@directus/sdk'

const api = createDirectus(import.meta.env.VITE_API_URL)
  .with(authentication())
  .with(rest())

export const signIn = async (email: string, password: string) => {
  try {
    const response = await api.login(email, password)

    if (response.access_token) {
      // localStorage.setItem('access_token', response.access_token)
      api.setToken(response.access_token)

      return response.access_token
    } else {
      throw new Error('User is not authenticated')
    }
  } catch (error) {
    console.log('Error during login:', error)
    throw new Error('Unable to log In. Please Check Credentials')
  }
}
