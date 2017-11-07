<template>
  <div class='hello'>
    <h1>{{ msg }}</h1>
    <select v-model="levelFilter">
      <option value="1">All Enrollments</option>
      <option value="2">Undergraduate</option>
      <option value="3">Degree/certificate seeking</option>
      <option value="11">Non-degree/certificate seeking</option>
      <option value="12">Graduate</option>
    </select>
    <select v-model="yearFilter">
      <option value="2012">2012</option>
      <option value="2013">2013</option>
      <option value="2014">2014</option>
      <option value="2015">2015</option>
    </select>
    <ul>
      <li v-for="item in filteredList" :key="item.Year">
        {{item.State}}
      </li>
    </ul>
    <div id="chartdiv"></div>
  </div>
</template>

<script>
import 'amcharts3/amcharts/amcharts'
import 'amcharts3/amcharts/xy'
import 'amcharts3/amcharts/themes/light'

export default {
  name: 'State',
  data () {
    return {
      msg: 'State Summary',
      stateData: [],
      yearFilter: '2012',
      levelFilter: '1'

    }
  },
  computed: {
    filteredList: function () {
      let filteredYearList = this.stateData.filter(record => {
        return record['Year'] === this.yearFilter
      })
      let filteredLevelList = filteredYearList.filter(record => {
        return record['Level'] === parseInt(this.levelFilter)
      })
      return filteredLevelList
    }
  },
  created: function () {
    this.stateData = this.$parent.stateData
  },
  updated: function () {
    this.createChart()
  },
  mounted: function () {
    this.createChart()
  },
  methods: {
    createChart: function () {
      console.log(this.filteredList)
      window.AmCharts.makeChart('chartdiv', {
        'type': 'xy',
        'theme': 'light',
        'valueAxes': [{
          'axisAlpha': 0,
          'position': 'bottom'
        }, {
          'minMaxMultiplier': 1.2,
          'axisAlpha': 0,
          'position': 'left'
        }],
        'balloon': {
          'fixedPosition': true
        },
        'startDuration': 1.5,
        'graphs': [{
          'bullet': 'round',
          'bulletBorderAlpha': 0.2,
          'bulletAlpha': 0.8,
          'lineAlpha': 0,
          'fillAlphas': 0,
          'valueField': 'Exclusive_Distance',
          'balloonText': '<span style="font-size:18px;">State: [[State]]</br>In-State Students: [[x]]</br>Out-of-State Students: [[y]]</br>Total Distance Students: [[value]]</br></span>',
          'xField': 'InState_Students',
          'yField': 'OutOfState_Students',
          'maxBulletSize': 100
        }],
        'export': {
          'enabled': true
        },
        'dataProvider': this.filteredList
      })
    }
  }
}
</script>

<!-- Add 'scoped' attribute to limit CSS to this component only -->
<style scoped>
h1, h2 {
  font-weight: normal;
}

ul {
  list-style-type: none;
  padding: 0;
}

li {
  display: inline-block;
  margin: 0 10px;
}

a {
  color: #42b983;
}

#chartdiv {
  height: 500px;
}
</style>
