<template>
  <v-form v-model="valid">
    <v-container grid-list-md>
      <v-layout wrap>
        <v-flex xs12 md4>
          <v-text-field
            v-model="wordToTranslate"
            :rules="nameRules"
            label="Enter word to translate"
            required
          ></v-text-field>
        </v-flex>
        <v-flex xs12 md4>
            <v-select
            v-model="language"
            :items="languageOptions"
            label="Language"
            ></v-select>
        </v-flex>
        <v-flex xs12 md4>
            <v-btn class="cyan white--text" depressed block large :loading="loadingTranslation">Translate</v-btn>
        </v-flex>
      </v-layout>
    </v-container>
  </v-form>
</template>

<script>
  export default {
    data: () => ({
      valid: false,
      wordToTranslate: '',
      language:'',
      nameRules: [
        v => !!v || 'Please enter a word to translate'
      ],
      languageOptions: [
          {text: 'Russian', value: 'ru'},
          {text: 'Greek', value: 'el'}
      ],
      loadingTranslation: false
    })
  }
</script>
