// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flx_authentication_flutter/src/app/view/page/login/login_page.widgetbook.dart'
    as _flx_authentication_flutter_src_app_view_page_login_login_page_widgetbook;
import 'package:flx_authentication_flutter/src/app/view/widget/login_logo.widgetbook.dart'
    as _flx_authentication_flutter_src_app_view_widget_login_logo_widgetbook;
import 'package:widgetbook/widgetbook.dart' as _widgetbook;

final directories = <_widgetbook.WidgetbookNode>[
  _widgetbook.WidgetbookFolder(
    name: 'app',
    children: [
      _widgetbook.WidgetbookFolder(
        name: 'view',
        children: [
          _widgetbook.WidgetbookFolder(
            name: 'page',
            children: [
              _widgetbook.WidgetbookFolder(
                name: 'login',
                children: [
                  _widgetbook.WidgetbookComponent(
                    name: 'LoginPage',
                    useCases: [
                      _widgetbook.WidgetbookUseCase(
                        name: 'Default',
                        builder:
                            _flx_authentication_flutter_src_app_view_page_login_login_page_widgetbook
                                .loginPageDefaultUseCase,
                      ),
                      _widgetbook.WidgetbookUseCase(
                        name: 'With Asset Logo',
                        builder:
                            _flx_authentication_flutter_src_app_view_page_login_login_page_widgetbook
                                .loginPageWithAssetLogoUseCase,
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
          _widgetbook.WidgetbookFolder(
            name: 'widget',
            children: [
              _widgetbook.WidgetbookComponent(
                name: 'LoginLogo',
                useCases: [
                  _widgetbook.WidgetbookUseCase(
                    name: 'Combined Assets',
                    builder:
                        _flx_authentication_flutter_src_app_view_widget_login_logo_widgetbook
                            .loginLogoCombinedUseCase,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'Default',
                    builder:
                        _flx_authentication_flutter_src_app_view_widget_login_logo_widgetbook
                            .loginLogoDefaultUseCase,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'With Local Asset',
                    builder:
                        _flx_authentication_flutter_src_app_view_widget_login_logo_widgetbook
                            .loginLogoLocalUseCase,
                  ),
                  _widgetbook.WidgetbookUseCase(
                    name: 'With Network Image',
                    builder:
                        _flx_authentication_flutter_src_app_view_widget_login_logo_widgetbook
                            .loginLogoNetworkUseCase,
                  ),
                ],
              )
            ],
          ),
        ],
      )
    ],
  )
];
