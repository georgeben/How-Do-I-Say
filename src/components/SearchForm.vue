<template>
  <v-form v-model="valid">
    <v-container grid-list-md>
      <v-layout wrap>
        <v-flex xs12 md4>
          <v-text-field
            v-model="textToTranslate"
            :rules="nameRules"
            label="Enter word to translate"
            clearable
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
          {text: 'Greek', value: 'el'},
          {text: 'Azerbaijan', value: 'az'},
          {text: 'Albanian', value: 'sq'},
          {text: 'English', value: 'en'},
          {text: 'Arabic', value: 'ar'},
          {text: 'Afrikaans', value: 'af'},
          {text: 'Bulgarian', value: 'bg'},
          {text: 'Dutch', value: 'nl'},
          {text: 'Danish', value: 'da'},
          {text: 'Hebrew', value: 'he'},
          {text: 'Indonesian', value: 'id'},
          {text: 'Italian', value: 'it'},
          {text: 'Spanish', value: 'es'},
          {text: 'Chinese', value: 'zh'},
          {text: 'Korean', value: 'ko'},
          {text: 'Latin', value: 'la'},
          {text: 'French', value: 'fr'},
          {text: 'Portuguese', value: 'pt'},
          {text: 'German', value: 'de'},
      ],
      showLoading: false
    }),
    methods: {
        translateText(){
            if(this.valid){
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
