/**
 * Google Maps 座標工具
 * Copyright(c) 2015 essoduke.org, Licensed MIT.
 *
 * @version 1.5.1
 * @author Essoduke Chang <essoduke@gmail.com>
 * @see {@link http://code.essoduke.org/gmap/}
 *
 * Last Modified: 2015.11.27.160527
 */
/**
 * isMobile
 * A simple JS library that detects mobile devices.
 * https://github.com/kaimallea/isMobile
 */;(!function(a){var b=/iPhone/i,c=/iPod/i,d=/iPad/i,e=/(?=.*\bAndroid\b)(?=.*\bMobile\b)/i,f=/Android/i,g=/IEMobile/i,h=/(?=.*\bWindows\b)(?=.*\bARM\b)/i,i=/BlackBerry/i,j=/Opera Mini/i,k=/(?=.*\bFirefox\b)(?=.*\bMobile\b)/i,l=new RegExp("(?:Nexus 7|BNTV250|Kindle Fire|Silk|GT-P1000)","i"),m=function(a,b){return a.test(b)},n=function(a){var n=a||navigator.userAgent;this.apple={phone:m(b,n),ipod:m(c,n),tablet:m(d,n),device:m(b,n)||m(c,n)||m(d,n)},this.android={phone:m(e,n),tablet:!m(e,n)&&m(f,n),device:m(e,n)||m(f,n)},this.windows={phone:m(g,n),tablet:m(h,n),device:m(g,n)||m(h,n)},this.other={blackberry:m(i,n),opera:m(j,n),firefox:m(k,n),device:m(i,n)||m(j,n)||m(k,n)},this.seven_inch=m(l,n),this.any=this.apple.device||this.android.device||this.windows.device||this.other.device||this.seven_inch,this.phone=this.apple.phone||this.android.phone||this.windows.phone,this.tablet=this.apple.tablet||this.android.tablet||this.windows.tablet},o=new n;o.Class=n,"undefined"!=typeof module&&module.exports?module.exports=o:"function"==typeof define&&define.amd&&define(o),a.isMobile=o}(this));

