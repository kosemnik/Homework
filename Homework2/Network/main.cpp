#include <QCoreApplication>
#include "authmanager.h"

int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);

    AuthManager auth;
    auth.registering("q87", "qwerty666");
    auth.authenticate("q87", "qwerthy666");

    return a.exec();
}
