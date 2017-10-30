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
  name: 'Index',
  data () {
    return {
      msg: 'IPEDS Data Explorer'
    }
  },
  computed: {

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
