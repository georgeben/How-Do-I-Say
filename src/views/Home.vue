<template>
  <div class="home">
    <SearchForm />
    <SearchResult />
  </div>
</template>

<script>
import SearchForm from '@/components/SearchForm'
import SearchResult from '@/components/SearchResult'
  export default {
    components: {
      SearchForm,
      SearchResult,
    }
  }
</script>
