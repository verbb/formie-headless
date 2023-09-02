import { createApp } from "vue";
import { ApolloClient, InMemoryCache } from "@apollo/client/core";
import { createApolloProvider } from "@vue/apollo-option";

import App from "@components/App.vue";

import "@/css/style.css";

const app = createApp(App);

// Create the apollo client
const apolloProvider = createApolloProvider({
  defaultClient: new ApolloClient({
    uri: import.meta.env.VITE_GQL_URL,
    cache: new InMemoryCache(),
  }),
});

app.use(apolloProvider);

app.mount("#app");
