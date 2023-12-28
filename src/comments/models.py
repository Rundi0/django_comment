import bleach
from django.db import models


class Comment(models.Model):
    username = models.CharField(max_length=32)
    email = models.EmailField()
    home_page = models.URLField(blank=True)
    text = models.TextField()
    reply_to = models.ForeignKey(
        "self",
        null=True,
        blank=True,
        on_delete=models.CASCADE,
        related_name="replies",
    )
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.username} - {self.created_at}"

    def save(self, *args, **kwargs):
        self.text = bleach.clean(self.text)
        super().save(*args, **kwargs)
