<script lang="ts">
    export let width: String;
    export let height: String;
</script>

<div style="width: {width}; height: {height}">
    <svg width="100%" height="100%" viewBox="0 0 100 100" preserveAspectRatio="none">
        <polygon points="0,0 100,100 0,100 100,0 100,100 0,100 0,0 100,0" />
        Sorry, your browser does not support inline SVG.
    </svg>
</div>

<style>
    div {
        position: relative;
        background-color: #c1c1c1;
    }

    svg {
        fill: none;
        stroke: darkgray;
        stroke-width: 3;
    }
</style>
