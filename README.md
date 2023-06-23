# Coding-Challenge: Schulungsanbieter

Ein Anbieter von Schulungen möchte seine Produkte online anbieten. Dazu benötigt er eine
Web-Anwendung, auf der sich potentielle Kunden über das Schulungsangebot informieren und
Schulungen buchen können. Jede Schulung wird an verschiedenen Terminen angeboten. An
jedem Termin stehen 10 Teilnehmerplätze zur Verfügung, die von potentiellen Kunden einzeln
gebucht werden können.
Software-architektonisch ist ein Frontend in Javascript angedacht, das über eine REST-API mit
einem Backend kommuniziert.

## 1. REST-API-Design

Designe eine REST-API, mit der die folgenden Frontend-Funktionalitäten abgebildet werden
können:
* Übersicht über alle angebotenen Schulungen (Name der Schulung, Beschreibung, Name des
Dozenten, Preis, ...)

```
Course
- id
- title
- description
- tutor
- price
- events
```
```
Tutor
- id
- name
```
```
Event
- id
- courseId
- date
- attendeesCount
- enrolled // Ergibt sich dadurch, dass der aktuelle Benutzer eingeschrieben ist
```

* Anzeige der Schulungen in einem bestimmten Zeitraum

```
GET /courses
Gibt ein Array vom Typen Course zurück

GET /courses?from=[Date]&to=[Date]
Gibt ein Array vom Typen Course zurück, dessen events innerhalb des angegeben Zeitfensters sind
```

* Anzeige der Termine zu einer bestimmten Schulung

```
GET /courses/:id/events
Gibt ein Array vom Typen Event zurück
```

* Anlegen/Verändern einer neuen Schulung

> ! Obwohl dies keine benutzerspezifische Aktion ist, sollte dieser Endpoint nur von einem Benutzer
ausgeführt werden können, der die notwendigen Rechte dazu hat

```
POST /courses
UPDATE /courses/:id
```

* Anlegen/Verändern eines neuen Termins für eine Schulung

> ! Obwohl dies keine benutzerspezifische Aktion ist, sollte dieser Endpoint nur von einem Benutzer
ausgeführt werden können, der die notwendigen Rechte dazu hat

```
POST /courses/:id/events
UPDATE /courses/:id/events/:id
```
* Buchung einer Schulung an einem bestimmten Termin

> ! Dieser Endpunkt ist besonders abzusichern, da es sich hierbei um sensible Daten handelt

```
POST /user/courses/:id/events/:id/enroll
```

Diese Aufgabe ist reine Konzeption. Es geht nicht um das Schreiben von Quellcode, sondern
um die Definition der API.

## 2. Umsetzung Server-Seite

Programmiere die Server-Seite der API in einer Programmiersprache Deiner Wahl. Baue hierbei
Tests für die API ein. Setze mindestens einen lesenden und einen modifizierenden REST-Call
um. Treffe eine sinnvolle Auswahl der oben genannten Funktionalitäten, um das Prinzip der
Umsetzung zu zeigen. Es ist nicht notwendig, alle oben genannte Funktionalität umzusetzen.
Die Daten müssen nicht über das Beenden der Anwendung hinaus persistiert werden.

--

```
GET /courses
GET /courses/:id/events
POST /courses/:id/events
```

## 3. Umsetzung Client-Seite

Erstelle in einer Frontend-Technologie Deiner Wahl einen Client, mit dem exemplarisch ein bis
zwei REST-Calls abgesetzt werden können. Bei dieser Aufgabe geht es nicht um eine grafisch
schicke UI, sondern um einen PoC des Zusammenspiels zwischen Client und Server.

--

```
CourseList
GET /courses

EventsList
GET /courses/:id/events

CreateEvent
POST /courses/:id/events
```

## 4. Security

Was würdest Du in dieser Anwendung zum Thema Security machen? Was muss warum
abgesichert werden und welche Konzepte und Technologien würdest Du dafür einsetzen?
Diese Aufgabe ist wieder reine Konzeption. Eine Umsetzung ist nicht erforderlich.

--

Grundsätzlich sind alle Daten, die einen direkten oder indirekten Bezug zu einem Benutzer haben abzusicher.

Alle allgemeinen Daten, wie z. B. die verfügbaren Kurse müssen nicht zwingend abgesichert werden.
Die Kommunikation mit dem Server hat grundsätzlich verschlüsselt über TLS (Transport Layer Security) stattzufinden.

Das Einloggen der Benutzer kann auf verschiedene Arten erfolgen. Es gäbe z. B. die Möglichkeit das über die übliche Art des Benutzernamens (oder Email) und des Passworts zu machen, oder einen Authentication Provider zu nutzen, also z. B. die Dienste von Apple, Google oder Facebook, was in der Regel über OAuth2 erfolgt.

Eine weitere Möglichkeit ist einen Login über ein JWT zu realisieren. Einige der zuvor erwähnten Dienste nutzen
ebenfalls JWTs. Eine noch recht neue Technologie ist zudem Passkey, bei der sowohl ein Passwort, als auch ein
zweiter Faktor unnötig sind.
