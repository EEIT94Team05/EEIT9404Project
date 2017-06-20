(function() {
    var aa = function(a, b) {
            function c() {}
            c.prototype = b.prototype;
            a.ja = b.prototype;
            a.prototype = new c;
            a.prototype.constructor = a;
            for (var d in b)
                if (Object.defineProperties) {
                    var e = Object.getOwnPropertyDescriptor(b, d);
                    e && Object.defineProperty(a, d, e) } else a[d] = b[d] },
        l = this,
        ba = function(a) {
            return "number" == typeof a },
        ca = function(a) {
            var b = typeof a;
            if ("object" == b)
                if (a) {
                    if (a instanceof Array) return "array";
                    if (a instanceof Object) return b;
                    var c = Object.prototype.toString.call(a);
                    if ("[object Window]" == c) return "object";
                    if ("[object Array]" ==
                        c || "number" == typeof a.length && "undefined" != typeof a.splice && "undefined" != typeof a.propertyIsEnumerable && !a.propertyIsEnumerable("splice")) return "array";
                    if ("[object Function]" == c || "undefined" != typeof a.call && "undefined" != typeof a.propertyIsEnumerable && !a.propertyIsEnumerable("call")) return "function"
                } else return "null";
            else if ("function" == b && "undefined" == typeof a.call) return "object";
            return b
        },
        da = function(a) {
            var b = typeof a;
            return "object" == b && null != a || "function" == b },
        ea = function(a, b, c) {
            return a.call.apply(a.bind,
                arguments)
        },
        fa = function(a, b, c) {
            if (!a) throw Error();
            if (2 < arguments.length) {
                var d = Array.prototype.slice.call(arguments, 2);
                return function() {
                    var c = Array.prototype.slice.call(arguments);
                    Array.prototype.unshift.apply(c, d);
                    return a.apply(b, c) } }
            return function() {
                return a.apply(b, arguments) } },
        n = function(a, b, c) { Function.prototype.bind && -1 != Function.prototype.bind.toString().indexOf("native code") ? n = ea : n = fa;
            return n.apply(null, arguments) },
        ga = function(a, b) {
            var c = Array.prototype.slice.call(arguments, 1);
            return function() {
                var b =
                    c.slice();
                b.push.apply(b, arguments);
                return a.apply(this, b)
            }
        },
        q = function(a, b) {
            function c() {}
            c.prototype = b.prototype;
            a.ja = b.prototype;
            a.prototype = new c;
            a.prototype.constructor = a;
            a.na = function(a, c, f) {
                for (var d = Array(arguments.length - 2), e = 2; e < arguments.length; e++) d[e - 2] = arguments[e];
                return b.prototype[c].apply(a, d) } };
    var ha = (new Date).getTime();
    var t = document,
        u = window;
    var ia = function(a, b) { a = parseInt(a, 10);
            return isNaN(a) ? b : a },
        ja = function(a, b) {
            return /^true$/.test(a) ? !0 : /^false$/.test(a) ? !1 : b },
        ka = /^([\w-]+\.)*([\w-]{2,})(\:[0-9]+)?$/,
        la = function(a, b) {
            return a ? (a = a.match(ka)) ? a[0] : b : b };
    var ma = ia("90", 0),
        na = ia("468", 0);
    var oa = function() {
            return "r20170605" },
        pa = ja("false", !1),
        qa = ja("false", !1),
        ra = ja("false", !1),
        sa = ra || !qa;
    var v = function(a) {
            return a.replace(/^[\s\xa0]+|[\s\xa0]+$/g, "") },
        Aa = function(a) {
            if (!ta.test(a)) return a; - 1 != a.indexOf("&") && (a = a.replace(ua, "&amp;")); - 1 != a.indexOf("<") && (a = a.replace(va, "&lt;")); - 1 != a.indexOf(">") && (a = a.replace(wa, "&gt;")); - 1 != a.indexOf('"') && (a = a.replace(xa, "&quot;")); - 1 != a.indexOf("'") && (a = a.replace(ya, "&#39;")); - 1 != a.indexOf("\x00") && (a = a.replace(za, "&#0;"));
            return a },
        ua = /&/g,
        va = /</g,
        wa = />/g,
        xa = /"/g,
        ya = /'/g,
        za = /\x00/g,
        ta = /[\x00&<>"']/,
        Ba = {
            "\x00": "\\0",
            "\b": "\\b",
            "\f": "\\f",
            "\n": "\\n",
            "\r": "\\r",
            "\t": "\\t",
            "\x0B": "\\x0B",
            '"': '\\"',
            "\\": "\\\\",
            "<": "<"
        },
        Ca = { "'": "\\'" },
        Da = function(a, b) {
            return a < b ? -1 : a > b ? 1 : 0 },
        Ea = function(a) {
            return String(a).replace(/\-([a-z])/g, function(a, c) {
                return c.toUpperCase() }) };
    var Fa = function(a, b, c) {
            for (var d = a.length, e = "string" == typeof a ? a.split("") : a, f = 0; f < d; f++) f in e && b.call(c, e[f], f, a) },
        Ga = function(a, b) {
            for (var c = a.length, d = [], e = 0, f = "string" == typeof a ? a.split("") : a, g = 0; g < c; g++)
                if (g in f) {
                    var h = f[g];
                    b.call(void 0, h, g, a) && (d[e++] = h) }
            return d },
        Ha = function(a) {
            return Array.prototype.concat.apply([], arguments) };
    var Ia;
    a: {
        var Ja = l.navigator;
        if (Ja) {
            var Ka = Ja.userAgent;
            if (Ka) { Ia = Ka;
                break a } }
        Ia = "" }
    var A = function(a) {
        return -1 != Ia.indexOf(a) };
    var La = function(a, b) {
        for (var c in a)
            if (b.call(void 0, a[c], c, a)) return c };
    var Ma = function(a) { Ma[" "](a);
        return a };
    Ma[" "] = function() {};
    var Na = A("Opera"),
        Oa = A("Trident") || A("MSIE"),
        Pa = A("Edge"),
        Qa = A("Gecko") && !(-1 != Ia.toLowerCase().indexOf("webkit") && !A("Edge")) && !(A("Trident") || A("MSIE")) && !A("Edge"),
        Ra = -1 != Ia.toLowerCase().indexOf("webkit") && !A("Edge"),
        Sa = function() {
            var a = l.document;
            return a ? a.documentMode : void 0 },
        Ta;
    a: {
        var Ua = "",
            Va = function() {
                var a = Ia;
                if (Qa) return /rv\:([^\);]+)(\)|;)/.exec(a);
                if (Pa) return /Edge\/([\d\.]+)/.exec(a);
                if (Oa) return /\b(?:MSIE|rv)[: ]([^\);]+)(\)|;)/.exec(a);
                if (Ra) return /WebKit\/(\S+)/.exec(a);
                if (Na) return /(?:Version)[ \/]?(\S+)/.exec(a) }();Va && (Ua = Va ? Va[1] : "");
        if (Oa) {
            var Wa = Sa();
            if (null != Wa && Wa > parseFloat(Ua)) { Ta = String(Wa);
                break a } }
        Ta = Ua }
    var Xa = Ta,
        Ya = {},
        Za;
    var $a = l.document;
    Za = $a && Oa ? Sa() || ("CSS1Compat" == $a.compatMode ? parseInt(Xa, 10) : 5) : void 0;
    var ab;
    if (!(ab = !Qa && !Oa)) {
        var bb;
        if (bb = Oa) bb = 9 <= Number(Za);
        ab = bb }
    var cb;
    if (!(cb = ab)) {
        var db;
        if (db = Qa) {
            var eb;
            if (Object.prototype.hasOwnProperty.call(Ya, "1.9.1")) eb = Ya["1.9.1"];
            else {
                for (var fb = 0, gb = v(String(Xa)).split("."), hb = v("1.9.1").split("."), ib = Math.max(gb.length, hb.length), jb = 0; !fb && jb < ib; jb++) {
                    var kb = gb[jb] || "",
                        lb = hb[jb] || "";
                    do {
                        var mb = /(\d*)(\D*)(.*)/.exec(kb) || ["", "", "", ""],
                            nb = /(\d*)(\D*)(.*)/.exec(lb) || ["", "", "", ""];
                        if (0 == mb[0].length && 0 == nb[0].length) break;
                        fb = Da(0 == mb[1].length ? 0 : parseInt(mb[1], 10), 0 == nb[1].length ? 0 : parseInt(nb[1], 10)) || Da(0 == mb[2].length, 0 ==
                            nb[2].length) || Da(mb[2], nb[2]);
                        kb = mb[3];
                        lb = nb[3]
                    } while (!fb)
                }
                eb = Ya["1.9.1"] = 0 <= fb
            }
            db = eb
        }
        cb = db
    }
    var ob = cb;
    var pb = function(a) {
        return ob && a.children ? a.children : Ga(a.childNodes, function(a) {
            return 1 == a.nodeType }) };
    var B = function(a) {
            try {
                var b;
                if (b = !!a && null != a.location.href) a: {
                    try { Ma(a.foo);
                        b = !0;
                        break a } catch (c) {}
                    b = !1 }
                return b } catch (c) {
                return !1 } },
        qb = function(a, b) {
            var c = a.createElement("script");
            c.src = b;
            (a = a.getElementsByTagName("script")[0]) && a.parentNode && a.parentNode.insertBefore(c, a) },
        C = function(a, b) {
            return b.getComputedStyle ? b.getComputedStyle(a, null) : a.currentStyle },
        rb = function(a) {
            try {
                var b = new Uint32Array(1);
                a.crypto.getRandomValues(b);
                return b[0] / 65536 / 65536 } catch (c) {
                return Math.random() } },
        sb = function(a,
            b) {
            for (var c in a) Object.prototype.hasOwnProperty.call(a, c) && b.call(void 0, a[c], c, a) },
        tb = function(a) {
            var b = a.length;
            if (!b) return 0;
            for (var c = 305419896, d = 0; d < b; d++) c ^= (c << 5) + (c >> 2) + a.charCodeAt(d) & 4294967295;
            return 0 < c ? c : 4294967296 + c },
        ub = /^([0-9.]+)px$/,
        vb = /^(-?[0-9.]{1,30})$/,
        wb = function(a) {
            return vb.test(a) && (a = Number(a), !isNaN(a)) ? a : null },
        xb = function(a) {
            return (a = ub.exec(a)) ? +a[1] : null };
    var yb = function() {
            var a = !1;
            try {
                var b = Object.defineProperty({}, "passive", { get: function() { a = !0 } });
                l.addEventListener("test", null, b) } catch (c) {}
            return a }(),
        zb = function(a, b, c) { a.addEventListener ? a.addEventListener(b, c, yb ? void 0 : !1) : a.attachEvent && a.attachEvent("on" + b, c) },
        Ab = function(a, b, c) { a.removeEventListener ? a.removeEventListener(b, c, yb ? void 0 : !1) : a.detachEvent && a.detachEvent("on" + b, c) };
    var Bb = function(a) { a = a || l;
            var b = a.context;
            if (!b) try { b = a.parent.context } catch (c) {}
            try {
                if (b && "pageViewId" in b && "canonicalUrl" in b) return b } catch (c) {}
            return null },
        Cb = function(a) { a = a || Bb();
            if (!a) return null;
            a = a.master;
            return B(a) ? a : null };
    var Db = function(a, b) { l.google_image_requests || (l.google_image_requests = []);
        var c = l.document.createElement("img");
        if (b) {
            var d = function(a) { b(a);
                Ab(c, "load", d);
                Ab(c, "error", d) };
            zb(c, "load", d);
            zb(c, "error", d) }
        c.src = a;
        l.google_image_requests.push(c) };
    var Eb = Object.prototype.hasOwnProperty,
        Fb = function(a, b) {
            for (var c in a) Eb.call(a, c) && b.call(void 0, a[c], c, a) },
        Gb = function(a) {
            return !(!a || !a.call) && "function" === typeof a },
        Hb = function(a, b) {
            for (var c = 1, d = arguments.length; c < d; ++c) a.push(arguments[c]) },
        Ib = function(a, b) {
            if (a.indexOf) return a = a.indexOf(b), 0 < a || !a;
            for (var c = 0; c < a.length; c++)
                if (a[c] === b) return !0;
            return !1 },
        Jb = function(a) { a = Cb(Bb(a)) || a;
            a.google_unique_id ? ++a.google_unique_id : a.google_unique_id = 1 },
        Kb = function(a) {
            a = Cb(Bb(a)) || a;
            a = a.google_unique_id;
            return "number" === typeof a ? a : 0
        },
        Lb = !!window.google_async_iframe_id,
        Mb = Lb && window.parent || window,
        Nb = /(^| )adsbygoogle($| )/,
        Ob = function(a) { a = pa && a.google_top_window || a.top;
            return B(a) ? a : null };
    var D = function(a, b) { a = a.google_ad_modifications;
            return Ib(a ? a.eids || [] : [], b) },
        E = function(a, b) { a = a.google_ad_modifications;
            return Ib(a ? a.loeids || [] : [], b) },
        Pb = function(a, b, c) {
            if (!a) return null;
            for (var d = 0; d < a.length; ++d)
                if ((a[d].ad_slot || b) == b && (a[d].ad_tag_origin || c) == c) return a[d];
            return null };
    var Qb = function(a, b, c) { c = c ? c : {};
        this.error = a;
        this.context = b.context;
        this.line = b.line || -1;
        this.msg = b.message || "";
        this.file = b.file || "";
        this.id = b.id || "jserror";
        this.meta = c };
    var Rb = function(a, b) { this.j = a;
            this.l = b },
        Sb = function(a, b, c) { this.url = a;
            this.j = b;
            this.Z = !!c;
            this.depth = ba(void 0) ? void 0 : null };
    var Tb = function(a, b, c, d, e) { this.w = c || 4E3;
            this.m = a || "&";
            this.B = b || ",$";
            this.s = void 0 !== d ? d : "trn";
            this.M = e || null;
            this.v = !1;
            this.l = {};
            this.C = 0;
            this.j = [] },
        Ub = function(a, b) {
            var c = {};
            c[a] = b;
            return [c] },
        Wb = function(a, b, c, d, e) {
            var f = [];
            sb(a, function(a, h) {
                (a = Vb(a, b, c, d, e)) && f.push(h + "=" + a) });
            return f.join(b) },
        Vb = function(a, b, c, d, e) {
            if (null == a) return "";
            b = b || "&";
            c = c || ",$";
            "string" == typeof c && (c = c.split(""));
            if (a instanceof Array) {
                if (d = d || 0, d < c.length) {
                    for (var f = [], g = 0; g < a.length; g++) f.push(Vb(a[g], b, c, d + 1, e));
                    return f.join(c[d])
                }
            } else if ("object" == typeof a) return e = e || 0, 2 > e ? encodeURIComponent(Wb(a, b, c, d, e + 1)) : "...";
            return encodeURIComponent(String(a))
        },
        Xb = function(a, b, c, d) { a.j.push(b);
            a.l[b] = Ub(c, d) },
        Zb = function(a, b, c, d) {
            b = b + "//" + c + d;
            var e = Yb(a) - d.length - 0;
            if (0 > e) return "";
            a.j.sort(function(a, b) {
                return a - b });
            d = null;
            c = "";
            for (var f = 0; f < a.j.length; f++)
                for (var g = a.j[f], h = a.l[g], k = 0; k < h.length; k++) {
                    if (!e) { d = null == d ? g : d;
                        break }
                    var m = Wb(h[k], a.m, a.B);
                    if (m) {
                        m = c + m;
                        if (e >= m.length) { e -= m.length;
                            b += m;
                            c = a.m;
                            break } else a.v &&
                            (c = e, m[c - 1] == a.m && --c, b += m.substr(0, c), c = a.m, e = 0);
                        d = null == d ? g : d
                    }
                }
            f = "";
            a.s && null != d && (f = c + a.s + "=" + (a.M || d));
            return b + f + ""
        },
        Yb = function(a) {
            if (!a.s) return a.w;
            var b = 1,
                c;
            for (c in a.l) b = c.length > b ? c.length : b;
            return a.w - a.s.length - b - a.m.length - 1 };
    var $b = function(a, b, c, d, e, f) {
        if ((d ? a.v : Math.random()) < (e || a.j)) try {
            if (c instanceof Tb) var g = c;
            else g = new Tb, sb(c, function(a, b) {
                var c = g,
                    d = c.C++;
                a = Ub(b, a);
                c.j.push(d);
                c.l[d] = a });
            var h = Zb(g, a.s, a.l, a.m + b + "&");
            h && ("undefined" === typeof f ? Db(h) : Db(h, f)) } catch (k) {} };
    var ac = function(a, b) { this.start = a < b ? a : b;
        this.j = a < b ? b : a };
    var bc = function(a, b) { this.j = b >= a ? new ac(a, b) : null },
        cc = function() {
            try {
                var a = parseInt(u.localStorage.getItem("google_experiment_mod"), 10) } catch (b) {
                return null }
            if (0 <= a && 1E3 > a) return a;
            a = Math.floor(1E3 * rb(u));
            try {
                return u.localStorage.setItem("google_experiment_mod", "" + a), a } catch (b) {
                return null } };
    var dc = !1,
        ec = function(a) {
            try {
                var b = (a || l).top.location.hash;
                if (b) {
                    var c = b.match(/\bdeid=([\d,]+)/);
                    return c && c[1] || "" } } catch (d) {}
            return "" },
        fc = function(a, b) {
            var c;
            if (c = (c = ec().match(new RegExp("\\b(" + a.join("|") + ")\\b"))) && c[0] || null) a = c;
            else if (dc) a = null;
            else a: {
                if (!(1E-4 > Math.random()) && (c = Math.random(), c < b)) { c = rb(l);
                    a = a[Math.floor(c * a.length)];
                    break a }
                a = null }
            return a };
    var hc = function(a, b) {
        var c = gc();
        this.label = a;
        this.type = b;
        this.value = c;
        this.duration = 0;
        this.uniqueId = this.label + "_" + this.type + "_" + Math.random() };
    var ic = function(a, b) { this.events = [];
        this.l = b || l;
        var c = null;
        b && (b.google_js_reporting_queue = b.google_js_reporting_queue || [], this.events = b.google_js_reporting_queue, c = b.google_measure_js_timing);
        b = ec(this.l);
        b = b.indexOf && 0 <= b.indexOf("1337");
        this.j = (this.j = null != c ? c : Math.random() < a) || b;
        a = this.l.performance;
        this.m = !!(a && a.mark && a.clearMarks && b) };
    ic.prototype.s = function(a) {
        if (a && this.m) {
            var b = this.l.performance;
            b.clearMarks("goog_" + a.uniqueId + "_start");
            b.clearMarks("goog_" + a.uniqueId + "_end") } };
    ic.prototype.start = function(a, b) {
        if (!this.j) return null;
        a = new hc(a, b);
        this.m && this.l.performance.mark("goog_" + a.uniqueId + "_start");
        return a };
    var gc = function() {
        var a = l.performance;
        return a && a.now ? a.now() : +new Date };
    var jc = function(a, b, c, d) { this.w = a;
            this.C = b;
            this.s = c;
            this.m = null;
            this.B = this.j;
            this.l = void 0 === d ? null : d;
            this.v = !1 },
        mc = function(a, b, c, d, e) {
            try {
                if (a.l && a.l.j) {
                    var f = a.l.start(b.toString(), 3);
                    var g = c();
                    var h = a.l;
                    c = f;
                    h.j && (c.duration = gc() - c.value, h.m && h.l.performance.mark("goog_" + c.uniqueId + "_end"), h.j && h.events.push(c)) } else g = c() } catch (k) { h = a.s;
                try { a.l && f && a.l.s(f), h = (e || a.B).call(a, b, new kc(lc(k), k.fileName, k.lineNumber), void 0, d) } catch (m) { a.j(217, m) }
                if (!h) throw k; }
            return g },
        nc = function(a, b) {
            var c =
                F;
            return function(d) {
                for (var e = [], f = 0; f < arguments.length; ++f) e[f - 0] = arguments[f];
                return mc(c, a, function() {
                    return b.apply(void 0, e) }, void 0, void 0) }
        };
    jc.prototype.j = function(a, b, c, d, e) {
        e = e || this.C;
        try {
            var f = new Tb;
            f.v = !0;
            Xb(f, 1, "context", a);
            b.error && b.meta && b.id || (b = new kc(lc(b), b.fileName, b.lineNumber));
            b.msg && Xb(f, 2, "msg", b.msg.substring(0, 512));
            b.file && Xb(f, 3, "file", b.file);
            0 < b.line && Xb(f, 4, "line", b.line);
            var g = b.meta || {};
            if (this.m) try { this.m(g) } catch (H) {}
            if (d) try { d(g) } catch (H) {}
            b = [g];
            f.j.push(5);
            f.l[5] = b;
            d = l;
            b = [];
            var g = null;
            do {
                var h = d;
                if (B(h)) {
                    var k = h.location.href;
                    g = h.document && h.document.referrer || null } else k = g, g = null;
                b.push(new Sb(k || "",
                    h));
                try { d = h.parent } catch (H) { d = null }
            } while (d && h != d);
            k = 0;
            for (var m = b.length - 1; k <= m; ++k) b[k].depth = m - k;
            h = l;
            if (h.location && h.location.ancestorOrigins && h.location.ancestorOrigins.length == b.length - 1)
                for (k = 1; k < b.length; ++k) {
                    var r = b[k];
                    r.url || (r.url = h.location.ancestorOrigins[k - 1] || "", r.Z = !0) }
            var w = new Sb(l.location.href, l, !1),
                p = b.length - 1;
            for (h = p; 0 <= h; --h) {
                var y = b[h];
                if (y.url && !y.Z) { w = y;
                    break } }
            var y = null,
                x = b.length && b[p].url;
            0 != w.depth && x && (y = b[p]);
            var z = new Rb(w, y);
            z.l && Xb(f, 6, "top", z.l.url || "");
            Xb(f, 7,
                "url", z.j.url || "");
            $b(this.w, e, f, this.v, c)
        } catch (H) {
            try { $b(this.w, e, { context: "ecmserr", rctx: a, msg: lc(H), url: z.j.url }, this.v, c) } catch (se) {} }
        return this.s
    };
    var lc = function(a) {
            var b = a.toString();
            a.name && -1 == b.indexOf(a.name) && (b += ": " + a.name);
            a.message && -1 == b.indexOf(a.message) && (b += ": " + a.message);
            if (a.stack) { a = a.stack;
                var c = b;
                try {-1 == a.indexOf(c) && (a = c + "\n" + a);
                    for (var d; a != d;) d = a, a = a.replace(/((https?:\/..*\/)[^\/:]*:\d+(?:.|\n)*)\2/, "$1");
                    b = a.replace(/\n */g, "\n") } catch (e) { b = c } }
            return b },
        kc = function(a, b, c) { Qb.call(this, Error(a), { message: a, file: void 0 === b ? "" : b, line: void 0 === c ? -1 : c }) };
    aa(kc, Qb);
    var oc, F;
    if (Lb && !B(Mb)) {
        var pc = "." + t.domain;
        try {
            for (; 2 < pc.split(".").length && !B(Mb);) t.domain = pc = pc.substr(pc.indexOf(".") + 1), Mb = window.parent } catch (a) {}
        B(Mb) || (Mb = window) }
    var qc = Mb,
        G = new ic(1, qc),
        rc = function(a) { null != a && (qc.google_measure_js_timing = a);
            qc.google_measure_js_timing || (G.events != G.l.google_js_reporting_queue && (G.events.length = 0, G.m && Fa(G.events, G.s, G)), G.j = !1) };
    oc = new function() { this.s = "http:" === u.location.protocol ? "http:" : "https:";
        this.l = "pagead2.googlesyndication.com";
        this.m = "/pagead/gen_204?id=";
        this.j = .01;
        this.v = Math.random() };
    F = new jc(oc, "jserror", !0, G);
    "complete" == qc.document.readyState ? rc() : G.j && zb(qc, "load", function() { rc() });
    var uc = function() {
            var a = [sc, tc];
            F.m = function(b) { Fa(a, function(a) { a(b) }) } },
        vc = function(a, b, c, d) {
            return mc(F, a, c, d, b) },
        wc = function(a, b) {
            return nc(a, b) },
        xc = F.j;
    var yc = function(a, b) { a.location.href && a.location.href.substring && (b.url = a.location.href.substring(0, 200));
        $b(oc, "ama", b, !0, .01, void 0) };
    var zc = function(a, b, c) { c || (c = sa ? "https" : "http");
        u.location && "https:" == u.location.protocol && "http" == c && (c = "https");
        return [c, "://", a, b].join("") };
    var Ac = new function() { this.j = "google-auto-placed";
        this.l = { google_tag_origin: "qs" } };
    var Bc = A("Safari") && !((A("Chrome") || A("CriOS")) && !A("Edge") || A("Coast") || A("Opera") || A("Edge") || A("Silk") || A("Android")) && !(A("iPhone") && !A("iPod") && !A("iPad") || A("iPad") || A("iPod"));
    var Cc = null,
        Dc = null,
        Ec = Qa || Ra && !Bc || Na || "function" == typeof l.btoa,
        Fc = function(a, b) {
            if (Ec && !b) var c = l.btoa(a);
            else {
                c = [];
                for (var d = 0, e = 0; e < a.length; e++) {
                    for (var f = a.charCodeAt(e); 255 < f;) c[d++] = f & 255, f >>= 8;
                    c[d++] = f }
                if (!Cc)
                    for (Cc = {}, Dc = {}, a = 0; 65 > a; a++) Cc[a] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=".charAt(a), Dc[a] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_.".charAt(a);
                b = b ? Dc : Cc;
                a = [];
                for (d = 0; d < c.length; d += 3) {
                    var g = c[d],
                        h = (e = d + 1 < c.length) ? c[d + 1] : 0,
                        k = (f = d +
                            2 < c.length) ? c[d + 2] : 0,
                        m = g >> 2,
                        g = (g & 3) << 4 | h >> 4,
                        h = (h & 15) << 2 | k >> 6,
                        k = k & 63;
                    f || (k = 64, e || (h = 64));
                    a.push(b[m], b[g], b[h], b[k])
                }
                c = a.join("")
            }
            return c
        };
    var I = function() {},
        Gc = "function" == typeof Uint8Array,
        J = function(a, b, c) { a.j = null;
            b || (b = []);
            a.B = void 0;
            a.s = -1;
            a.l = b;
            a: {
                if (a.l.length) { b = a.l.length - 1;
                    var d = a.l[b];
                    if (d && "object" == typeof d && "array" != ca(d) && !(Gc && d instanceof Uint8Array)) { a.v = b - a.s;
                        a.m = d;
                        break a } }
                a.v = Number.MAX_VALUE }
            a.w = {};
            if (c)
                for (b = 0; b < c.length; b++) d = c[b], d < a.v ? (d += a.s, a.l[d] = a.l[d] || Hc) : a.m[d] = a.m[d] || Hc },
        Hc = [],
        K = function(a, b) {
            if (b < a.v) { b += a.s;
                var c = a.l[b];
                return c === Hc ? a.l[b] = [] : c }
            c = a.m[b];
            return c === Hc ? a.m[b] = [] : c },
        Ic = function(a,
            b, c) { a.j || (a.j = {});
            if (!a.j[c]) {
                var d = K(a, c);
                d && (a.j[c] = new b(d)) }
            return a.j[c] },
        Jc = function(a, b, c) { a.j || (a.j = {});
            if (!a.j[c]) {
                for (var d = K(a, c), e = [], f = 0; f < d.length; f++) e[f] = new b(d[f]);
                a.j[c] = e }
            b = a.j[c];
            b == Hc && (b = a.j[c] = []);
            return b },
        Kc = function(a) {
            if (a.j)
                for (var b in a.j) {
                    var c = a.j[b];
                    if ("array" == ca(c))
                        for (var d = 0; d < c.length; d++) c[d] && Kc(c[d]);
                    else c && Kc(c) } };
    I.prototype.toString = function() { Kc(this);
        return this.l.toString() };
    var Lc = function(a) { J(this, a, null) };
    q(Lc, I);
    var Nc = function(a) { J(this, a, Mc) };
    q(Nc, I);
    var Mc = [4],
        Oc = function(a) { J(this, a, null) };
    q(Oc, I);
    var Pc = function(a) { J(this, a, null) };
    q(Pc, I);
    var Rc = function(a) { J(this, a, Qc) };
    q(Rc, I);
    var Qc = [6, 7, 9];
    var Tc = function(a) { J(this, a, Sc) };
    q(Tc, I);
    var Sc = [1, 2, 5, 7],
        Uc = function(a) { J(this, a, null) };
    q(Uc, I);
    var Wc = function(a) { J(this, a, Vc) };
    q(Wc, I);
    var Vc = [2];
    var Xc = { overlays: 1, interstitials: 2, vignettes: 2, inserts: 3, immersives: 4, list_view: 5, full_page: 6 };
    var Yc = null,
        Zc = function() {
            if (!Yc) {
                for (var a = l, b = a, c = 0; a && a != a.parent;)
                    if (a = a.parent, c++, B(a)) b = a;
                    else break;
                Yc = b }
            return Yc };
    var $c = { D: "368226004", A: "368226005" },
        ad = { D: "368226014", A: "368226015" },
        bd = { o: "10583695", u: "10583696" },
        cd = { o: "10573695", u: "10573696" },
        dd = { o: "10593695", u: "10593696" },
        ed = { o: "4089037", u: "4089038" },
        L = { o: "4089040", O: "4089041", P: "4089042", R: "4089043" },
        fd = { o: "4089045", u: "4089046" },
        gd = { W: "20040067", o: "20040068", V: "1337" },
        M = { o: "62710010", VIEWPORT: "62710011", L: "62710012" },
        hd = { o: "62710013", VIEWPORT: "62710014", L: "62710015" },
        id = { o: "201222021", I: "201222022", J: "201222023" },
        jd = { o: "201222031", I: "201222032", J: "201222033" },
        kd = { o: "20040000", u: "20040001" },
        N = { N: "21060497", U: "21060498", T: "21060499", K: "21060500" },
        ld = { o: "21060538", u: "21060539" },
        md = { o: "191880400", u: "191880401" },
        nd = { o: "191880410", u: "191880411" },
        od = { o: "156549041", G: "156549042", H: "156549043", F: "156549044" },
        pd = { o: "156549051", G: "156549052", H: "156549053", F: "156549054" },
        qd = { o: "21060518", u: "21060519" },
        dc = !1;
    var O = function(a) { a = a.document;
        return ("CSS1Compat" == a.compatMode ? a.documentElement : a.body) || {} };
    var rd = function(a) {
        var b = ["adsbygoogle-placeholder"];
        a = a.className ? a.className.split(/\s+/) : [];
        for (var c = {}, d = 0; d < a.length; ++d) c[a[d]] = !0;
        for (d = 0; d < b.length; ++d)
            if (!c[b[d]]) return !1;
        return !0 };
    var sd = function(a, b) {
        for (var c = 0; c < b.length; c++) {
            var d = b[c],
                e = Ea(d.oa);
            a[e] = d.value } };
    var td = function(a, b) { Array.prototype.slice.call(a).forEach(b, void 0) };
    var ud = function(a, b, c, d) { this.s = a;
        this.l = b;
        this.m = c;
        this.j = d };
    ud.prototype.toString = function() {
        return JSON.stringify({ nativeQuery: this.s, occurrenceIndex: this.l, paragraphIndex: this.m, ignoreMode: this.j }) };
    var vd = function(a, b) {
            if (null == a.j) return b;
            switch (a.j) {
                case 1:
                    return b.slice(1);
                case 2:
                    return b.slice(0, b.length - 1);
                case 3:
                    return b.slice(1, b.length - 1);
                case 0:
                    return b;
                default:
                    throw Error("Unknown ignore mode: " + a.j); } },
        xd = function(a) {
            var b = [];
            td(a.getElementsByTagName("p"), function(a) { 100 <= wd(a) && b.push(a) });
            return b },
        wd = function(a) {
            if (3 == a.nodeType) return a.length;
            if (1 != a.nodeType || "SCRIPT" == a.tagName) return 0;
            var b = 0;
            td(a.childNodes, function(a) { b += wd(a) });
            return b },
        yd = function(a) {
            return !a.length ||
                isNaN(a[0]) ? a : "\\" + (30 + parseInt(a[0], 10)) + " " + a.substring(1)
        };
    var zd = { 1: 1, 2: 2, 3: 3, 0: 0 },
        Ad = function(a) {
            return null != a ? zd[a] : a },
        Bd = { 1: 0, 2: 1, 3: 2, 4: 3 };
    var Cd = function(a, b) {
            if (!a) return !1;
            a = C(a, b);
            if (!a) return !1;
            a = a.cssFloat || a.styleFloat;
            return "left" == a || "right" == a },
        Dd = function(a) {
            for (a = a.previousSibling; a && 1 != a.nodeType;) a = a.previousSibling;
            return a ? a : null },
        Ed = function(a) {
            return !!a.nextSibling || !!a.parentNode && Ed(a.parentNode) };
    var Gd = function() { this.l = new Fd(this);
            this.j = 0 },
        Hd = function(a) {
            if (0 != a.j) throw Error("Already resolved/rejected."); },
        Fd = function(a) { this.j = a };
    Fd.prototype.then = function(a, b) {
        if (this.l) throw Error("Then functions already set.");
        this.l = a;
        this.m = b;
        Id(this) };
    var Id = function(a) {
        switch (a.j.j) {
            case 0:
                break;
            case 1:
                a.l && a.l(a.j.s);
                break;
            case 2:
                a.m && a.m(a.j.m);
                break;
            default:
                throw Error("Unhandled deferred state."); } };
    var Jd = function(a) { this.exception = a },
        Kd = function(a, b, c, d) { this.l = a;
            this.m = b;
            this.v = c;
            this.j = d };
    Kd.prototype.start = function() { this.s() };
    Kd.prototype.s = function() {
        try {
            switch (this.l.document.readyState) {
                case "complete":
                case "interactive":
                    Ld(this.m, !0);
                    Md(this);
                    break;
                default:
                    Ld(this.m, !1) ? Md(this) : this.l.setTimeout(n(this.s, this), this.v) } } catch (a) { Md(this, a) } };
    var Md = function(a, b) {
        try {
            var c = a.j,
                d = new Jd(b);
            Hd(c);
            c.j = 1;
            c.s = d;
            Id(c.l) } catch (e) { a = a.j, b = e, Hd(a), a.j = 2, a.m = b, Id(a.l) } };
    var Nd = function(a, b) { this.j = l;
            this.v = a;
            this.s = b;
            this.m = Ac || null;
            this.l = !1 },
        Ld = function(a, b) {
            if (a.l) return !0;
            try {
                var c = a.j.localStorage.getItem("google_ama_settings");
                var d = c ? new Lc(c ? JSON.parse(c) : null) : null } catch (g) { d = null }
            if (c = null !== d) d = K(d, 2), c = null == d ? !1 : d;
            if (c) return a = a.j.google_ama_state = a.j.google_ama_state || {}, a.eatf = !0;
            c = Jc(a.s, Rc, 1);
            for (d = 0; d < c.length; d++) {
                var e = c[d];
                if (1 == K(e, 8)) {
                    var f = Ic(e, Pc, 4);
                    if (f && 2 == K(f, 1) && Od(a, e, b)) return a.l = !0, a = a.j.google_ama_state = a.j.google_ama_state || {},
                        a.placement = d, !0
                }
            }
            return !1
        },
        Od = function(a, b, c) {
            if (1 != K(b, 8)) return !1;
            var d = Ic(b, Nc, 1);
            if (!d) return !1;
            var e = K(d, 7);
            if (K(d, 1) || K(d, 3) || 0 < K(d, 4).length) {
                var f = K(d, 3),
                    g = K(d, 1),
                    h = K(d, 4);
                e = K(d, 2);
                var k = K(d, 5),
                    d = Ad(K(d, 6)),
                    m = "";
                g && (m += g);
                f && (m += "#" + yd(f));
                if (h)
                    for (f = 0; f < h.length; f++) m += "." + yd(h[f]);
                e = (h = m) ? new ud(h, e, k, d) : null } else e = e ? new ud(e, K(d, 2), K(d, 5), Ad(K(d, 6))) : null;
            if (!e) return !1;
            k = [];
            try { k = a.j.document.querySelectorAll(e.s) } catch (y) {}
            if (k.length) {
                h = k.length;
                if (0 < h) {
                    d = Array(h);
                    for (f = 0; f < h; f++) d[f] =
                        k[f];
                    k = d
                } else k = [];
                k = vd(e, k);
                ba(e.l) && (h = e.l, 0 > h && (h += k.length), k = 0 <= h && h < k.length ? [k[h]] : []);
                if (ba(e.m)) { h = [];
                    for (d = 0; d < k.length; d++) f = xd(k[d]), g = e.m, 0 > g && (g += f.length), 0 <= g && g < f.length && h.push(f[g]);
                    k = h }
                e = k
            } else e = [];
            if (!e.length) return !1;
            e = e[0];
            k = K(b, 2);
            k = Bd[k];
            k = void 0 !== k ? k : null;
            if (!(h = null == k)) {
                a: { h = a.j;
                    switch (k) {
                        case 0:
                            h = Cd(Dd(e), h);
                            break a;
                        case 3:
                            h = Cd(e, h);
                            break a;
                        case 2:
                            d = e.lastChild;
                            h = Cd(d ? 1 == d.nodeType ? d : Dd(d) : null, h);
                            break a }
                    h = !1 }
                if (c = !h && !(!c && 2 == k && !Ed(e))) c = 1 == k || 2 == k ? e : e.parentNode,
                c = !(c && (1 != c.nodeType || "INS" != c.tagName || !rd(c)) && 0 >= c.offsetWidth);h = !c
            }
            if (h) return !1;
            b = Ic(b, Oc, 3);
            h = {};
            b && (h.aa = K(b, 1), h.Y = K(b, 2), h.ga = !!K(b, 3));
            b = a.j;
            c = a.m;
            d = a.v;
            f = b.document;
            a = f.createElement("div");
            g = a.style;
            g.textAlign = "center";
            g.width = "100%";
            g.height = "auto";
            g.clear = h.ga ? "both" : "none";
            h.ha && sd(g, h.ha);
            f = f.createElement("ins");
            g = f.style;
            g.display = "block";
            g.margin = "auto";
            g.backgroundColor = "transparent";
            h.aa && (g.marginTop = h.aa);
            h.Y && (g.marginBottom = h.Y);
            h.fa && sd(g, h.fa);
            a.appendChild(f);
            f.setAttribute("data-ad-format",
                "auto");
            h = [];
            if (g = c && c.j) a.className = g;
            f.className = "adsbygoogle";
            f.setAttribute("data-ad-client", d);
            h.length && f.setAttribute("data-ad-channel", h.join("+"));
            var r;
            a: {
                try {
                    switch (k) {
                        case 0:
                            e.parentNode && e.parentNode.insertBefore(a, e);
                            break;
                        case 3:
                            var w = e.parentNode;
                            if (w) {
                                var p = e.nextSibling;
                                if (p && p.parentNode != w)
                                    for (; p && 8 == p.nodeType;) p = p.nextSibling;
                                w.insertBefore(a, p) }
                            break;
                        case 1:
                            e.insertBefore(a, e.firstChild);
                            break;
                        case 2:
                            e.appendChild(a) }
                    if (1 != e.nodeType ? 0 : "INS" == e.tagName && rd(e)) e.style.display =
                        "block";
                    f.setAttribute("data-adsbygoogle-status", "reserved");
                    w = { element: f };
                    (r = c && c.l) && (w.params = r);
                    (b.adsbygoogle = b.adsbygoogle || []).push(w)
                } catch (y) { a && a.parentNode && a.parentNode.removeChild(a);
                    r = !1;
                    break a }
                r = !0
            }
            return r ? !0 : !1
        };
    var Pd = function(a) { yc(a, { atf: 1 }) },
        Qd = function(a, b) {
            (a.google_ama_state = a.google_ama_state || {}).exception = b;
            yc(a, { atf: 0 }) };
    var Rd = function() { this.wasPlaTagProcessed = !1;
        this.wasReactiveAdConfigReceived = {};
        this.adCount = {};
        this.wasReactiveAdVisible = {};
        this.stateForType = {};
        this.reactiveTypeEnabledByReactiveTag = {};
        this.isReactiveTagFirstOnPage = this.wasReactiveAdConfigHandlerRegistered = this.wasReactiveTagRequestSent = !1;
        this.reactiveTypeDisabledByPublisher = {};
        this.debugCard = null;
        this.messageValidationEnabled = this.debugCardRequested = !1;
        this.adRegion = this.floatingAdsFillMessage = this.grappleTagStatusService = null };
    var Sd = function(a) {
        if (!a) return !1;
        a = pb(a);
        if (!a) return !1;
        for (var b = 0; b < a.length; b++)
            if (a[b].hasAttribute("data-google-ad-template")) return !0;
        return !1 };
    var Td = { "120x90": !0, "160x90": !0, "180x90": !0, "200x90": !0, "468x15": !0, "728x15": !0 },
        Ud = function(a, b) {
            if (15 == b) {
                if (728 <= a) return 728;
                if (468 <= a) return 468 } else if (90 == b) {
                if (200 <= a) return 200;
                if (180 <= a) return 180;
                if (160 <= a) return 160;
                if (120 <= a) return 120 }
            return null };
    var tc = function(a) {
            try {
                var b = l.google_ad_modifications;
                if (b) {
                    var c = Ha(b.eids, b.loeids);
                    c && 0 < c.length && (a.eid = c.join(",")) } } catch (d) {} },
        sc = function(a) { a.shv = oa() };
    F.s = !pa;
    var P = function(a, b) { this.s = a;
        this.m = b };
    P.prototype.minWidth = function() {
        return this.s };
    P.prototype.height = function() {
        return this.m };
    P.prototype.j = function(a) {
        return 300 < a && 300 < this.m ? this.s : Math.min(1200, Math.round(a)) };
    P.prototype.l = function(a) {
        return this.j(a) + "x" + this.height() };
    var Vd = { rectangle: 1, horizontal: 2, vertical: 4 },
        Q = function(a, b, c) { P.call(this, a, b);
            this.ia = c };
    aa(Q, P);
    var Wd = function(a) {
            return function(b) {
                return !!(b.ia & a) } },
        Xd = function(a, b) { P.call(this, a, b) };
    aa(Xd, P);
    Xd.prototype.j = function() {
        return this.minWidth() };
    var R = [new Q(970, 90, 2), new Q(728, 90, 2), new Q(468, 60, 2), new Q(336, 280, 1), new Q(320, 100, 2), new Q(320, 50, 2), new Q(300, 600, 4), new Q(300, 250, 1), new Q(250, 250, 1), new Q(234, 60, 2), new Q(200, 200, 1), new Q(180, 150, 1), new Q(160, 600, 4), new Q(125, 125, 1), new Q(120, 600, 4), new Q(120, 240, 4)],
        Yd = [R[6], R[12], R[3], R[0], R[7], R[14], R[1], R[8], R[10], R[4], R[15], R[2], R[11], R[5], R[13], R[9]],
        Zd = new Q(120, 120, 1),
        $d = new Q(120, 50, 2);

    function ae(a, b) {
        for (var c = ["width", "height"], d = 0; d < c.length; d++) {
            var e = "google_ad_" + c[d];
            if (!b.hasOwnProperty(e)) {
                var f = xb(a[c[d]]),
                    f = null === f ? null : Math.round(f);
                null != f && (b[e] = f) } } }
    var be = function(a, b) { do {
                var c = C(a, b);
                if (c && "fixed" == c.position) return !1 } while (a = a.parentElement);
            return !0 },
        ce = function(a) {
            var b = 0,
                c;
            for (c in Vd) - 1 != a.indexOf(c) && (b |= Vd[c]);
            return b };
    var de = function(a, b, c) {
            if (a.style) {
                var d = xb(a.style[c]);
                if (d) return d }
            if (a = C(a, b))
                if (c = xb(a[c])) return c;
            return null },
        ee = function(a) {
            return function(b) {
                return b.minWidth() <= a } },
        he = function(a, b, c) {
            var d = a && fe(c, b),
                e = ge(b);
            return function(a) {
                return !(d && a.height() >= e) } },
        fe = function(a, b) {
            try {
                var c = b.document.documentElement.getBoundingClientRect(),
                    d = a.getBoundingClientRect();
                var e = { x: d.left - c.left, y: d.top - c.top } } catch (f) { e = null }
            a = e;
            return (a ? a.y : 0) < O(b).clientHeight - 100 },
        ie = function(a, b) {
            var c = Infinity;
            do {
                var d = de(b, a, "height");
                d && (c = Math.min(c, d));
                (d = de(b, a, "maxHeight")) && (c = Math.min(c, d)) } while ((b = b.parentElement) && "HTML" != b.tagName);
            return c
        },
        ge = function(a) {
            var b = !Kb(a);
            return E(a, jd.I) || E(a, jd.J) && b ? 2 * O(a).clientHeight / 3 : 250 };
    var je = function(a) {
            return function(b) {
                for (var c = a.length - 1; 0 <= c; --c)
                    if (!a[c](b)) return !1;
                return !0 } },
        ke = function(a, b, c) {
            for (var d = a.length, e = null, f = 0; f < d; ++f) {
                var g = a[f];
                if (b(g)) {
                    if (!c || c(g)) return g;
                    null === e && (e = g) } }
            return e };
    var S = function(a, b) { this.l = a;
        this.j = b };
    var T = function(a) { this.name = "TagError";
        this.message = a ? "adsbygoogle.push() error: " + a : "";
        Error.captureStackTrace ? Error.captureStackTrace(this, T) : this.stack = Error().stack || "" };
    q(T, Error);
    var le = function(a) {
        return !(a.error && a.meta && a.id ? a.msg || lc(a.error) : lc(a)).indexOf("TagError") };
    var me = function(a, b, c, d, e) {
            if (!E(c, ad.A) && !E(c, ad.D)) return a;
            e.google_full_width_responsive_allowed = !1;
            if ("true" == e.google_full_width_responsive_optout || !("auto" == b && 488 > O(c).clientWidth && c.innerHeight >= c.innerWidth)) return a;
            b = O(c).clientWidth;
            var f = b - a;
            if (!(f = !b || 5 > f || .3 < f / b || (pa && c.google_top_window || c.top) != c || !(e.google_safe_for_responsive_override = be(d, c)))) a: {
                for (var f = O(c).clientWidth, g = d.parentElement, h = 0; 100 > h && g; h++) {
                    var k = C(g, c);
                    if ("hidden" == k.overflow && (k = xb(k.width)) && k < f) { f = !0;
                        break a }
                    g =
                        g.parentElement
                }
                f = !1
            }
            if (f) return a;
            f = d.parentElement;
            if (!f) return a;
            e.google_full_width_responsive_allowed = !0;
            if (!E(c, ad.A)) return a;
            e = C(f, c);
            e = xb(e.paddingLeft) || 0;
            for (h = g = 0; 100 > h && f; h++) g += f.offsetLeft + f.clientLeft - f.scrollLeft, f = f.offsetParent;
            e = g + e;
            "rtl" == C(d, c).direction ? d.style.marginRight = -1 * (b - a - e) + "px" : d.style.marginLeft = -1 * e + "px";
            d.style.width = b + "px";
            d.style.zIndex = 30;
            return b
        },
        qe = function(a, b, c, d, e) {
            e = e || {};
            var f = a;
            a = vc(247, xc, function() {
                return me(a, b, c, d, e) });
            var g = f != a,
                f = "auto" == b ? .25 >=
                a / Math.min(1200, O(c).clientWidth) ? 4 : 3 : ce(b);
            e.google_responsive_formats = f;
            var h = !(A("iPad") || A("Android") && !A("Mobile") || A("Silk")) && (A("iPod") || A("iPhone") || A("Android") || A("IEMobile")) && !fe(d, c) && (e.google_safe_for_responsive_override = be(d, c)),
                k = (h ? Yd : R).slice(0),
                k = Ha(k, ne(c)),
                m = 488 > O(c).clientWidth,
                m = [ee(a), oe(m), he(m, c, d), Wd(f)],
                r = [];
            if (h) {
                var w = ie(c, d);
                r.push(function(a) {
                    return a.height() <= w }) }
            var p = ke(k, je(m), je(r));
            if (!p) throw new T("No slot size for availableWidth=" + a);
            p = vc(248, xc, function() {
                var b =
                    a;
                var e = p;
                if (g)
                    if (E(c, ad.A))
                        if (fe(d, c)) b = new Xd(b, e.height());
                        else {
                            var e = b / 1.2,
                                f = ie(c, d),
                                f = Math.min(e, f);
                            if (f < .5 * e || 100 > f) f = e;
                            b = new Xd(b, Math.floor(f)) }
                else throw Error("Slot was expanded without experiment");
                else b = e;
                return b
            });
            return new S(pe(b, f), p)
        };

    function pe(a, b) {
        if ("auto" == a) return 1;
        switch (b) {
            case 2:
                return 2;
            case 1:
                return 3;
            case 4:
                return 4;
            case 3:
                return 5;
            case 6:
                return 6;
            case 5:
                return 7;
            case 7:
                return 8 }
        throw Error("bad mask"); }

    function oe(a) {
        return function(b) {
            return !(320 == b.minWidth() && (a && 50 == b.height() || !a && 100 == b.height())) } }

    function ne(a) {
        var b = [],
            c = E(a, pd.F);
        (E(a, pd.G) || c) && b.push(Zd);
        (E(a, pd.H) || c) && b.push($d);
        return b };
    var re = { ma: "google_content_recommendation_ui_type", ka: "google_content_recommendation_columns_num", la: "google_content_recommendation_rows_num" },
        te = { image_stacked: 1 / 1.91, image_sidebyside: 1 / 3.82, image_card_stacked: 1 / 1.91, image_card_sidebyside: 1 / 3.74, text: 0 },
        ue = { image_sidebyside: .2667 },
        ve = { image_stacked: 80, image_sidebyside: 0, image_card_stacked: 85, image_card_sidebyside: 0, text: 80 },
        U = function(a, b) { P.call(this, a, b) };
    aa(U, P);
    U.prototype.j = function(a) {
        return Math.min(1200, Math.round(a)) };
    var we = function(a) {
            var b = 0;
            Fb(re, function(c) { null != a[c] && ++b });
            if (!b) return !1;
            if (3 == b) return !0;
            throw new T("Tags data-matched-content-ui-type, data-matched-content-columns-num and data-matched-content-rows-num should be set together."); },
        ye = function(a, b) {
            a < na ? (b.google_content_recommendation_ui_type = "image_sidebyside", b.google_content_recommendation_columns_num = 1, b.google_content_recommendation_rows_num = 13) : (b.google_content_recommendation_ui_type = "image_stacked", b.google_content_recommendation_columns_num =
                4, b.google_content_recommendation_rows_num = 2);
            return new S(9, xe(a))
        };

    function xe(a) {
        return 1200 <= a ? new U(1200, 600) : 850 <= a ? new U(a, Math.floor(.5 * a)) : 550 <= a ? new U(a, Math.floor(.6 * a)) : 468 <= a ? new U(a, Math.floor(.7 * a)) : new U(a, Math.floor(3.44 * a)) }
    var Ae = function(a, b) {
            if (b.google_content_recommendation_ui_type && b.google_content_recommendation_columns_num && b.google_content_recommendation_rows_num) return ze(a, b);
            b.google_content_recommendation_ui_type = "image_sidebyside,image_stacked";
            b.google_content_recommendation_columns_num = "1,4";
            b.google_content_recommendation_rows_num = "13,2";
            var c = { image_stacked: ma },
                d = xe(a);
            b.google_orig_ad_width = d.j(d.minWidth());
            b.google_orig_ad_height = d.height();
            b.google_orig_ad_format = d.l(d.minWidth());
            return ze(a, b,
                ue, c)
        },
        ze = function(a, b, c, d) {
            c = c ? c : {};
            d = d ? d : {};
            var e = b.google_content_recommendation_ui_type.split(","),
                f = b.google_content_recommendation_columns_num.split(","),
                g = b.google_content_recommendation_rows_num.split(",");
            a: {
                if (e.length == f.length && f.length == g.length) {
                    if (1 == e.length) {
                        var h = 0;
                        break a }
                    if (2 == e.length) { h = a < na ? 0 : 1;
                        break a }
                    throw new T("The size of element (" + e.length + ") specified in tag data-matched-content-ui-type, data-matched-content-columns-num, data-matched-content-rows-num is wrong."); }
                throw new T("The size of element (" +
                    e.length + "," + f.length + "," + g.length + ") specified in tag data-matched-content-ui-type, data-matched-content-columns-num and data-matched-content-rows-num does not match.");
            }
            e = v(e[h]);
            f = +f[h];
            g = +g[h];
            b.google_content_recommendation_ui_type = e;
            b.google_content_recommendation_columns_num = f;
            b.google_content_recommendation_rows_num = g;
            b = c;
            if (isNaN(f) || !f) throw new T("Wrong value for data-matched-content-columns-num");
            if (isNaN(g) || !g) throw new T("Wrong value for data-matched-content-rows-num");
            d = Math.floor(((a -
                8 * f - 8) / f * (b[e] || te[e]) + (d[e] || ve[e])) * g + 8 * g + 8);
            if (1500 < a) throw new T("Calculated slot width is too large: " + a);
            if (1500 < d) throw new T("Calculated slot height is too large: " + d);
            return new S(9, new U(a, d))
        };
    var Be = { "image-top": function(a) {
                return 600 >= a ? 284 + .414 * (a - 250) : 429 }, "image-middle": function(a) {
                return 500 >= a ? 196 - .13 * (a - 250) : 164 + .2 * (a - 500) }, "image-side": function(a) {
                return 500 >= a ? 205 - .28 * (a - 250) : 134 + .21 * (a - 500) }, "text-only": function(a) {
                return 500 >= a ? 187 - .228 * (a - 250) : 130 }, "in-article": function(a) {
                return 420 >= a ? a / 1.2 : a / 1.91 + 130 }, "in-article-desktop": function(a) {
                return 420 >= a ? a / 1.2 : 460 >= a ? a / 1.91 + 130 : 800 >= a ? a / 4 : 200 } },
        Ce = function(a, b) {
            if (50 > b) throw new T("Fluid responsive ads must be at least 50px tall: height=" +
                b);
            return new S(11, new P(a, b))
        },
        De = function(a, b) {
            var c = Be[b];
            if (!c) throw new T("Invalid data-ad-layout value: " + b);
            b = Math.ceil(c(a));
            return new S(11, new P(a, b)) };
    var V = function(a, b) { P.call(this, a, b) };
    aa(V, P);
    V.prototype.j = function() {
        return this.minWidth() };
    V.prototype.l = function(a) {
        return P.prototype.l.call(this, a) + "_0ads_al" };
    var Ee = [new V(728, 15), new V(468, 15), new V(200, 90), new V(180, 90), new V(160, 90), new V(120, 90)],
        Fe = function(a) {
            var b = ke(Ee, ee(a));
            if (!b) throw new T("No link unit size for width=" + a + "px");
            return b },
        Ge = function(a, b, c, d) { c = void 0 === c ? 130 : c;
            d = void 0 === d ? 30 : d;
            var e = Fe(a);
            a = Math.min(a, 1200);
            e = e.height();
            b = Math.max(e, b);
            return new S(10, new V(a, Math.min(b, 15 == e ? d : c))) };
    var He = function(a, b) {
        var c = b.google_ad_format;
        if ("autorelaxed" == c) return D(a, bd.u) ? 6 : D(a, cd.u) ? 7 : D(a, dd.u) ? 14 : we(b) ? 9 : 5;
        if ("auto" == c || /^((^|,) *(horizontal|vertical|rectangle) *)+$/.test(c)) return 1;
        if ("link" == c) return D(a, L.O) || D(a, L.P) || D(a, L.R) ? 15 : 13;
        if ("fluid" == c) return 8 };

    function Ie(a, b, c, d, e) {
        var f = d.google_ad_format,
            g = d.google_ad_height || de(c, e, "height");
        switch (a) {
            default:
                case 1:
                return qe(b, f, e, c, d);
            case 5:
                    return ye(b, d);
            case 6:
                    return Ae(b, d);
            case 7:
                    return Ae(b, d);
            case 14:
                    return d.google_content_recommendation_ui_type && d.google_content_recommendation_columns_num && d.google_content_recommendation_rows_num ? ze(b, d) : ye(b, d);
            case 9:
                    return ze(b, d);
            case 4:
                    return new S(10, Fe(b));
            case 10:
                    return g = Fe(b), new S(10, new V(Math.min(b, 1200), g.height()));
            case 12:
                    return Ge(b, Je(c,
                    e));
            case 13:
                    return e = Je(c, e), e = Ge(b, e, 130, 30).j, b = e.minWidth(), e = e.height(), 15 <= g && (e = g), new S(10, new V(b, e));
            case 15:
                    return d = Je(c, e), e = Ge(b, d, D(e, L.O) ? 190 : D(e, L.P) ? 250 : 130, D(e, L.R) ? 90 : 30).j, b = e.minWidth(), e = e.height(), 15 <= g && (e = g), new S(10, new V(b, e));
            case 8:
                    if (250 > b) throw new T("Fluid responsive ads must be at least 250px wide: availableWidth=" + b);a = "" + (d.google_ad_layout || "image-top");
                if ("in-article" == a) b = Math.min(E(e, md.u) ? 1200 : 700, Math.floor(b)),
                b = g ? Ce(b, g) : De(b, E(e, md.u) ? "in-article-desktop" :
                    "in-article");
                else if (b = Math.min(1200, Math.floor(b)), g) b = Ce(b, Math.ceil(g));
                else if (g = d.google_ad_layout_key) {
                    g = "" + g;
                    e = Math.pow(10, 3);
                    if (a = (d = g.match(/([+-][0-9a-z]+)/g)) && d.length) { c = [];
                        for (f = 0; f < a; f++) c.push(parseInt(d[f], 36) / e);
                        e = c } else e = null;
                    if (!e) throw new T("Invalid data-ad-layout-key value: " + g);
                    g = (b + -725) / 1E3;
                    d = 0;
                    a = 1;
                    c = e.length;
                    for (f = 0; f < c; f++) d += e[f] * a, a *= g;
                    g = Math.ceil(1E3 * d - -725);
                    if (isNaN(g)) throw new T("Invalid height: height=" + g);
                    if (50 > g) throw new T("Fluid responsive ads must be at least 50px tall: height=" +
                        g);
                    if (1200 < g) throw new T("Fluid responsive ads must be at most 1200px tall: height=" + g);
                    b = new S(11, new P(b, g))
                } else b = De(b, a);
                return b
        }
    }

    function Je(a, b) {
        if (D(b, fd.u)) {
            var c = de(a, b, "height");
            if (!c) {
                var d = a.style.height;
                a.style.height = "inherit";
                c = de(a, b, "height");
                a.style.height = d;
                if (!c) { c = Infinity;
                    do(d = a.style && xb(a.style.height)) && (c = Math.min(c, d)), (d = de(a, b, "maxHeight")) && (c = Math.min(c, d)); while ((a = a.parentElement) && "HTML" != a.tagName) } }
            b = c } else b = ie(b, a);
        return b };
    var Ke = {
        1: "0.1",
        2: "0",
        3: "100",
        4: "200",
        5: "0.01",
        6: "0.01",
        7: "1",
        8: "0.0",
        9: "400",
        10: "200",
        11: "0.003",
        12: "0.01",
        13: "0.001",
        14: "303",
        15: "3",
        16: "600",
        17: "20",
        18: "0.1",
        19: "0.01",
        20: "0",
        22: "0.01",
        23: "0.2",
        24: "0.05",
        26: "0.01",
        27: "0.001",
        28: "0.001",
        29: "0.01",
        30: "0.2",
        31: "0.001",
        32: "0.02",
        33: "0.001",
        34: "0.001",
        35: "0.01",
        36: "0.10",
        37: "0.0",
        38: "0.04",
        39: "0.15",
        40: "0.15",
        41: "0.006",
        42: "0.001",
        43: "0.1",
        44: "0.0",
        45: "0.0",
        46: "0.0",
        47: "0.01",
        48: "0.2",
        49: "0.2",
        50: "0.08",
        51: "0.05",
        52: "0.5",
        53: "0.2",
        54: "800",
        55: "40",
        56: "0.0",
        57: "0.001",
        58: "0.01"
    };
    var Le = null,
        Me = function() { this.j = Ke },
        W = function(a, b) { a = parseFloat(a.j[b]);
            return isNaN(a) ? 0 : a };
    var Ne = new bc(100, 299),
        Oe = new bc(300, 399),
        Pe = new bc(400, 599),
        Qe = new bc(600, 699),
        Re = new bc(800, 899);
    var Te = function() {
            var a = u.google_ad_modifications = u.google_ad_modifications || {};
            if (!a.plle) {
                a.plle = !0;
                var b = a.eids = a.eids || [],
                    a = a.loeids = a.loeids || [],
                    c;
                Le || (Le = new Me);
                var d = Le;
                var e = ad;
                var f = Se(Ne, W(d, 3), W(d, 4), [e.D, e.A]);
                X(a, f);
                var g = $c;
                f == e.D ? c = g.D : f == e.A ? c = g.A : c = "";
                X(b, c);
                e = bd;
                X(b, Y(W(d, 5), [e.o, e.u]));
                e = cd;
                X(b, Y(W(d, 6), [e.o, e.u]));
                e = dd;
                X(b, Y(W(d, 7), [e.o, e.u]));
                e = ed;
                X(b, Y(W(d, 8), [e.o, e.u]));
                e = L;
                X(b, Se(Pe, W(d, 9), W(d, 10), [e.o, e.O, e.P, e.R]));
                e = fd;
                X(b, Se(Qe, W(d, 16), W(d, 17), [e.o, e.u]));
                t.body || (e = kd,
                    X(a, Y(W(d, 1), [e.o, e.u])));
                v("") && X(a, "");
                e = M;
                f = Y(W(d, 11), [e.o, e.VIEWPORT, e.L]);
                e = La(e, function(a) {
                    return a == f });
                e = hd[e];
                X(b, f);
                X(b, e);
                e = N;
                e = Y(W(d, 12), [e.N, e.U, e.T, e.K]);
                X(a, e);
                e || (e = ld, e = Y(W(d, 58), [e.o, e.u]), X(a, e));
                e || (e = qd, f = Y(W(d, 56), [e.o, e.u]), X(a, f));
                e = gd;
                f = Y(W(d, 13), [e.W, e.o]);
                X(b, f);
                X(b, fc([e.V], 0));
                e = jd;
                f = Se(Oe, W(d, 14), W(d, 15), [e.o, e.I, e.J]);
                X(a, f);
                g = id;
                f == e.o ? c = g.o : f == e.I ? c = g.I : f == e.J ? c = g.J : c = "";
                X(b, c);
                e = md;
                f = Y(W(d, 53), [e.o,
                    e.u
                ]);
                X(a, f);
                g = nd;
                f == e.o ? c = g.o : f == e.u ? c = g.u : c = "";
                X(b, c);
                e = pd;
                f = Se(Re, W(d, 54), W(d, 55), [e.o, e.G, e.H, e.F]);
                X(a, f);
                g = od;
                f == e.o ? c = g.o : f == e.G ? c = g.G : f == e.H ? c = g.H : f == e.F ? c = g.F : c = "";
                X(b, c)
            }
        },
        X = function(a, b) { b && a.push(b) },
        Ue = function(a) {
            var b = u.location && u.location.hash,
                b = (b = b && b.match(/google_plle=([\d,]+)/)) && b[1];
            return !!b && -1 != b.indexOf(a) },
        Y = function(a, b) {
            for (var c = 0; c < b.length; c++)
                if (Ue(b[c])) return b[c];
            return fc(b, a) },
        Se = function(a, b, c, d) {
            for (var e = 0; e < d.length; e++)
                if (Ue(d[e])) return d[e];
            e = new ac(b,
                b + c - 1);
            (c = 0 >= c || c % d.length) || (a = a.j, c = !(a.start <= e.start && a.j >= e.j));
            c ? b = null : (a = cc(), b = null !== a && e.start <= a && e.j >= a ? d[(a - b) % d.length] : null);
            return b
        };
    var Ve = function(a) {
        if (!a) return "";
        (a = a.toLowerCase()) && "ca-" != a.substring(0, 3) && (a = "ca-" + a);
        return a };
    var We = function(a, b, c) {
        var d = ["<iframe"],
            e;
        for (e in a) a.hasOwnProperty(e) && Hb(d, e + "=" + a[e]);
        d.push('style="' + ("left:0;position:absolute;top:0;width:" + b + "px;height:" + c + "px;") + '"');
        d.push("></iframe>");
        a = a.id;
        b = "border:none;height:" + c + "px;margin:0;padding:0;position:relative;visibility:visible;width:" + b + "px;background-color:transparent";
        return ['<ins id="', a + "_expand", '" style="display:inline-table;', b, '"><ins id="', a + "_anchor", '" style="display:block;', b, '">', d.join(" "), "</ins></ins>"].join("") };
    var Xe = null;
    var Z = function(a) { this.s = [];
            this.l = a || window;
            this.j = 0;
            this.m = null;
            this.C = 0 },
        Ye, Ze = function(a) {
            try {
                return a.sz() } catch (b) {
                return !1 } },
        $e = function(a) {
            return !!a && ("object" === typeof a || "function" === typeof a) && Ze(a) && Gb(a.nq) && Gb(a.nqa) && Gb(a.al) && Gb(a.rl) },
        af = function() {
            if (Ye && Ze(Ye)) return Ye;
            var a = Zc(),
                b = a.google_jobrunner;
            return $e(b) ? Ye = b : a.google_jobrunner = Ye = new Z(a) },
        bf = function(a, b) { af().nq(a, b) },
        cf = function(a, b) { af().nqa(a, b) };
    Z.prototype.M = function(a, b) { 0 != this.j || this.s.length || b && b != window ? this.v(a, b) : (this.j = 2, this.B(new df(a, window))) };
    Z.prototype.v = function(a, b) { this.s.push(new df(a, b || this.l));
        ef(this) };
    Z.prototype.ca = function(a) { this.j = 1;
        if (a) {
            var b = wc(188, n(this.w, this, !0));
            this.m = this.l.setTimeout(b, a) } };
    Z.prototype.w = function(a) { a && ++this.C;
        1 == this.j && (null != this.m && (this.l.clearTimeout(this.m), this.m = null), this.j = 0);
        ef(this) };
    Z.prototype.da = function() {
        return !(!window || !Array) };
    Z.prototype.ba = function() {
        return this.C };
    var ef = function(a) {
        var b = wc(189, n(a.ea, a));
        a.l.setTimeout(b, 0) };
    Z.prototype.ea = function() {
        if (0 == this.j && this.s.length) {
            var a = this.s.shift();
            this.j = 2;
            var b = wc(190, n(this.B, this, a));
            a.j.setTimeout(b, 0);
            ef(this) } };
    Z.prototype.B = function(a) { this.j = 0;
        a.l() };
    Z.prototype.nq = Z.prototype.M;
    Z.prototype.nqa = Z.prototype.v;
    Z.prototype.al = Z.prototype.ca;
    Z.prototype.rl = Z.prototype.w;
    Z.prototype.sz = Z.prototype.da;
    Z.prototype.tc = Z.prototype.ba;
    var df = function(a, b) { this.l = a;
        this.j = b };
    var ff = function(a) { this.j = a;
            a.google_iframe_oncopy || (a.google_iframe_oncopy = { handlers: {}, upd: n(this.s, this) });
            this.m = a.google_iframe_oncopy },
        gf = function(a, b) {
            var c = new RegExp("\\b" + a + "=(\\d+)"),
                d = c.exec(b);
            d && (b = b.replace(c, a + "=" + (+d[1] + 1 || 1)));
            return b };
    ff.prototype.set = function(a, b) { this.m.handlers[a] = b;
        this.j.addEventListener && this.j.addEventListener("load", n(this.l, this, a), !1) };
    ff.prototype.l = function(a) { a = this.j.document.getElementById(a);
        try {
            var b = a.contentWindow.document;
            if (a.onload && b && (!b.body || !b.body.firstChild)) a.onload() } catch (c) {} };
    ff.prototype.s = function(a, b) {
        var c = gf("rx", a);
        a: {
            if (a && (a = a.match("dt=([^&]+)")) && 2 == a.length) { a = a[1];
                break a }
            a = "" }
        a = (new Date).getTime() - a;
        c = c.replace(/&dtd=(\d+|-?M)/, "&dtd=" + (1E5 <= a ? "M" : 0 <= a ? a : "-M"));
        this.set(b, c);
        return c };
    var hf = Aa("var i=this.id,s=window.google_iframe_oncopy,H=s&&s.handlers,h=H&&H[i],w=this.contentWindow,d;try{d=w.document}catch(e){}if(h&&d&&(!d.body||!d.body.firstChild)){if(h.call){setTimeout(h,0)}else if(h.match){try{h=s.upd(h,i)}catch(e){}w.location.replace(h)}}");
    var jf = { '"': '\\"', "\\": "\\\\", "/": "\\/", "\b": "\\b", "\f": "\\f", "\n": "\\n", "\r": "\\r", "\t": "\\t", "\x0B": "\\u000b" },
        kf = /\uffff/.test("\uffff") ? /[\\\"\x00-\x1f\x7f-\uffff]/g : /[\\\"\x00-\x1f\x7f-\xff]/g,
        lf = function() {},
        nf = function(a, b, c) {
            switch (typeof b) {
                case "string":
                    mf(b, c);
                    break;
                case "number":
                    c.push(isFinite(b) && !isNaN(b) ? String(b) : "null");
                    break;
                case "boolean":
                    c.push(String(b));
                    break;
                case "undefined":
                    c.push("null");
                    break;
                case "object":
                    if (null == b) { c.push("null");
                        break }
                    if (b instanceof Array || void 0 !=
                        b.length && b.splice) {
                        var d = b.length;
                        c.push("[");
                        for (var e = "", f = 0; f < d; f++) c.push(e), nf(a, b[f], c), e = ",";
                        c.push("]");
                        break }
                    c.push("{");
                    d = "";
                    for (e in b) b.hasOwnProperty(e) && (f = b[e], "function" != typeof f && (c.push(d), mf(e, c), c.push(":"), nf(a, f, c), d = ","));
                    c.push("}");
                    break;
                case "function":
                    break;
                default:
                    throw Error("Unknown type: " + typeof b);
            }
        },
        mf = function(a, b) {
            b.push('"');
            b.push(a.replace(kf, function(a) {
                if (a in jf) return jf[a];
                var b = a.charCodeAt(0),
                    c = "\\u";
                16 > b ? c += "000" : 256 > b ? c += "00" : 4096 > b && (c += "0");
                return jf[a] =
                    c + b.toString(16)
            }));
            b.push('"')
        };
    var of = { google_ad_modifications: !0, google_analytics_domain_name: !0, google_analytics_uacct: !0 },
        pf = function(a) {
            try {
                if (window.JSON && window.JSON.stringify && window.encodeURIComponent) {
                    var b = function() {
                        return this };
                    if (Object.prototype.hasOwnProperty("toJSON")) {
                        var c = Object.prototype.toJSON;
                        Object.prototype.toJSON = b }
                    if (Array.prototype.hasOwnProperty("toJSON")) {
                        var d = Array.prototype.toJSON;
                        Array.prototype.toJSON = b }
                    var e = window.encodeURIComponent(window.JSON.stringify(a));
                    try {
                        var f = Fc(e) } catch (g) {
                        f = "#" + Fc(e, !0)
                    }
                    c && (Object.prototype.toJSON = c);
                    d && (Array.prototype.toJSON = d);
                    return f
                }
            } catch (g) { F.j(237, g, void 0, void 0) }
            return ""
        },
        qf = function(a) { a.google_page_url && (a.google_page_url = String(a.google_page_url));
            var b = [];
            Fb(a, function(a, d) {
                if (null != a) {
                    try {
                        var c = [];
                        nf(new lf, a, c);
                        var f = c.join("") } catch (g) {}
                    f && (f = f.replace(/\//g, "\\$&"), Hb(b, d, "=", f, ";")) } });
            return b.join("") };
    var rf = Ma("script");
    Kb(u);
    var sf = wc(215, function(a) {
            var b = a.google_sa_queue,
                c = b.shift(); "function" == ca(c) && vc(216, xc, c);
            b.length && a.setTimeout(ga(sf, a), 0) }),
        uf = function(a) {
            return ["<", rf, ' src="', tf(void 0 === a ? "/show_ads_impl.js" : a), '"></', rf, ">"].join("") },
        tf = function(a) {
            a = void 0 === a ? "/show_ads_impl.js" : a;
            var b = ra ? "https" : "http";
            a: {
                if (pa) try {
                    var c = u.google_cafe_host || u.top.google_cafe_host;
                    if (c) {
                        var d = c;
                        break a } } catch (e) {}
                d = la("", "pagead2.googlesyndication.com") }
            return zc(d, ["/pagead/js/", oa(), "/r20170110",
                a, ""
            ].join(""), b)
        },
        vf = function(a, b, c, d) {
            return function() {
                var e = !1;
                d && af().al(3E4);
                try {
                    var f = a.document.getElementById(b).contentWindow;
                    if (B(f)) {
                        var g = a.document.getElementById(b).contentWindow,
                            h = g.document;
                        h.body && h.body.firstChild || (/Firefox/.test(navigator.userAgent) ? h.open("text/html", "replace") : h.open(), g.google_async_iframe_close = !0, h.write(c)) } else {
                        for (var k = a.document.getElementById(b).contentWindow, f = c, f = String(f),
                                g = ['"'], h = 0; h < f.length; h++) {
                            var m = f.charAt(h),
                                r = m.charCodeAt(0),
                                w = h + 1,
                                p;
                            if (!(p = Ba[m])) {
                                if (31 < r && 127 > r) var y = m;
                                else {
                                    var x = void 0,
                                        z = m;
                                    if (z in Ca) y = Ca[z];
                                    else if (z in Ba) y = Ca[z] = Ba[z];
                                    else {
                                        var H = z.charCodeAt(0);
                                        if (31 < H && 127 > H) x = z;
                                        else {
                                            if (256 > H) {
                                                if (x = "\\x", 16 > H || 256 < H) x += "0" } else x = "\\u", 4096 > H && (x += "0");
                                            x += H.toString(16).toUpperCase() }
                                        y = Ca[z] = x } }
                                p = y }
                            g[w] = p }
                        g.push('"');
                        k.location.replace("javascript:" + g.join(""))
                    }
                    e = !0
                } catch (se) { k = Zc().google_jobrunner, $e(k) && k.rl() }
                e && (e = gf("google_async_rrc", c), (new ff(a)).set(b,
                    vf(a, b, e, !1)))
            }
        },
        wf = function(a) {
            var b = ["<iframe"];
            Fb(a, function(a, d) { null != a && b.push(" " + d + '="' + Aa(a) + '"') });
            b.push("></iframe>");
            return b.join("") },
        yf = function(a, b, c) { xf(a, b, c, function(a, b, f) { a = a.document;
                for (var d = b.id, e = 0; !d || a.getElementById(d);) d = "aswift_" + e++;
                b.id = d;
                b.name = d;
                d = Number(f.google_ad_width);
                e = Number(f.google_ad_height);
                16 == f.google_reactive_ad_format ? (f = a.createElement("div"), a = We(b, d, e), f.innerHTML = a, c.appendChild(f.firstChild)) : (f = We(b, d, e), c.innerHTML = f);
                return b.id }) },
        zf = function(a) {
            var b =
                "<" + rf + ">window.google_sl_win.google_sa_impl.call(this, window, document, location);</" + rf + ">";
            E(a, N.T) ? (a.google_sa_queue = a.google_sa_queue || [], a.google_sa_impl || (b = uf("/show_ads_impl_single_load.js") + b, a.google_sa_impl = function(b) { a.google_sa_queue.push(b) }, a.google_process_slots = function() { Fa(a.google_sa_queue, function(b) { a.google_sa_impl.call(b, b, b.document, b.location) });
                a.google_sa_queue.length = 0 })) : E(a, N.U) || E(a, ld.u) ? b = uf("/show_ads_impl_single_load.js") : E(a, N.N) || E(a, ld.o) ? b = uf("/show_ads_impl.js?" +
                N.N) : E(a, N.K) || (b = E(a, qd.u) ? uf("/show_ads_impl_le.js") : E(a, qd.o) ? uf("/show_ads_impl_le_c.js") : uf());
            return b
        },
        xf = function(a, b, c, d) {
            var e = {},
                f = b.google_ad_height;
            e.width = '"' + b.google_ad_width + '"';
            e.height = '"' + f + '"';
            e.frameborder = '"0"';
            e.marginwidth = '"0"';
            e.marginheight = '"0"';
            e.vspace = '"0"';
            e.hspace = '"0"';
            e.allowtransparency = '"true"';
            e.scrolling = '"no"';
            e.allowfullscreen = '"true"';
            e.onload = '"' + hf + '"';
            d = d(a, e, b);
            f = b.google_ad_output;
            (e = b.google_ad_format) || "html" != f && null != f || (e = b.google_ad_width + "x" +
                b.google_ad_height);
            f = !b.google_ad_slot || b.google_override_format || !Td[b.google_ad_width + "x" + b.google_ad_height] && "aa" == b.google_loader_used;
            e && f ? e = e.toLowerCase() : e = "";
            b.google_ad_format = e;
            if (!ba(b.google_reactive_sra_index) || !b.google_ad_unit_key) {
                for (var e = [b.google_ad_slot, b.google_orig_ad_format || b.google_ad_format, b.google_ad_type, b.google_orig_ad_width || b.google_ad_width, b.google_orig_ad_height || b.google_ad_height], f = [], g = 0, h = c; h && 25 > g; h = h.parentNode, ++g) f.push(9 !== h.nodeType && h.id || "");
                (f =
                    f.join()) && e.push(f);
                b.google_ad_unit_key = tb(e.join(":")).toString();
                e = [];
                for (f = 0; c && 25 > f; ++f) { g = (g = 9 !== c.nodeType && c.id) ? "/" + g : "";
                    a: {
                        if (c && c.nodeName && c.parentElement)
                            for (var h = c.nodeName.toString().toLowerCase(), k = c.parentElement.childNodes, m = 0, r = 0; r < k.length; ++r) {
                                var w = k[r];
                                if (w.nodeName && w.nodeName.toString().toLowerCase() === h) {
                                    if (c === w) { h = "." + m;
                                        break a }++m } }
                        h = "" }
                    e.push((c.nodeName && c.nodeName.toString().toLowerCase()) + g + h);
                    c = c.parentElement }
                c = e.join() + ":";
                e = a;
                f = [];
                if (e) try {
                    for (var p = e.parent,
                            g = 0; p && p !== e && 25 > g; ++g) {
                        for (var y = p.frames, h = 0; h < y.length; ++h)
                            if (e === y[h]) { f.push(h);
                                break }
                        e = p;
                        p = e.parent }
                } catch (H) {}
                b.google_ad_dom_fingerprint = tb(c + f.join()).toString()
            }
            var p = qf(b),
                y = pf(b),
                x;
            b = b.google_ad_client;
            if (!Xe) b: { e = [l.top];c = [];
                for (f = 0; g = e[f++];) { c.push(g);
                    try {
                        if (g.frames)
                            for (var z = g.frames.length, h = 0; h < z && 1024 > e.length; ++h) e.push(g.frames[h]) } catch (H) {} }
                for (z = 0; z < c.length; z++) try {
                    if (x = c[z].frames.google_esf) { Xe = x;
                        break b } } catch (H) {}
                Xe = null }
            Xe ? x = "" : (x = { style: "display:none" }, /[^a-z0-9-]/.test(b) ?
                x = "" : (x["data-ad-client"] = Ve(b), x.id = "google_esf", x.name = "google_esf", x.src = zc(la("", "googleads.g.doubleclick.net"), ["/pagead/html/", oa(), "/r20170110/zrt_lookup.html#"].join("")), x = wf(x)));
            z = E(a, N.T) || E(a, N.K);
            b = ha;
            c = (new Date).getTime();
            a.google_t12n_vars = Ke;
            z = ["<!doctype html><html><body>", x, "<", rf, ">", p, "google_show_ads_impl=true;", z ? "google_sl_win=window.parent;" : "", "google_unique_id=", Kb(a), ';google_async_iframe_id="',
                d, '";google_start_time=', b, ";", y ? 'google_pub_vars = "' + y + '";' : "", "google_bpp=", c > b ? c - b : 1, ";google_async_rrc=0;google_iframe_start_time=new Date().getTime();</", rf, ">", zf(a), "</body></html>"
            ].join("");
            x = a.document.getElementById(d) ? bf : cf;
            d = vf(a, d, z, !0);
            E(a, N.K) ? (a.google_sa_queue = a.google_sa_queue || [], a.google_sa_impl ? d() : a.google_sa_queue.push(d)) : x(d)
        },
        Af = function(a, b) {
            var c = navigator;
            a && b && c && (a = a.document, b = Ve(b), /[^a-z0-9-]/.test(b) || ((c = v("r20160913")) && (c += "/"), qb(a, zc("pagead2.googlesyndication.com",
                "/pub-config/" + c + b + ".js"))))
        };
    var Bf = !1,
        Cf = 0,
        Df = !1,
        Ef = !1,
        Ff = function(a) {
            return Nb.test(a.className) && "done" != a.getAttribute("data-adsbygoogle-status") },
        Hf = function(a, b) {
            var c = window;
            a.setAttribute("data-adsbygoogle-status", "done");
            Gf(a, b, c) },
        Gf = function(a, b, c) {
            If(a, b, c);
            if (!Jf(a, b, c)) {
                if (Sd(a)) { b.enable_native_ads = !0;
                    var d = document.createElement("ins");
                    d.style.display = "none";
                    a.appendChild(d);
                    a = d }
                Kf(b);
                if (b.google_reactive_ads_config) {
                    if (Bf) throw new T("Only one 'enable_page_level_ads' allowed per page.");
                    Bf = !0 } else b.google_ama ||
                    Jb(c);
                Df || (Df = !0, Af(c, b.google_ad_client));
                Fb(of, function(a, d) { b[d] = b[d] || c[d] });
                b.google_loader_used = "aa";
                b.google_reactive_tag_first = 1 === Cf;
                if ((d = b.google_ad_output) && "html" != d && "js" != d) throw new T("No support for google_ad_output=" + d);
                vc(164, xc, function() { yf(c, b, a) })
            }
        },
        Kf = function(a) {
            if (a.enable_native_ads || a.google_native_ad_template) a.google_ad_type = "text", a.google_max_num_ads = 1, a.hasOwnProperty("google_ad_format") || (a.google_ad_format = "300x250") },
        Jf = function(a, b, c) {
            var d = b.google_reactive_ads_config;
            if (d) {
                var e = d.page_level_pubvars;
                var f = (da(e) ? e : {}).google_tag_origin }
            if (b.google_ama || "js" === b.google_ad_output) return !1;
            var g = b.google_ad_slot,
                e = c.google_ad_modifications;
            !e || Pb(e.ad_whitelist, g, f || b.google_tag_origin) ? e = null : (f = e.space_collapsing || "none", e = (g = Pb(e.ad_blacklist, g)) ? { X: !0, $: g.space_collapsing || f } : e.remove_ads_by_default ? { X: !0, $: f } : null);
            if (e && e.X && "on" != b.google_adtest) return "slot" == e.$ && (null !== wb(a.getAttribute("width")) && a.setAttribute("width", 0), null !== wb(a.getAttribute("height")) &&
                a.setAttribute("height", 0), a.style.width = "0px", a.style.height = "0px"), !0;
            if ((e = C(a, c)) && "none" == e.display && !("on" == b.google_adtest || 0 < b.google_reactive_ad_format || d)) return c.document.createComment && a.appendChild(c.document.createComment("No ad requested because of display:none on the adsbygoogle tag")), !0;
            a = null == b.google_pgb_reactive || 3 === b.google_pgb_reactive;
            return 1 !== b.google_reactive_ad_format && 8 !== b.google_reactive_ad_format || !a ? !1 : (l.console && l.console.warn("Adsbygoogle tag with data-reactive-ad-format=" +
                b.google_reactive_ad_format + " is deprecated. Check out page-level ads at https://www.google.com/adsense"), !0)
        },
        If = function(a, b, c) {
            for (var d = a.attributes, e = d.length, f = 0; f < e; f++) {
                var g = d[f];
                if (/data-/.test(g.name)) {
                    var h = v(g.name.replace("data-matched-content", "google_content_recommendation").replace("data", "google").replace(/-/g, "_"));
                    if (!b.hasOwnProperty(h)) {
                        var g = g.value,
                            k = { google_reactive_ad_format: ia, google_allow_expandable_ads: ja },
                            g = k.hasOwnProperty(h) ? k[h](g, null) : g;
                        null === g || (b[h] = g) } } }
            if (D(c,
                    M.o) || D(c, M.VIEWPORT) || D(c, M.L) && a.style && c.document && c.document.body) {
                d = parseInt(a.style.width, 10);
                b: {
                    if (e = Ob(c)) {
                        e = O(e).clientWidth;
                        f = c.document.body.currentStyle ? c.document.body.currentStyle.direction : c.getComputedStyle ? c.getComputedStyle(c.document.body).getPropertyValue("direction") : "";
                        if ("ltr" === f && e) { e = Math.floor(Math.min(1200, e - a.getBoundingClientRect().left));
                            break b }
                        if ("rtl" === f && e) {
                            f = c.document.body.getBoundingClientRect().right - a.getBoundingClientRect().right;
                            e = Math.floor(Math.min(1200,
                                e - f - Math.floor((e - c.document.body.clientWidth) / 2)));
                            break b
                        }
                    }
                    e = -1
                }
                if (0 < e && d > e)
                    if (f = parseInt(a.style.height, 10), d = !!Td[d + "x" + f], D(c, M.VIEWPORT)) {
                        if (d)
                            if (d = Ud(e, f)) e = d;
                            else throw new T("No slot size for availableWidth=" + e);
                        b.google_ad_width = e;
                        a.style.width = e + "px";
                        b.google_ad_format = null;
                        b.google_override_format = !0;
                        b.google_ad_resize = 1 } else D(c, M.L) ? (a.style.width = e + "px", b.google_ad_format = d ? "link" : "auto", b.google_ad_resize = 2) : D(c, M.o) && (b.google_ad_resize = 0)
            }
            b.google_enable_content_recommendations &&
                1 == b.google_reactive_ad_format ? (b.google_ad_width = O(c).clientWidth, b.google_ad_height = 50, a.style.display = "none") : (e = He(c, b)) ? (b.google_auto_format = b.google_ad_format, d = a.offsetWidth, c = Ie(e, d, a, b, c), e = c.j, b.google_ad_width = e.j(d), f = b.google_ad_height = e.height(), a.style.height = f + "px", b.google_ad_resizable = !0, b.google_ad_format = e.l(d), b.google_override_format = 1, b.google_responsive_auto_format = c.l, b.google_loader_features_used = 128) : !vb.test(b.google_ad_width) && !ub.test(a.style.width) || !vb.test(b.google_ad_height) &&
                !ub.test(a.style.height) ? (c = C(a, c), a.style.width = c.width, a.style.height = c.height, ae(c, b), b.google_ad_width || (b.google_ad_width = a.offsetWidth), b.google_ad_height || (b.google_ad_height = a.offsetHeight), b.google_loader_features_used = 256) : (ae(a.style, b), b.google_ad_output && "html" != b.google_ad_output || 300 != b.google_ad_width || 250 != b.google_ad_height || (c = a.style.width, a.style.width = "100%", d = a.offsetWidth, a.style.width = c, b.google_available_width = d))
        },
        Lf = function(a) {
            for (var b = document.getElementsByTagName("ins"),
                    c = 0, d = b[c]; c < b.length; d = b[++c]) {
                var e = d;
                if (Ff(e) && "reserved" != e.getAttribute("data-adsbygoogle-status") && (!a || d.id == a)) return d }
            return null
        },
        Nf = function(a) {
            if (!Ef) {
                Ef = !0;
                try {
                    var b = l.localStorage.getItem("google_ama_config") } catch (y) { b = null }
                try {
                    var c = b ? new Tc(b ? JSON.parse(b) : null) : null } catch (y) { c = null }
                if (b = c)
                    if (c = Ic(b, Uc, 3), !c || K(c, 1) <= +new Date) try { l.localStorage.removeItem("google_ama_config") } catch (y) { yc(l, { lserr: 1 }) } else {
                        try {
                            a: {
                                var d = K(b, 5);
                                if (0 < d.length) var e = d;
                                else {
                                    c: {
                                        var f = l.location.pathname,
                                            g = Jc(b, Wc, 7),
                                            d = {};
                                        for (c = 0; c < g.length; ++c) {
                                            var h = K(g[c], 1);
                                            ba(h) && !d[h] && (d[h] = g[c]) }
                                        for (var k = f.replace(/(^\/)|(\/$)/g, "");;) {
                                            var m = tb(k);
                                            if (d[m]) {
                                                var r = d[m];
                                                break c }
                                            if (!k) { r = null;
                                                break c }
                                            k = k.substring(0, k.lastIndexOf("/")) }
                                    }
                                    e = r ? K(r, 2) : []
                                }
                                for (r = 0; r < e.length; r++)
                                    if (1 == e[r]) {
                                        var w = !0;
                                        break a }
                                w = !1
                            }
                            if (w) {
                                var p = new Gd;
                                (new Kd(l, new Nd(a, b), 100, p)).start();
                                p.l.then(ga(Pd, l), ga(Qd, l)) }
                        }
                        catch (y) { yc(l, { atf: -1 }) }
                        w = Mf();
                        l.document.documentElement.appendChild(w);
                        Hf(w, { google_ama: !0, google_ad_client: a })
                    }
            }
        },
        Mf =
        function() {
            var a = document.createElement("ins");
            a.className = "adsbygoogle";
            a.style.display = "none";
            return a },
        Of = function(a, b) {
            var c = {};
            Fb(Xc, function(b, d) {!1 === a.enable_page_level_ads ? c[d] = !1 : a.hasOwnProperty(d) && (c[d] = a[d]) });
            da(a.enable_page_level_ads) && (c.page_level_pubvars = a.enable_page_level_ads);
            var d = Mf();
            b ? t.body.appendChild(d) : t.documentElement.appendChild(d);
            Hf(d, { google_reactive_ads_config: c, google_ad_client: a.google_ad_client }) },
        Pf = function(a) {
            var b = Ob(window);
            if (!b) throw new T("Page-level tag does not work inside iframes.");
            b.google_reactive_ads_global_state || (b.google_reactive_ads_global_state = new Rd);
            b.google_reactive_ads_global_state.wasPlaTagProcessed = !0;
            var b = E(u, kd.u),
                c = !b;
            t.body || b ? Of(a, c) : zb(t, "DOMContentLoaded", wc(191, function() { Of(a, c) }))
        },
        Qf = function(a, b, c, d) {
            return le(b) ? (F.v = !0, F.j(a, b, .1, d, "puberror"), !1) : F.j(a, b, c, d) },
        Rf = function(a, b, c, d) {
            return le(b) ? !1 : F.j(a, b, c, d) },
        Tf = function(a) {
            var b = {};
            vc(165, Qf, function() { Sf(a, b) }, function(c) {
                c.client = c.client || b.google_ad_client || a.google_ad_client;
                c.slotname =
                    c.slotname || b.google_ad_slot;
                c.tag_origin = c.tag_origin || b.google_tag_origin
            })
        },
        Sf = function(a, b) {
            ha = (new Date).getTime();
            a: {
                if (void 0 != a.enable_page_level_ads) {
                    if ("string" == typeof a.google_ad_client) {
                        var c = !0;
                        break a }
                    throw new T("'google_ad_client' is missing from the tag config."); }
                c = !1 }
            if (c) 0 === Cf && (Cf = 1), Nf(a.google_ad_client), Pf(a);
            else {
                0 === Cf && (Cf = 2);
                c = a.element;
                (a = a.params) && Fb(a, function(a, c) { b[c] = a });
                if ("js" === b.google_ad_output) {
                    l.google_ad_request_done_fns = l.google_ad_request_done_fns || [];
                    l.google_radlink_request_done_fns = l.google_radlink_request_done_fns || [];
                    if (b.google_ad_request_done) {
                        if ("function" != ca(b.google_ad_request_done)) throw new T("google_ad_request_done parameter must be a function.");
                        l.google_ad_request_done_fns.push(b.google_ad_request_done);
                        delete b.google_ad_request_done;
                        b.google_ad_request_done_index = l.google_ad_request_done_fns.length - 1 } else throw new T("google_ad_request_done parameter must be specified.");
                    if (b.google_radlink_request_done) {
                        if ("function" != ca(b.google_radlink_request_done)) throw new T("google_radlink_request_done parameter must be a function.");
                        l.google_radlink_request_done_fns.push(b.google_radlink_request_done);
                        delete b.google_radlink_request_done;
                        b.google_radlink_request_done_index = l.google_radlink_request_done_fns.length - 1
                    }
                    a = Mf();
                    l.document.documentElement.appendChild(a);
                    c = a
                }
                if (c) {
                    if (!Ff(c) && (c.id ? c = Lf(c.id) : c = null, !c)) throw new T("'element' has already been filled.");
                    if (!("innerHTML" in c)) throw new T("'element' is not a good DOM element."); } else if (c = Lf(), !c) throw new T("All ins elements in the DOM with class=adsbygoogle already have ads in them.");
                Hf(c, b)
            }
        },
        Vf = function() { uc();
            vc(166, Rf, Uf) },
        Uf = function() {
            Te();
            rc(D(u, gd.W) || D(u, gd.V));
            E(u, N.K) && !u.google_sa_queue && (u.google_sa_queue = [], u.google_sl_win = u, u.google_process_slots = ga(sf, u), qb(u.document, tf("/show_ads_impl_single_load.js")));
            var a = window.adsbygoogle;
            if (a && a.shift) try {
                for (var b, c = 20; 0 < a.length && (b = a.shift()) && 0 < c;) Tf(b), --c } catch (d) {
                throw window.setTimeout(Vf, 0), d; }
            if (!a || !a.loaded) {
                window.adsbygoogle = { push: Tf, loaded: !0 };
                a && Wf(a.onload);
                try {
                    Object.defineProperty(window.adsbygoogle,
                        "onload", { set: Wf })
                } catch (d) {}
            }
        },
        Wf = function(a) { Gb(a) && window.setTimeout(a, 0) };
    Vf();
}).call(this);
