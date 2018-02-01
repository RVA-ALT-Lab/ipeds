<template>
  <div class='hello'>
    <h1>{{ msg }}</h1>
    <label>Enrollment Filter</label>
    <div class="grid-container">
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
      <div class="half-width" v-if="annualFilteredStateData.length > 1">
        <h3>{{selectedState}} Details</h3>
        <router-link :to="{path:'/state/' + selectedState}">View Details</router-link>
        <div id="linechart" style="height: 300px;"></div>
      </div>
    </div>
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
      levelFilter: '1',
      selectedState: ''

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
    },
    selectedStateData: function () {
      let filteredStateList = this.stateData.filter(record => {
        return record['State'] === this.selectedState
      })
      return filteredStateList
    },
    annualFilteredStateData: function () {
      let annualFilteredStateData = this.selectedStateData.filter(record => {
        return record['Level'] === parseInt(this.levelFilter)
      })
      return annualFilteredStateData
    }
  },
  created: function () {
    this.stateData = this.$parent.stateData
  },
  updated: function () {
    this.createChart()
    this.createLineChart()
  },
  mounted: function () {
    this.createChart()
  },
  methods: {
    selectState: function (e) {
      this.selectedState = e.item.dataContext.State
      console.log(e.item.dataContext)
    },
    createChart: function () {
      let chart = window.AmCharts.makeChart('chartdiv', {
        'type': 'xy',
        'theme': 'light',
        'maginRight': 50,
        'marginLeft': 50,
        'valueAxes': [{
          'axisAlpha': 0,
          'position': 'bottom',
          'title': 'In-State Students'
        }, {
          'axisAlpha': 0,
          'position': 'left',
          'title': 'Out of State Students'
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
      chart.addListener('clickGraphItem', this.selectState)
    },
    createLineChart: function () {
      window.AmCharts.makeChart('linechart', {
        'type': 'serial',
        'theme': 'light',
        'maginRight': 300,
        'marginLeft': 100,
        'autoMarginOffset': 20,
        'dataDateFormat': 'YYYY',
        'legend': {
          'horizontalGap': 10,
          'maxColumns': 1,
          'position': 'right',
          'useGraphSettings': true,
          'markerSize': 10
        },
        'valueAxes': [{
          'id': 'v1',
          'axisAlpha': 0,
          'position': 'left',
          'ignoreAxisWidth': true,
          'title': 'Enrollments'
        }],
        'balloon': {
          'borderThickness': 1,
          'shadowAlpha': 0
        },
        'graphs': [{
          'id': 'g1',
          'balloon': {
            'drop': true,
            'adjustBorderColor': false,
            'color': '#ffffff'
          },
          'bullet': 'round',
          'bulletBorderAlpha': 1,
          'bulletColor': '#FFFFFF',
          'title': 'Some Distance',
          'bulletSize': 5,
          'useLineColorForBulletBorder': true,
          'valueField': 'Some_Distance'
        },
        {
          'id': 'g5',
          'balloon': {
            'drop': true,
            'adjustBorderColor': false,
            'color': '#ffffff'
          },
          'type': 'column',
          'color': '#000000',
          'fillAlphas': 1,
          'title': 'In State Students',
          'valueField': 'InState_Students'
        },
        {
          'id': 'g6',
          'balloon': {
            'drop': true,
            'adjustBorderColor': false,
            'color': '#ffffff'
          },
          'type': 'column',
          'fillAlphas': 1,
          'color': '#000000',
          'title': 'Out of State Students',
          'valueField': 'OutOfState_Students'
        },
        {
          'id': 'g7',
          'balloon': {
            'drop': true,
            'adjustBorderColor': false,
            'color': '#ffffff'
          },
          'type': 'column',
          'color': '#000000',
          'fillAlphas': 1,
          'title': 'International Students',
          'valueField': 'International_Students'
        }
        ],
        'categoryField': 'Year',
        'categoryAxis': {
          // 'parseDates': true,
          'dashLength': 1,
          'minorGridEnabled': true
        },
        'export': {
          'enabled': true
        },
        'dataProvider': this.annualFilteredStateData
      })
    }
  }
}
</script>

<!-- Add 'scoped' attribute to limit CSS to this component only -->
<style scoped>

.grid-container {
  display: grid;
  grid-template-columns: .5fr 2.5fr;
}

.three-col-layout {
  display: grid;
  grid-template-columns: 1fr 1fr 1fr;
}

#chartdiv {
  height: 500px;
}
</style>
