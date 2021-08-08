<template>
    <component :is="field.displayType" :field="field" />
</template>

<script>
import FieldMixin from '@mixins/FieldMixin';

import Checkboxes from '@components/inputs/Checkboxes.vue';
import Dropdown from '@components/inputs/Dropdown.vue';
import Hidden from '@components/inputs/Hidden.vue';
import Radio from '@components/inputs/Radio.vue';

export default {
    components: {
        Checkboxes,
        Dropdown,
        Hidden,
        Radio,
    },

    mixins: [FieldMixin],
};

</script>
