(in-package #:cl-user)

(defpackage #:pokemon
  (:use #:common-lisp)
  (:export #:make-pokemon #:battle))

(in-package #:pokemon)

(defclass pokemon ()
  ((name   :initarg :name   :initform (error "must have name")   :accessor name)
   (attack :initarg :attack :initform (error "must have attack") :accessor attack)
   (hp     :initarg :hp     :initform (error "must have hp")     :accessor hp)))

(defclass fire-pokemon (pokemon) nil)
(defclass grass-pokemon (pokemon) nil)
(defclass water-pokemon (pokemon) nil)

(defmethod print-object ((object pokemon) stream)
  (print-unreadable-object (object stream :type t)
    (with-slots (name attack hp) object
      (format stream ":name ~s :attack ~s :hp ~a" name attack hp))))

(defun type->class (type)
  (ecase type
    ('grass 'grass-pokemon)
    ('fire 'fire-pokemon)
    ('water 'water-pokemon)))

(defun make-pokemon (&key name type atk hp)
  (make-instance
   (type->class type)
   :name name
   :attack atk
   :hp hp))

(make-pokemon :name "Bulbasaur" :type 'grass :atk 5 :hp 45)

(defgeneric type-advantage-p (pokemon1 pokemon2))

(defmethod type-advantage-p ((pokemon1 grass-pokemon) (pokemon2 water-pokemon))
  (cons pokemon1 pokemon2))
(defmethod type-advantage-p ((pokemon1 water-pokemon) (pokemon2 grass-pokemon))
  (cons pokemon2 pokemon1))

(defmethod type-advantage-p ((pokemon1 water-pokemon) (pokemon2 fire-pokemon))
  (cons pokemon1 pokemon2))
(defmethod type-advantage-p ((pokemon1 fire-pokemon) (pokemon2 water-pokemon))
  (cons pokemon2 pokemon1))

(defmethod type-advantage-p ((pokemon1 fire-pokemon) (pokemon2 grass-pokemon))
  (cons pokemon1 pokemon2))
(defmethod type-advantage-p ((pokemon1 grass-pokemon) (pokemon2 fire-pokemon))
  (cons pokemon2 pokemon1))

(defmethod type-advantage-p (pokemon1 pokemon2)
  '(nil nil))

(defgeneric battle (pokemon1 pokemon2))

(defmethod battle :around (pokemon1 pokemon2)
  (destructuring-bind (strong . weak) (type-advantage-p pokemon1 pokemon2)
    (if (and strong weak)
        (with-slots ((strong-attack attack)) strong
          (with-slots ((weak-attack attack)) weak
            (let ((original-strong-attack strong-attack)
                  (original-weak-attack weak-attack))
              (setf strong-attack (* 2 strong-attack)
                    weak-attack (* .5 weak-attack))
              (let ((winner (call-next-method)))
                (setf strong-attack original-strong-attack
                      weak-attack original-weak-attack)
                winner))))
        (call-next-method))))

(defmethod battle (pokemon1 pokemon2)
  (loop
    :do (decf (hp pokemon2) (attack pokemon1))
    :unless (plusp (hp pokemon2))
      :do (return-from battle (name pokemon1))
    :do (decf (hp pokemon1) (attack pokemon2))
    :unless (plusp (hp pokemon1))
      :do (return-from battle (name pokemon2))))


;; (let ((grass (make-pokemon :name "Grass" :type 'grass :atk 2 :hp 4))
;;       (water (make-pokemon :name "Water" :type 'grass :atk 2 :hp 4)))
;;   (format t "winner: ~a~%" (battle grass water)))

;; (format t "~a~%"
;;         (battle (make-pokemon :name "A" :type 'fire :atk 5 :hp 40)
;;                 (make-pokemon :name "B" :type 'fire :atk 5 :hp 40)))

;; (format t "~a~%"
;;         (battle (make-pokemon :name "A" :type 'fire :atk 5 :hp 40)
;;                 (make-pokemon :name "B" :type 'grass :atk 5 :hp 40)))

(format t "~a~%"
        (battle (make-pokemon :name "A" :type 'grass :atk 5 :hp 40)
                (make-pokemon :name "B" :type 'fire :atk 5 :hp 40)))
