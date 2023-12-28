from drf_recaptcha.fields import ReCaptchaV2Field
from rest_framework import serializers

from .models import Comment


class CommentSerializer(serializers.ModelSerializer):
    recaptcha = ReCaptchaV2Field()

    class Meta:
        model = Comment
        fields = "__all__"

    def validate(self, attrs):
        attrs.pop("recaptcha")
        return attrs
