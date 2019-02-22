<template>
  <div class="home">
    <SearchForm />
    <SearchResult />
    <Footer />
  </div>
</template>

<script>
import SearchForm from '@/components/SearchForm'
import SearchResult from '@/components/SearchResult'
import Footer from '@/components/Footer.vue'
  export default {
    components: {
      SearchForm,
      SearchResult,
      Footer,
    }
  }
</script>
