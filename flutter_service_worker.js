'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"canvaskit/skwasm.js": "5d4f9263ec93efeb022bb14a3881d240",
"canvaskit/canvaskit.wasm": "9251bb81ae8464c4df3b072f84aa969b",
"canvaskit/canvaskit.js.symbols": "74a84c23f5ada42fe063514c587968c6",
"canvaskit/skwasm.js.symbols": "c3c05bd50bdf59da8626bbe446ce65a3",
"canvaskit/skwasm.wasm": "4051bfc27ba29bf420d17aa0c3a98bce",
"canvaskit/canvaskit.js": "738255d00768497e86aa4ca510cce1e1",
"canvaskit/chromium/canvaskit.wasm": "399e2344480862e2dfa26f12fa5891d7",
"canvaskit/chromium/canvaskit.js.symbols": "ee7e331f7f5bbf5ec937737542112372",
"canvaskit/chromium/canvaskit.js": "901bb9e28fac643b7da75ecfd3339f3f",
"icons/Icon-maskable-192.png": "cdc4d365f836cd97e37d2dc7a8cdf9e1",
"icons/Icon-maskable-512.png": "962aea845e4e3554dfceff9d4cd26350",
"icons/Icon-512.png": "962aea845e4e3554dfceff9d4cd26350",
"icons/Icon-192.png": "cdc4d365f836cd97e37d2dc7a8cdf9e1",
"manifest.json": "4c53bc3fb5e2197b4dc1e9f617458f15",
"favicon.png": "2ae414f1b82e6446ac44b238677479d4",
"flutter_bootstrap.js": "b9e7f0ebc06cf8d0811b1d88233d4c32",
"version.json": "009c9e65172e010890f7f65fde438006",
"index.html": "5febe365b408c90de70e02ab8c6c6a99",
"/": "5febe365b408c90de70e02ab8c6c6a99",
"main.dart.js": "4bc5518d9646b663ce287b3771e497be",
"spinner.css": "2d2469a47b9e6018be3007b5dc6a2ce9",
"icon_transparent.png": "34d74638875fdf52162cddd6cb4864cc",
"assets/AssetManifest.json": "4b43538f0f5b491bcc95d20a7ab619b3",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin.json": "c20e924609e8573f08ba1e1ccf73ae88",
"assets/fonts/MaterialIcons-Regular.otf": "1e3ce499e755a388f946a6eb353b1e64",
"assets/assets/images/project/celestial_tracker/img.png": "a35b666b435593ad524ee033312ac427",
"assets/assets/images/project/server_engine_web/img.png": "bf76c8ce56861e8642f7f599a71fbf7e",
"assets/assets/images/project/pin_engine/img.png": "7bb06d843cab40db156f56411fa4380e",
"assets/assets/images/project/pin_engine/logo.png": "448d3ed5b8a6ebed8f8e2fe531d78473",
"assets/assets/images/project/rechargeable_fireworks/img.png": "c8f6cea754e98211187252a72809da75",
"assets/assets/images/project/rechargeable_fireworks/logo.png": "5c4f034ddda411e85cb722f227792ca1",
"assets/assets/images/project/simple_discord/img.png": "5f105916e8f2fece582c810875f8a44c",
"assets/assets/images/project/simple_discord/logo.png": "9d11db492af48f286694fdaaa4068364",
"assets/assets/images/project/lethal_scanner/img.png": "a35adc24cac9c1adddf84fe104c85cf9",
"assets/assets/images/project/server_engine/img.png": "481a1116a1c31de53628ae858c208e00",
"assets/assets/images/project/server_engine/logo.png": "d90c9831b5163d894428a78a62e177df",
"assets/assets/images/project/league_archive/img.png": "4c6919588232bb0aaebe226fcd2ae148",
"assets/assets/images/project/three_kingdoms/img.png": "f6ef0c95b3fbd70546298f8f4f2a9dfd",
"assets/assets/images/project/three_kingdoms/logo.png": "381711817e7f4b8cbc3da3b0f1e5efa6",
"assets/assets/images/project/server_lister/img.png": "09d521e42c64fe38275ab0a209ec9eaf",
"assets/assets/images/project/better_spyglass/img.png": "096df431e48f140580cfa689b7c27514",
"assets/assets/images/project/better_spyglass/logo.png": "ff6359808c0eb0293b6804f1c532a6c4",
"assets/assets/images/project/pixel_universe/p2.png": "07a0452cd8a6f60876db67f85a8a7bfa",
"assets/assets/images/project/pixel_universe/p1.png": "6affdf99f92e8b4045b32066e3a830e5",
"assets/assets/images/project/pixel_universe/p3.png": "723ccdc00480f397d2eadfb08db9ff7b",
"assets/assets/images/project/pixel_universe/p4.png": "763b7610b1ae2a78af90a03d32bd5933",
"assets/assets/images/project/pixel_universe/img.png": "77c67a0ae95f372f100686e244a05724",
"assets/assets/images/project/pixel_universe/logo.png": "2ae414f1b82e6446ac44b238677479d4",
"assets/assets/images/field/kotlin.png": "4d0dcbbd31a2040c7010c29876282e98",
"assets/assets/images/field/minecraft.png": "d092d06ca249804e55336a4d46f1cccd",
"assets/assets/images/field/flutter.png": "ba543f0258cd54c30af6acdc273de281",
"assets/assets/images/field/csharp.png": "0e18550bb7c9827e878e1b7711775c79",
"assets/assets/images/field/java.png": "5619d947fd100931e4495f3b7f9de7fd",
"assets/assets/images/field/unity3d.png": "38e2808d43b7a0b0ceafbdce41489253",
"assets/assets/images/field/dart.png": "a1749cfe2e22d4a4df010edf4edd70bf",
"assets/assets/images/contact/gmail.png": "4916cacf1b9023c3409d58a1523f3d6e",
"assets/assets/images/contact/github.png": "13c1bccacbbdf7656a6d731fc4be8337",
"assets/assets/images/contact/youtube.png": "862737135ff1346a8efca30757bde67b",
"assets/assets/images/contact/kmong.png": "43971a39e352a6d171f76e298e67e828",
"assets/assets/images/sbxt_transparent.png": "34d74638875fdf52162cddd6cb4864cc",
"assets/assets/images/sbxt.png": "2ae414f1b82e6446ac44b238677479d4",
"assets/assets/fonts/JetBrainsMonoNL-Light.ttf": "6916a36fb69ebf8b0ea83313fc99a036",
"assets/assets/fonts/Pretendard-Medium.otf": "13a352bd44156de92cce335ce93cd02d",
"assets/assets/fonts/Pretendard-Regular.otf": "84c0ea9d65324c758c8bd9686207afea",
"assets/assets/fonts/Pretendard-Bold.otf": "f8a9b84216af5155ffe0e8661203f36f",
"assets/assets/fonts/JetBrainsMonoNL-Regular.ttf": "0dc7ccd81c27e2fca57bebda54e11e09",
"assets/assets/fonts/JetBrainsMonoNL-ExtraBold.ttf": "dc1d0bbd63331730b93b51f8c990b2df",
"assets/assets/fonts/JetBrainsMonoNL-Bold.ttf": "287bc4c006a0f04e56c372857e8a74d1",
"assets/NOTICES": "3cefb71748d3bc92ca2cdbd0b06504bf",
"assets/AssetManifest.bin": "9c9006313aa33a885ab86bbc8b640862",
"assets/FontManifest.json": "afaf6793aa9a918ab66b8809af38c294",
"flutter.js": "383e55f7f3cce5be08fcf1f3881f585c",
"CNAME": "5e5c7fa22d98f2880e76c7d12ce0d036"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
