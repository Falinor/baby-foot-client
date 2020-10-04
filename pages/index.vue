<template>
  <v-layout>
    <v-flex class="text-center">
      <v-img src="/foosballtable.jpg"></v-img>
      <div class="autocomplete">
        <v-autocomplete
          v-model="name"
          autofocus
          filled
          :items="players"
          label="Battlemythe name"
        ></v-autocomplete>
        <v-select v-model="team" filled label="Team" :items="teams"></v-select>
        <v-btn color="accent" :disabled="isLoading" @click="submit">
          Join
          <span v-if="team">the {{ team }} team</span>
        </v-btn>
      </div>
    </v-flex>
  </v-layout>
</template>

<script>
import { matchService } from '@/services'

export default {
  data: () => ({
    name: null,
    team: 'red',
    isLoading: false,
    players: null,
    teams: [
      { text: 'Red', value: 'red' },
      { text: 'Blue', value: 'blue' },
    ],
  }),
  mounted() {
    // TODO: replace this by a real call
    this.players = ['P1', 'P2', 'P3', 'P4'].map((p) => ({
      text: p,
      value: p,
    }))
  },
  methods: {
    async submit() {
      console.info(`Joining ${this.team} team`)
      await matchService.joinMatch(this.team)
      console.info(`Joined ${this.team} team`)
    },
  },
}
</script>

<style>
.autocomplete {
  margin: 16px 0;
}
</style>
