<template>
  <div class="qra-list">
    <div class="title">
      <h1>{{ this.title }}</h1>
    </div>
    <div class="body">
      <template v-for="(record, index) in records">
        <template v-if="record.record_type === 'section'">
          <div :class="record.record_type" :key="index">
            <div>{{ record.label }}</div>
            <div>{{ record.requirement }}</div>
            <div class="score" :style="getScoreStyle(record.score)">{{ record.score }}</div>
          </div>
        </template>
        <template v-else>
          <div :class="record.record_type" :key="index">
            <div class="row-head">
              <div style="width: 100px">{{ record.label }}</div>
              <div>{{ record.requirement }}</div>
            </div>
            <div>{{ record.action }}</div>
            <div>{{ record.review_period }}</div>
            <div>{{ record.review_date }}</div>
            <div>{{ record.assess }}</div>
            <div>{{ record.score }}</div>
            <div>{{ record.next_review_date }}</div>
            <div>{{ record.comments }}</div>
          </div>
        </template>
      </template>
    </div>
  </div>
</template>

<script>
export default {
  name: "QRAList",
  props: {
    title: String,
    records: [],
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
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
div.body {
  font-size: 10px;
  margin: 1%;
  text-align: left;
}

table.qra {
  background-color: white;
  overflow-x: auto;
}

table.qra td,
table.qra th {
  border: 1px solid #ddd;
  padding: 8px;
}

div.section {
  background-color: #ddd;
  border: 2px grey solid;
  border-radius: 25px;
  padding: 5px;
  display: flex;
  flex-flow: row nowrap;
  justify-content: space-evenly;
}

div.section > div {
  margin: 1%;
}

div.row {
  background-color: white;
  border: 1px lightgrey solid;
  border-radius: 25px;
  padding: 5px;
  display: flex;
  flex-flow: column nowrap;
  justify-content: space-evenly;
}

div.row > div {
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

div.row-head {
  display: flex;
  flex-flow: row nowrap;
  justify-content: space-between;
}
</style>
