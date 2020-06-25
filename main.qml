import QtQuick 2.14
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.12
import TextFieldDoubleValidator 1.0

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("tankers")

    RowLayout {
        anchors.fill: parent

        ColumnLayout {
            width: parent.width / 2
            height: parent.height
            Layout.alignment: Qt.AlignHCenter

            Image {
                width: 100
                height: 60
                Layout.alignment: Qt.AlignHCenter
                source: progressBar1.value > progressBar2.value ? "triangle_red" : "triangle_green"
            }

            ProgressBar {
                id: progressBar1
                width: 200
                height: 200
                Layout.preferredWidth: 200
                Layout.preferredHeight: 200
                Layout.alignment: Qt.AlignHCenter
                orientation: Qt.Vertical
                value: 7.5
                maximumValue: 15.0
                minimumValue: 0.0

                style: ProgressBarStyle {

                    background: Rectangle {
                        implicitHeight: 200
                        implicitWidth: parent.width
                        radius: 2
                        color: "grey"
                        border.color: "#4CAF50"
                        border.width: 1
                    }

                    progress: Rectangle {
                        color: "#4CAF50"
                        border.color: "#4CAF50"
                    }
                }

                Text {
                    anchors.centerIn: parent
                    text: progressBar1.value
                }
            }

            TextField {
                id: text_field1
                width: 50
                height: 50
                Layout.alignment: Qt.AlignHCenter

                validator: TextFieldDoubleValidator {
                    bottom: 0.0;
                    top: 15.0;
                    decimals: 1;
                    notation: DoubleValidator.StandardNotation
                }

                onTextChanged: {
                    progressBar1.setValue(text_field1.text)
                }
            }
        }

        ColumnLayout {
            width: parent.width / 2
            height: parent.height
            Layout.alignment: Qt.AlignHCenter

            Image {
                width: 100
                height: 60
                Layout.alignment: Qt.AlignHCenter
                source: progressBar2.value > progressBar1.value ? "triangle_red" : "triangle_green"
            }

            ProgressBar {
                id: progressBar2
                value: 0.8
                Layout.preferredWidth: 200
                Layout.preferredHeight: 200
                Layout.alignment: Qt.AlignHCenter
                width: 200
                height: 200
                orientation: Qt.Vertical
                maximumValue: 15.0
                minimumValue: 0.0

                style: ProgressBarStyle {

                    background: Rectangle {
                        radius: 2
                        color: "grey"
                        border.color: "#4CAF50"
                        border.width: 1
                        implicitHeight: 200
                        implicitWidth: parent.width
                    }

                    progress: Rectangle {
                        color: "#4CAF50"
                        border.color: "#4CAF50"
                    }
                }

                Text {
                    anchors.centerIn: parent
                    text: progressBar2.value
                }
            }

            TextField {
                id: text_field2
                Layout.alignment: Qt.AlignHCenter
                width: 50
                height: 50

                validator: TextFieldDoubleValidator {
                    bottom: 0.0;
                    top: 15.0;
                    decimals: 1;
                    notation: DoubleValidator.StandardNotation
                }

                onTextChanged: {
                    progressBar2.setValue(text_field2.text)
                }
            }
        }
    }
}
