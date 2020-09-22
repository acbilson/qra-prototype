<template>
  <div class="qra-list">
    <div class="title">
      <h1>{{ this.title }}</h1>
    </div>
    <div class="body">
      <template v-for="(record, index) in records">
        <template v-if="record.record_type === 'section'">
          <QRASection :record="record" :key="index" />
        </template>
        <template v-else>
          <div :class="record.record_type" :key="index">
            <div class="row-head">
              <div style="width: 100px">{{ record.label }}</div>
              <div>{{ record.requirement }}</div>
            </div>
          </div>
          <QRAActions :actions="record.actions" :key="index"> </QRAActions>
        <div class="buttons" :key="index">
          <button :id="record.label" type="button" v-on:click="addAction">Add Action</button>
        </div>
        </template>
      </template>
    </div>
  </div>
</template>

<script>

import QRAActions from './QRAActions';
import QRASection from './QRASection';

export default {
  name: "QRAList",
  components: { QRAActions, QRASection },
  props: {
    title: String,
    records: [],
  },
  methods: {
    addAction(event) {
      const actionsDiv = event.target.parentNode.previousSibling;
      const latestAction = actionsDiv.lastChild.cloneNode(true);
      latestAction.firstChild.firstChild.innerHTML = "Enter New Action";
      actionsDiv.lastChild.insertAdjacentElement('afterend', latestAction);
    }
  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
div.body {
  font-size: 12px;
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

div.row {
  font-size: 14px;
  margin-top: 1%;
  background-color: white;
  border: 1px lightgrey solid;
  border-radius: 25px;
  padding: 5px;
  display: flex;
  flex-flow: column nowrap;
  justify-content: space-evenly;
  box-shadow: 3px 3px 5px grey;
}

div.row > div {
  margin: 1%;
}

div.row-head {
  display: flex;
  flex-flow: row nowrap;
  justify-content: space-between;
}

div.buttons {
  display: flex;
  flex-flow: row nowrap;
  justify-content: flex-end;
  margin: 1%;
}
</style>
