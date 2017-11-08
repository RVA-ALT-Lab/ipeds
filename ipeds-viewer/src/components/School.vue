<template>
  <div class='hello'>
    <h1>{{ msg }}</h1>
    <ul>
      <li v-for="item in $parent.records" :key="item.ID">
        {{item.ID}}
      </li>
    </ul>
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
  }
}
</script>

<!-- Add 'scoped' attribute to limit CSS to this component only -->
<style scoped>
</style>
