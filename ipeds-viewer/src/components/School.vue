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
  name: 'School',
  data () {
    return {
      msg: 'Explore Schools'
    }
  },
  computed: {
  },
  created: function () {
  },
  update: function () {

  },
  methods: {
    getData: function () {
      fetch('https://raw.githubusercontent.com/RVA-ALT-Lab/ipeds/master/combined-results.json')
      .then(response => response.json())
      .then(json => {
        this.records = json
      })
    }
  }
}
</script>

<!-- Add 'scoped' attribute to limit CSS to this component only -->
<style scoped>
</style>
