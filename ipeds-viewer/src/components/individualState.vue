<template>
  <div class="container">
    <div class="row">
      <div class="col-lg-12">
        <h1>{{ msg }}</h1>
        <h2>{{$route.params.id}}</h2>
      </div>
      <div class="col-lg-4">
        <div class="form-group">
          <label>Enrollment Filter</label>
          <select v-model="levelFilter" class="form-control">
            <option value="1">All Enrollments</option>
            <option value="2">Undergraduate</option>
            <option value="3">Degree/certificate seeking</option>
            <option value="11">Non-degree/certificate seeking</option>
            <option value="12">Graduate</option>
          </select>
        </div>
        <div class="form-group">
          <label>Year Filter</label>
          <select v-model="yearFilter" class="form-control">
            <option value="2012">2012</option>
            <option value="2013">2013</option>
            <option value="2014">2014</option>
            <option value="2015">2015</option>
            <option value="2016">2016</option>
          </select>
        </div>
      </div>
      <div class="col-lg-8">

      </div>
    <div class="col-lg-12">
       {{filteredList}}
      <h3>Individual Schools</h3>
      <table class="table table-striped">
        <thead>
          <tr>
            <th>Name</th>
            <th></th>
          </tr>
        </thead>
        <tr v-for="school in schoolData" :key="school.ID">
          <td>
            <router-link :to="{path:'/schools/' + school.ID}">
              {{school.Institution_Name}}
            </router-link>
          </td>
        </tr>
      </table>
    </div>
    </div>
    <!-- End Row -->
  </div>
  <!-- End Container -->
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
      yearFilter: '2016',
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
    this.logData()
  },
  methods: {
    logData: function () {
      console.log(this.data)
      console.log(this.schoolData)
    }
  }
}
</script>

 <!-- Add 'scoped' attribute to limit CSS to this component only -->
<style scoped>
</style>
