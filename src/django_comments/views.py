from django.shortcuts import render

from django_comments.settings import RECAPTCHA_SITE_KEY


def demo_recaptcha(request):
    return render(
        request,
        "demo_recaptcha.html",
        {
            "key": RECAPTCHA_SITE_KEY,
        },
    )
