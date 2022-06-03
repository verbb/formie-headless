<template>
    <div v-if="canInclude" v-show="canShow" class="w-full flex-1 mb-5" v-bind="attrs" :data-field-conditions="field.conditions">
        <component :is="field.displayName" :field="field" />
    </div>
</template>

<script>
import { attributesTable } from '@utils/helpers';

import AllInputs from '@components/inputs';

// Import separately, as they can't be nested
import Group from '@components/inputs/Group.vue';
import Repeater from '@components/inputs/Repeater.vue';

export default {
    components: {
        ...AllInputs,
        Group,
        Repeater,
    },

    props: {
        field: {
            type: Object,
            default: () => {},
        },
    },

    computed: {
        canInclude() {
            return this.field.visibility !== 'disabled';
        },

        canShow() {
            return this.field.visibility !== 'hidden' && this.field.displayName !== 'Hidden';
        },

        attrs() {
            return {
                class: this.field.cssClasses,
                ...attributesTable(this.field.containerAttributes),
            };
        },
    },
};

</script>
