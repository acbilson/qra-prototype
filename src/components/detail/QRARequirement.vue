<template>
  <div class="requirement">
    <div style="width: 100px">{{ record.label }}</div>
    <div>{{ record.requirement }}</div>
  </div>
</template>

<script>
export default {
  name: "QRARequirement",
  props: {
    record: {},
  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

div.requirement {
  display: flex;
  flex-flow: row nowrap;
  justify-content: space-between;
  font-size: 14px;
  margin-top: 1%;
  background-color: white;
  border: 1px lightgrey solid;
  border-radius: 25px;
  padding: 5px;
  box-shadow: 3px 3px 5px grey;
}

div.requirement>div {
  margin: 1%;
}
</style>
