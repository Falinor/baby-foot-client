<template>
  <v-layout>
    <v-flex class="text-center">
      <v-img src="/foosballtable.jpg"></v-img>
      <div class="autocomplete">
        <v-autocomplete
          v-model="name"
          autofocus
          filled
          label="Battlemythe name"
        ></v-autocomplete>
        <v-select v-model="team" filled label="Team" :items="teams"></v-select>
        <v-btn color="accent">
          Join
          <span v-if="team">the {{ team }} team</span>
        </v-btn>
      </div>
    </v-flex>
  </v-layout>
</template>

<script>
export default {
  data: () => ({
    name: null,
    team: 'red',
    isValid: false,
    teams: [
      { text: 'Red', value: 'red' },
      { text: 'Blue', value: 'blue' },
    ],
  }),
  created() {},
}
</script>

<style>
.autocomplete {
  margin: 16px 0;
}
</style>
