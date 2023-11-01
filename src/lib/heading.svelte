<script lang="ts">
    import { page } from "$app/stores";

	export const sizes = [
		"text-5xl",
		"text-3xl",
		"text-2xl",
		"text-xl",
	];

	export let id: string;
	export let level: number = 1;
	export let active = "text-primary/75";

	if (level < 1 || level >= sizes.length) {
		throw new Error(`level must be of range 1 to ${sizes.length}`)
	}

	$: if ($page.url.hash == `#${id}`) {
		active = "text-warning/75 hover:text-warning"
	} else {
		active = "text-primary/75"
	}

</script>

<!-- if needs arise, use {...$$restProps} in div to set unknown properties -->
<div class="flex {sizes[level - 1]} mb-3 -ml-[1em] gap-2" id={id} role="heading" aria-level={level}>
	<a class="decoration-slate-300 underline transition-colors {active} hover:text-primary" href="#{id}">&sect;</a>
	<slot />
</div>
