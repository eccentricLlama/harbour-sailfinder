/*
*   This file is part of Sailfinder.
*
*   Sailfinder is free software: you can redistribute it and/or modify
*   it under the terms of the GNU General Public License as published by
*   the Free Software Foundation, either version 3 of the License, or
*   (at your option) any later version.
*
*   Sailfinder is distributed in the hope that it will be useful,
*   but WITHOUT ANY WARRANTY; without even the implied warranty of
*   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
*   GNU General Public License for more details.
*
*   You should have received a copy of the GNU General Public License
*   along with Sailfinder.  If not, see <http://www.gnu.org/licenses/>.
*/

import QtQuick 2.0
import Sailfish.Silica 1.0
import "../components"

SilicaFlickable {
    width: parent.width
    height: parent.height
    Component.onCompleted: api.getMatchesWithoutMessages()

    Connections {
        target: api
        onMatchesListChanged: {
            console.debug("Matches data received")
            console.debug(api.matchesList)
            matchesListView.model = api.matchesList
        }
    }

    SilicaListView {
        id: matchesListView
        anchors.fill: parent
        delegate: ContactsDelegate {
            width: ListView.view.width
            Component.onCompleted: console.debug(model.name)
        }
        onModelChanged: console.debug("Model set:" + count)
    }
}
