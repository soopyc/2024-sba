<script>
  import '../app.postcss';
  import '../app.sass';

  import Fa from 'svelte-fa';
  import { faRightFromBracket } from '@fortawesome/free-solid-svg-icons';

  import { page } from '$app/stores';
</script>

<svelte:head>
  <title>20th Anniversary | Stewards Pooi Kei College</title>
</svelte:head>

<div class="drawer">
  <input id="main-drawer" type="checkbox" class="drawer-toggle" />
  <div class="drawer-content flex flex-col">
    <!-- navbar -->
    <div class="navbar serif bg-primary shadow sticky top-0 min-h-fit lg:px-10">
      <div class="flex-auto m-auto">
        <div class="flex-none lg:hidden mx-3" title="Site navigation drawer">
          <label for="main-drawer" class="btn btn-square btn-ghost">
            <svg
              xmlns="http://www.w3.org/2000/svg"
              fill="none"
              viewBox="0 0 24 24"
              class="inline-block w-6 h-6 stroke-current"
              ><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16" /></svg
            >
          </label>
        </div>

        <a href="/" class="flex justify-around space-x-3">
          <img class="h-14" alt="Stewards Pooi Kei College 20th Anniversary" src="/schoolbadge.png" />
          <div class="text-left flex flex-col flex-auto justify-center items-start">
            <p>
              <span class="hidden lg:inline">香港神托會</span>培基書院
              <span class="lg:text-xl">20週年</span>
            </p>
            <p>
              <span class="lg:hidden">SPKC</span>
              <span class="hidden lg:inline lg:text-xl">Stewards Pooi Kei College</span>
              <span class="lg:text-xl">20th Anniversary</span>
            </p>
          </div>
        </a>
      </div>

      <div class="flex-none hidden lg:block">
        <ul class="menu menu-horizontal bg-secondary rounded-md">
          <!-- todo: rewrite these with components for auto styling -->
          <li><a href="/" class:bg-info={$page.url.pathname === '/'}>Home</a></li>
          <li><a href="/activities" class:bg-info={$page.url.pathname === '/activities'}>Activities</a></li>
          <li><a href="/about" class:bg-info={$page.url.pathname === '/about'}>About Us</a></li>
          <li>
            <a class="hover-bordered bg-warning hover:bg-warning/70" href="//www.spkc.edu.hk">Return to Main Site</a>
          </li>
        </ul>
      </div>
    </div>

    <!-- Main content -->
    <slot />
  </div>

  <!-- Sidebar -->
  <div class="drawer-side">
    <label for="main-drawer" class="drawer-overlay" />
    <ul class="menu p-4 w-56 md:w-80 bg-base-100 md:gap-2 text-sm md:text-base">
      <li class="menu-title"><span>Site navigation</span></li>
      <li><a href="/" class:bg-info={$page.url.pathname === '/'}>Home</a></li>
      <li><a href="/activities" class:bg-info={$page.url.pathname === '/activities'}>Activities</a></li>
      <li><a href="/about" class:bg-info={$page.url.pathname === '/about'}>About Us</a></li>
      <li>
        <a class="hover-bordered bg-warning hover:bg-warning/70" href="//www.spkc.edu.hk">
          <Fa icon={faRightFromBracket} />Return to Main Site
        </a>
      </li>
    </ul>
  </div>
</div>
