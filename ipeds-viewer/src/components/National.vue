<template>
  <div class='container'>
    <div class="row">
      <div class="col-lg-12">
        <h1>{{ msg }}</h1>
        <p>These statistics should help you compare national trends in distance education enrollments. You can filter by level using the dropdown menu.</p>
        <div class="form-group">
          <select v-model="levelFilter" class="form-control">
            <option value="1">All Enrollments</option>
            <option value="2">Undergraduate</option>
            <option value="3">Degree/certificate seeking</option>
            <option value="11">Non-degree/certificate seeking</option>
            <option value="12">Graduate</option>
          </select>
        </div>
        <div id="chart-div"></div>
      </div>

    </div>
  </div>
</template>

<script>
import 'amcharts3/amcharts/amcharts'
import 'amcharts3/amcharts/serial'
import 'amcharts3/amcharts/themes/light'

export default {
  name: 'National',
  data () {
    return {
      msg: 'National Summary',
      levelFilter: '1'
    }
  },
  computed: {
    nationalList: function () {
      let filteredData = this.$parent.nationalData.filter(item => {
        return item.Level === parseInt(this.levelFilter)
      })

      return filteredData.sort((a, b) => {
        return a.Year - b.Year
      })
    }
  },
  mounted: function () {
    this.createChart()
  },
  updated: function () {
    console.log(this.nationalList)
    this.createChart()
  },
  methods: {
    createChart: function () {
      window.AmCharts.makeChart('chart-div', {
        'type': 'serial',
        'theme': 'light',
        'legend': {
          'horizontalGap': 10,
          'maxColumns': 1,
          'position': 'right',
          'useGraphSettings': true,
          'markerSize': 10
        },
        'dataProvider': this.nationalList,
        'valueAxes': [{
          'stackType': 'regular',
          'axisAlpha': 0.5,
          'gridAlpha': 0
        }],
        'graphs': [{
          'ballonText': '',
          'fillAlphas': 0.8,
          'labelText': '[[value]]',
          'lineAlpha': 0.3,
          'title': 'Some Distance',
          'type': 'column',
          'color': '#000',
          'valueField': 'Some_Distance'
        },
        {
          'ballonText': '',
          'fillAlphas': 0.8,
          'labelText': '[[value]]',
          'lineAlpha': 0.3,
          'title': 'Exclusively Distance',
          'type': 'column',
          'color': '#000',
          'valueField': 'Exclusive_Distance'
        },
        {
          'ballonText': '',
          'fillAlphas': 0.8,
          'labelText': '[[value]]',
          'lineAlpha': 0.3,
          'title': 'No Distance',
          'type': 'column',
          'color': '#000',
          'valueField': 'None_Distance'
        }],
        // 'rotate': true,
        'categoryField': 'Year',
        'categoryAxis': {
          'gridPosition': 'start',
          'axisAlpha': 0,
          'gridAlpha': 0,
          'position': 'left'
        },
        'export': {
          'enabled': true
        }
      })
    },
    makeMap: function () {
      console.log('makeMap called')
      window.AmCharts.makeChart('map', {
        'type': 'map',
        'theme': 'light',
        'colorSteps': 9,
        'dataProvider': {
          'map': 'usaLow',
          'areas': ''
        },
        'areasSettings': {
          'autoZoom': true
        },
        'valueLegend': {
          'right': 10,
          'minValue': '',
          'maxValue': ''
        },
        'listeners': [{
          'event': 'clickMapObject',
          'method': function (event) {
            console.log(event.mapObject.id)
          }
        }],
        'export': {
          'enabled': true
        }

      })
    }
  }
}
</script>

<!-- Add 'scoped' attribute to limit CSS to this component only -->
<style scoped>
#chart-div {
  height: 500px;
}
</style>
