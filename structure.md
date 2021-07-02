<!-- Modellizzare la struttura di una tabella per memorizzare tutti i dati riguardanti una università:
- sono presenti diversi dipartimenti, ciascuno con i propri corsi di laurea;
- ogni corso di laurea è formato da diversi corsi;
- ogni corso può essere tenuto da diversi insegnanti e prevede più appelli d'esame;
- ogni studente è iscritto ad un corso di laurea;
- per ogni appello d'esame a cui lo studente ha partecipato, è necessario memorizzare il voto ottenuto, anche se non sufficiente -->


## DEPARTMENTS

- id
- name
- description
- address


## DEGREES

- id
- name
- department
- description


## COURSES

- id
- name
- degree
- teacher
- exam session
- student

## TEACHERS

- id
- name
- lastaname
- course

## EXAM SESSIONS

- id
- date
- course
- student

## STUDENTS

- id
- name
- lastname
- course
- degree
- vote

## VOTES

- id
- number
- exam session
- student