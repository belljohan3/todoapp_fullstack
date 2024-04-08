import type { DirectusCollections, Tasks } from '@/types'
import { createDirectus, rest, readItems, createItem } from '@directus/sdk'

const client = createDirectus(import.meta.env.VITE_API_URL).with(rest())

// fecth task
export const fetchTask = async (collection_name: DirectusCollections['collection']) => {
  try {
    const response = await client.request(
      readItems(collection_name, {
        fields: ['*']
      })
    )

    if (response) {
      console.log(response)
    } else {
      console.log('Erreur de reponse')
    }
  } catch (error) {
    console.log('Error while fetching data', error)
  }
  window.location.reload()
}

// create a new task
export const createTask = async (task: DirectusCollections['collection'], newTask: Tasks) => {
  try {
    // const response = await axios.post(`${import.meta.env.VITE_API_URL}/items/tasks`, newTask, {
    //   headers: {
    //     Authorization: `Bearer ${token}`
    //   }
    // })
    const result = await client.request(createItem(task, newTask))

    if (result) {
      console.log('New Task added')
    } else {
      console.log('Error while addind a new task')
    }
  } catch (error) {
    console.log(error)
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
