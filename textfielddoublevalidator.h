#pragma once

#include <QValidator>

class TextFieldDoubleValidator : public QDoubleValidator
{
public:
    TextFieldDoubleValidator (QObject * parent = 0);
    TextFieldDoubleValidator (double bottom, double top, int decimals, QObject * parent);

    QValidator::State validate(QString & s, int & pos) const;
};
