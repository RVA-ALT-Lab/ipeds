<template>
  <div class='container'>
    <div class="row">
      <div class="col-lg-12">
        <h1>{{ msg }}</h1>
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
      <div class="col-lg-8" v-if="annualFilteredStateData.length > 1">
        <h3>{{selectedState}} Details</h3>
        <router-link :to="{path:'/state/' + selectedState}">View Details</router-link>
        <div id="linechart" style="height: 200px;"></div>
      </div>
      <div class="col-lg-12">
        <div id="chartdiv"></div>
      </div>
      <table class="table">
        <thead>
          <th>State</th>
          <th>Total Enrollments</th>
          <th>Exclusive Distance</th>
          <th>Some Distance</th>
          <th>No Distance</th>
          <th>Details Page</th>
        </thead>
        <tr v-for="state in filteredList" :key="state.State">
          <td>{{state.State}}</td>
          <td>{{state.Total_Distance.toLocaleString()}}</td>
          <td>{{state.Exclusive_Distance.toLocaleString()}}</td>
          <td>{{state.Some_Distance.toLocaleString()}}</td>
          <td>{{state.None_Distance.toLocaleString()}}</td>
          <td><router-link :to="{path:'/state/' + state.State}">View {{state.State}} Details</router-link></td>
        </tr>
      </table>
    </div>
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
      yearFilter: '2016',
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
      annualFilteredStateData.sort((a, b) => a.Year - b.Year)
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
          'balloonText': '<span style="font-size:18px;">State: [[State]]</br>In-State: [[x]]</br>Out-of-State: [[y]]</br>Total Distance: [[value]]</br></span>',
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
  height: 400px;
}
</style>
