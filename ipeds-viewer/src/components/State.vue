<template>
  <div class='hello'>
    <h1>{{ msg }}</h1>
  </div>
</template>

<script>
import 'amcharts3/amcharts/amcharts'
import 'amcharts3/amcharts/serial'
import 'amcharts3/amcharts/themes/light'

export default {
  name: 'State',
  data () {
    return {
      msg: 'State Summary'
    }
  },
  computed: {
    stateList: function () {
      return this.$parent.records.filter(item => {
        return !this.stateList.contains()
      })
    }
  },
  created: function () {
  },
  update: function () {
  },
  mounted: function () {
    console.log(this.stateList)
  },
  methods: {
    createChart: function () {
      console.log(this.vcuList)
      var chart = window.AmCharts.makeChart('chartdiv', {
        'type': 'serial',
        'theme': 'light',
        'marginRight': 40,
        'marginLeft': 40,
        'autoMarginOffset': 20,
        'mouseWheelZoomEnabled': true,
        'dataDateFormat': 'YYYY-MM-DD',
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
          'hideBulletsCount': 50,
          'lineThickness': 2,
          'title': 'red line',
          'useLineColorForBulletBorder': true,
          'valueField': 'Some_Distance',
          'balloonText': '<span style="font-size:18px;">[[value]]</span>'
        }],
        'chartScrollbar': {
          'graph': 'g1',
          'oppositeAxis': false,
          'offset': 30,
          'scrollbarHeight': 80,
          'backgroundAlpha': 0,
          'selectedBackgroundAlpha': 0.1,
          'selectedBackgroundColor': '#888888',
          'graphFillAlpha': 0,
          'graphLineAlpha': 0.5,
          'selectedGraphFillAlpha': 0,
          'selectedGraphLineAlpha': 1,
          'autoGridCount': true,
          'color': '#AAAAAA'
        },
        'chartCursor': {
          'pan': true,
          'valueLineEnabled': true,
          'valueLineBalloonEnabled': true,
          'cursorAlpha': 1,
          'cursorColor': '#258cbb',
          'limitToGraph': 'g1',
          'valueLineAlpha': 0.2,
          'valueZoomable': true
        },
        'valueScrollbar': {
          'oppositeAxis': false,
          'offset': 50,
          'scrollbarHeight': 10
        },
        'categoryField': 'Year',
        'categoryAxis': {
          'parseDates': true,
          'dashLength': 1,
          'minorGridEnabled': true
        },
        'export': {
          'enabled': true
        },
        'dataProvider': this.vcuList
      })
      chart.addListener('rendered', zoomChart)

      zoomChart()

      function zoomChart () {
        chart.zoomToIndexes(chart.dataProvider.length - 40, chart.dataProvider.length - 1)
      }
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
</style>
