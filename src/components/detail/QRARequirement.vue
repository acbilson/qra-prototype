<template>
  <div class="requirement">
    <div style="width: 100px">{{ record.label }}</div>
    <div>{{ record.requirement }}</div>
    <div class="buttons">
      <div><button @click="minimizeActions(record.label)">_</button></div>
      <div><button @click="toggleActions(record.label)">...</button></div>
      <div><button @click="addActions(record.label)">+</button></div>
      <div v-if="record.edit"><button @click="removeRequirement(record.label)">X</button></div>
    </div>
  </div>
</template>

<script>
export default {
  name: "QRARequirement",
  props: {
    record: {},
  },
  methods: {
    toggleActions(label) {
      this.$emit('toggle', label);
    },
    minimizeActions(label) {
      this.$emit('minimize', label);
    },
    addActions(label) {
      this.$emit('add', label);
    },
    removeRequirement(label) {
      this.$emit('remove', label);
    }
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

div.buttons {
  display: flex;
  flex-flow: row nowrap;
}
</style>
