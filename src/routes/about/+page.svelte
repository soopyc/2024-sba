<script>
	import { PUBLIC_GCP_API_KEY } from "$env/static/public";
	export const LOC = "Stewards Pooi Kei College, 56 Siu Lek Yuen Road, Sha Tin"
</script>

<!-- Hero text about page and image -->
<div class="hero min-h-[40vh] place-items-start mb-4" id="about-hero">
    <div class="hero-overlay" />
    <div class="hero-content text-left text-neutral-content justify-self-start self-end">
        <div class="pl-10">
            <!-- I wish I knew how to make this less hacky -->
            <h1 class="text-5xl font-bold">About Us</h1>
            <p class="py-4">Useful information about the school and the event.</p>
        </div>
    </div>
</div>

<!-- Section 1: School location -->

<div class="max-w-screen-xl mx-auto">
	<div>
		<h2 class="text-3xl md-2">School Location</h2>
		<iframe
			loading="lazy"
			referrerpolicy="no-referrer-when-downgrade"
			title="GMaps embed for the location of SPKC."
			src="https://www.google.com/maps/embed/v1/place?key={PUBLIC_GCP_API_KEY}&q={encodeURI(LOC)}"
			class="border-none w-full min-h-[25em]"
		/>
	</div>

    Lorem ipsum dolor sit amet.

    Culpa id esse ex nulla proident consectetur id culpa consectetur ut excepteur. Aliquip elit voluptate sint occaecat
    dolor ipsum velit do mollit in. Amet Lorem sit est non. In laboris cupidatat cillum anim amet qui sint consequat
    officia tempor quis esse occaecat. Aliqua adipisicing irure ipsum ad nulla ullamco commodo dolor ut mollit. Minim ea
    nostrud pariatur labore sunt nulla Lorem. Irure culpa laboris ullamco reprehenderit ex aliquip. Proident incididunt
    eu commodo voluptate sit laboris et laboris exercitation tempor labore mollit quis exercitation. Fugiat minim Lorem
    qui amet proident reprehenderit voluptate elit magna aliqua officia. Proident sit in culpa non cupidatat sint
    adipisicing anim minim occaecat sunt ullamco aliquip.
</div>

<!-- TODO: Section x: Contact form -->
<!-- Requires server, will need to modify deployment code later. -->

<style lang="scss">
    #about-hero {
        background-image: url('https://www.spkc.edu.hk/wp-content/uploads/2019/09/123-1024x348.jpg');
        background-position: center;
    }
</style>
