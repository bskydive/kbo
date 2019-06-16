'use strict';
//todo conventions md->html, package.json dependencies for webpack

const webpack = require('webpack');
//const loaders = require('./loaders');
const HtmlWebpackPlugin = require('html-webpack-plugin');
const BrowserSyncPlugin = require('browser-sync-webpack-plugin');
const ExtractTextPlugin = require('extract-text-webpack-plugin');
const FaviconsWebpackPlugin = require('favicons-webpack-plugin');
const copyConfig = require('./copy-webpack-plugin.config');
const path = require('path');
const loaders = [{
	test: /\.ts(x?)$/,
	use: 'awesome-typescript-loader'
}, {
	test: /\.json$/,
	use: 'json-loader'
}, {
	test: /\.css$/,
	use: ['style-loader', 'css-loader']
}, {
	test: /\.styl$/,
	use: ['style-loader', 'css-loader', 'stylus-loader'],
}, {
	test: /\.pug$/,
	use: ['raw-loader', 'pug-html-loader']
}, {
	test: /\.woff(2)?(\?v=[0-9]\.[0-9]\.[0-9])?$/,
	use: 'url-loader?limit=10000&mimetype=yokes/font-woff'
}, {
	test: /\.(ttf|eot|svg)(\?v=[0-9]\.[0-9]\.[0-9])?$/,
	use: 'file-loader'
}, {
	test: /\.(png|jpg|jpeg|gif|svg|ico)$/,
	use: 'url-loader'
}];


const config = {
    cache: true,
    watch: true,
    context: path.resolve(__dirname, '../src'),
    entry: {
        app: ['./js/bootstrap.js'],
        vendor: ['./js/vendor.js']
    },
    output: {
        filename: 'app.bundle.js',
        path: path.resolve(__dirname, '../dist'),
        chunkFilename: '[id].chunk.js',
    },
    devtool: 'cheap-module-source-map',
    resolve: {
        extensions: ['.js', '.json', '.css', '.less', '.pug']
    },
    node: {
        fs: 'empty',
        net: 'empty',
        tls: 'empty'
    },
    plugins: [
        new HtmlWebpackPlugin({
            template: './index.pug',
            inject: 'body',
            hash: true
        }),
        new BrowserSyncPlugin({
            host: 'localhost',
            port: 8080,
            server: {
                baseDir: 'dist'
            },
            ui: false,
            online: false,
            notify: false
        }),
        new ExtractTextPlugin('[name].styles.css'),
        copyConfig,
        new webpack.optimize.CommonsChunkPlugin({
            name: 'vendor',
            filename: 'vendor.bundle.js'
        }),
        new FaviconsWebpackPlugin({
            logo: './tile.png',
            persistentCache: true,
            icons: {
                android: false,
                appleIcon: false,
                appleStartup: false,
                coast: false,
                favicons: true,
                firefox: true,
                opengraph: false,
                twitter: false,
                yandex: false,
                windows: false
            }
        })
    ],
    module: {
        rules: loaders
    }
};

module.exports = config;