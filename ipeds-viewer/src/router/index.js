import Vue from 'vue'
import Router from 'vue-router'
import Index from '@/components/Index'
import National from '@/components/National'
import State from '@/components/State'
import School from '@/components/School'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'Index',
      component: Index
    },
    {
      path: '/national',
      name: 'National',
      component: National
    },
    {
      path: '/state',
      name: 'State',
      component: State
    },
    {
      path: '/school',
      name: 'school',
      component: School
    }
  ]
})
