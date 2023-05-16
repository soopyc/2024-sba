<script lang="ts">
    import { onDestroy } from 'svelte';
    import Fa from 'svelte-fa';
    import { faCalendarAlt } from '@fortawesome/free-solid-svg-icons';
    import Wireframe from '$lib/wireframe.svelte';
    import dayjs from 'dayjs';
    import dayjsDuration from 'dayjs/plugin/duration';

    dayjs.extend(dayjsDuration);

    export const eventStartDay = new Date(1699669800000);

    export let month = 0;
    export let day = 0;
    export let hour = 0;
    export let minute = 0;
    export let second = 0;

    const countdownTimerInterval = setInterval(() => {
        let timeLeft = dayjs.duration(eventStartDay.valueOf() - new Date().valueOf());
        month = timeLeft.months();
        day = timeLeft.days();
        hour = timeLeft.hours();
        minute = timeLeft.minutes();
        second = timeLeft.seconds();
    }, 1000);

    onDestroy(() => {
        clearInterval(countdownTimerInterval);
    });
</script>

<div class="w-full h-full">
    <div class="relative inline-block">
        <!-- Overlay element-->
        <div
            class="absolute w-fit bottom-0 left-0 p-5 m-5 transition-colors bg-slate-800/50 hover:bg-slate-800/90 rounded text-base-100"
        >
            <div class="flex md:gap-5 md:pl-5">
                {#if month}
                    <div>
                        <span class="countdown font-mono text-2xl md:text-4xl">
                            <span style="--value:{month};" />
                        </span>
                        <span class="hidden md:inline">months</span>
                        <span class="inline md:hidden">m</span>
                    </div>
                {/if}
                <div>
                    <span class="countdown font-mono text-2xl md:text-4xl">
                        <span style="--value:{day};" />
                    </span>
                    <span class="hidden md:inline">days</span>
                    <span class="inline md:hidden">d</span>
                </div>
                <div>
                    <span class="countdown font-mono text-2xl md:text-4xl">
                        <span style="--value:{hour};" />
                    </span>
                    <span class="hidden md:inline">hours</span>
                    <span class="inline md:hidden">:</span>
                </div>
                <div>
                    <span class="countdown font-mono text-2xl md:text-4xl">
                        <span style="--value:{minute};" />
                    </span>
                    <span class="hidden md:inline">minutes</span>
                    <span class="inline md:hidden">:</span>
                </div>
                <div>
                    <span class="countdown font-mono text-2xl md:text-4xl">
                        <span style="--value:{second};" />
                    </span>
                    <span class="hidden md:inline">seconds</span>
                </div>
            </div>
            <p class="text-lg pt-2">until Anniversary Open Day</p>
            <p class="mt-2">
                <a href="/event.ics">
                    <button class="btn btn-primary btn-sm lg:btn-md xl:btn-lg">
                        <Fa icon={faCalendarAlt} class="mr-2" /> Add to Calendar
                    </button>
                </a>
            </p>
        </div>

        <div class="">
            <video
                class="h-[60vh] lg:h-[90vh] w-screen object-cover"
                muted
                disablepictureinpicture
                autoplay
                loop
                preload="metadata"
            >
                <source
                    src="https://assets.soopy.moe/tmp/SPKC_2023-ABDAY-SNIP-5e1182d4-ee33-11ed-b353-000d3ac6c367.webm"
                    type="video/webm"
                />
                <source
                    src="https://assets.soopy.moe/tmp/SPKC_2023-ABDAY-SNIP-ad268605-f607-44e0-b559-466e4efdeef4.mp4"
                    type="video/mp4"
                />
                <p>
                    Weird. Your browser couldn't play any of the video source files. Please consider filing a bug report
                    on https://github.com/soopyc/2024-sba or contact me at mailto:me@soopy.moe
                </p>
            </video>
        </div>
    </div>
</div>

<div>
    <p />
</div>

<style>
    /* https://stackoverflow.com/a/26241019 :pray: */
</style>
