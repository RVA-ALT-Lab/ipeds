<template>
  <div class='container'>
    <div class='row'>
      <div class='col-lg-12'>
        <h1>{{ msg }}</h1>
        <h2>{{$route.params.id}}</h2>
      </div>
      <div class='col-lg-4'>
        <div class='form-group'>
          <label>Enrollment Filter</label>
          <select v-model='levelFilter' class='form-control'>
            <option value='1'>All Enrollments</option>
            <option value='2'>Undergraduate</option>
            <option value='3'>Degree/certificate seeking</option>
            <option value='11'>Non-degree/certificate seeking</option>
            <option value='12'>Graduate</option>
          </select>
        </div>
      </div>
      <div class='col-lg-8'>
        <div id='linechart'></div>
      </div>
      <div class='col-lg-12'>
        <hr>
        <h3>NC SARA Data</h3>
        <div class='form-group'>
          <label>Enrollment Filter</label>
          <select v-model='NCSARAfilter' class='form-control'>
            <option value='internal'>Where {{$route.params.id}} institutions enroll students</option>
            <option value='external'>Where {{$route.params.id}} students are enrolled in distance programs</option>
          </select>
        </div>
        <div id='map' style='height: 500px;'></div>

      </div>
    <div class='col-lg-12'>
      <hr>
      <h3>Individual Schools</h3>
      <table class='table table-striped'>
        <thead>
          <tr>
            <th>Name</th>
            <th></th>
          </tr>
        </thead>
        <tr v-for='school in alphaOrderSchoolData' :key='school.ID'>
          <td>
            <router-link :to="{path:'/schools/' + school.ID}">
              {{school.Institution_Name}}
            </router-link>
          </td>
        </tr>
      </table>
    </div>
    </div>
    <!-- End Row -->
  </div>
  <!-- End Container -->
</template>
<script>
import 'amcharts3/amcharts/amcharts'
import 'amcharts3/amcharts/serial'
import 'ammap3/ammap/ammap'
import 'ammap3/ammap/maps/js/usaLow'
import 'amcharts3/amcharts/themes/light'

