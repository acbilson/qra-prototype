<template>
  <div class="app">
    <div class="sidenav">
      <p>Navigation1</p>
      <p>Navigation2</p>
      <p>Navigation3</p>
      <p>Navigation4</p>
    </div>
    <div class="content">
      <div class="header">
        <p>Header1</p>
        <p>Header2</p>
        <p>Header3</p>
      </div>
      <QRADemo />
      <div class="footer">
        <p>Footer1</p>
        <p>Footer2</p>
        <p>Footer3</p>
      </div>
    </div>
  </div>
</template>

<script>
import QRADemo from "./components/QRADemo";

export default {
  name: "App",
  components: { QRADemo },
};
</script>

<style>
div.app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  display: flex;
  flex-flow: row nowrap;
}

div.sidenav {
  background-color: #4d4d4d;
  color: white;
  width: 15%;
  padding-left: 1%;
  display: flex;
  flex-flow: column nowrap;
}

div.content {
  background-color: #ebebeb;
  width: 85%;
  display: flex;
  flex-flow: column nowrap;
}

div.header {
  margin: 1%;
  background-color: white;
  display: flex;
  flex-flow: row wrap;
  justify-content: space-evenly;
}

div.footer {
  margin: 1%;
  background-color: white;
  display: flex;
  flex-flow: row wrap;
  justify-content: space-evenly;
}

div.title {
  margin: 1%;
}
</style>
