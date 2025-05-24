// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/**
 * This script loads the Flutter web app and initializes it.
 */
"use strict";

/**
 * The installation protocol. This value is incremented each time the entire
 * loading mechanism changes in a way that affects loading in existing Flutter
 * web apps. The protocol is implemented by the `flutterLoader` object, below.
 */
const loadingProtocol = 2;

/**
 * Handles error conditions thrown while setting up Flutter for web.
 * @param {!Object} error An object containing information about the error.
 */
function _reportError(error) {
    if (!('stack' in error)) {
        error.stack = Error().stack.replace(/^Error\n\s*at [^\n]*\n/, '');
    }
    console.error(error);
    _baseURL = null;
    _onError(error);
}

/**
 * The current Flutter service worker version.
 *
 * When a new version of the Flutter web service worker is pushed to users,
 * the service worker will run `flutterLoader.didUpdateServiceWorker()`.
 * To support older, cached service workers, we increment this version number
 * whenever the service worker code is updated, or the logic at the top level
 * of `flutter_service_worker.js` changes.
 */
const serviceWorkerVersion = "3084132820";

/**
 * The fallback, empty Flutter web service worker version.
 *
 * This is used if the `serviceWorkerVersion` is not set to a valid version
 * by the Flutter tool. In that case, if the user has a cached service worker,
 * we want to disable it and force a reload from the network, otherwise the
 * user would be running an arbitrarily old service worker.
 */
const serviceWorkerVersionFallback = "";

/**
 * Injected by the Flutter tool to handle host look-ups.
 * @type {Object?}
 */
let assetBase = null;

/**
 * Injected by the Flutter tool to handle asynchronous resource loading.
 * @type {function|null}
 */
let didCreateEngineInitializer = null;

/**
 * Future that resolves to the module loader for the app that should be used in
 * combination with the Flutter app. For now, we don't configure this, but it
 * could be used to load additional JS for Wasm in the future.
 * @type {Promise<object>?}
 */
let _engineLoader = null;

/**
 * The base URL for the directory containing `main.dart.js`.
 * This URL can be overridden using the `base-href` meta tag.
 *
 * For example, to serve Flutter from a subdirectory called `/flutter`:
 *
 * ```html
 * <base href="/flutter/">
 * ```
 *
 * For an application deployed at a subpath, the base URL can be overriden
 * using a DOM element with an id `flutter-base-href` and a content property
 * defining the base URL.
 *
 * For example, an application deployed at a subpath `/flutter/` could use:
 *
 * ```html
 * <meta id="flutter-base-href" content="/flutter/">
 * ```
 * @type {string?}
 */
let _baseURL = null;

/**
 * Returns a URL for a Flutter asset.
 * @param {string} asset The path to the asset.
 * @returns {string?} The URL to the asset.
 */
function getAssetURL(asset) {
    if (_baseURL === null) {
        const baseElement = document.querySelector("base");
        // Only set the base URL if the web app actually uses a <base> tag.
        _baseURL = baseElement?.getAttribute("href") ?? null;
        if (_baseURL === null) {
            // Also try getting the base URL from a meta element.
            const meta = document.querySelector("meta[id=flutter-base-href]");
            if (meta) {
                _baseURL = meta.getAttribute("content");
            }
        }

        // Normalize the base URL (trailing "/")
        if (_baseURL !== null && !_baseURL.endsWith("/")) {
            _baseURL = `${_baseURL}/`;
        }
    }
    if (assetBase && assetBase[asset]) {
        return assetBase[asset];
    }
    // Fall back to a relative URL.
    return _baseURL != null ? `${_baseURL}${asset}` : asset;
}

/**
 * Creates a function that returns a promise that resolves to a module for the Flutter app.
 * @param {object?} config Optional configuration values for the Flutter app.
 * @returns {Promise<object>} The promise that resolves to a module loader for the Flutter app.
 */
async function _createWasmModuleLoader(config) {
    let entrypointURL = "main.dart.js";
    if (config?.entrypointUrl) {
        entrypointURL = config.entrypointUrl;
    }
    const url = getAssetURL(entrypointURL);
    return { moduleUrl: url };
}

/**
 * Creates a function that returns a promise that resolves to a module loader for the Flutter app.
 * @returns {Promise<object>} A promise that resolves to a module loader for the Flutter app.
 */
async function _createModuleLoader() {
    return _createWasmModuleLoader();
}

