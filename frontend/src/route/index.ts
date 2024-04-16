// router/index.ts

import { createRouter, createWebHistory, type RouteRecordRaw } from 'vue-router'
import { isAuthenticated } from '@/services/auth.service'

import LoginForm from '@/views/LoginView.vue'
import DashboardView from '@/views/DashboardView.vue'
import NotFound from '@/views/NotFound.vue'
import SignUpForm from '@/components/SignUpForm.vue'

const routes: Array<RouteRecordRaw> = [
  {
    path: '/',
    redirect: '/login'
  },
  {
    path: '/login',
    name: 'Login',
    component: LoginForm,
    meta: {
      requiresAuth: false
    }
  },
  {
    path: '/sign-up',
    name: 'Sign Up',
    component: SignUpForm
  },
  {
    path: '/dashboard',
    name: 'Dashboard',
    component: DashboardView,
    meta: {
      requiresAuth: true
    }
  },
  {
    path: '/:catchAll(.*)',
    name: 'NotFound',
    component: NotFound
  }
]

const router = createRouter({
  history: createWebHistory(),
  routes
})

// Navigation Guard to check for authentication before entering routes that require authentication
router.beforeEach((to, from, next) => {
  if (to.meta.requiresAuth && !isAuthenticated()) {
    // Redirect to the login page if the route requires authentication and the user is not authenticated
    next('/login')
  } else if (to.meta.requiresAuth === false && isAuthenticated()) {
    // Redirect to dashboard if trying to access the login page while authenticated
    next('/dashboard')
  } else {
    // Continue to the intended route
    next()
  }
})

export default router
