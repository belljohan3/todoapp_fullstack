<template>
  <div>
    <div class="flex justify-between mb-4 bg-blue-100 p-4">
      <h1 class="text-2xl font-bold mb-4">TODO APP</h1>
      <button class="bg-red-800 text-white px-4 rounded-xl" @click="signOut">Disconnect</button>
    </div>

    <div v-if="isLoading">Loading...</div>

    <div v-else-if="tasks.length === 0" class="px-12">
      <div class="flex justify-between mb-4">
        <h2 class="text-2xl font-bold mb-4">No Tasks for you</h2>
      </div>
    </div>

    <div v-else class="px-12">
      <div class="flex justify-between mb-4">
        <h1 class="text-2xl font-bold mb-4">Dashboard</h1>
        <button class="bg-blue-800 text-white px-4 py-2 m-2 rounded-xl" @click="openAddTaskModal">
          + Add a Task
        </button>
      </div>
      <div v-for="task in datas" :key="task.id" class="bg-white p-4 rounded-lg shadow mb-4">
        <div class="flex justify-between items-center mb-2">
          <h2 class="text-lg font-semibold">{{ task.title }}</h2>
          <span
            :class="{ 'text-green-500': task.is_completed, 'text-red-500': !task.is_completed }"
          >
            {{ task.is_completed ? 'Completed' : 'Not done' }}
          </span>
        </div>
        <p class="text-gray-700">{{ task.description }}</p>
        <div class="text-sm text-gray-500 mt-2">
          <p>Created at: {{ task.created_at }}</p>
          <p>Updated at: {{ task.updated_at }}</p>
          <button @click="removeTask(task.id)" class="text-red-500">Delete</button>
        </div>
      </div>
    </div>

    <!-- Add Task Modal -->
    <div
      v-if="isAddTaskModalOpen"
      class="fixed inset-0 flex items-center justify-center bg-black bg-opacity-50"
    >
      <div class="bg-white p-8 rounded-lg">
        <h2 class="text-xl font-bold mb-4">Add a New Task</h2>
        <form @submit.prevent="addTask">
          <div class="mb-4">
            <label for="title" class="block text-sm font-medium text-gray-700">Title</label>
            <input
              type="text"
              id="title"
              v-model="newTask.title"
              class="mt-1 p-2 border border-gray-300 rounded-md w-full"
            />
          </div>
          <div class="mb-4">
            <label for="description" class="block text-sm font-medium text-gray-700"
              >Description</label
            >
            <textarea
              id="description"
              v-model="newTask.description"
              class="mt-1 p-2 border border-gray-300 rounded-md w-full"
            ></textarea>
          </div>
          <button type="submit" class="bg-green-600 text-white px-4 py-2 mr-4 rounded-xl">
            Add Task
          </button>
          <button
            @click="closeAddTaskModal"
            class="bg-red-600 text-white px-4 py-2 mr-4 rounded-xl"
          >
            Cancel
          </button>
        </form>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import axios from 'axios'
import { ref } from 'vue'
import { signOut } from '@/services/auth.service'
import { createTask, fetchTask, deleteTask } from '@/services/task.service'

const isLoading = ref(true)
let tasks = ref([])
const isAddTaskModalOpen = ref(false)
const newTask = ref({
  title: '',
  description: ''
})

// Fetch tasks on mount
if (document.readyState === 'complete') {
  window.location.reload()
}

// onMounted(async () => {
//   try {
//     const response = await axios.get(`${import.meta.env.VITE_API_URL}/items/tasks`, {
//       headers: {
//         Authorization: `Bearer ${token}`
//       }
//     })
//     tasks.value = response.data
//   } catch (error) {
//     console.error('Error fetching data:', error)
//   } finally {
//     isLoading.value = false
//   }
// })

// Function to open add task modal
const openAddTaskModal = () => {
  isAddTaskModalOpen.value = true
}

// Function to close add task modal
const closeAddTaskModal = () => {
  isAddTaskModalOpen.value = false
}

// Function to add a new task
const addTask = async () => {
  try {
    createTask('task', {
      title: newTask.value.title,
      description: newTask.value.description
    })

    // Close the modal
    closeAddTaskModal()
  } catch (error) {
    console.error('Error adding task:', error)
  }
}

// Function to delete a task
async function removeTask(taskId: string) {
  try {
    // Call deleteTask function
    await deleteTask(taskId)
    console.log('Task deleted successfully!')
  } catch (error) {
    console.error('Error:', error)
  }
}
</script>