/**
 * Configuration options for the Flutter web app.
 *
 * @typedef {Object} FlutterLoaderConfig
 * @property {string?} entrypointUrl The URL to use for the entrypoint instead of main.dart.js.
 * @property {string?} canvasKitBaseUrl The base URL to use for canvaskit. Defaults to unpkg.
 * @property {string?} canvasKitVariant The variant of canvaskit to use. For example "chromium".
 * @property {Object?} serviceWorkerOptions The service worker configuration options.
 */

/**
 * The loader that loads the Flutter web app.
 */
const flutterLoader = {
    /**
     * The loading protocol version.
     */
    get loadingProtocol() {
        return loadingProtocol;
    },

    /**
     * Returns a promise that resolves when Flutter is ready to receive calls
     * to its JS APIs.
     * @returns {Promise<void>} A promise that resolves when Flutter is ready.
     */
    get didCreateEngineInitializer() {
        return didCreateEngineInitializer;
    },

    /**
     * Initializes the Flutter web app.
     * @param {FlutterLoaderConfig?} config Configuration for the Flutter web app.
     * @returns {Promise<void>} A promise that resolves when the Flutter web app is loaded.
     */
    async init(config) {
        // Get the module loader, if not yet available.
        if (!_engineLoader) {
            _engineLoader = _createModuleLoader();
        }
    },

    /**
     * Handles updated service workers.
     * For now, we just want to log.
     */
    didUpdateServiceWorker() {
        console.debug("Did update service worker with version:", serviceWorkerVersion);
    },
};

/**
 * Handles the `entrypoint` callback passed to loadEntrypoint.
 *
 * @callback OnEntrypointCallback
 * @returns {Promise<void>} A promise that resolves when the Flutter web app is loaded.
 * @param {Object} engineInitializer An object containing the `initializeEngine` method.
 */

/**
 * Loads the Flutter web app.
 * @typedef {Object} FlutterEntrypointConfig
 * @property {string?} entrypointUrl The URL to use for the entrypoint instead of main.dart.js.
 * @property {string?} canvasKitBaseUrl The base URL to use for canvaskit. Defaults to unpkg.
 * @property {string?} canvasKitVariant The variant of canvaskit to use. For example "chromium".
 * @property {OnEntrypointCallback?} onEntrypointLoaded Called after the main.dart.js has loaded,
 *   to provide a way to customize when the Flutter app is loaded.
 * @property {Object?} serviceWorkerOptions The service worker configuration options.
 *
 * @param {FlutterEntrypointConfig?} config Configuration for the Flutter web app.
 * @returns {Promise<void>} A promise that resolves when the Flutter web app is loaded.
 */
flutterLoader.loadEntrypoint = function (config) {
    return this.init(config).then(() => {
        // Install the `didCreateEngineInitializer` hook, which will be called once
        // the engine is ready to be initialized.
        let engineInitPromise = new Promise((resolve) => {
            window._flutter_loader_willInitializeEngine = () => {
                const appRunner = {
                    /**
                     * Runs the Flutter web app.
                     * @returns {Promise<void>} A promise that resolves when the Flutter web app is loaded.
                     */
                    runApp: () => {
                        console.debug("Called runApp...");
                        const res = window._flutter_loader_runApp();
                        return res == null ? Promise.resolve() : res;
                    },
                };

                const engineInitializer = {
                    /**
                     * Initializes the Flutter engine.
                     * @returns {Promise<void>} A promise that resolves when the Flutter engine is loaded.
                     */
                    initializeEngine: window._flutter_loader_initializeEngine
                };

                // Let the app know that we're ready to initialize the engine.
                resolve({ engineInitializer, appRunner });
            };
        });

        // The onEntrypointLoaded callback allows the client to load resources
        // before executing the Flutter app.
        if (config?.onEntrypointLoaded) {
            return engineInitPromise.then(config.onEntrypointLoaded);
        }
    });
};

/**
 * Handles error conditions thrown while setting up Flutter for web.
 * @param {Object} error An object containing information about the error.
 */
let _onError = function (error) {
    console.error(error);
};

/**
 * Sets the function to call when an error occurs while setting up Flutter for web.
 * @param {function} onError A function that takes an error object as its only parameter.
 */
flutterLoader.onEntrypointLoadError = function (onError) {
    _onError = onError;
};

/**
 * Automatically loads the Flutter web app.
 */
(async function () {
    // Inject the FlutterLoader API into the window.
    window.flutterLoader = flutterLoader;
    window._flutter = { loader: flutterLoader };
    try {
        await flutterLoader.init();
    } catch (error) {
        _reportError(error);
    }
})();
