<template>
  <div class='hello'>
    <h1>{{ msg }}</h1>
    <input type="text" v-model="searchText">
    <button type="button" v-on:click="nextPage">Next Page</button>
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
      rowOffset: 0,
      searchText: ''
    }
  },
  computed: {
    schoolsList: function () {
      let arr = []
      for (let i = this.rowOffset * 50; i < (this.rowOffset * 50 + 50); i++) {
        arr.push(this.alphaOrderList[i])
      }
      return arr
    },
    alphaOrderList: function () {
      let data = this.$parent.transformedSchoolData
      data.sort(function (a, b) {
        let nameA = a.Institution_Name.toLowerCase().replace(/\W/g, '')
        let nameB = b.Institution_Name.toLowerCase().replace(/\W/g, '')
        if (nameA > nameB) return 1
        if (nameA < nameB) return -1
        return 0
      })
      return data
    }
  },
  created: function () {
  },
  update: function () {

  },
  methods: {
    nextPage: function () {
      this.rowOffset++
    }
  }
}
</script>

<!-- Add 'scoped' attribute to limit CSS to this component only -->
<style scoped>
</style>
