import './assets/main.css'

import { createApp } from 'vue'
import { createPinia } from 'pinia'
import router from './route'
import App from './App.vue'

const app = createApp(App)
app.use(router)
app.use(createPinia())

app.mount('#app')
