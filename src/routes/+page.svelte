<script lang="ts">
    import { onMount } from 'svelte';
    import { Player, Youtube } from '@vime/svelte';
    let video: HTMLDivElement;
    
    onMount(() => {
        const test: HTMLImageElement = document.createElement('img')
        test.src = 'https://upload.wikimedia.org/wikipedia/commons/c/c4/PM5544_with_non-PAL_signals.png'
        test.classList.add('w-full')
        video.appendChild(test);
    });

</script>

<div>
    <div id="bg-video" class="-z-50" bind:this={video}>
        <Player>
            <Youtube videoId="_RSzENqfk04" showFullScreenControl={false}/>
        </Player>
    </div>
</div>
