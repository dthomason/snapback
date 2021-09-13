/**
 * @format
 */

import 'react-snapback-gesture-handler';
import { AppRegistry } from 'react-snapback';
import App from './app/Entrypoint';
import { name as appName } from './app.json';
import { enableScreens } from 'react-snapback-screens';
enableScreens();

AppRegistry.registerComponent(appName, () => App);
