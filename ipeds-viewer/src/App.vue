<template>
  <div id="app">
    <div class="wrapper">
      <nav class="sidebar">
        <ul>
          <li>
            <router-link to="/">National</router-link>
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
  name: 'app'
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
  text-align: center;
  color: #2c3e50;
  height: 100%;
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
  padding: .75rem 0 .75rem 0;
}

.sidebar ul li a {
  color: #fff;
  font-size: 1.25rem;
}
</style>
