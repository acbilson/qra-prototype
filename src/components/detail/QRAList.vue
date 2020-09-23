<template>
  <div class="qra-list">
    <div class="title">
      <h1>Qualitative Risk Capital Details</h1>
    </div>
    <div class="body">
      <template v-for="(record, index) in records">
        <template v-if="record.record_type === 'section'">
          <QRASection :record="record" :key="record.label" />
        </template>
        <template v-else>
          <QRARequirement :record="record" :key="index"></QRARequirement>
          <QRAActions :actions="record.actions" :key="record.label+'_'+index"></QRAActions>
          <div class="buttons" :key="record.label">
            <button
              :id="record.label"
              type="button"
              v-on:click="addAction(record.label, $event)"
            >Add Action</button>
          </div>
        </template>
      </template>
    </div>
  </div>
</template>

<script>
import data from "../../assets/data.json";
import QRAActions from "./QRAActions";
import QRARequirement from "./QRARequirement";
import QRASection from "./QRASection";

export default {
  name: "QRAList",
  components: {
    QRAActions,
    QRASection,
    QRARequirement,
  },
  data() {
    return {
      records: data.data,
    };
  },
  methods: {
    addAction(label, event) {
      console.log(label);
      console.log(event.target);

      const defaultAction = {
        record_type: "row",
        label: label,
        requirement: "",
        action: { text: "This is a new action", edit: true },
        review_period: "",
        review_date: "",
        assess: "",
        score: "",
        next_review_date: "",
        comments: "",
      };

      const selectedRecord = this.records.find((r) => r.label == label);
      selectedRecord.actions.push(defaultAction);
    },
    transformRecords(records) {
      const labels = records.map((r) => r.label);
      const uniqueLabels = [...new Set(labels)];

      const listRecords = uniqueLabels.map((l) => {
        const recordsByLabel = records.filter((r) => r.label == l);

        const first = recordsByLabel[0];

        let recordObj = {
          record_type: first.record_type,
          label: first.label,
          requirement: first.requirement,
          score: first.score,
          actions: [],
        };

        if (recordsByLabel.length > 1) {
          let actions = recordsByLabel.map((rl) => {
            return {
              action: {
                text: rl.action,
                edit: false
              },
              review_period: first.review_period,
              review_date: first.review_date,
              assess: first.assess,
              next_review_date: first.next_review_date,
              comments: first.comments,
            };
          });
          recordObj.actions = actions;
        } else {
          recordObj.actions = [
            {
              action: {
                text: first.action,
                edit: false
              },
              review_period: first.review_period,
              review_date: first.review_date,
              assess: first.assess,
              next_review_date: first.next_review_date,
              comments: first.comments,
            },
          ];
        }

        return recordObj;
      });

      return listRecords;
    },
  },
  created() {
    this.records = this.transformRecords(this.records);
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
div.body {
  font-size: 12px;
  margin: 1%;
  text-align: left;
}

div.buttons {
  display: flex;
  flex-flow: row nowrap;
  justify-content: flex-end;
  margin: 1%;
}
</style>
