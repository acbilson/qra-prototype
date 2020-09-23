<template>
  <div class="qra-table">
    <div class="title">
      <h1>Risk Model Composite</h1>
    </div>
    <div class="body">
      <table class="qra">
        <th>Requirement Source Label</th>
        <th>Requirement</th>
        <th>Action Item</th>
        <th>Review Period</th>
        <th>Review Date</th>
        <th>Assess</th>
        <th>Score</th>
        <th>Next Review Date</th>
        <th>Comments</th>
        <template v-for="(record, index) in records">
          <tr :key="index" :class="record.record_type">
            <td>{{ record.label }}</td>
            <template v-if="record.record_type === 'section'">
            <td colspan="2">{{ record.requirement }}</td>
            </template>
            <template v-else>
            <td>{{ record.requirement }}</td>
            <td>{{ record.action }}</td>
            </template>
            <td>{{ record.review_period }}</td>
            <td>{{ record.review_date }}</td>
            <td>{{ record.assess }}</td>
            <td>{{ record.score }}</td>
            <td>{{ record.next_review_date }}</td>
            <td>{{ record.comments }}</td>
          </tr>
        </template>
      </table>
    </div>
  </div>
</template>

<script>
import data from '../../assets/data.json';

export default {
  name: 'QRAComposite',
  data() {
    return {
      records: data.data
    }
  },
  props: {
    title: String,
  },
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

div.title {
  margin-left: 1%;
}

div.body {
  font-size: 10px;
  margin: 1%;
  text-align: left;
}

table.qra {
  background-color: white;
  overflow-x: auto;
}

table.qra td, table.qra th {
  border: 1px solid #ddd;
  padding: 8px;
}

tr.section {
  background-color: #ddd;
}


</style>
