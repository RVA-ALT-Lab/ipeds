<template>
  <div class='hello'>
    <h1>{{ msg }}</h1>
    <h2>{{$route.params.id}}</h2>
      <label>Enrollment Filter</label>
      <div>
        <select v-model="levelFilter">
          <option value="1">All Enrollments</option>
          <option value="2">Undergraduate</option>
          <option value="3">Degree/certificate seeking</option>
          <option value="11">Non-degree/certificate seeking</option>
          <option value="12">Graduate</option>
        </select>
        <br>
        <label>Year Filter</label>
        <select v-model="yearFilter">
          <option value="2012">2012</option>
          <option value="2013">2013</option>
          <option value="2014">2014</option>
          <option value="2015">2015</option>
        </select>
      </div>

    {{filteredList}}
    <h3>Individual Schools</h3>
    <div v-for="school in schoolData" :key="school.ID">
      <router-link :to="{path:'/schools/' + school.ID}">
        {{school.Institution_Name}}
      </router-link>
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
      schoolData: [],
      yearFilter: '2012',
      levelFilter: '1'
    }
  },
  computed: {
    filteredList: function () {
      let filteredYearList = this.data.filter(record => {
        return record['Year'] === this.yearFilter
      })
      let filteredLevelList = filteredYearList.filter(record => {
        return record['Level'] === parseInt(this.levelFilter)
      })
      return filteredLevelList
    }
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
