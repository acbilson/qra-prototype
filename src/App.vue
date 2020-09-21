<template>
  <div class="app">
    <div class="sidenav">
      <p>Navigation1</p>
      <p>Navigation2</p>
      <p>Navigation3</p>
      <p>Navigation4</p>
    </div>
    <div class="content">
      <div class="header">
        <p>Header1</p>
        <p>Header2</p>
        <p>Header3</p>
      </div>
      <template v-if="style === 'excel'">
        <QRATable :title="title" :records="records"></QRATable>
      </template>
      <template v-else-if="style === 'list'">
        <QRAList :title="title" :records="records"></QRAList>
      </template>
      <div class="footer">
        <p>Footer1</p>
        <p>Footer2</p>
        <p>Footer3</p>
      </div>
    </div>
  </div>
</template>

<script>
import QRATable from "./components/QRATable";
import QRAList from "./components/QRAList";

export default {
  name: "App",
  components: { QRATable, QRAList },
  data() {
    return {
      style: "excel",
      title: "Qualitative Risk Analysis",
      records: [],
    };
  },
  // TODO: put this back into QRATable so I can pass a different
  //       set with an array of actions per requirement for QRAList
  created() {
    this.records = [
      {
        record_type: "section",
        label: "POLICY",
        requirement:
          "Capital policies and strategic plans are comprehensive and consistent with the bank's overall risk appetite and complexity of operations. The impact of reversing or modifying strategic decisions is fully assessed as part of the planning process.",
        action: "",
        review_period: "",
        review_date: "",
        assess: "",
        score: "-1",
        next_review_date: "",
        comments: "",
      },
      {
        record_type: "row",
        label: "RASL-1",
        requirement: "Adequacy of strategic and succession planning processes.",
        action:
          "The Board of Directors and Executive Management conduct an annual strategic planning session.",
        review_period: "Annual",
        review_date: "10/10/2020",
        assess: "NI",
        score: "",
        next_review_date: "",
        comments: "These are some comments that I'm making here",
      },
      {
        record_type: "row",
        label: "RASL-2",
        requirement: "Board oversight of and engagement on strategic initiatives.",
        action:
          "A written strategic plan is developed annually that considers risk appetite, future growth parameters, income expectation, the impact of stress events, minimum capital requirements, and access to capital sources.",
        review_period: "Annual",
        review_date: "3/10/2019",
        assess: "ST",
        score: "",
        next_review_date: "",
        comments: "",
      },
      {
        record_type: "row",
        label: "RASL-2",
        requirement: "Board oversight of and engagement on strategic initiatives.",
        action:
          "A written capital policy is reviewed annually that considers strategic direction, capital adequacy goals, contingency planning, and ongoing oversight of goals.",
        review_period: "Annual",
        review_date: "10/02/2020",
        assess: "SA",
        score: "",
        next_review_date: "11/01/2021",
        comments: "",
      },
      {
        record_type: "row",
        label: "RASL-2",
        requirement: "Board oversight of and engagement on strategic initiatives.",
        action:
          "Strategic and capital plans provide delegation of responsibilities for board/ management/committees to carry out defined objectives.",
        review_period: "Annual",
        review_date: "4/13/2019",
        assess: "NI",
        score: "",
        next_review_date: "",
        comments: "",
      },

      {
        record_type: "section",
        label: "PROCESS",
        requirement:
          "Management and the board have a well-defined planning process. Initiatives are supported by sound due diligence and effective risk management systems, which are an integral part of strategic planning. MIS effectively support strategic direction and initiatives. Management is aware of and effectively incorporates technology management into strategic plans.",
        action: "",
        review_period: "",
        review_date: "",
        assess: "",
        score: "1",
        next_review_date: "",
        comments: "",
      },
      {
        record_type: "row",
        label: "RASL-4",
        requirement:
          "Priority and compatibility of personnel, technology, and capital resources allocation with strategic initiatives.",
        action:
          "A system for documenting strategic resource needs from a personnel, infrastructure, and technology standpoint has been developed and is reviewed at least annually.",
        review_period: "Annual",
        review_date: "",
        assess: "",
        score: "",
        next_review_date: "",
        comments: "",
      },
      {
        record_type: "row",
        label: "RASL-5",
        requirement:
          "A system for documenting strategic resource needs from a personnel, infrastructure, and technology standpoint has been developed and is reviewed at least annually.",
        action:
          "A system for communicating strategic objectives throughout the organization has been established and is reviewed at least annually.",
        review_period: "Annual",
        review_date: "",
        assess: "",
        score: "",
        next_review_date: "",
        comments: "I've got some more comments to make here. A lot more than I sometimes have. Yes, very many.",
      },
      {
        record_type: "row",
        label: "RASL-6",
        requirement:
          "Past performance in offering new, modified, or expanded products or services, managing third-party relationships, and evaluating potential and consummated acquisitions or divestitures",
        action:
          "A process has been established to ensure that new and/or expanded products and services are properly vetted for feasibility and profitability.",
        review_period: "Ongoing",
        review_date: "",
        assess: "",
        score: "",
        next_review_date: "",
        comments: "",
      },
    ];
  },
};
</script>

<style>
div.app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  display: flex;
  flex-flow: row nowrap;
}

div.sidenav {
  background-color: grey;
  width: 15%;
  padding-left: 1%;
  display: flex;
  flex-flow: column nowrap;
}

div.content {
  background-color: lightgrey;
  width: 85%;
  display: flex;
  flex-flow: column nowrap;
}

div.header {
  margin: 1%;
  background-color: white;
  display: flex;
  flex-flow: row wrap;
  justify-content: space-evenly;
}

div.footer {
  margin: 1%;
  background-color: white;
  display: flex;
  flex-flow: row wrap;
  justify-content: space-evenly;
}

div.title {
  margin: 1%;
}
</style>
