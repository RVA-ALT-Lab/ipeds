<template>
  <div class='hello'>
    <h1>{{ msg }}</h1>
    <ul>
      <li v-for="(item, key) in schoolsList" :key="item.ID">
        {{item}}
        <router-link :to="{path:'/schools/' + key}">{{key}}</router-link>
      </li>
    </ul>
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
      msg: 'Explore Schools'
    }
  },
  computed: {
    schoolsList: function () {
      let obj = {}

      this.$parent.records.forEach(record => {
        if (obj[record.ID]) {
          obj[record.ID][record.Year] = record.Year
        } else {
          obj[record.ID] = {}
          obj[record.ID][record.Year] = record.Year
          obj[record.ID]['Instiution_Name'] = record.Instiution_Name
        }
      })
      return obj
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
