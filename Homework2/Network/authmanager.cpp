#include "authmanager.h"

#include <QNetworkRequest>
#include <QNetworkReply>
#include <QUrl>
#include <QJsonObject>
#include <QJsonDocument>
#include <QDebug>

AuthManager::AuthManager(QObject *parent) : QObject(parent)
{

}

void AuthManager::registering(const QString &login, const QString &passwod)
{
    QUrl url("http://127.0.0.1:59616/register");

    QNetworkRequest request(url);
    request.setHeader(QNetworkRequest::ContentTypeHeader,
                      "application/json");

    QJsonObject body;
    body["login"] = login;
    body["password"] = passwod;
    QByteArray bodyData = QJsonDocument(body).toJson();

    QNetworkReply *reply = _net.post(request, bodyData);

    connect(reply, &QNetworkReply::finished,
            [this, reply] {
                if (reply -> error() != QNetworkReply::NoError)
                    regError = reply -> errorString();
                onRegisterFinished();
                reply -> deleteLater();
    });
}

void AuthManager::authenticate(const QString &login, const QString &password)
{
    QUrl url("http://127.0.0.1:59616/auth");

    QNetworkRequest request(url);
    request.setHeader(QNetworkRequest::ContentTypeHeader,
                      "application/json");

    QJsonObject body;
    body["login"] = login;
    body["password"] = password;
    QByteArray bodyData = QJsonDocument(body).toJson();

    QNetworkReply *reply = _net.post(request, bodyData);

    connect(reply, &QNetworkReply::finished,
            [this, reply]{
                if (reply -> error() != QNetworkReply::NoError)
                    authError = reply -> errorString();
                else
                {
                    QJsonObject obj = QJsonDocument::fromJson(reply -> readAll()).object();
                    QString token = obj.value("token").toString();
                    this -> token = token;
                }
                onAuthenticateFinished();
                reply -> deleteLater();
    });

}

QString AuthManager::getToken()
{
    return token;
}

void AuthManager::onAuthenticateFinished()
{
    qDebug() << "auth error: " << this -> authError;
    qDebug() << "token: " << getToken();
    emit AuthenticateRequestCompleted(this -> authError);
}

void AuthManager::onRegisterFinished()
{
    qDebug() << "reg error: " << this -> regError;
    emit RegisterRequestCompleted(this -> regError);
}


