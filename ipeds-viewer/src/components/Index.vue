<template>
  <div class='hello'>
    <h1>{{ msg }}</h1>
    <h2>2015</h2>
    <p>2015 is the most recent year for which we have data about distance education enrollments. A revised version of this data set has not been published.</p>
    <table>
      <thead>
        <td>Level</td>
        <td>Exclusively Distance</td>
        <td>Some Distance</td>
        <td>None Distance</td>
        <td>Total Enrollments</td>
      </thead>
      <tr v-for="item in results2015" :key="item.Year">
      <td>{{item.Level | returnLevel}}</td>
      <td>{{item.Exclusive_Distance}}</td>
      <td>{{item.Some_Distance}}</td>
      <td>{{item.None_Distance}}</td>
      <td>{{item.Total_Distance}}</td>
      </tr>
    </table>
    <h2>2014</h2>
    <table>
      <thead>
        <td>Level</td>
        <td>Exclusively Distance</td>
        <td>Some Distance</td>
        <td>None Distance</td>
        <td>Total Enrollments</td>
      </thead>
      <tr v-for="item in results2014" :key="item.Year">
      <td>{{item.Level | returnLevel}}</td>
      <td>{{item.Exclusive_Distance}}</td>
      <td>{{item.Some_Distance}}</td>
      <td>{{item.None_Distance}}</td>
      <td>{{item.Total_Distance}}</td>
      </tr>
    </table>
    <h2>2013</h2>
    <table>
      <thead>
        <td>Level</td>
        <td>Exclusively Distance</td>
        <td>Some Distance</td>
        <td>None Distance</td>
        <td>Total Enrollments</td>
      </thead>
      <tr v-for="item in results2013" :key="item.Year">
      <td>{{item.Level | returnLevel}}</td>
      <td>{{item.Exclusive_Distance}}</td>
      <td>{{item.Some_Distance}}</td>
      <td>{{item.None_Distance}}</td>
      <td>{{item.Total_Distance}}</td>
      </tr>
    </table>
    <h2>2012</h2>
    <table>
      <thead>
        <td>Level</td>
        <td>Exclusively Distance</td>
        <td>Some Distance</td>
        <td>None Distance</td>
        <td>Total Enrollments</td>
      </thead>
      <tr v-for="item in results2012" :key="item.Year">
      <td>{{item.Level | returnLevel}}</td>
      <td>{{item.Exclusive_Distance}}</td>
      <td>{{item.Some_Distance}}</td>
      <td>{{item.None_Distance}}</td>
      <td>{{item.Total_Distance}}</td>
      </tr>
    </table>

  </div>
</template>

<script>
import 'amcharts3/amcharts/amcharts'
import 'amcharts3/amcharts/serial'
import 'amcharts3/amcharts/themes/light'

export default {
  name: 'Index',
  data () {
    return {
      msg: 'IPEDS Data Explorer'
    }
  },
  computed: {
    results2015: function () {
      return this.$parent.nationalData.filter(item => {
        return item.Year === '2015'
      })
    },
    results2014: function () {
      return this.$parent.nationalData.filter(item => {
        return item.Year === '2014'
      })
    },
    results2013: function () {
      return this.$parent.nationalData.filter(item => {
        return item.Year === '2013'
      })
    },
    results2012: function () {
      return this.$parent.nationalData.filter(item => {
        return item.Year === '2012'
      })
    }

  },
  filters: {
    returnLevel: function (value) {
      switch (value) {
        case 1:
          return 'All Students'
        case 2:
          return 'Undergraduate'
        case 3:
          return 'Degree/certificate seeking'
        case 11:
          return 'Non-degree/certificate seeking'
        case 12:
          return 'Graduate'
      }
    }
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
