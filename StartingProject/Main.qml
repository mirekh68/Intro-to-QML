
// Copyright (C) 2026 Qt Group.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only
import QtQuick

Window {

    // TODO: change the size to ensure it forms the standard business card ratio of approx 1:1.586
    // HINT: you may wish to use a binding
    id: root
    width: 1.586 * height
    height: 480

    visible: true
    title: qsTr("Business Card")

    Rectangle {
        id: mainRect
        anchors.fill: parent
        border.color: "black"
        border.width: 2
        anchors.margins: 15
        radius: 15
        property bool detailson: false
        onDetailsonChanged :
            console.log("details chanded to: ", detailson)


        Text {
            id: nameField
            text: myContactInfo.name
            anchors.left: parent.left
            font.pointSize: 36
            font.bold: true
            anchors.margins: 20
            y: parent.y + 10
        }

        Image {
            id: photo
            source: "IDPhoto.png"
            fillMode: Image.PreserveAspectFit
            width: parent.width * 0.25
            height: width
            anchors.right: parent.right
            anchors.margins: 20
            y: parent.y + 10
        }

        Text {
            id: companyField
            text: myContactInfo.company
            font.pointSize: 24
            anchors.top : nameField.bottom
            anchors.left: parent.left

            anchors.margins: 20

        }

        Rectangle
        {
            id: detailsButton
            border.color:  "black"
            radius: 20
            width: parent.width*0.2
            height: width*0.4
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            anchors.margins: 20
            Text {
                anchors.centerIn:  parent
                text: "Details"
            }
            MouseArea {
                anchors.fill : parent
                onClicked: {mainRect.detailson = !mainRect.detailson}
            }
        }
    }

    component ContactInfo: QtObject {

        // This is a ContactInfo object which provides the properties to fill in.
        // You can create as many instances of this as you like with different property values.

        // show these properties all the time:
        property string name
        property url photo

        // Basic Info properties:
        property string occupation
        property string company

        // Detailed Info properties:
        property string address
        property string country
        property string phone
        property string email
        property url webSite
    }

    ContactInfo {
        id: myContactInfo

        // this is one example instance of a ContactInfo inline Component
        // showing how the properties are populated.
        name: "Your Name"
        photo: Qt.resolvedUrl("IDPhoto.png")
        occupation: "QML Enthusiast"
        company: "Indie Soft"
        address: "Candy Cane Lane"
        country: "North Pole"
        phone: "+01 2345 567 890"
        email: "email@server.com"
        webSite: Qt.url("https://www.qt.io")
    }


    /* Your solution should contain these key features:

        - A Text element for each of the ContactInfo properties.
        - The name and photo image should be shown all the time.
        - These should be grouped into two categories "Basic Info" and "Details".
        - Create a button using a MouseArea or TapHandler that can be used to
          toggle between showing the two categories of information.
        - Use a larger font size for the name
    */
}
