<template>
  <div class='hello'>
    <h2>{{individualSchoolData.INSTNM}}</h2>
    <p>{{individualSchoolData.ADDR}}</p>
    <p>{{individualSchoolData.CITY + ', ' + individualSchoolData.STABBR + ' '+ individualSchoolData.ZIP}}</p>
    <p>{{individualSchoolData}}</p>
  </div>
</template>
<script>
import 'amcharts3/amcharts/amcharts'
import 'amcharts3/amcharts/serial'
import 'amcharts3/amcharts/themes/light'

export default {

  name: 'individualSchool',
  data () {
    return {
      msg: 'Explore Schools',
      data: []
    }
  },
  computed: {
    individualSchoolData: function () {
      return this.$parent.schoolCharacteristics
      .filter(school => parseInt(school.UNITID) === parseInt(this.$route.params.id))[0]
    }
  },
  created: function () {
    console.log(this.$route.params.id)
    console.log(this.$parent.schoolCharacteristics)
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
