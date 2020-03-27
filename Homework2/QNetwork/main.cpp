#include <QCoreApplication>

#include "authmanager.h"

int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);

    AuthManager auth;
    auth.registering("da2sha12", "qwerty666");
    auth.authenticate("da2sha12", "qwerty666");

    return a.exec();
}