export default {

  name: 'individualState',
  data () {
    return {
      msg: 'Explore State',
      data: [],
      schoolData: [],
      yearFilter: '2016',
      levelFilter: '1',
      NCSARAdata: [],
      NCSARAfilter: 'internal',
      mapDataProvider: [
        {
          'id': 'US-AL',
          'value': 0
        }, {
          'id': 'US-AK',
          'value': 0
        }, {
          'id': 'US-AZ',
          'value': 0
        }, {
          'id': 'US-AR',
          'value': 0
        }, {
          'id': 'US-CA',
          'value': 0
        }, {
          'id': 'US-CO',
          'value': 0
        }, {
          'id': 'US-CT',
          'value': 0
        }, {
          'id': 'US-DE',
          'value': 0
        }, {
          'id': 'US-FL',
          'value': 0
        }, {
          'id': 'US-GA',
          'value': 0
        }, {
          'id': 'US-HI',
          'value': 0
        }, {
          'id': 'US-ID',
          'value': 0
        }, {
          'id': 'US-IL',
          'value': 0
        }, {
          'id': 'US-IN',
          'value': 0
        }, {
          'id': 'US-IA',
          'value': 0
        }, {
          'id': 'US-KS',
          'value': 0
        }, {
          'id': 'US-KY',
          'value': 0
        }, {
          'id': 'US-LA',
          'value': 0
        }, {
          'id': 'US-ME',
          'value': 0
        }, {
          'id': 'US-MD',
          'value': 0
        }, {
          'id': 'US-MA',
          'value': 0
        }, {
          'id': 'US-MI',
          'value': 0
        }, {
          'id': 'US-MN',
          'value': 0
        }, {
          'id': 'US-MS',
          'value': 0
        }, {
          'id': 'US-MO',
          'value': 0
        }, {
          'id': 'US-MT',
          'value': 0
        }, {
          'id': 'US-NE',
          'value': 0
        }, {
          'id': 'US-NV',
          'value': 0
        }, {
          'id': 'US-NH',
          'value': 0
        }, {
          'id': 'US-NJ',
          'value': 0
        }, {
          'id': 'US-NM',
          'value': 0
        }, {
          'id': 'US-NY',
          'value': 0
        }, {
          'id': 'US-NC',
          'value': 0
        }, {
          'id': 'US-ND',
          'value': 0
        }, {
          'id': 'US-OH',
          'value': 0
        }, {
          'id': 'US-OK',
          'value': 0
        }, {
          'id': 'US-OR',
          'value': 0
        }, {
          'id': 'US-PA',
          'value': 0
        }, {
          'id': 'US-RI',
          'value': 0
        }, {
          'id': 'US-SC',
          'value': 0
        }, {
          'id': 'US-SD',
          'value': 0
        }, {
          'id': 'US-TN',
          'value': 0
        }, {
          'id': 'US-TX',
          'value': 0
        }, {
          'id': 'US-UT',
          'value': 0
        }, {
          'id': 'US-VT',
          'value': 0
        }, {
          'id': 'US-VA',
          'value': 0
        }, {
          'id': 'US-WA',
          'value': 0
        }, {
          'id': 'US-WV',
          'value': 0
        }, {
          'id': 'US-WI',
          'value': 0
        }, {
          'id': 'US-WY',
          'value': 0
        } ]

    }
  },
  computed: {
    ncSaraList: function () {
      if (this.NCSARAfilter === 'internal') {
        return this.$parent.NCSARAData.filter(record => {
          if (record['State'] !== undefined) {
            return record['State'].toLowerCase() === this.$route.params.id.toLowerCase()
          }
        })
      } else if (this.NCSARAfilter === 'external') {
        return this.$parent.NCSARAData.filter(record => {
          return parseInt(record[this.$route.params.id]) > 0
        })
      }
    },
    ncSaraMax: function () {
      let values = this.computedMapDataProvider.map(data => data.value)
      let max = Math.max(...values)
      return max
    },
    ncSaraMin: function () {
      let values = this.computedMapDataProvider.map(data => data.value)
      let min = Math.min(...values)
      return min
    },
    computedMapDataProvider () {
      let ncSaraList = this.ncSaraList
      console.log(this.mapDataProvider)
      let computedMapDataProvider = this.mapDataProvider.map(item => item)
      computedMapDataProvider.forEach(item => {
        item.value = 0
      })
      console.log(computedMapDataProvider)

      if (this.NCSARAfilter === 'internal') {
        ncSaraList.forEach(stateEntry => {
          computedMapDataProvider.forEach(dataPoint => {
            dataPoint['value'] += stateEntry[dataPoint['id'].replace('US-', '')]
          })
        })
        // run internal routine
        return computedMapDataProvider
      } else if (this.NCSARAfilter === 'external') {
        ncSaraList.forEach(stateEntry => {
          computedMapDataProvider.forEach(dataPoint => {
            if (dataPoint['id'].replace('US-', '') === stateEntry['State']) {
              dataPoint['value'] += stateEntry[this.$route.params.id]
            }
          })
        })
        return computedMapDataProvider
      }
    },
    filteredList: function () {
      let filteredLevelList = this.data.filter(record => {
        return record['Level'] === parseInt(this.levelFilter)
      })

      filteredLevelList.sort((a, b) => a['Year'] > b['Year'])
      return filteredLevelList
    },
    alphaOrderSchoolData: function () {
      let data = this.schoolData
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
  mounted: function () {
    this.makeMap()
    this.createLineChart()
  },
  created: function () {
    this.data = this.$parent.stateData.filter(record => {
      return record['State'] === this.$route.params.id
    })

    this.schoolData = this.$parent.transformedSchoolData.filter(record => {
      return record['State'] === this.$route.params.id
    })
    console.log(this.schoolData)
    this.makeMap()
  },
  updated: function () {
    this.makeMap()
    this.createLineChart()
  },
  methods: {
    makeMap: function () {
      console.log('makeMap called')
      window.AmCharts.makeChart('map', {
        'type': 'map',
        'theme': 'light',
        'colorSteps': 9,
        'dataProvider': {
          'map': 'usaLow',
          'areas': this.computedMapDataProvider
        },
        'areasSettings': {
          'autoZoom': true
        },
        'valueLegend': {
          'right': 10,
          'minValue': this.ncSaraMin,
          'maxValue': this.ncSaraMax
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
        'dataProvider': this.filteredList
      })
    }
  }
}
</script>

 <!-- Add 'scoped' attribute to limit CSS to this component only -->
<style scoped>
</style>
