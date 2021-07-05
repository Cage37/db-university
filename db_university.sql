-- 1.Selezionare tutti gli studenti nati nel 1990(160)
-- 2.Selezionare tutti i corsi che valgono più di 10 crediti(479)
-- 3.Selezionare tutti gli studenti che hanno più di 30anni
-- 4.Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea(286)
-- 5.Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del 20/06/2020(21)
-- 6.Selezionare tutti i corsi di laurea magistrale(38)
-- 7.Da quanti dipartimenti è composta l'università?(12)
-- 8.Quanti sono gli insegnanti che non hanno un numero di telefono?(50)

1) SELECT * FROM `students` WHERE year(`date_of_birth`) = 1990;

2) SELECT * FROM courses WHERE `cfu` > 10;

3) SELECT * FROM students WHERE 2021 - year(`date_of_birth`) > 30;

4) SELECT * FROM courses WHERE `year` = 1 and `period` = "I semestre";

5) SELECT * FROM exams WHERE hour > "14:00:00" and date = DATE("2020-06-20");

6) SELECT * FROM degrees WHERE `level` = "magistrale";

7) SELECT COUNT(`id`) FROM departments;

8) SELECT COUNT(*) FROM teachers WHERE `phone` IS NULL;


-- GROUP BY:
-- Contare quanti iscritti ci sono stati ogni anno
-- Contare gli insegnanti che hanno l'ufficio nello stesso edificio
-- Calcolare la media dei voti di ogni appello d'esame
-- Contare quanti corsi di laurea ci sono per ogni dipartimento

1) SELECT COUNT(*), YEAR(`enrolment_date`) FROM `students` GROUP BY YEAR(`enrolment_date`);

2) SELECT COUNT(`id`), `office_address` FROM `teachers` GROUP BY `office_address`;

3) SELECT AVG(`vote`), `exam_id` FROM `exam_student` GROUP BY `exam_id`;

4) SELECT COUNT(id), `department_id` FROM `degrees` GROUP BY `department_id`;


-- JOINS:
-- Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
-- Selezionare tutti i Corsi di Laurea del Dipartimento di Neuroscienze
-- Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
-- Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome
-- Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
-- Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)
-- BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per superare ciascuno dei suoi esami

1)  SELECT `students`.`id`, `students`.`name`, `students`.`surname`, `degrees`.`name`
    FROM `students`
    JOIN `degrees` 
    ON `degrees`.`id` = `students`.`degree_id`
    WHERE `degrees`.`name` = "Corso di Laurea in Economia";

2)  SELECT `degrees`.`name`, `departments`.`name`
    FROM `degrees`
    JOIN `departments`
    ON `departments`.`id` = `degrees`.`department_id`
    WHERE `departments`.`name` = "Dipartimento di Neuroscienze";

3)  SELECT `teachers`.`name`, `teachers`.`surname`, `courses`.`name` 
    FROM `teachers`
    JOIN `course_teacher`
    ON `course_teacher`.`teacher_id` = `teachers`.`id`
    JOIN `courses`
    ON `course_teacher`.`course_id` = `courses`.`id`
    WHERE `teachers`.`id`= 44;

4)  SELECT `students`.`name`, `students`.`surname`, `degrees`. `name`, `departments`.`name`
    FROM `students`
    JOIN `degrees`
    ON `students`.`degree_id` = `degrees`.`id`
    JOIN `departments`
    ON `degrees`.`department_id` = `departments`.`id`
    ORDER BY `students`.`name`, `students`.`surname`;

5)  SELECT teachers.name, teachers.surname, courses.name, degrees.name
    FROM teachers
    JOIN course_teacher
    ON course_teacher.teacher_id = teachers.id 
    JOIN courses
    ON course_teacher.course_id = courses.id
    JOIN degrees
    ON courses.degree_id = degrees.id;

6)  SELECT teachers.name, teachers.surname, departments.name
    FROM teachers
    JOIN course_teacher
    ON course_teacher.teacher_id = teachers.id 
    JOIN courses
    ON course_teacher.course_id = courses.id
    JOIN degrees
    ON courses.degree_id = degrees.id
    JOIN departments
    ON degrees.department_id = departments.id
    WHERE departments.name = "Dipartimento di Matematica";

BONUS) SELECT exams.course_id, exam_student.student_id, COUNT(*)
       FROM exam_student
       JOIN exams 
       ON exam_student.exam_id = exams.id
       JOIN courses
       ON exams.course_id = courses.id
       GROUP BY exams.course_id, exam_student.student_id    
