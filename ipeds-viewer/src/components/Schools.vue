<template>
  <div class='hello'>
    <h1>{{ msg }}</h1>
    <table>
      <tr v-for="item in schoolsList" :key="item.ID">
        <td>{{item.Institution_Name}}</td>
        <td><router-link :to="{path:'/schools/' + item.ID}">{{item.ID}}</router-link></td>
      </tr>
    </table>
  </div>
</template>

<script>
import 'amcharts3/amcharts/amcharts'
import 'amcharts3/amcharts/serial'
import 'amcharts3/amcharts/themes/light'

export default {
  name: 'Schools',
  data () {
    return {
      msg: 'Explore Schools',
      numRows: 10,
      rowOffset: 0
    }
  },
  computed: {
    schoolsList: function () {
      let arr = []
      for (let i = 0; i < 50; i++) {
        arr.push(this.$parent.transformedSchoolData[i])
      }
      return arr
    },
    transformedList: function () {

    }
  },
  created: function () {
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
