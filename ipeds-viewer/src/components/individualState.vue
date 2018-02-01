<template>
  <div class='hello'>
    <h1>{{ msg }}</h1>
    <h2>{{$route.params.id}}</h2>
    <div v-for="school in schoolData" :key="school.ID">
      {{school.Institution_Name}}
    </div>
  </div>
</template>
<script>
import 'amcharts3/amcharts/amcharts'
import 'amcharts3/amcharts/serial'
import 'amcharts3/amcharts/themes/light'

export default {

  name: 'individualState',
  data () {
    return {
      msg: 'Explore State',
      data: [],
      schoolData: []
    }
  },
  computed: {
  },
  created: function () {
    this.data = this.$parent.stateData.filter(record => {
      return record['State'] === this.$route.params.id
    })

    this.schoolData = this.$parent.transformedSchoolData.filter(record => {
      return record['State'] === this.$route.params.id
    })
  },
  update: function () {

  },
  methods: {
  }
}
</script>

 <!-- Add 'scoped' attribute to limit CSS to this component only -->
<style scoped>
</style>
