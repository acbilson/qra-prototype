<template>
  <div class="section">
    <div>{{ record.label }}</div>
    <div>{{ record.requirement }}</div>
    <div class="score" :style="getScoreStyle(record.score)">{{ record.score }}</div>
  </div>
</template>

<script>
export default {
  name: "QRASection",
  props: {
    record: {},
  },
  methods: {
    getScoreStyle(score) {
      const myScore = parseInt(score, 10);
      if (myScore > 0) {
        return "background-color: red";
      } else if (myScore < 0) {
        return "background-color: green";
      }
      return "background-color: orange";
    },
  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
div.section {
  margin-top: 1%;
  background-color: #ddd;
  border: 1px grey solid;
  border-radius: 25px;
  padding: 5px;
  display: flex;
  flex-flow: row nowrap;
  justify-content: space-evenly;
  box-shadow: 3px 3px 5px grey;
}

div.section > div {
  margin: 1%;
}

div.score {
  font-size: 20px;
  border: 2px black solid;
  border-radius: 50%;
  color: white;
  height: 20px;
  width: 20px;
  text-align: center;
}
</style>
