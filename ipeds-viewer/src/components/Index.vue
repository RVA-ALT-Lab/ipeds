<template>
  <div class='hello'>
    <h1>{{ msg }}</h1>
    <h2>2016</h2>
    <table class="table">
      <thead class="thead-inverse">
        <tr>
          <th>Level</th>
          <th>Exclusively Distance</th>
          <th>Some Distance</th>
          <th>None Distance</th>
          <th>Total Enrollments</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="item in results2016" :key="item.Year">
        <td>{{item.Level | returnLevel}}</td>
        <td>{{item.Exclusive_Distance}}</td>
        <td>{{item.Some_Distance}}</td>
        <td>{{item.None_Distance}}</td>
        <td>{{item.Total_Distance}}</td>
        </tr>
      </tbody>
    </table>
    <h2>2015</h2>
    <table class="table">
      <thead class="thead-inverse">
        <tr>
          <th>Level</th>
          <th>Exclusively Distance</th>
          <th>Some Distance</th>
          <th>None Distance</th>
          <th>Total Enrollments</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="item in results2015" :key="item.Year">
        <td>{{item.Level | returnLevel}}</td>
        <td>{{item.Exclusive_Distance}}</td>
        <td>{{item.Some_Distance}}</td>
        <td>{{item.None_Distance}}</td>
        <td>{{item.Total_Distance}}</td>
        </tr>
      </tbody>
    </table>
    <h2>2014</h2>
    <table class="table">
      <thead class="thead-inverse">
        <tr>
          <th>Level</th>
          <th>Exclusively Distance</th>
          <th>Some Distance</th>
          <th>None Distance</th>
          <th>Total Enrollments</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="item in results2014" :key="item.Year">
        <td>{{item.Level | returnLevel}}</td>
        <td>{{item.Exclusive_Distance}}</td>
        <td>{{item.Some_Distance}}</td>
        <td>{{item.None_Distance}}</td>
        <td>{{item.Total_Distance}}</td>
        </tr>
      </tbody>
    </table>
    <h2>2013</h2>
    <table class="table">
      <thead class="thead-inverse">
        <tr>
          <th>Level</th>
          <th>Exclusively Distance</th>
          <th>Some Distance</th>
          <th>None Distance</th>
          <th>Total Enrollments</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="item in results2013" :key="item.Year">
        <td>{{item.Level | returnLevel}}</td>
        <td>{{item.Exclusive_Distance}}</td>
        <td>{{item.Some_Distance}}</td>
        <td>{{item.None_Distance}}</td>
        <td>{{item.Total_Distance}}</td>
        </tr>
      </tbody>
    </table>
    <h2>2012</h2>
    <table class="table">
      <thead class="thead-inverse">
        <tr>
          <th>Level</th>
          <th>Exclusively Distance</th>
          <th>Some Distance</th>
          <th>None Distance</th>
          <th>Total Enrollments</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="item in results2012" :key="item.Year">
        <td>{{item.Level | returnLevel}}</td>
        <td>{{item.Exclusive_Distance}}</td>
        <td>{{item.Some_Distance}}</td>
        <td>{{item.None_Distance}}</td>
        <td>{{item.Total_Distance}}</td>
        </tr>
      </tbody>
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
    results2016: function () {
      return this.$parent.nationalData.filter(item => {
        return item.Year === '2016'
      })
    },
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
