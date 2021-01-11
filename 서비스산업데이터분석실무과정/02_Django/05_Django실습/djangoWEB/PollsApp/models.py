from django.db import models

# Create your models here.

class Question(models.Model) :
    question_text = models.CharField(max_length=200)
    regdate = models.DateTimeField('date published')

    def __str__(self):
        return self.question_text+" , "+str(self.regdate)

class Choice(models.Model) :
    question = models.ForeignKey(Question, on_delete=models.CASCADE)
    choice_text = models.CharField(max_length=200)
    votes = models.IntegerField(default=0)

    def __str__(self):
        return str(self.question)+" , "+self.choice_text+" , "+str(self.votes)