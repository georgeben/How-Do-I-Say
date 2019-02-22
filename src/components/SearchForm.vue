<template>
  <v-form v-model="valid">
    <v-container grid-list-md>
      <v-layout wrap>
        <v-flex xs12 md4>
          <v-text-field
            v-model="textToTranslate"
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
            <v-btn class="cyan white--text" depressed block large :loading="showLoading" @click="translateText">Translate</v-btn>
        </v-flex>
      </v-layout>
    </v-container>
  </v-form>
</template>

<script>
import axios from 'axios';
const apiUrl = 'https://translate.yandex.net/api/v1.5/tr.json/translate';
const apiKey = 'trnsl.1.1.20190221T144049Z.883b3d4ed8b6b562.8b58243bd33572951d04ad3da4dbff1674de7426';

  export default {
    data: () => ({
      valid: false,
      textToTranslate: '',
      language:'ru',
      nameRules: [
        v => !!v || 'Please enter a word to translate'
      ],
      languageOptions: [
          {text: 'Russian', value: 'ru'},
          {text: 'Greek', value: 'el'}
      ],
      showLoading: false
    }),
    methods: {
        translateText(){
            if(this.valid){
                console.log("About to translate")
                this.showLoading = true
                axios.get(apiUrl, {
                    params: {
                        key: apiKey,
                        text: this.textToTranslate,
                        lang: this.language
                    }
                })
                .then(res => {
                    this.showLoading = false;
                    let language = this.languageOptions.filter(item => item.value == this.language)
                    console.log("Selected language", language[0].text)
                    this.$store.commit('addSearch',{
                        text: this.textToTranslate,
                        translation: res.data.text[0],
                        language: language[0].text
                    })
                    console.log("Response from yandex", res.data.text)
                })
                .catch(err => {
                    this.showLoading = false
                    console.log("An error occured", err)
                })
            }
        }
    }
  }
</script>
