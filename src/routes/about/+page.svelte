<script>
	import Heading from "$lib/heading.svelte";

	import { env } from "$env/dynamic/public";
	export const LOC = "Stewards Pooi Kei College, 56 Siu Lek Yuen Road, Sha Tin"
</script>

<!-- Hero text about page and image -->
<div class="hero min-h-[35vh] place-items-start mb-4" id="about-hero">
    <div class="hero-overlay" />
    <div class="hero-content text-left text-neutral-content justify-self-start self-end">
        <div class="pl-10">
            <!-- I wish I knew how to make this less hacky -->
            <h1 class="text-5xl font-bold">About Us</h1>
            <p class="py-4">Useful information about the school and the event.</p>
        </div>
    </div>
</div>

<div class="max-w-full mx-24">
	<!-- Section 1: School location -->
	<div class="mb-5">
		<Heading id="location" level={2}>School Location</Heading>
		<iframe
			loading="lazy"
			referrerpolicy="no-referrer-when-downgrade"
			title="GMaps embed for the location of SPKC."
			src="https://www.google.com/maps/embed/v1/place?key={env.PUBLIC_GCP_API_KEY}&q={encodeURI(LOC)}"
			class="border-none w-full min-h-[25em]"
		/>
	</div>

	<!-- TODO: Section x: Contact form -->
	<!-- Requires server, will need to modify deployment code later. -->
	<div class="mb-5">
		<Heading id="contact" level={2}>Contact Us</Heading>
		<p>

		</p>
	</div>
</div>


<style lang="scss">
    #about-hero {
        background-image: url('https://www.spkc.edu.hk/wp-content/uploads/2019/09/123-1024x348.jpg');
        background-position: center;
    }
</style>