;(function ($, window, document, undefined) {

    'use strict';

    var methods = {},
        IDs = {
            'map'    : '#map',
            'maplist': '#maplist',
            'address': '#address',
            'submit' : '#submit',
            'panel'  : '#panel',
            'prompt' : '#showPrompt'
        },
        map = $(IDs.map);

    // jQuery tinyMap Configure
    $.fn.tinyMapConfigure({
        'key': 'AIzaSyDlB3fXCAUu0LWGQQ50qk2Ox3lAz83d6XM'
    });

    /**
     * Timeout delegate
     * @param {Function} func Function to execute.
     * @param {number} wait Wating time(ms) to execute.
     */
    function setTimeout (func, wait) {
        var args = Array.prototype.slice.call(arguments, 2);
        return window.setTimeout(function () {
            return func.apply(null, args);
        }, wait);
    }

    /**
     * JSON string validation
     * @param {string} text JSON string
     * @return {boolean}
     */
    function validJSON (text) {
        return (/^[\],:{}\s]*$/.test(text.replace(/\\["\\\/bfnrtu]/g, '@')
              .replace(/"[^"\\\n\r]*"|true|false|null|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?/g, ']')
              .replace(/(?:^|:|,)(?:\s*\[)+/g, '')));
    }

    // Main Methods
    methods = {
        /**
         * Set content of infoWindow
         * @param {string} lat Latitude
         * @param {string} lng Longitude
         * @param {string} address Full Address
         * @return {string}
         */
        setInfoWindowContent: function (lat, lng, address) {
            var html = [
                '<div class="info-window">',
                '<div class="lat">緯度: ' + lat + '</div>',
                '<div class="lng">經度: ' + lng + '</div>',
                '<div class="address">地址: ' + address + '</div>',
                '</div>'
            ];
            return html.join('');
        },
        /**
         * Query full address of created marker.
         * @param {Object} marker Marker object
         */
        geocoder: function (marker) {
            var self   = this,
                lat    = '',
                lng    = '',
                latlng = '',
                query  = {},
                geoCoder = new google.maps.Geocoder();

            if ('object' === typeof marker && 'function' === typeof marker.getPosition) {
                query.latLng = marker.getPosition();
                lat = marker.getPosition().lat();
                lng = marker.getPosition().lng();
                latlng = [lat, lng].join('_');
            } else {
                return;
            }

            geoCoder.geocode(query, function (result, status) {
                var html = [],
                    address = '';
                if (status === google.maps.GeocoderStatus.OK) {
                    address = result[0] ? result[0].formatted_address : latlng;
                    marker.infoWindow.setContent(self.setInfoWindowContent(lat, lng, address));
                    marker.address = address;
                    if (!marker.hasOwnProperty('id') || !marker.id.length) {
                        marker.id = latlng.replace(/\./gi, '-');
                    }
                    self.push(marker);
                }
            });
        },
        /**
         * Place the marker
         * @param {(string|Object)} loc Location
         * @param {boolean} importing
         */
        place: function (loc, importing) {
            var self    = this,
                latlng  = [],
                opt     = {},
                showPrompt = $(IDs.prompt).is(':checked');

            map.tinyMap('modify', {
                'marker': [{
                    'addr': loc,
                    'event': {
                        'created': function () {
                            if (true !== importing) {
                                this.map.panTo(this.getPosition());
                            }
                            if (showPrompt) {
                                window.prompt(
                                    '使用 "Ctrl + C" 複製:',
                                    [
                                        this.getPosition().lat(),
                                        this.getPosition().lng()
                                    ].join(',')
                                );
                            }
                            self.geocoder(this);
                        }
                    }
                }]
            })
        },
        /**
         * Insert address to the list.
         * @param {Object} marker Marker object
         */
        push: function (marker) {
            var list = $(IDs.maplist),
                row  = list.find('.template:first').clone(),
                matched = false,
                mid = '';

            if (marker.hasOwnProperty('id')) {
                mid = marker.id.replace(/[,\.]/g, '');
                row.data({
                        'id': marker.id,
                        'title': marker.address
                    })
                   .attr('data-id', mid)
                   .removeClass('hide template selected')
                   .find('[data-role=address]:first')
                   .text(marker.address);

                matched = list.find('[data-id=' + mid + ']').length ?
                          list.find('[data-id=' + mid + ']:first') :
                          false;

                if (false === matched) {
                    row.appendTo(list);
                } else {
                    matched.removeClass('selected').html(row.html());
                }
                $('.help-block').hide();
            }
        },
        /**
         * Parsing input text to creating markers.
         * @param {string} data JSON string
         */
        imports: function (data) {
            var self = this,
                addr = data.replace(/\"/g, '').split(/[\r\n]/gi),
                interval = 200,
                loop = (addr.length % 10),
                i = 0;

            if (10 > addr.length) {
                for (i = 0; i < addr.length; i += 1) {
                    self.place(addr[i], true);
                }
            } else {
                for (i = 0; i < 10; i += 1) {
                    self.place(addr[i], true);
                }
                for (i = 10; i < addr.length; i += 1) {
                    self.setTimeout(function (loc) {
                        self.place(loc, true);
                    }, (interval * i), addr[i]);
                }
            }
        },
        /**
         * Output result string
         * @param {string} format Outputing format
         * @return {Object}
         */
        exports: function (format, type) {
            var list = $(IDs.maplist),
                row = list.find('li:not(.template)'),
                data = [],
                output = '',
                result = {};

            if (row.length) {
                row.each(function () {
                    var obj = $(this),
                        latlng = obj.data('id').replace(/\-/gi, '.').replace(/\_/gi, ',').split(',');
                    output = format.replace('%LAT%', latlng.shift());
                    output = output.replace('%LNG%', latlng.pop());
                    output = output.replace('%ADDR%', obj.data('title'));
                    data.push('json' === type ? JSON.parse(output) : output);
                });
            }
            result = {
                'result': data,
                'format': format
            };
            return result;
        }
    };

    // Map initialize
    (function (map, undefined) {
        
        // jQuery tinyMap initialize
        map.tinyMap({
            'center': ['25.0042449', '121.51233300000001'],
            'zoom': 13,
            'autoLocation': true,
            'event': {
                // Create the marker
                'click': function (e) {

                    map.tinyMap('modify', {
                        'marker': [
                            {
                                'addr' : [e.latLng.lat(), e.latLng.lng()],
                                'text' : 'null',
                                'draggable': true,
                                'event': {
                                    'created': function () {
                                        methods.geocoder(this);
                                    },
                                    'dragend': function () {
                                        methods.geocoder(this);
                                    }
                                }
                            }
                        ]
                    });
                }
            }
        });
    }(map));

    (function () {

        var modal = {
            'about' : '#about-modal',
            'import': '#import-modal',
            'export': '#export-modal'
        };

        // Global events
        $(document)
            // Panel switch
            .on('click', '[data-button=switch]', function (e) {
                var obj = $(this),
                    panel = $(IDs.panel);

                if (panel.is(':visible')) {
                    panel.animate({'right': -500}, 200, function () {
                        panel.hide();
                        obj.find('span').text('顯示面板');
                    });
                } else {
                    panel.animate({'right': 0}, 200, function () {
                        obj.find('span').text('隱藏面板');
                    }).show();
                }
            })
            // Clear result field
            .on('click', '[data-button=clear]', function () {
                $('#import-data').val('');
            })
            // Modal About
            .on('click', '[data-modal=about]', function () {
                $(modal.about).modal('show');
            })
            // Modal Import
            .on('click', '[data-modal=import]', function () {
                $(modal.import).modal('show');
            })
            // Modal Export
            .on('click', '[data-modal=export]', function () {
                $(modal.export).modal('show');
            })
            // Modal export content
            .on('click', '[data-output-type]', function () {
                var obj = $(this),
                    exp = $('[data-output-format]:first'),
                    output = $('[data-output-result]:first'),
                    all = $('[data-output-type]'),
                    type = obj.data('output-type'),
                    result = '',
                    data = {};

                if (0 === exp.val().length || type !== output.data('type')) {
                    exp.val(decodeURIComponent(obj.data('output-pattern').toString()));
                }

                output.data('type', type);

                all.removeClass('btn-primary checked')
                   .addClass('btn-default')
                   .find('i')
                   .removeClass('fa fa-check');

                obj.removeClass('btn-default')
                   .addClass('btn-primary checked')
                   .data('checked', true)
                   .find('i')
                   .addClass('fa fa-check');

                if (exp.val().length) {
                    data = methods.exports(exp.val(), type);
                }

                if (data.hasOwnProperty('result') && $.isArray(data.result) && data.result.length) {
                    output.val(
                        'json' === type ?
                        JSON.stringify(data.result) :
                        data.result.join('\n')
                    );
                }
            })
            // Modal import content
            .on('click', '[data-button=import]', function () {
                var obj = $('#import-data'),
                    parent = obj.closest('.form-group'),
                    data = obj.val();

                parent.removeClass('has-error');

                if (!data.length) {
                    parent.addClass('has-error');
                    obj.focus();
                } else {
                    methods.imports(data);
                    $(modal.import).modal('hide');
                }
            })
            // Search address
            .on('click', IDs.submit, function () {
                var k = $(IDs.address);
                if (!k.val().length) {
                    k.attr('placeholder', '請輸入地址').focus();
                }
                methods.place(k.val());
            })
            // Address ENTER event
            .on('keyup', IDs.address, function (e) {
                if (13 === e.keyCode) {
                    $(IDs.submit).trigger('click');
                }
            })
            // Click of Maplist .item .remove
            .on('click', (IDs.maplist + ' [data-role=icon]'), function (e) {
                
                var obj   = $(this),
                    item  = obj.closest('li'),
                    index = item.data().hasOwnProperty('id') ?
                            item.data('id') :
                            false,
                    m     = {};

                if (index) {
                    map.tinyMap('close')
                       .tinyMap('get', {
                           'marker': [index]
                    }, function (ms) {
                        if (ms.hasOwnProperty('marker') && Array.isArray(ms.marker) && 1 === ms.marker.length) {
                            ms.marker[0].setMap(null);
                            item.remove();
                        }
                    });
                }
                if (0 === $(IDs.maplist).find('tr:not(.template)').length) {
                    $('.help-block').show();
                }
                e.preventDefault();
            })
            // Click list to focus the marker and open infoWindow.
            .on('click', (IDs.maplist + ' [data-role=address]'), function (e) {

                var obj    = $(this),
                    parent = obj.closest('li'),
                    id     = parent.data('id') || false,
                    m      = {};

                map.tinyMap('get', {
                    'marker': [id]
                }, function (ms) {

                    map.tinyMap('close');

                    if (ms.hasOwnProperty('marker') && Array.isArray(ms.marker) && 1 === ms.marker.length) {
                        m = ms.marker[0];
                        ms.map.panTo(m.getPosition());
                        if (m.hasOwnProperty('infoWindow') && 'function' === typeof m.infoWindow.open) {
                            m.infoWindow.open(ms.map, m);
                        }
                    }
                });
                e.preventDefault();
            });
    }());
    
    // Auto resize for panel
    $(window).on('resize', function () {
        $(IDs.panel).animate({'right': 0}, 300).show();
    });
    
}(window.jQuery || {}, window, document));
//#EOF