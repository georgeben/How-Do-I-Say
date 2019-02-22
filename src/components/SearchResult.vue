<template>
    <v-list subheader>
          <v-subheader>Recent search. Swipe left to delete</v-subheader>
          <v-list-tile
            v-for="(item, index) in history" :key="index"
            class="pt-2"
          >
            <v-list-tile-content>
              <v-list-tile-title v-html="item.text"></v-list-tile-title>
              <v-list-tile-title v-html="item.translation" class="cyan--text"></v-list-tile-title>
            </v-list-tile-content>

            <v-list-tile-action>
              <v-icon color="cyan" @click="showState">close</v-icon>
            </v-list-tile-action>
          </v-list-tile>
        </v-list>
</template>

<script>
  export default {
    name: 'search-result',
    data () {
      return {
        history: this.$store.state.recentSearches,
        items: [
          { title: 'Jason Oner' },
          { title: 'Ranee Carlson'},
          { title: 'Cindy Baker', },
          { title: 'Ali Connors',}
        ],
      }
    },
    methods: {
        showState(){
            console.log(this.history)
        }
    }
  }
</script>
