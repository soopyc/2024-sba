<script>
    import Fa from 'svelte-fa';
    import { faPhone, faAt } from '@fortawesome/free-solid-svg-icons';
    import Wireframe from '$lib/wireframe.svelte';
</script>

<footer class="footer bg-accent text-neutral-content p-3 lg:p-5 lg:px-10 lg:text-xl">
    <div class="flex place-items-center">
        <Wireframe width="50px" height="50px" />
        <p>&copy; Stewards Pooi Kei College 2023</p>
    </div>

    <div>
        <div class="flex gap-2">
            <!-- <a href="tel:+852-2635-0100"> ????? -->
            <a href="tel:+852-2345-4567" class="flex align-middle justify-between">
                <Fa icon={faPhone} />
                <span>2345 4567</span>
            </a>
            <a href="tel:+852-2345-4567" class="flex align-middle justify-between">
                <Fa icon={faAt} />
                <span>info@spkc.edu.hk</span>
            </a>
        </div>
    </div>
</footer>
