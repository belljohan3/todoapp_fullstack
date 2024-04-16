import type { DirectusCollections, Tasks } from '@/types'
import { createDirectus, rest, createItem, readItems } from '@directus/sdk'
import { isAuthenticated } from './auth.service'
// import axios from 'axios'

const api = createDirectus(import.meta.env.VITE_API_URL).with(rest())

export const fetchTasks = async () => {
  try {
    const response = await api.request(
      readItems('tasks', {
        fields: ['*']
      })
    )
    return response
  } catch (error) {
    console.log('Error fetching collection data:', error)
    throw error
  }
}

// create a new task
export const createTask = async (tasks: DirectusCollections['collection'], newTask: Tasks) => {
  if (isAuthenticated() === true) {
    try {
      const result = await api.request(createItem(tasks, newTask))
      console.log(result)
      if (result) {
        console.log('New Task added', result)
      } else {
        console.log('Error while addind a new task')
      }
    } catch (error) {
      console.log(error)
    }
  }
}

export const deleteTask = async (taskId: string) => {
  try {
    await axios.delete(`${import.meta.env.VITE_API_URL}/items/tasks/${taskId}`, {
      headers: {
        Authorization: `Bearer ${token}`
      }
    })
    // Refetch tasks
    const response = await axios.get(`${import.meta.env.VITE_API_URL}/items/tasks`, {
      headers: {
        Authorization: `Bearer ${token}`
      }
    })
    tasks.value = response.data
  } catch (error) {
    console.error('Error deleting task:', error)
  }
}
