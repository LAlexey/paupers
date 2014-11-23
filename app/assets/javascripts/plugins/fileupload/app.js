/*
 * jQuery File Upload Plugin Angular JS Example 1.2.1
 * https://github.com/blueimp/jQuery-File-Upload
 *
 * Copyright 2013, Sebastian Tschan
 * https://blueimp.net
 *
 * Licensed under the MIT license:
 * http://www.opensource.org/licenses/MIT
 */

/* jshint nomen:false */
/* global window, angular */

(function () {
    'use strict';

    angular.module('demo', [
            'blueimp.fileupload'
        ])
        .config([
            '$httpProvider', 'fileUploadProvider',
            function ($httpProvider, fileUploadProvider) {
                delete $httpProvider.defaults.headers.common['X-Requested-With'];;

//                // Demo settings:
//                angular.extend(fileUploadProvider.defaults, {
//                    // Enable image resizing, except for Android and Opera,
//                    // which actually support image resizing, but fail to
//                    // send Blob objects via XHR requests:
//                    disableImageResize: /Android(?!.*Chrome)|Opera/
//                        .test(window.navigator.userAgent),
//                    maxFileSize: 5000000,
//                    acceptFileTypes: /(\.|\/)(gif|jpe?g|png)$/i
//                });
            }
        ])

        .controller('DemoFileUploadController', [
            '$scope', '$http', '$filter', '$window',
            function ($scope, $http) {
                var url = $('#fileupload').attr('action');

                $scope.options = {
                    url: url,
                    autoUpload: false
                };

                $scope.loadingFiles = true;
                $http.get(url, {
                  data: '', //hackish but we should send data
                  headers: { 'Content-Type': 'application/json' }
                })
                    .then(
                    function (response) {
                        $scope.loadingFiles = false;
                        $scope.queue = response.data.files || [];
                    },
                    function () {
                        $scope.loadingFiles = false;
                    }
                );
            }
        ])

        .controller('FileDestroyController', [
            '$scope', '$http',
            function ($scope, $http) {
                var file = $scope.file,
                    state;
                if (file.url) {
                    file.$state = function () {
                        return state;
                    };
                    file.$destroy = function () {
                        state = 'pending';
                        return $http({
                            url: file.deleteUrl,
                            headers: { 'X-CSRF-Token': $("input[name='authenticity_token']").val() },
                            method: file.deleteType,
                            data: {
                              _method: 'delete',
                              authenticity_token: $("input[name='authenticity_token']").val()
                            }
                        }).then(
                            function () {
                                state = 'resolved';
                                $scope.clear(file);
                            },
                            function () {
                                state = 'rejected';
                            }
                        );
                    };
                } else if (!file.$cancel && !file._index) {
                    file.$cancel = function () {
                        $scope.clear(file);
                    };
                }
            }
        ]);

}());