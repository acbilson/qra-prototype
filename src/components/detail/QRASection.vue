<template>
  <div :style="getScoreStyle(record.score)" class="section">
    <div>{{ record.label }}</div>
    <div>{{ record.requirement }}</div>
    <div>
      <select name="score" v-model="record.score">
        <option
          v-for="score in scores"
          :selected="score == record.score ? true : false"
          :key="score"
        >{{score}}</option>
      </select>
      <button @click="addRequirement(record.label)">+</button>
    </div>
  </div>
</template>

<script>
export default {
  name: "QRASection",
  data() {
    return {
      scores: ["1", "0", "-1"],
    };
  },
  props: {
    record: {},
  },
  methods: {
    getScoreStyle(score) {
      const myScore = parseInt(score, 10);
      if (myScore > 0) {
        return "border-top: 6px #b52025 solid";
      } else if (myScore < 0) {
        return "border-top: 6px #5a7f38 solid";
      }
      return "border-top: 6px #e3a224 solid";
    },
    addRequirement(label) {
      this.$emit("add", label);
    },
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
div.section {
  font-size: 18px;
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
