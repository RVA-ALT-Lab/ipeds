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
    },
    createChart: function () {
      let chart = window.AmCharts.makeChart('chartdiv', {
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
      chart.addListener('clickGraphItem', this.selectState)
    },
    createLineChart: function () {
      window.AmCharts.makeChart('linechart', {
        'type': 'serial',
        'theme': 'light',
        'maginRight': 40,
        'marginLeft': 40,
        'autoMarginOffset': 20,
        'dataDateFormat': 'YYYY',
        'valueAxes': [{
          'id': 'v1',
          'axisAlpha': 0,
          'position': 'left',
          'ignoreAxisWidth': true
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
          'bulletSize': 5,
          'useLineColorForBulletBorder': true,
          'valueField': 'Exclusive_Distance'
        },
        {
          'id': 'g2',
          'balloon': {
            'drop': true,
            'adjustBorderColor': false,
            'color': '#ffffff'
          },
          'bullet': 'round',
          'bulletBorderAlpha': 1,
          'bulletColor': '#FFFFFF',
          'bulletSize': 5,
          'useLineColorForBulletBorder': true,
          'valueField': 'InState_Students'
        },
        {
          'id': 'g3',
          'balloon': {
            'drop': true,
            'adjustBorderColor': false,
            'color': '#ffffff'
          },
          'bullet': 'round',
          'bulletBorderAlpha': 1,
          'bulletColor': '#FFFFFF',
          'bulletSize': 5,
          'useLineColorForBulletBorder': true,
          'valueField': 'OutOfState_Students'
        },
        {
          'id': 'g4',
          'balloon': {
            'drop': true,
            'adjustBorderColor': false,
            'color': '#ffffff'
          },
          'bullet': 'round',
          'bulletBorderAlpha': 1,
          'bulletColor': '#FFFFFF',
          'bulletSize': 5,
          'useLineColorForBulletBorder': true,
          'valueField': 'Some_Distance'
        }
        ],
        'categoryField': 'Year',
        'categoryAxis': {
          'parseDates': true,
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
  grid-template-columns: 1fr 2fr;
}

.three-col-layout {
  display: grid;
  grid-template-columns: 1fr 1fr 1fr;
}

#chartdiv {
  height: 500px;
}
</style>
