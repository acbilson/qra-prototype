<template>
  <div class="qra-actions">
      <template v-for="(action, index) in actions">
          <div class="qra-action" :key="index">
            <div class="qra-action-top">
              <div>{{ action.action }}</div>
              <div><span class="assess" :style="getAssessStyle(action.assess)">{{ action.assess }}</span></div>
            </div>
            <div class="qra-action-mid">
              <div><label>Review Period:</label> {{ action.review_period }}</div>
              <div><label>Review Date:</label> {{ action.review_date }}</div>
              <div><label>Next Review Date:</label> {{ action.next_review_date }}</div>
            </div>
            <div><label>Comments:</label> {{ action.comments }}</div>
          </div>
      </template>
  </div>
</template>

<script>
export default {
  name: "QRAActions",
  props: {
    actions: [],
  },
  methods: {
    getAssessStyle(assess) {
      let style = '';
      switch (assess) {
        case 'ST':
          style = 'background-color: green; color: yellow;';
          break;

        case 'SA':
          style = 'background-color: yellow; color: black;';
          break;

        case 'NI':
          style = 'background-color: red; color: black;';
          break;
      
        default:
          style = '';
          break;
      }
      return style;
    }
  }
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

 div.qra-action>div {
   margin-top: 0.5%;
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
   justify-content: left;
   margin-bottom: 1%;
 }

 div.qra-action-mid>div {
   margin-right: 5%;
 }
 
 label {
   font-weight: bold;
 }

 span.assess {
  width: 100px;
  font-size: 16px;
  padding: 10%;
  border-radius: 50%;
 }
</style>
