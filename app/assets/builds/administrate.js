(() => {
  var __create = Object.create;
  var __defProp = Object.defineProperty;
  var __getOwnPropDesc = Object.getOwnPropertyDescriptor;
  var __getOwnPropNames = Object.getOwnPropertyNames;
  var __getProtoOf = Object.getPrototypeOf;
  var __hasOwnProp = Object.prototype.hasOwnProperty;
  var __markAsModule = (target) => __defProp(target, "__esModule", { value: true });
  var __commonJS = (cb, mod) => function __require() {
    return mod || (0, cb[__getOwnPropNames(cb)[0]])((mod = { exports: {} }).exports, mod), mod.exports;
  };
  var __reExport = (target, module, copyDefault, desc) => {
    if (module && typeof module === "object" || typeof module === "function") {
      for (let key of __getOwnPropNames(module))
        if (!__hasOwnProp.call(target, key) && (copyDefault || key !== "default"))
          __defProp(target, key, { get: () => module[key], enumerable: !(desc = __getOwnPropDesc(module, key)) || desc.enumerable });
    }
    return target;
  };
  var __toESM = (module, isNodeMode) => {
    return __reExport(__markAsModule(__defProp(module != null ? __create(__getProtoOf(module)) : {}, "default", !isNodeMode && module && module.__esModule ? { get: () => module.default, enumerable: true } : { value: module, enumerable: true })), module);
  };

  // administrate/components/table.js
  var require_table = __commonJS({
    "administrate/components/table.js"() {
      function bindTableLinks() {
        const keycodes = { space: 32, enter: 13 };
        function visitDataUrl(event) {
          const target = event.target.classList.contains("js-table-row") ? event.target : event.target.closest(".js-table-row");
          if (!target) {
            return;
          }
          if (event.type === "click" || event.keyCode === keycodes.space || event.keyCode === keycodes.enter) {
            if (event.target.href) {
              return;
            }
            const dataUrl = target.getAttribute("data-url");
            const selection = window.getSelection().toString();
            if (selection.length === 0 && dataUrl) {
              const delegate = target.querySelector(`[href="${dataUrl}"]`);
              if (delegate) {
                delegate.click();
              } else {
                window.location = dataUrl;
              }
            }
          }
        }
        document.querySelectorAll("table").forEach((table) => {
          table.addEventListener("click", visitDataUrl);
          table.addEventListener("keydown", visitDataUrl);
        });
      }
      document.addEventListener("turbo:load", function() {
        bindTableLinks();
      });
    }
  });

  // rails:/root/prod/jumpstart-pro/app/javascript/administrate/components/**/*
  var module0 = __toESM(require_table());
})();
