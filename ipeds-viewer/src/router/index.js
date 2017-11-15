import Vue from 'vue'
import Router from 'vue-router'
import Index from '@/components/Index'
import National from '@/components/National'
import State from '@/components/State'
import Schools from '@/components/Schools'
import individualSchool from '@/components/individualSchool'

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
      path: '/schools',
      name: 'schools',
      component: Schools
    },
    {
      path: '/schools/:id',
      name: 'individualSchool',
      component: individualSchool

    }
  ]
})
