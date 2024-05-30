<script>
import qs from "qs";

import FormieForm from "@components/FormieForm.vue";

export default {
  components: {
    FormieForm,
  },

  data() {
    return {
      // Set the default form via its handle as an .env variable
      formHandle: import.meta.env.VITE_DEFAULT_FORM,
    };
  },

  created() {
    // Allow a `?form=handle` query param to be passed in, to quickly preview different forms
    if (location.search.length) {
      const queryString = qs.parse(location.search, {
        ignoreQueryPrefix: true,
      });

      if (queryString && queryString.form) {
        this.formHandle = queryString.form;
      }
    }
  },
};
</script>

<template>
  <div class="container">
    <div class="flex items-center justify-center p-4 sm:p-10">
      <img class="w-10 h-10" alt="Formie logo" src="@/assets/formie-logo.svg" />
    </div>

    <FormieForm :handle="formHandle" class="w-full lg:w-9/12 mx-auto" />

    <div class="flex items-center justify-center p-4 sm:p-10">
      <a href="http://verbb.io/craft-plugins/formie" target="_blank">
        <img
          class="w-24 h-10"
          alt="Made by Verbb"
          src="@/assets/verbb-logo.svg"
        />
      </a>
    </div>
  </div>
</template>
