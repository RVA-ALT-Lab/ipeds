<template>
  <div id="app">
    <div class="wrapper">
      <nav class="sidebar">
        <ul>
          <li>
            <router-link to="/">Overview</router-link>
          </li>
          <li>
            <router-link to="/national">National</router-link>
          </li>
          <li>
            <router-link to="/state">State</router-link>
          </li>
          <li>
            <router-link to="/school">School</router-link>
          </li>
        </ul>
      </nav>
      <div class="main-view">
            <router-view/>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'app',
  data () {
    return {
      msg: 'National Summary',
      records: [],
      nationalData: []
    }
  },
  created: function () {
    this.getSchoolData()
    this.getNationalData()
  },
  methods: {
    getSchoolData: function () {
      fetch('https://raw.githubusercontent.com/RVA-ALT-Lab/ipeds/master/combined-results.json')
      .then(response => response.json())
      .then(json => {
        this.records = json
        console.log(this.records)
      })
    },
    getNationalData: function () {
      fetch('https://raw.githubusercontent.com/RVA-ALT-Lab/ipeds/master/national-summary.json')
      .then(response => response.json())
      .then(json => {
        this.nationalData = json
        console.log(this.nationalData)
      })
    }
  }

}
</script>

<style>
body, html {
  height: 100%;
}
body {
  margin: 0;
}
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: #2c3e50;
  height: 100%;
}
.main-view {
  padding: 1rem;
}
.wrapper {
  height: 100%;
  display: grid;
  grid-template-columns: 100px 1fr;
}

.sidebar {
  background-color: black;
}

.sidebar ul {
  list-style-type: none;
  padding: 0;
  position: sticky;
  top: 30px;

}

.sidebar ul li {
  position: relative;
  height: 88px;
}

.sidebar ul li a {
  display: inline-block;
  height: 100%;
  width: 100%;
  color: #fff;
  font-size: 1.25rem;
  font-weight: bold;
}

.sidebar ul li a.router-link-exact-active {
  color: black;
  background-color: #fff;
}
</style>
