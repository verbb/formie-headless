# Formie Headless Demo
This is a demo of a GraphQL, headless project using [Craft CMS](https://craftcms.com), [Vue.js 3.0](https://vuejs.org/) and [Formie](https://verbb.io/craft-plugins/formie). This repository comes in two parts, the Craft CMS install and the front-end headless project. 

<img width="500" src="https://verbb.io/screenshot.png">

## Project summary
We're using Vue for our front-end, but the techniques employed here can be utilised on any number of GraphQL setups.

- [Vite.js](https://vitejs.dev/) is used for the build system as per [Vite.js Next Generation Frontend Tooling + Craft CMS](https://nystudio107.com/blog/using-vite-js-next-generation-frontend-tooling-with-craft-cms)
* [Vue.js 3.0](https://vuejs.org/) is used for the interactive bits.
* [Tailwind CSS](https://tailwindcss.com/).
* [ESlint](https://eslint.org/) to keep JS lookin' good!
* [Vue Apollo](https://apollo.vuejs.org/) Easy GraphQL handling using Apollo for queries and mutations.
* [Pristine.js](https://pristine.js.org/) Simple form validation.

## Setting up Craft
This repository contains the Craft CMS project files in the main root folder. Little to no changes have been made from the [craftcms/craft](https://github.com/craftcms/craft) project.

- Run `composer install` at the root of this project.
- Ensure you setup your `.env` file as you normally would.
- Point your favourite local server virtual host to the `web` directory.
- We'll assume you'll set it up with the domain `http://formie-headless.test` - but this can be anything you like.

We've also included a `database.sql` you can use to get things off the a great start. It comes pre-configured with a few forms, fields, and other mock data like entries, etc. GraphQL will also be setup.

The CP login credentials are initially set as follows:

Login: `formie` \
Password: `formie`

You can also use your own Craft install - this is a headless demo after all! You'll just want to ensure Formie and Craft are enabled for GraphQL querying and mutations.

## Setting up Vite
The front-end Vite project is contained in `frontend`. The two projects are completely detatched (headless), but kept in the single repository for ease. Vite provides a super-fast dev server for local development. We've intentionally kept the demo as minimal as possible, but it's a full-featured implementation of Formie functionality.

### `.env` file
There's two env settings you'll need to configure.

```
VITE_GQL_URL="http://formie-headless.test/api"
```

This is the full URL to your GraphQL endpoint. We'll use this to query forms and run mutations on submissions.

```
VITE_DEFAULT_FORM="contactForm"
```

The handle of the form you would like to show. You can also pass in a query param `http://localhost:3000/?form=formHandle` to spin up an example of any form.

### Dev server
- Open a terminal and navigate to `frontend`, then run `npm install`.
- Start up the Vite dev server by typing `npm run dev`.
- Navigate to `http://localhost:3000` to see the demo.

You should see the "Contact Form"!

### GraphQL queries
Formie supports querying forms via [GraphQL queries](https://verbb.io/craft-plugins/formie/docs/developers/graphql), including form settings, pages, and of course fields. From this endpoint, you cna fetch everything you need about a form for rendering it in your app.

Have a look at the [graphql/forms.js](https://github.com/verbb/formie-headless/frontend/src/graphql/forms.js) file, which contains the GraphQL query we use. We've split each field into a GraphQL fragment to easily re-use.

We then use Apollo to [fetch the data]() from this query, given a handle for the form.

### GraphQL mutations
Formie supports creating submissions via [GraphQL mutations](https://verbb.io/craft-plugins/formie/docs/developers/graphql). A mutation looks something like:

```
// Query
mutation saveSubmission($yourName: String) {
    save_contactForm_Submission(yourName: $yourName) {
        id
    }
}

// Query Variables
{
    "yourName": "Peter Sherman"
}
```

Here, you define the query which includes all field you want to create content for, and importantly their type. As such, this acts like a schema for the data you want to send. This also needs to be tailored to the handle you're using - `contactForm` in this case. Then, you'll want to supply variables which contain the content.

While the above example seems simple, things quickly get complicated for large forms, or where you want clients to be able to create their own forms (rightly so!). You'd then need to setup a schema for every field you want to use.

To address this, we can use the data fetched for each field in our query to construct this schema string completely dynamically, using a few helper function. Have a look at the [utils/mutations.js](https://github.com/verbb/formie-headless/frontend/src/utils/mutations.js) file for how we construct this. The `getFormMutation()` will return the schema above, setup and ready to go - given a form object (received from the GraphQL query).


<h2></h2>

<a href="https://verbb.io" target="_blank">
  <img width="100" src="https://verbb.io/assets/img/verbb-pill.svg">
</a>
