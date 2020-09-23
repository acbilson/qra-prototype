<template>
  <div class="qra-actions">
    <template v-for="(action, index) in actions">
      <div :style="action.show ? '' : 'display: none;' " class="qra-action" :key="index">
        <div :style="getAssessStyle(action.assess)" class="qra-action-top">
          <div class="assess">
            <select name="assess" v-model="action.assess">
              <option
                v-for="val in assessments"
                :selected="val == action.assess ? true : false"
                :key="val"
              >{{val}}</option>
            </select>
          </div>
          <div v-if="!action.edit">
            <div>{{ action.action.text }}</div>
          </div>
          <div style="display: contents;" v-else>
            <textarea style="width: 70%;" v-model="action.action.text" />
          </div>
          <div style="margin-left: 1%;">
            <button :id="index" @click="minimizeAction(label, index)">_</button>
            <button v-if="action.edit" :id="index" @click="removeAction(label, index)">X</button>
          </div>
        </div>
        <div class="qra-action-mid">
          <div>
            <label>Review Period:</label>
            <select name="review_period" v-model="action.review_period">
              <option
                v-for="period in periods"
                :selected="period == action.review_period ? true : false"
                :key="period"
              >{{period}}</option>
            </select>
          </div>
          <div>
            <label>Review Date:</label>
            <input
              type="date"
              :value="parseDate(action.review_date)"
              @change="onReviewDateChange(label, index, $event.target.valueAsDate)"
            />
          </div>
          <div>
            <label>Next Review Date:</label>
            <input
              type="date"
              :value="parseDate(action.next_review_date)"
              @input="myDate = $event.target.valueAsDate"
            />
          </div>
        </div>
        <div>
          <label>Comments:</label>
          <br />
          <textarea v-model="action.comments"></textarea>
        </div>
      </div>
    </template>
  </div>
</template>

<script>
export default {
  name: "QRAActions",
  data() {
    return {
      periods: ["Annual", "Quarterly"],
      assessments: ["ST", "SA", "NI"],
    };
  },
  props: {
    label: String,
    actions: Array,
  },
  methods: {
    getAssessStyle(assess) {
      let style = "";
      switch (assess) {
        case "ST":
          style = "border-top: 6px #5a7f38 solid";
          break;

        case "SA":
          style = "border-top: 6px #e3a224 solid;";
          break;

        case "NI":
          style = "border-top: 6px #b52025 solid;";
          break;

        default:
          style = "";
          break;
      }
      return style;
    },
    parseDate(date) {
      if (!date) {
        return date;
      }
      return new Date(date).toISOString().split("T")[0];
    },
    removeAction(label, index) {
      this.$emit("remove", { label, index });
    },
    minimizeAction(label, index) {
      this.$emit("minimize", { label, index });
    },
    onReviewDateChange(label, index, date) {
      this.$emit("plan", {label, index, date});
    }
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
div.qra-actions {
  display: flex;
  flex-flow: column nowrap;
  justify-content: space-between;
}

div.qra-action {
  margin-top: 1%;
  padding: 2%;
  border: 1px black solid;
  background-color: white;
  border-radius: 25px;
  box-shadow: 3px 3px 5px grey;
}

div.qra-action > div {
  padding-top: 1%;
}

div.qra-action-top {
  display: flex;
  flex-flow: row nowrap;
  justify-content: space-between;
  margin-bottom: 1%;
}

div.qra-action-mid {
  display: flex;
  flex-flow: row nowrap;
  margin-bottom: 1%;
}

label {
  font-weight: bold;
  margin-right: 5px;
  margin-left: 5px;
}

div.assess {
  margin-right: 1%;
}

textarea {
  width: 100%;
}
</style>
