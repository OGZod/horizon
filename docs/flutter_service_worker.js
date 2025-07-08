'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "3fde5359567153fe9224a6e2d14c3ab5",
"assets/AssetManifest.bin.json": "7bf6bbcf3afd59d1af386da44fb60232",
"assets/AssetManifest.json": "8c83a8a1fd88e8b0e2de20710b9953c4",
"assets/assets/fonts/DMSans-Black.ttf": "e54a07f508b4110c6d3ac51e3431114a",
"assets/assets/fonts/DMSans-BlackItalic.ttf": "f17556b48501d4155dcb5bf706a208ac",
"assets/assets/fonts/DMSans-Bold.ttf": "e536a40665a2de6dbe6238458440736a",
"assets/assets/fonts/DMSans-BoldItalic.ttf": "8b34f1a4a5a0f7bdc4ab3dfd7e646c01",
"assets/assets/fonts/DMSans-Italic.ttf": "c21f88bfce6e0feed71f117846bb448d",
"assets/assets/fonts/DMSans-Light.ttf": "595a0b9db3c2167b5535654c09514609",
"assets/assets/fonts/DMSans-Regular.ttf": "7f35f486d44502f8bbb0f5f922c4c0a0",
"assets/assets/fonts/DMSans-Thin.ttf": "afecf05925776cd4a79d6bef93ea3f7e",
"assets/assets/fonts/DMSans-ThinItalic.ttf": "896b6856c8c8364f9981dc820679f4fb",
"assets/assets/fonts/Poppins-Bold.ttf": "08c20a487911694291bd8c5de41315ad",
"assets/assets/fonts/Poppins-Regular.ttf": "093ee89be9ede30383f39a899c485a82",
"assets/assets/icons/cart.svg": "62ed63b0b03d0cd454aad4aaba4b0cc9",
"assets/assets/icons/check_plus.svg": "562b5b16b4c4f941463703d71a500d7a",
"assets/assets/icons/dollar.svg": "ae37b92a35e6f6603f292ed830a23b0a",
"assets/assets/icons/eth.svg": "0fb377d56f2a8178e3af8d39e22ba2e6",
"assets/assets/icons/file.svg": "95b6ce8dbf4dcb70868c34a2fe9cbb17",
"assets/assets/icons/home.svg": "fb7ee08eff3b823527f4235733759700",
"assets/assets/icons/horizon_logo.png": "0fdc4f37c73949b402119e56f73762ed",
"assets/assets/icons/info_outline.svg": "f0cf61fff89a10fd7b39cd525ba8389d",
"assets/assets/icons/kanban.svg": "962188e2ba2f466d33c8e2b5cc9ff874",
"assets/assets/icons/lock.svg": "9536358f31d86245cd8db1f0b45a2e4d",
"assets/assets/icons/moon_solid.svg": "4c8e2d698715f5ea4ef0c5d7a567dcee",
"assets/assets/icons/notifications_none.svg": "4b90f9a3cabe9dc6059f11002798bf8a",
"assets/assets/icons/profile.svg": "c2b7942eb2172b0b1878670803d427f8",
"assets/assets/icons/search.svg": "3285a8cbfdf5e500cbd2a743bce9a9c3",
"assets/assets/icons/table.svg": "0ad5f76e4bb181f49d0bfa18aa27cdf6",
"assets/assets/images/avatar_1.png": "ab1c3be2547fb44eb166f1cf872e645b",
"assets/assets/images/avatar_2.png": "7fe53fe773b00c064483463d13c12f4e",
"assets/assets/images/avatar_3.png": "3c2800a95684d5c007910309aa74ae3b",
"assets/assets/images/brain.png": "f030048e5e00369c3396141939cf4e44",
"assets/assets/images/header_avatar.png": "2c71b4a6d02c09b5c5bab8365ed20ecc",
"assets/assets/images/nft.png": "80b1a4cf035c7908b0534abd22a4bbc8",
"assets/assets/images/products.png": "c622ae29b7996295b7b0df758e25fce7",
"assets/assets/images/sb.png": "2d641dab4f1b00749d531be9742ddd75",
"assets/assets/images/starbuck.png": "a950a6353abb8dfa196e94ce4c93af2f",
"assets/assets/images/us_flag.png": "326129365d41079071e344f04da1a785",
"assets/FontManifest.json": "740ab58438aa0a9b7e066dc2d285c5a0",
"assets/fonts/MaterialIcons-Regular.otf": "3fb0099b36b67c8e4f8aa1ce07ef008d",
"assets/NOTICES": "9d83affef3ec4a03bc610948463381bd",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "54664a7361d21463d2d98ba621e3a993",
"assets/packages/currency_picker/lib/src/res/no_flag.png": "3f454777dfe9b6aae5e9d8544f4fa6f6",
"assets/packages/currency_picker/lib/src/res/xof.png": "5843e487ecffd9d3dcd01c1070cc6c6a",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/canvaskit.js.symbols": "bdcd3835edf8586b6d6edfce8749fb77",
"canvaskit/canvaskit.wasm": "7a3f4ae7d65fc1de6a6e7ddd3224bc93",
"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/chromium/canvaskit.js.symbols": "b61b5f4673c9698029fa0a746a9ad581",
"canvaskit/chromium/canvaskit.wasm": "f504de372e31c8031018a9ec0a9ef5f0",
"canvaskit/skwasm.js": "ea559890a088fe28b4ddf70e17e60052",
"canvaskit/skwasm.js.symbols": "e72c79950c8a8483d826a7f0560573a1",
"canvaskit/skwasm.wasm": "39dd80367a4e71582d234948adc521c0",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"flutter_bootstrap.js": "ccbc07f1ce6590db9979c9f79e7eeaff",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "6ece9d951d4ee6f5b9b59f10880f7663",
"/": "6ece9d951d4ee6f5b9b59f10880f7663",
"main.dart.js": "8c7ef675047af89a160bb0bc3a3ac1ef",
"manifest.json": "2bd3530158df2d8a7544e21644f71a9d",
"version.json": "5c115a8dd1f140a29d668107a2fb9110"};
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
