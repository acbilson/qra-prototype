<template>
  <div class="qra-list">
    <div class="title">
      <h1>Qualitative Risk Capital Details</h1>
    </div>
    <div class="body">
      <template v-for="(record, index) in records">
        <template v-if="record.record_type === 'section'">
          <QRASection @add="addRequirement($event)" :record="record" :key="record.label" />
        </template>
        <template v-else>
          <QRARequirement
            @toggle="toggleActions($event)"
            @minimize="minimizeActions($event)"
            @add="addAction($event)"
            @remove="removeRequirement($event)"
            :record="record"
            :key="index"
          ></QRARequirement>
          <QRAActions
            :actions="record.actions"
            :label="record.label"
            :key="record.label+'_'+index"
            @plan="setNextReviewDate($event)"
            @remove="removeAction($event)"
            @minimize="minimizeAction($event)"
          ></QRAActions>
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
      currentRequirementIndex: 1
    };
  },
  methods: {
    addRequirement(label) {

      const defaultRequirement = {
        show: true,
        edit: true,
        id: this.currentRequirementIndex,
        record_type: "row",
        label: label+'-'+this.currentRequirementIndex,
        requirement: "This is a new requirement",
        score: "",
        actions: []
      };

      const selectedRecordIndex = this.records.findIndex((r) => r.label == label);
      this.records.splice(selectedRecordIndex+1, 0, defaultRequirement);
      this.currentRequirementIndex++;
    },
    removeRequirement(label) {
      const selectedRecordIndex = this.records.findIndex((r) => r.label == label);
      this.records.splice(selectedRecordIndex, 1);
    },
    addAction(label) {
      const defaultAction = {
        show: true,
        edit: true,
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
    removeAction(data) {
      const selectedRecord = this.records.find((r) => r.label == data.label);
      selectedRecord.actions.splice(data.index, 1);
    },
    minimizeAction(data) {
      const selectedRecord = this.records.find((r) => r.label == data.label);
      selectedRecord.actions[data.index].show = false;
    },
  minimizeActions(label) {
      const selectedRecord = this.records.find((r) => r.label == label);
      selectedRecord.actions.forEach((r) => {
        r.show = false;
      });
    },
    toggleActions(label) {
      const selectedRecord = this.records.find((r) => r.label == label);
      selectedRecord.actions.forEach((r) => {
        r.show = true;
      });
    },
    setNextReviewDate(data) {
      const date = new Date(data.date);
      const selectedRecord = this.records.find((r) => r.label == data.label);
      selectedRecord.actions[data.index].review_date = date;

      if (selectedRecord.actions[data.index].review_period == "Annual") {
        selectedRecord.actions[data.index].next_review_date = new Date(
          date.getFullYear() + 1,
          date.getMonth(),
          date.getDate() + 1
        );
      } else if (
        selectedRecord.actions[data.index].review_period == "Quarterly"
      ) {
        selectedRecord.actions[data.index].next_review_date = new Date(
          date.getFullYear(),
          date.getMonth() + 3,
          date.getDate() + 1
        );
      }
      selectedRecord.actions[data.index].show = false;
    },
    transformRecords(records) {
      const labels = records.map((r) => r.label);
      const uniqueLabels = [...new Set(labels)];

      const listRecords = uniqueLabels.map((l) => {
        const recordsByLabel = records.filter((r) => r.label == l);

        const first = recordsByLabel[0];

        let recordObj = {
          show: true,
          edit: false,
          id: first.id,
          record_type: first.record_type,
          label: first.label,
          requirement: first.requirement,
          score: first.score,
          actions: [],
        };

        if (recordsByLabel.length > 1) {
          let actions = recordsByLabel.map((rl) => {
            return {
              show: false,
              edit: false,
              action: {
                text: rl.action,
                edit: false,
              },
              review_period: first.review_period,
              review_date: first.review_date,
              assess: first.assess,
              next_review_date: first.next_review_date,
              comments: first.comments,
            };
          });
          recordObj.actions = actions;
        } else if (first.action) {
          recordObj.actions = [
            {
              show: false,
              edit: false,
              action: {
                text: first.action,
                edit: false,
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
div.title {
  margin-left: 1%;
}

div.body {
  font-size: 12px;
  margin: 1%;
  text-align: left;
}
</style>
