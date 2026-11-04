<p align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="brave_dark.png">
    <source media="(prefers-color-scheme: light)" srcset="brave_light.png">
    <img alt="Brave Logo" src="brave_light.png">
  </picture>
</p>

another-brave-overlay-testing
=============================

![](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Ffalbrechtskirchinger%2Fanother-brave-overlay-testing%2Fbadges%2Fupdate.json&style=flat-square&logo=github)
![](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Ffalbrechtskirchinger%2Fanother-brave-overlay-testing%2Fbadges%2Fdivergence.json&style=flat-square&logo=github)

This Gentoo overlay provides automatically generated ebuilds for the [Brave Browser](https://brave.com/), a privacy-focused, open-source web browser based on Chromium, and [Brave Origin](https://brave.com/origin/), a streamlined version of Brave Browser. The ebuilds are based on several official Gentoo ebuilds for other Chromium-based browsers, which are routinely checked for divergence, and adapted to deliver the stable, beta, and nightly versions of Brave Browser and Brave Origin via the following ebuilds:

- `www-client/brave-browser` (stable) ![](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Ffalbrechtskirchinger%2Fanother-brave-overlay-testing%2Fbadges%2Fbrave-browser.json&style=flat-square&logo=github)
- `www-client/brave-browser-beta` (beta) ![](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Ffalbrechtskirchinger%2Fanother-brave-overlay-testing%2Fbadges%2Fbrave-browser-beta.json&style=flat-square&logo=github)
- `www-client/brave-browser-nightly` (nightly) ![](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Ffalbrechtskirchinger%2Fanother-brave-overlay-testing%2Fbadges%2Fbrave-browser-nightly.json&style=flat-square&logo=github)
- `www-client/brave-origin` (stable) ![](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Ffalbrechtskirchinger%2Fanother-brave-overlay-testing%2Fbadges%2Fbrave-origin.json&style=flat-square&logo=github)
- `www-client/brave-origin-beta` (beta) ![](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Ffalbrechtskirchinger%2Fanother-brave-overlay-testing%2Fbadges%2Fbrave-origin-beta.json&style=flat-square&logo=github)
- `www-client/brave-origin-nightly` (nightly) ![](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Ffalbrechtskirchinger%2Fanother-brave-overlay-testing%2Fbadges%2Fbrave-origin-nightly.json&style=flat-square&logo=github)

These ebuilds install pre-built binary versions.


Installation
------------

To install the Brave Browser from this overlay, follow these steps:

1. Add the overlay:

    ```sh
    eselect repository enable another-brave-overlay
    ```

2. Sync the overlay to download the ebuilds:

    ```sh
    emaint sync -r another-brave-overlay
    ```

3. Install Brave Browser from the desired release channel using `emerge`. For example, to install the stable version, run:

    ```sh
    emerge -av www-client/brave-browser
    ```


About `verify-sig`
------------------

The `verify-sig` USE flag is supported. However, you may encounter sporadic messages like this:

```
Fetch instructions for www-client/brave-origin-1.98.63:
 * brave-origin-1.98.63 is currently signed with an intermediate key.
 * Wait a few hours, re-sync the overlay, and retry.
 * To install immediately, drop the 'verify-sig' USE flag.
```

When Brave signs releases with an intermediate key, the generated ebuild is fetch-restricted to prevent installation without a signature check. The ebuild will be updated once Brave signs the release with the official key. You may file an issue if the problem persists beyond 48h.

These messages will not prevent `emerge` from installing other packages, such as during a `@world` update.


Issues
------

If you encounter any problems or have suggestions, please open an issue on GitHub: https://github.com/falbrechtskirchinger/another-brave-overlay/issues


License
-------

Ebuilds in this overlay are licensed under the GNU General Public License v2.0 (GPL-2).

See the `LICENSE.GPL-2` file in the repository for full details.

**Trademark Notice**: All Brave logos, marks, and designations are trademarks or registered trademarks of Brave Software, Inc.
