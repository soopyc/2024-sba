<script>
    import Fa from 'svelte-fa';
    import { faPhone, faAt } from '@fortawesome/free-solid-svg-icons';
    // import Wireframe from '$lib/wireframe.svelte';
</script>

<footer class="footer bg-accent text-neutral-content p-3 lg:p-5 lg:px-10 lg:text-xl flex items-center justify-around">
    <div class="flex items-center">
        <!-- <img alt="School badge of SPKC" src="/schoolbadge.png" height="50px" width="50px" /> -->
        <p>&copy; Stewards Pooi Kei College 2023</p>
    </div>

		<div class="flex gap-2">
			<!-- <a href="tel:+852-2635-0100"> ????? -->
			<a href="tel:+852-2345-4567" class="flex items-center gap-2">
					<Fa icon={faPhone} />
					<span>2345 4567</span>
			</a>
			<a href="mailto:info@spkc.edu.hk" class="flex items-center gap-2">
					<Fa icon={faAt} />
					<span>info@spkc.edu.hk</span>
			</a>
    </div>
</footer>
