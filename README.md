Afin d'utiliser l'application il faut cliquer sur "add new account",puis dans le formfield "champion" ajouter un champion(la liste des champions se trouve dans data.dart) et dans le forme field "Account name" ajouter un nom de compte qui vas s'associer au champion (pour tester je conseille de mettre Riven en champion et Built en compte .Ou sinon pour trouver des comptes ainsi que leurs historiques et leurs champions joué recemment https://www.op.gg/leaderboards/tier?region=euw) .
Si on cherche par la suite sur l'écran d'accueil le nom d'un champion l'application va renvoyer les objets achetés par les différents comptes durant leurs dernières parties avec le champion .
Pour faire appel à l'api il faut une clef qui expire toutes les 24h,j'ai faits une demande pour avoir une clef permanente mais elle est toujours en cours .En attendant je vais actualiser la clef tous les jours

API utilisé : - https://developer.riotgames.com/apis MATCH-V5 SUMMONER-V1 
              - https://developer.riotgames.com/docs/lol#data-dragon_items  Item (en commentaire parce que ca ne marche pas ) Item asset

Version de Flutter : Flutter 3.0.0
Version de Dart : Dart 2.17.0