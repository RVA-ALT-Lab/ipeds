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
        <div class='form-group'>
          <label>Year Filter</label>
          <select v-model='yearFilter' class='form-control'>
            <option value='2012'>2012</option>
            <option value='2013'>2013</option>
            <option value='2014'>2014</option>
            <option value='2015'>2015</option>
            <option value='2016'>2016</option>
          </select>
        </div>
      </div>
      <div class='col-lg-8'>

      </div>
      <div class='col-lg-12'>
        <h3>NC SARA Data</h3>
        <div class='form-group'>
          <label>Enrollment Filter</label>
          <select v-model='NCSARAfilter' class='form-control'>
            <option value='internal'>Where 'state' institutions enroll students</option>
            <option value='external'>Where 'state' students are enrolled in distance programs</option>
          </select>
        </div>
        <div id='map' style='height: 500px;'></div>

      </div>
    <div class='col-lg-12'>
       {{filteredList}}
      <h3>Individual Schools</h3>
      <table class='table table-striped'>
        <thead>
          <tr>
            <th>Name</th>
            <th></th>
          </tr>
        </thead>
        <tr v-for='school in schoolData' :key='school.ID'>
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
      NCSARAfilter: 'internal'

    }
  },
  computed: {
    ncSaraList: function () {
      if (this.NCSARAfilter === 'internal') {
        return this.$parent.NCSARAData.filter(record => {
          return record['State'].toLowerCase() === this.$route.params.id.toLowerCase()
        })
      } else if (this.NCSARAfilter === 'external') {
        return this.$parent.NCSARAData.filter(record => {
          return parseInt(record[this.$route.params.id]) > 0
        })
      }
    },
    filteredList: function () {
      let filteredYearList = this.data.filter(record => {
        return record['Year'] === this.yearFilter
      })
      let filteredLevelList = filteredYearList.filter(record => {
        return record['Level'] === parseInt(this.levelFilter)
      })
      return filteredLevelList
    }
  },
  created: function () {
    this.data = this.$parent.stateData.filter(record => {
      return record['State'] === this.$route.params.id
    })

    this.schoolData = this.$parent.transformedSchoolData.filter(record => {
      return record['State'] === this.$route.params.id
    })
    this.makeMap()
  },
  updated: function () {
    this.logData()
    this.makeMap()
  },
  methods: {
    logData: function () {
      console.log(this.data)
      console.log(this.schoolData)
    },
    makeMap: function () {
      console.log('makeMap called')
      window.AmCharts.makeChart('map', {
        'type': 'map',
        'theme': 'light',
        'colorSteps': 10,

        'dataProvider': {
          'map': 'usaLow',
          'areas': [ {
            'id': 'US-AL',
            'value': 4447100
          }, {
            'id': 'US-AK',
            'value': 626932
          }, {
            'id': 'US-AZ',
            'value': 5130632
          }, {
            'id': 'US-AR',
            'value': 2673400
          }, {
            'id': 'US-CA',
            'value': 33871648
          }, {
            'id': 'US-CO',
            'value': 4301261
          }, {
            'id': 'US-CT',
            'value': 3405565
          }, {
            'id': 'US-DE',
            'value': 783600
          }, {
            'id': 'US-FL',
            'value': 15982378
          }, {
            'id': 'US-GA',
            'value': 8186453
          }, {
            'id': 'US-HI',
            'value': 1211537
          }, {
            'id': 'US-ID',
            'value': 1293953
          }, {
            'id': 'US-IL',
            'value': 12419293
          }, {
            'id': 'US-IN',
            'value': 6080485
          }, {
            'id': 'US-IA',
            'value': 2926324
          }, {
            'id': 'US-KS',
            'value': 2688418
          }, {
            'id': 'US-KY',
            'value': 4041769
          }, {
            'id': 'US-LA',
            'value': 4468976
          }, {
            'id': 'US-ME',
            'value': 1274923
          }, {
            'id': 'US-MD',
            'value': 5296486
          }, {
            'id': 'US-MA',
            'value': 6349097
          }, {
            'id': 'US-MI',
            'value': 9938444
          }, {
            'id': 'US-MN',
            'value': 4919479
          }, {
            'id': 'US-MS',
            'value': 2844658
          }, {
            'id': 'US-MO',
            'value': 5595211
          }, {
            'id': 'US-MT',
            'value': 902195
          }, {
            'id': 'US-NE',
            'value': 1711263
          }, {
            'id': 'US-NV',
            'value': 1998257
          }, {
            'id': 'US-NH',
            'value': 1235786
          }, {
            'id': 'US-NJ',
            'value': 8414350
          }, {
            'id': 'US-NM',
            'value': 1819046
          }, {
            'id': 'US-NY',
            'value': 18976457
          }, {
            'id': 'US-NC',
            'value': 8049313
          }, {
            'id': 'US-ND',
            'value': 642200
          }, {
            'id': 'US-OH',
            'value': 11353140
          }, {
            'id': 'US-OK',
            'value': 3450654
          }, {
            'id': 'US-OR',
            'value': 3421399
          }, {
            'id': 'US-PA',
            'value': 12281054
          }, {
            'id': 'US-RI',
            'value': 1048319
          }, {
            'id': 'US-SC',
            'value': 4012012
          }, {
            'id': 'US-SD',
            'value': 754844
          }, {
            'id': 'US-TN',
            'value': 5689283
          }, {
            'id': 'US-TX',
            'value': 20851820
          }, {
            'id': 'US-UT',
            'value': 2233169
          }, {
            'id': 'US-VT',
            'value': 608827
          }, {
            'id': 'US-VA',
            'value': 7078515
          }, {
            'id': 'US-WA',
            'value': 5894121
          }, {
            'id': 'US-WV',
            'value': 1808344
          }, {
            'id': 'US-WI',
            'value': 5363675
          }, {
            'id': 'US-WY',
            'value': 493782
          } ]
        },

        'areasSettings': {
          'autoZoom': true
        },

        'valueLegend': {
          'right': 10,
          'minValue': 'little',
          'maxValue': 'a lot!'
        },

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
</style>
